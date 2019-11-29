FROM openjdk:8-jdk
ADD README.md .
ENV PATH="/kotlin/kotlinc/bin:${PATH}"
RUN if [ ! -d "/docker-java-home" ]; then ln -s "${JAVA_HOME}" /docker-java-home; fi
RUN apt -y install wget unzip
RUN mkdir -p kotlin && \
    cd kotlin && \
    wget https://github.com/JetBrains/kotlin/releases/download/v1.3.50/kotlin-compiler-1.3.50.zip && \
    unzip kotlin-compiler-1.3.50.zip


RUN echo $(kotlinc -version)