#!/bin/bash
#
# This script searches all guides in the AAP docset for a module or assembly.
#
# To operate this script, run the following command from the /titles directory in your AAP docs repo:
# whichguide <filename.adoc>
# Example command and output:
#  $ whichguide con-automation-savings-plan.adoc
#  ./analytics/automation-savings-planner/master.adoc includes con-automation-savings-plan.adoc
#
# List all master.adoc files
find . -name "master.adoc" > tmp.docx
# The atree command lists all modules and assemblies in a guide.
# Run a grep in the atree output and print the output
while read line; do 
  python /Users/ariordan/repos/tools/atree/atree $line > tmp-current.docx
  if grep -q $1 tmp-current.docx; then
    echo "$line includes $1"
  fi
done < tmp.docx
# clean up temporary files
rm tmp.docx
rm tmp-current.docx
