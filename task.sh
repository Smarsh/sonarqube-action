#!/bin/bash

cd target

sonar-scanner -Dsonar.host.url=$SONAR_URL -Dsonar.projectKey=$SONAR_PROJECT_KEY -Dsonar.projectName=$SONAR_PROJECT_NAME-$SONAR_PROJECT_KEY -Dsonar.login=$SONAR_TOKEN -Dsonar.analysis.mode=preview -Dsonar.github.pullRequest=$GITHUB_PULL_REQUEST -Dsonar.github.repository=$GITHUB_REPOSITORY -Dsonar.github.oauth=$GITHUB_ACCESS_TOKEN
