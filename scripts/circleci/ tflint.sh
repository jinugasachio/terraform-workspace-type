
#!/bin/bash

TARGET_DIRS=$@
echo $TARGET_DIRS | xargs -r -n 1 bash -c 'cd $CIRCLE_WORKING_DIRECTORY/$0 && tflint --config $CIRCLE_WORKING_DIRECTORY/.tflint.hcl --format compact'
