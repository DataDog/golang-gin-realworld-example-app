load("@bazel_gazelle//:deps.bzl", "go_repository")

def ddtrace_repo_name():
    name =  native.repository_name()
    return name.replace("@", "@ddtrace_")

def deps():
    go_repository(
        name = "com_github_davecgh_go_spew",
        importpath = "github.com/davecgh/go-spew",
        sum = "h1:vj9j/u1bqnvCEfJOwUhtlOARqs3+rkHYY13jYWTU97c=",
        version = "v1.1.1",
    )
    go_repository(
        name = "com_github_dgrijalva_jwt_go",
        importpath = "github.com/dgrijalva/jwt-go",
        sum = "h1:nmYyGtn9AO7FCeZ2tHr1ZWjJAHi6SfGB3o80F8o7EbA=",
        version = "v0.0.0-20170608005149-a539ee1a749a",
    )
    go_repository(
        name = "com_github_gin_contrib_sse",
        importpath = "github.com/gin-contrib/sse",
        sum = "h1:AzN37oI0cOS+cougNAV9szl6CVoj2RYwzS3DpUQNtlY=",
        version = "v0.0.0-20170109093832-22d885f9ecc7",
    )
    go_repository(
        name = "com_github_gin_gonic_contrib",
        importpath = "github.com/gin-gonic/contrib",
        sum = "h1:crGQSfdxAd6l3zsAV2x36/6ORuut9mkmGYJqMVY2TZA=",
        version = "v0.0.0-20170529062310-d4fc5a96cc0d",
    )
    go_repository(
        name = "com_github_gin_gonic_gin",
        importpath = "github.com/gin-gonic/gin",
        sum = "h1:1oXx03/6zCbLOJJej5S6WsESDKLpI/4QNVuyK/h+ZKU=",
        version = "v0.0.0-20170716034208-93b3a0d7ec95",
    )
    go_repository(
        name = "com_github_go_playground_locales",
        importpath = "github.com/go-playground/locales",
        sum = "h1:I4ff2nZlLpFVRofYk8c6JdA9rpeI1fuInIQVyUx0MDU=",
        version = "v0.0.0-20170327191450-1e5f1161c641",
    )
    go_repository(
        name = "com_github_go_playground_universal_translator",
        importpath = "github.com/go-playground/universal-translator",
        sum = "h1:vfBaUX49VsqTxXGADDIWvTPvaU4AbQyX/yENHE0f7AY=",
        version = "v0.0.0-20170327191703-71201497bace",
    )
    go_repository(
        name = "com_github_golang_protobuf",
        importpath = "github.com/golang/protobuf",
        sum = "h1:ulJ2cj/xlDlrwLCvWH4UeV9vJ/jXP6wEGgTSF7EOnmQ=",
        version = "v0.0.0-20170712042213-0a4f71a498b7",
    )
    go_repository(
        name = "com_github_gosimple_slug",
        importpath = "github.com/gosimple/slug",
        sum = "h1:qazuiO8Pq90VbYCUh8/iNY8ShifnkXhRY6LOT8ZtNa4=",
        version = "v1.1.0",
    )
    go_repository(
        name = "com_github_jinzhu_gorm",
        importpath = "github.com/jinzhu/gorm",
        sum = "h1:sWeCm69jE8uwB/gHLNG65Szf24KebYqoWq1boLccYcQ=",
        version = "v0.0.0-20170703134954-2a1463811ee1",
    )
    go_repository(
        name = "com_github_jinzhu_inflection",
        importpath = "github.com/jinzhu/inflection",
        sum = "h1:jRQLvyVGL+iVtDElaEIDdKwpPqUIZJfzkNLV34htpEc=",
        version = "v0.0.0-20170102125226-1c35d901db3d",
    )
    go_repository(
        name = "com_github_json_iterator_go",
        importpath = "github.com/json-iterator/go",
        sum = "h1:x3oKqNE0z7njySl+5qrdEWUovQL4t8pu4wXKPeCjcbY=",
        version = "v0.0.0-20170711230430-b9dc3ebda73c",
    )
    go_repository(
        name = "com_github_mattn_go_isatty",
        importpath = "github.com/mattn/go-isatty",
        sum = "h1:F+DnWktyadxnOrohKLNUC9/GjFii5RJgY4GFG6ilggw=",
        version = "v0.0.2",
    )
    go_repository(
        name = "com_github_mattn_go_sqlite3",
        importpath = "github.com/mattn/go-sqlite3",
        sum = "h1:28XLVqevl+zxAOK/wA9tx5Cz098nz8+ogwpsMPgiNgo=",
        version = "v0.0.0-20170710140056-47fc4e5e9153",
    )
    go_repository(
        name = "com_github_pallinder_go_randomdata",
        importpath = "github.com/Pallinder/go-randomdata",
        sum = "h1:vIKeNyQ5PcCF+SyJisV2++w5cUFtU23WjzZQVrCDfk0=",
        version = "v0.0.0-20170410161340-8c3362a5e678",
    )
    go_repository(
        name = "com_github_pmezard_go_difflib",
        importpath = "github.com/pmezard/go-difflib",
        sum = "h1:4DBwDE0NGyQoBHbLQYPwSUPoCMWR5BEzIk/f1lZbAQM=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_rainycape_unidecode",
        importpath = "github.com/rainycape/unidecode",
        sum = "h1:ta7tUOvsPHVHGom5hKW5VXNc2xZIkfCKP8iaqOyYtUQ=",
        version = "v0.0.0-20150907023854-cb7f23ec59be",
    )
    go_repository(
        name = "com_github_stretchr_objx",
        importpath = "github.com/stretchr/objx",
        sum = "h1:nvL7eaZN/Zw5emVOGaOclbLMeFO030UrPtWFTUS0p80=",
        version = "v0.0.0-20150928122152-1a9d0bb9f541",
    )
    go_repository(
        name = "com_github_stretchr_testify",
        importpath = "github.com/stretchr/testify",
        sum = "h1:MsolbevHkd4SpbeG4dHLHj6I9jzoohyNI6EK6JvR5hE=",
        version = "v0.0.0-20170714215325-05e8a0eda380",
    )
    go_repository(
        name = "com_github_ugorji_go",
        importpath = "github.com/ugorji/go",
        sum = "h1:VtqNxrWGmleRhhDwCE2E98hD6Qn47lM06TOq4NTF9h0=",
        version = "v0.0.0-20170620104852-5efa3251c7f7",
    )
    go_repository(
        name = "in_gopkg_gin_gonic_gin_v1",
        importpath = "gopkg.in/gin-gonic/gin.v1",
        sum = "h1:qGaE1Yh54ssS+X6FWyhpb0T54cXpqUIo+pSIe4zaqhE=",
        version = "v1.0.0-20170702092826-d459835d2b07",
    )
    go_repository(
        name = "in_gopkg_go_playground_validator_v8",
        importpath = "gopkg.in/go-playground/validator.v8",
        sum = "h1:F8SLY5Vqesjs1nI1EL4qmF1PQZ1sitsmq0rPYXLyfGU=",
        version = "v8.18.1",
    )
    go_repository(
        name = "in_gopkg_stretchr_testify_v1",
        importpath = "gopkg.in/stretchr/testify.v1",
        sum = "h1:uFGKWu3BZZmCflbTclcFQJ6vDuVL+JDq1M+jZzL6cks=",
        version = "v1.1.4",
    )
    go_repository(
        name = "in_gopkg_yaml_v2",
        importpath = "gopkg.in/yaml.v2",
        sum = "h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=",
        version = "v2.2.2",
    )
    go_repository(
        name = "org_golang_x_crypto",
        importpath = "golang.org/x/crypto",
        sum = "h1:QmwruyY+bKbDDL0BaglrbZABEali68eoMFhTZpCjYVA=",
        version = "v0.0.0-20200311171314-f7b00557c8c4",
    )
    go_repository(
        name = "org_golang_x_net",
        importpath = "golang.org/x/net",
        sum = "h1:0GoQqolDA55aaLxZyTzK/Y2ePZzZTUrRacwib7cNsYQ=",
        version = "v0.0.0-20190404232315-eb5bcb51f2a3",
    )
    go_repository(
        name = "org_golang_x_sys",
        importpath = "golang.org/x/sys",
        sum = "h1:+R4KGOnez64A81RvjARKc4UT5/tI9ujCIVX+P5KiHuI=",
        version = "v0.0.0-20190412213103-97732733099d",
    )
    go_repository(
        name = "org_golang_x_text",
        importpath = "golang.org/x/text",
        sum = "h1:g61tztE5qeGQ89tm6NTjjM9VPIm088od1l6aSorWRWg=",
        version = "v0.3.0",
    )
    go_repository(
        name = "com_github_denisenkom_go_mssqldb",
        importpath = "github.com/denisenkom/go-mssqldb",
        sum = "h1:LzwWXEScfcTu7vUZNlDDWDARoSGEtvlDKK2BYHowNeE=",
        version = "v0.0.0-20200206145737-bbfc9a55622e",
    )
    go_repository(
        name = "com_github_erikstmartin_go_testdb",
        importpath = "github.com/erikstmartin/go-testdb",
        sum = "h1:Yzb9+7DPaBjB8zlTR87/ElzFsnQfuHnVUVqpZZIcV5Y=",
        version = "v0.0.0-20160219214506-8d10e4a1bae5",
    )
    go_repository(
        name = "com_github_go_sql_driver_mysql",
        importpath = "github.com/go-sql-driver/mysql",
        sum = "h1:ozyZYNQW3x3HtqT1jira07DN2PArx2v7/mN66gGcHOs=",
        version = "v1.5.0",
    )
    go_repository(
        name = "com_github_golang_sql_civil",
        importpath = "github.com/golang-sql/civil",
        sum = "h1:lXe2qZdvpiX5WZkZR4hgp4KJVfY3nMkvmwbVkpv1rVY=",
        version = "v0.0.0-20190719163853-cb61b32ac6fe",
    )
    go_repository(
        name = "com_github_jinzhu_now",
        importpath = "github.com/jinzhu/now",
        sum = "h1:g39TucaRWyV3dwDO++eEc6qf8TVIQ/Da48WmqjZ3i7E=",
        version = "v1.1.1",
    )
    go_repository(
        name = "com_github_kr_pty",
        importpath = "github.com/kr/pty",
        sum = "h1:VkoXIwSboBpnk99O/KFauAEILuNHv5DVFKZMBN/gUgw=",
        version = "v1.1.1",
    )
    go_repository(
        name = "com_github_kr_text",
        importpath = "github.com/kr/text",
        sum = "h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaKSTVE=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_lib_pq",
        importpath = "github.com/lib/pq",
        sum = "h1:/qkRGz8zljWiDcFvgpwUpwIAPu3r07TDvs3Rws+o/pU=",
        version = "v1.3.0",
    )
    go_repository(
        name = "com_github_niemeyer_pretty",
        importpath = "github.com/niemeyer/pretty",
        sum = "h1:fD57ERR4JtEqsWbfPhv4DMiApHyliiK5xCTNVSPiaAs=",
        version = "v0.0.0-20200227124842-a10e7caefd8e",
    )
    go_repository(
        name = "in_gopkg_check_v1",
        importpath = "gopkg.in/check.v1",
        sum = "h1:qIbj1fsPNlZgppZ+VLlY7N33q108Sa+fhmuc+sWQYwY=",
        version = "v1.0.0-20180628173108-788fd7840127",
    )
    go_repository(
        name = "in_gopkg_go_playground_assert_v1",
        importpath = "gopkg.in/go-playground/assert.v1",
        sum = "h1:xoYuJVE7KT85PYWrN730RguIQO0ePzVRfFMXadIrXTM=",
        version = "v1.2.1",
    )
    go_repository(
        name = "org_golang_x_sync",
        importpath = "golang.org/x/sync",
        sum = "h1:vcxGaoTs7kV8m5Np9uUNQin4BrLOthgV7252N8V+FwY=",
        version = "v0.0.0-20190911185100-cd5d95a43a6e",
    )
    go_repository(
        name = "com_github_bazelbuild_bazel_gazelle",
        importpath = "github.com/bazelbuild/bazel-gazelle",
        sum = "h1:kRymV9q+24Mbeg25fJehw+gvrtVIlwZZAefOSUq4MzU=",
        version = "v0.20.0",
    )
    go_repository(
        name = "com_github_bazelbuild_buildtools",
        importpath = "github.com/bazelbuild/buildtools",
        sum = "h1:OfyUN/Msd8yqJww6deQ9vayJWw+Jrbe6Qp9giv51QQI=",
        version = "v0.0.0-20190731111112-f720930ceb60",
    )
    go_repository(
        name = "com_github_bazelbuild_rules_go",
        importpath = "github.com/bazelbuild/rules_go",
        sum = "h1:wzbawlkLtl2ze9w/312NHZ84c7kpUCtlkD8HgFY27sw=",
        version = "v0.0.0-20190719190356-6dae44dc5cab",
    )
    go_repository(
        name = "com_github_burntsushi_toml",
        importpath = "github.com/BurntSushi/toml",
        sum = "h1:WXkYYl6Yr3qBf1K79EBnL4mak0OimBfB0XUf9Vl28OQ=",
        version = "v0.3.1",
    )
    go_repository(
        name = "com_github_datadog_datadog_go",
        importpath = "github.com/DataDog/datadog-go",
        sum = "h1:hRUopimy+td4Lc3QDvP/hsbQKI3n5xsmGJTRghwaA7U=",
        version = "v3.4.1+incompatible",
    )
    go_repository(
        name = "com_github_fsnotify_fsnotify",
        importpath = "github.com/fsnotify/fsnotify",
        sum = "h1:IXs+QLmnXW2CcXuY+8Mzv/fWEsPGWxqefPtCP5CnV9I=",
        version = "v1.4.7",
    )
    go_repository(
        name = "com_github_kr_pretty",
        importpath = "github.com/kr/pretty",
        sum = "h1:L/CwN0zerZDmRFUapSPitk6f+Q3+0za1rQkzVuMiMFI=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_pelletier_go_toml",
        importpath = "github.com/pelletier/go-toml",
        sum = "h1:T5zMGML61Wp+FlcbWjRDT7yAxhJNAiPPLOFECq181zc=",
        version = "v1.2.0",
    )
    go_repository(
        name = "com_github_philhofer_fwd",
        importpath = "github.com/philhofer/fwd",
        sum = "h1:UbZqGr5Y38ApvM/V/jEljVxwocdweyH+vmYvRPBnbqQ=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_tinylib_msgp",
        importpath = "github.com/tinylib/msgp",
        sum = "h1:gWmO7n0Ys2RBEb7GPYB9Ujq8Mk5p2U08lRnmMcGy6BQ=",
        version = "v1.1.2",
    )
    go_repository(
        name = "org_golang_x_time",
        importpath = "golang.org/x/time",
        sum = "h1:/5xXl8Y5W96D+TtHSlonuFqGHIWVuyCkGJLwGh9JJFs=",
        version = "v0.0.0-20191024005414-555d28b269f0",
    )
    go_repository(
        name = "org_golang_x_tools",
        importpath = "golang.org/x/tools",
        sum = "h1:FkAkwuYWQw+IArrnmhGlisKHQF4MsZ2Nu/fX4ttW55o=",
        version = "v0.0.0-20190122202912-9c309ee22fab",
    )
    go_repository(
        name = "org_golang_x_xerrors",
        importpath = "golang.org/x/xerrors",
        sum = "h1:E7g+9GITq07hpfrRu66IVDexMakfv52eLZ2CXBWiKr4=",
        version = "v0.0.0-20191204190536-9bdfabe68543",
    )

