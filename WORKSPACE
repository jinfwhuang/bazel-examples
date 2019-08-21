load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

RULES_JVM_EXTERNAL_TAG = "2.7"
RULES_JVM_EXTERNAL_SHA = "f04b1466a00a2845106801e0c5cec96841f49ea4e7d1df88dc8e4bf31523df74"

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    sha256 = RULES_JVM_EXTERNAL_SHA,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

# --------------------------
# Maven dependencies
# --------------------------
load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    artifacts = [
        "com.fasterxml.jackson.core:jackson-core:2.9.8",
        "com.fasterxml.jackson.core:jackson-databind:2.9.8",
        "com.fasterxml.jackson.core:jackson-annotations:2.9.8",

        "junit:junit:4.12",
        "org.hamcrest:hamcrest-library:1.3",
        "com.google.guava:guava:27.0.1-jre",
        "org.mockito:mockito-core:2.23.4",
    ],
    repositories = [
        "https://mvnrepository.com/artifact",
        "https://jcenter.bintray.com/",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)

# --------------------------
# lcov
# --------------------------
http_archive(
    name = "lcov",
    build_file_content = """\
filegroup(
    name = "runtime",
    visibility = ["//visibility:public"],
    srcs = [
        "bin/genhtml",
    ],
)
""",

    strip_prefix = "lcov-1.14",
    urls = [
        "https://github.com/linux-test-project/lcov/releases/download/v1.14/lcov-1.14.tar.gz",
    ],
)



