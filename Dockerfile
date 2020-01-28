FROM openjdk:8

RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778-linux.zip && \
    unzip sonar-scanner-cli-3.0.3.778-linux.zip  && \
    cd /usr/bin && ln -s /sonar-scanner-3.0.3.778-linux/bin/sonar-scanner sonar-scanner

ADD task.sh .

ENTRYPOINT  ./task.sh