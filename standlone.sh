 /appserver/wildfly-8.2.1.Final/bin/add-user.sh -a -u admin -sc /appserver/wildfly-8.2.1.Final/servers/instance1/configuration -up mgmt-users.properties -gp mgmt-groups.properties 
 
/appserver/wildfly-8.2.1.Final/servers/instances1/standalone


[root@localhost standalone]# echo $JBOSS_SERVER_BASE
/appserver/wildfly-8.2.1.Final/servers

 sh -x /appserver/wildfly-8.2.1.Final/bin/standalone.sh -Djboss.home.dir=$JBOSS_HOME -Djboss.server.base.dir=$JBOSS_SERVER_BASE/instances1/standalone -Djboss.server.config.dir=$JBOSS_SERVER_BASE/instances1/standalone/configuration --server-config=standalone-full-ha.xml  -Djboss.bind.address.management=192.168.88.137 -Djboss.management.native.port=9999 &

[root@localhost instances1]# pwd
/appserver/wildfly-8.2.1.Final/servers/instances1
[root@localhost instances1]#
[root@localhost instances1]# ls -ltr
total 0
drwxr-xr-x. 8 root root 91 Aug 25 15:10 standalone
[root@localhost instances1]# ls -ltr standalone/
total 4
drwxr-xr-x. 2 root root   24 Jul 23  2015 deployments
drwxr-xr-x. 3 root root   17 Jul 23  2015 lib
drwxr-xr-x. 4 root root   29 Aug 25 15:10 tmp
drwxr-xr-x. 3 root root 4096 Aug 25 21:51 configuration
drwxr-xr-x. 2 root root   53 Sep  1 16:19 log
drwxr-xr-x. 8 root root  149 Sep  1 16:28 data
[root@localhost instances1]#
