FROM openjdk:8

COPY task.sh .

ENTRYPOINT  ./task.sh