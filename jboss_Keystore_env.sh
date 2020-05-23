#!/bin/sh

rm -rf /root/jboss-eap-7.2
rm -rf /root/jdk1.8.0_202 /ql/java
rm -rf /ql/jboss-eap-7.2

systemctl stop firewalld

unzip /root/jboss-eap-7.2.0.zip -d /root
mkdir -p /ql/java
mv /root/jboss-eap-7.2 /ql/

rm -f /ql/java/current-java
rm -f /etc/alternatives/java
rm -f /bin/java

tar -xvf /root/jdk-8u202-linux-x64.tar.gz -C /ql/java/
ln -s /ql/java/jdk1.8.0_202 /ql/java/current-java
ln -s /ql/java/current-java/bin/java /etc/alternatives/java
ln -s /etc/alternatives/java /bin/java
java -version

cp -prv /ql/jboss-eap-7.2/domain/configuration/ /ql/jboss-eap-7.2/domain/configuration_bak
/ql/jboss-eap-7.2/bin/add-user.sh -u admin -p redhat@1 -ds >> /ql/jboss-eap-7.2/secret.txt

rm -rf /root/jboss-eap-7.2




#!/bin/sh

rm -rf client.crt client.truststore client.keystore server.crt server.keystore

/ql/java/current-java/bin/keytool  -genkeypair -alias localhost -keyalg RSA -keysize 2048 -validity 365 -keystore server.keystore -dname "cn=Server Administrator,o=Acme,c=GB" -keypass secret -storepass secret

/ql/java/current-java/bin/keytool -genkeypair -alias client -keyalg RSA -keysize 2048 -validity 365 -keystore client.keystore -dname "CN=client" -keypass secret -storepass secret

/ql/java/current-java/bin/keytool -exportcert  -keystore server.keystore -alias localhost -keypass secret -storepass secret -file server.crt

/ql/java/current-java/bin/keytool  -exportcert  -keystore client.keystore -alias client -keypass secret -storepass secret -file client.crt

/ql/java/current-java/bin/keytool -importcert -keystore server.truststore -storepass secret -alias client -trustcacerts -file client.crt -noprompt

/ql/java/current-java/bin/keytool  -importcert -keystore client.truststore -storepass secret -alias localhost -trustcacerts -file server.crt -noprompt

 cp client.truststore /ql/jboss-eap-7.2/domain/configuration
