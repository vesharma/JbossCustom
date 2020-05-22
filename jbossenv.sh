#!/bin/sh

rm -rf /root/jboss-eap-7.2
rm -rf /root/jdk1.8.0_202 /ql/java

unzip /root/jboss-eap-7.2.0.zip
mkdir -p /ql/java
mv /root/jboss-eap-7.2 /ql/

rm -f /ql/java/current-java
rm -f /etc/alternatives/java
rm -f /bin/java

tar -xvf jdk-8u202-linux-x64.tar.gz -C /ql/java/
ln -s /ql/java/jdk1.8.0_202 /ql/java/current-java
ln -s /ql/java/current-java/bin/java /etc/alternatives/java
ln -s /etc/alternatives/java /bin/java
java -version

cp -prv /ql/jboss-eap-7.2/domain/configuration/ /ql/jboss-eap-7.2/domain/configuration_bak
/ql/jboss-eap-7.2/bin/add-user.sh -u admin -p redhat@1 -ds >> /ql/jboss-eap-7.2/secret.txt
rm -rf /root/jboss-eap-7.2
