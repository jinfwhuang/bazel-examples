

#### Bazel Rule to generate report
```bash
# Generate coverage file
bazel coverage \
    --instrumentation_filter=//java/com/example \
    --test_output=streamed \
    --cache_test_results=false \
    //javatest/com/example:unit_test

# Use custom Bazel rule to get coverage report  
bazel run //javatest/com/example:coverage_report


# See runfiles
tree bazel-out/darwin-fastbuild/bin/javatest/com/example/genhtml_script.runfiles/
```


# TODO
- The goal would be able to combine the `bazel coverage` and `bazel run ...:coverage_report` 
  into one step.



#### Manually generate coverage file
```bash

# Generate coverage file
bazel coverage \
    --instrumentation_filter=//java/com/example \
    --test_output=streamed \
    --cache_test_results=false \
    //javatest/com/example:unit_test

# Manually generate html file
genhtml bazel-testlogs/javatest/com/example/unit_test/coverage.dat -o .coverage

# Open html
open .coverage/index.html

# One liner
genhtml -o coverage `bazel coverage //javatest/com/example:unit_test | grep coverage.dat`
```


#### Other commands
```bash
# Run program
bazel run //java/com/example:main

# Run test
bazel test //javatest/com/example:unit_test
```
