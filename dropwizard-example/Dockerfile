FROM maven:3.8.1-amazoncorretto-11 as builder

WORKDIR /app
COPY pom.xml /app/pom.xml
RUN mvn dependency:copy-dependencies dependency:resolve-plugins dependency:go-offline

COPY . /app/
RUN mvn package



FROM amazoncorretto:11.0.11

ARG TINI_VERSION=v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /sbin/tini
USER root
RUN chmod +x /sbin/tini

WORKDIR /app
COPY run.sh hello-world.yml /app/

COPY --from=builder /app/target/dropwizard-example-1.0-SNAPSHOT.jar /app/dropwizard-example.jar
RUN ls -alt /app/
RUN ls -alt /sbin/
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/app/run.sh"]