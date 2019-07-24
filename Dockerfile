#Source image name
FROM anapsix/alpine-java
#Maintainer name
LABEL maintainer="daniela.dza95@gmail.com" 
#Copy artifact to the image
COPY /target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar /home/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar 
#Use java command to run the .jar file
CMD ["java","-jar","/home/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar"]
