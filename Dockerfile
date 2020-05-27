FROM openjdk:8

RUN wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.7.0/credhub-linux-2.7.0.tgz && \
    tar xf credhub-linux*.tgz -C /usr/local/bin && \
    chmod +x /usr/local/bin/credhub

COPY sonar-scanner-cli-3.0.3.778-linux.zip .

RUN unzip sonar-scanner-cli-3.0.3.778-linux.zip && \
    cd /usr/bin && ln -s /sonar-scanner-3.0.3.778-linux/bin/sonar-scanner sonar-scanner

COPY task.sh /task.sh

ENTRYPOINT  ["/task.sh"]