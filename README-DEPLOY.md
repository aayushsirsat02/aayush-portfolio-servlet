# Servlet Portfolio — Render Deployment

This project runs a Java Servlet WAR inside Tomcat 9 using Docker.

## Architecture

GitHub -> Render -> Docker -> Tomcat 9 -> portfolio-project.war

## Local build

```bash
mvn clean package
```

The WAR should be:

```text
target/portfolio-project.war
```

## Docker test

```bash
docker build -t portfolio-servlet .
docker run --rm -p 8080:8080 portfolio-servlet
```

Open:

```text
http://localhost:8080/portfolio
```

## Render

Create a Render Web Service from the GitHub repository and choose Docker.

Port: 8080

The application endpoint will be:

```text
https://YOUR-APP.onrender.com/portfolio
```

Free Render web services can spin down after 15 minutes of inactivity, so the first request after idle time can take about a minute.
