#!/bin/sh

#
# Example
# $ ./run-tesh.sh TestUserConfig.TestUserConfig.test_get_integer
#

testcase=""
if [ $# -ge 1 ]; then
  testcase=$1
fi

export PYTHONPATH=../..:.
export DJANGO_SETTINGS_MODULE=testsettings 
../../manage.py syncdb

if [ -z $testcase ]; then
  python -m unittest discover -p 'Test*.py'
else
  python -m unittest $testcase
fi
