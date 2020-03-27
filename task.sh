#!/bin/bash

credhub login --skip-tls-validation

GITHUB_ACCESS_TOKEN="$(credhub get -q -n /concourse/${CONCOURSE_TEAM}/github-access-token)"
SONAR_TOKEN="$(credhub get -q -n /concourse/${CONCOURSE_TEAM}/sonar-token)"

cd target

sonar-scanner -Dsonar.host.url=$SONAR_URL -Dsonar.projectKey=$SONAR_PROJECT_KEY -Dsonar.projectName=$SONAR_PROJECT_NAME-$SONAR_PROJECT_KEY -Dsonar.java.coveragePlugin=jacoco -Dsonar.jacoco.reportPaths=target/coverage-reports/jacoco-unit.exec -Dsonar.jacoco.itReportPath=target/jacoco-it.exec -Dsonar.surefire.reportsPath=target/surefire-reports -Dsonar.javascript.jstestdriver.reportsPath=target/surefire-reports -Dsonar.junit.reportsPaths=target/surefire-reports -Dsonar.login=$SONAR_TOKEN -Dsonar.analysis.mode=preview -Dsonar.github.pullRequest=$GITHUB_PULL_REQUEST -Dsonar.github.repository=$GITHUB_REPOSITORY -Dsonar.github.oauth=$GITHUB_ACCESS_TOKEN
