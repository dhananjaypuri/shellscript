FROM maven AS build
WORKDIR /app
COPY . .
RUN mvn install

FROM tomcat:9

COPY --from=build /app/target/hello-world-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/app.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
