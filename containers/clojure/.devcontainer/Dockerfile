FROM clojure:openjdk-8-lein
ADD README.md .
RUN if [ ! -d "/docker-java-home" ]; then ln -s "${JAVA_HOME}" /docker-java-home; fi

RUN echo $(lein -v)
 