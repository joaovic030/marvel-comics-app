#!/bin/bash

result=0

echo "
********************************************************************************
*** Running container app specs
********************************************************************************"

export BUNDLE_GEMFILE=`pwd`/Gemfile
bundle config set specific_platform true

echo ">>> Running drop DB"
bundle exec rails db:drop

echo ">>> Running create and migrate DB"
bundle exec rails environment db:create db:migrate
((result+=$?))

# echo ">>> Running prepare tests"
# bundle exec rails db:test:prepare

# echo ">>> Running Rspec"
# bundle exec rspec spec --force-color
# ((result+=$?))

exit $result
