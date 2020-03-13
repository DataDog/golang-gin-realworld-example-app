load("@io_bazel_rules_docker//go:image.bzl", "go_image")

go_image(
    name = "image",
    embed = ["//:go_default_library"],
    visibility = ["//visibility:public"],
)
