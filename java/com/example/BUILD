filegroup(
    name = "lib_srcs",
    visibility = ["//visibility:public"],
    srcs = glob([
       "*.java",
   ]),
)

java_library(
    name = "lib",
    visibility = ["//visibility:public"],
    srcs = [":lib_srcs"],
    deps = [
        "@maven//:com_fasterxml_jackson_core_jackson_core",
        "@maven//:com_fasterxml_jackson_core_jackson_databind",
        "@maven//:com_google_guava_guava",
    ],

)

java_binary(
    name = "main",
    visibility = ["//visibility:public"],

    srcs = ["Code.java"],
    main_class = "com.example.Code",
    deps = [
        ":lib",
    ],
)
