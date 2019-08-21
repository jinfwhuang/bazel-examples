java_library(
    visibility = ["//visibility:public"],
    name = "test_jar",
    srcs = glob(["*.java"]),
    deps = [
        "//java/com/example:lib",

        "@maven//:junit_junit",
        "@maven//:org_hamcrest_hamcrest_core",
        "@maven//:org_mockito_mockito_core",
        "@maven//:com_google_guava_guava",
    ],
)

java_test(
    name = "AllTests",
    size = "small",
    runtime_deps = [
        ":tests",
        "//util/mysql",
    ],
)

java_test(
    name = "unit_test",
    visibility = ["//visibility:public"],
    size = "small",
            srcs = glob(
        ["*Test.java"],
    ),
    test_class = "com.example.CodeTest",
    deps = [
        ":test_jar",
        "//java/com/example:lib",
    ],
)

load("//bazelrule:coverage.bzl", "gen_coverage_report_test")
gen_coverage_report_test(
    name = "coverage_report",
    instrumentated_files = [
        "//java/com/example:lib_srcs",
    ],
    test_target = ":unit_test",
)