from ubuntu:22.10

RUN apt-get update && \
   apt-get -y install openjdk-18-jdk curl sudo

RUN curl -o "netbeans.deb" "https://dlcdn.apache.org/netbeans/netbeans-installers/17/apache-netbeans_17-1_all.deb" && \
   dpkg -i "netbeans.deb" && \
   rm netbeans.deb

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["netbeans"]
