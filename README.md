\# Push-to-Production: Automated CI/CD to AWS EC2



A Java web app that deploys itself. Push to GitHub, and the site on EC2 updates automatically.



\## Architecture



GitHub push -> GitHub Actions (build WAR with Maven) -> SSH deploy -> Apache Tomcat on EC2 -> Nginx reverse proxy -> Browser



\## Tech used



\- Java, Maven

\- GitHub Actions (CI/CD)

\- AWS EC2 (Ubuntu)

\- Apache Tomcat 10

\- Nginx (reverse proxy)

\- Bash and cron (nightly backups)

\- GitHub Secrets (SSH key never stored in code)



\## How it works



1\. Push code to the `main` branch

2\. GitHub Actions builds the WAR file

3\. The WAR is copied to EC2 over SSH

4\. Tomcat restarts and serves the new version

5\. A cron job backs up the webapps folder every night at 2 AM and keeps 7 days



\## Problem I solved



Tomcat's JSP compiler failed with `UnsupportedClassVersionError` because the server had Java 17. Upgrading to Java 21 and setting `JAVA\_HOME` for Tomcat fixed it.



\## Screenshots



!\[Pipeline](docs/pipeline.png)

!\[Live site](docs/site.png)



\## Next steps



\- Containerize with Docker

\- Provision EC2 with Terraform

