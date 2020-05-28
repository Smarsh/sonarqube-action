FROM openjdk:8

RUN wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.7.0/credhub-linux-2.7.0.tgz && \
    tar xf credhub-linux*.tgz -C /usr/local/bin && \
    chmod +x /usr/local/bin/credhub

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

COPY task.sh /task.sh

ENTRYPOINT  ["/task.sh"]