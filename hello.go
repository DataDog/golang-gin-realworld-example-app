package main

import (
	"fmt"
	"log"
	"net"
	"os"
	"runtime"
	"runtime/debug"
	"time"

	"github.com/DataDog/golang-gin-realworld-example-app/articles"
	"github.com/DataDog/golang-gin-realworld-example-app/common"
	"github.com/DataDog/golang-gin-realworld-example-app/users"

	"github.com/DataDog/datadog-go/statsd"
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
)

func Migrate(db *gorm.DB) {
	users.AutoMigrate()
	db.AutoMigrate(&articles.ArticleModel{})
	db.AutoMigrate(&articles.TagModel{})
	db.AutoMigrate(&articles.FavoriteModel{})
	db.AutoMigrate(&articles.ArticleUserModel{})
	db.AutoMigrate(&articles.CommentModel{})
}

// reportRuntimeMetrics periodically reports go runtime metrics at
// the given interval.
func reportRuntimeMetrics(stop chan struct{}, interval time.Duration) {
	statsdHost, statsdPort := "localhost", "8125"
	if v := os.Getenv("DD_AGENT_HOST"); v != "" {
		statsdHost = v
	}
	if v := os.Getenv("DD_DOGSTATSD_PORT"); v != "" {
		statsdPort = v
	}
	dogstatsdAddr := net.JoinHostPort(statsdHost, statsdPort)

	statsd, err := statsd.New(dogstatsdAddr, statsd.WithMaxMessagesPerPayload(40))
	if err != nil {
		log.Fatalf("FATAL: reportRuntimeMetrics: %s", err)
	}
	var ms runtime.MemStats
	gc := debug.GCStats{
		// When len(stats.PauseQuantiles) is 5, it will be filled with the
		// minimum, 25%, 50%, 75%, and maximum pause times. See the documentation
		// for (runtime/debug).ReadGCStats.
		PauseQuantiles: make([]time.Duration, 5),
	}

	tick := time.NewTicker(interval)
	defer tick.Stop()
	for {
		select {
		case <-tick.C:
			runtime.ReadMemStats(&ms)
			debug.ReadGCStats(&gc)

			// CPU statistics
			statsd.Gauge("runtime.go.num_cpu", float64(runtime.NumCPU()), nil, 1)
			statsd.Gauge("runtime.go.num_goroutine", float64(runtime.NumGoroutine()), nil, 1)
			statsd.Gauge("runtime.go.num_cgo_call", float64(runtime.NumCgoCall()), nil, 1)
			// General statistics
			statsd.Gauge("runtime.go.mem_stats.alloc", float64(ms.Alloc), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.total_alloc", float64(ms.TotalAlloc), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.sys", float64(ms.Sys), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.lookups", float64(ms.Lookups), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.mallocs", float64(ms.Mallocs), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.frees", float64(ms.Frees), nil, 1)
			// Heap memory statistics
			statsd.Gauge("runtime.go.mem_stats.heap_alloc", float64(ms.HeapAlloc), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.heap_sys", float64(ms.HeapSys), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.heap_idle", float64(ms.HeapIdle), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.heap_inuse", float64(ms.HeapInuse), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.heap_released", float64(ms.HeapReleased), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.heap_objects", float64(ms.HeapObjects), nil, 1)
			// Stack memory statistics
			statsd.Gauge("runtime.go.mem_stats.stack_inuse", float64(ms.StackInuse), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.stack_sys", float64(ms.StackSys), nil, 1)
			// Off-heap memory statistics
			statsd.Gauge("runtime.go.mem_stats.m_span_inuse", float64(ms.MSpanInuse), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.m_span_sys", float64(ms.MSpanSys), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.m_cache_inuse", float64(ms.MCacheInuse), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.m_cache_sys", float64(ms.MCacheSys), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.buck_hash_sys", float64(ms.BuckHashSys), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.gc_sys", float64(ms.GCSys), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.other_sys", float64(ms.OtherSys), nil, 1)
			// Garbage collector statistics
			statsd.Gauge("runtime.go.mem_stats.next_gc", float64(ms.NextGC), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.last_gc", float64(ms.LastGC), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.pause_total_ns", float64(ms.PauseTotalNs), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.num_gc", float64(ms.NumGC), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.num_forced_gc", float64(ms.NumForcedGC), nil, 1)
			statsd.Gauge("runtime.go.mem_stats.gc_cpu_fraction", ms.GCCPUFraction, nil, 1)
			for i, p := range []string{"min", "25p", "50p", "75p", "max"} {
				statsd.Gauge("runtime.go.gc_stats.pause_quantiles."+p, float64(gc.PauseQuantiles[i]), nil, 1)
			}

		case <-stop:
			return
		}
	}
}

func main() {

	db := common.Init()
	Migrate(db)
	defer db.Close()

	r := gin.Default()

	v1 := r.Group("/api")
	users.UsersRegister(v1.Group("/users"))
	v1.Use(users.AuthMiddleware(false))
	articles.ArticlesAnonymousRegister(v1.Group("/articles"))
	articles.TagsAnonymousRegister(v1.Group("/tags"))

	v1.Use(users.AuthMiddleware(true))
	users.UserRegister(v1.Group("/user"))
	users.ProfileRegister(v1.Group("/profiles"))

	articles.ArticlesRegister(v1.Group("/articles"))

	testAuth := r.Group("/api/ping")

	testAuth.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	// test 1 to 1
	tx1 := db.Begin()
	userA := users.UserModel{
		Username: "AAAAAAAAAAAAAAAA",
		Email:    "aaaa@g.cn",
		Bio:      "hehddeda",
		Image:    nil,
	}
	tx1.Save(&userA)
	tx1.Commit()
	fmt.Println(userA)

	//db.Save(&ArticleUserModel{
	//    UserModelID:userA.ID,
	//})
	//var userAA ArticleUserModel
	//db.Where(&ArticleUserModel{
	//    UserModelID:userA.ID,
	//}).First(&userAA)
	//fmt.Println(userAA)

	stop := make(chan struct{})
	go reportRuntimeMetrics(stop, 10*time.Second)
	defer close(stop)

	r.Run() // listen and serve on 0.0.0.0:8080
}
