# ---------- Build the WAR ----------
FROM maven:3.9.11-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn clean package -DskipTests


# ---------- Run on Tomcat ----------
# javax.servlet -> Tomcat 9
FROM tomcat:9.0-jdk17-temurin

# Remove Tomcat's default application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Deploy our WAR as the root application
# This makes:
# https://your-app.onrender.com/portfolio
# map to @WebServlet("/portfolio")
COPY --from=build /app/target/portfolio-project.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
