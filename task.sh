#!/bin/bash

credhub login --skip-tls-validation

GITHUB_ACCESS_TOKEN=`credhub get -q -n /concourse/${CONCOURSE_TEAM}/github-access-token`
SONAR_TOKEN=`credhub get -q -n /concourse/${CONCOURSE_TEAM}/sonar-token`
AWS_ACCESS_KEY_ID=`credub get -q -n /concourse/${CONCOURSE_TEAM}/aws-access-key-id`
AWS_SECRET_ACCESS_KEY=`credhub get -q -n /concourse/${CONCOURSE_TEAM}/aws-secret-access-key`

home=$PWD

aws s3 cp s3://delivery-engineering/tools/sonar-scanner-cli-3.0.3.778-linux.zip  ./ && \
unzip -q sonar-scanner-cli-3.0.3.778-linux.zip && \
cd /usr/bin && ln -s /sonar-scanner-3.0.3.778-linux/bin/sonar-scanner sonar-scanner && \
cd $home

cd target

sonar-scanner -Dsonar.host.url=$SONAR_URL -Dsonar.projectKey=$SONAR_PROJECT_KEY -Dsonar.projectName=$SONAR_PROJECT_NAME-$SONAR_PROJECT_KEY -Dsonar.login=$SONAR_TOKEN -Dsonar.analysis.mode=preview -Dsonar.github.pullRequest=$GITHUB_PULL_REQUEST -Dsonar.github.repository=$GITHUB_REPOSITORY -Dsonar.github.oauth=$GITHUB_ACCESS_TOKEN
