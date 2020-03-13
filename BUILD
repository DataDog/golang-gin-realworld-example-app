load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")
load("@bazel_gazelle//:def.bzl", "gazelle")

# gazelle:prefix github.com/DataDog/golang-gin-realworld-example-app
gazelle(
    name = "gazelle",
)

go_library(
    name = "go_default_library",
    srcs = [
        "doc.go",
        "hello.go",
    ],
    importpath = "github.com/DataDog/golang-gin-realworld-example-app",
    visibility = ["//visibility:public"],
    deps = [
        "//articles:go_default_library",
        "//common:go_default_library",
        "//users:go_default_library",
        "@com_github_gin_gonic_gin//:go_default_library",
        "@com_github_jinzhu_gorm//:go_default_library",
    ],
)

go_binary(
    name = "golang-gin-realworld-example-app",
    embed = [":go_default_library"],
    visibility = ["//visibility:public"],
)
