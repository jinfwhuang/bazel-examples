genhtml_template = """\
#!/bin/bash
GEN_HTML -s DAT_FILE -o coverage

echo "Coverage report:"
echo "--------------------------"
echo $(pwd)"/coverage/index.html"
echo "--------------------------"
"""
def _gen_cov_report_impl(ctx):
    """
    Run "genhtml" to generate the coverage report
    """
    # Collect runfiles
    _files = ctx.files.instrumentated_files
    _files = _files + ctx.files._genhtlm
    _files = _files + ctx.files._coverage_files
    runfiles = ctx.runfiles(
        files = _files,
        collect_default = True
    )

    # Find genhtml path
    genhtml = ctx.files._genhtlm[0]

    # Find dat file path
    lcov_dat_path = None
    test_target = ctx.attr.test_target
    testlog_path_substring = test_target.label.package + '/' + test_target.label.name + '/coverage.dat'
    for lcov_file in ctx.files._coverage_files:
        if testlog_path_substring in lcov_file.path:
            lcov_dat_path = lcov_file.path
            break

    # Assert we find the correct coverage file
    if lcov_dat_path == None:
        msg = 'Fail to find coverage file: ' + testlog_path_substring + '\n'
        msg = msg + 'Please run bazel coverage for target first: ' + str(test_target)
        fail(msg)

    # genhtml script
    genhtml_script = genhtml_template.replace('DAT_FILE', lcov_dat_path)
    genhtml_script= genhtml_script.replace('GEN_HTML', genhtml.path)
    script = ctx.actions.declare_file("genhtml_script")
    ctx.actions.write(script, genhtml_script, is_executable = True)

    return [DefaultInfo(executable = script, runfiles = runfiles)]

gen_coverage_report_test = rule(
    implementation = _gen_cov_report_impl,
    test = True,
    attrs = {
        "instrumentated_files": attr.label_list(
            allow_files = True,
        ),
        "test_target": attr.label(
            allow_files = True,
        ),

        "_genhtlm": attr.label(
            allow_files = True,
            default = "@lcov//:runtime",
        ),
        "_coverage_files": attr.label(
            allow_files = True,
            default = "//:testlogs_coverage_files",
        ),
    },
)
