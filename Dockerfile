FROM openjdk:11
COPY ./target/Spe_miniProject-1.0-SNAPSHOT-shaded.jar ./
WORKDIR ./
CMD ["java", "-jar", "Spe_miniProject-1.0-SNAPSHOT-shaded.jar"]