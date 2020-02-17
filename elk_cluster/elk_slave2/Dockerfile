FROM java:8
LABEL Description="This image is just for test" Vendor="pigtom" Version="1.0"
VOLUME /tmp
ADD ../elk_master/spring-boot-elasticsearch-1.0.1-SNAPSHOT.jar /app/
ENTRYPOINT ["java", "-Xmx200m", "-jar", "/app/spring-boot-elasticsearch-1.0.1-SNAPSHOT.jar"]
EXPOSE 6000