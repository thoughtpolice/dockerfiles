name := "Simple Project"

version := "1.0"

scalaVersion := "2.9.3"

libraryDependencies += "org.ow2.asm" % "asm" % "4.0"

libraryDependencies += "org.apache.hadoop" % "hadoop-client" % "2.0.0-mr1-cdh4.2.0"

libraryDependencies += "org.apache.spark" %% "spark-core" % "0.8.0-incubating"

libraryDependencies += "org.apache.spark" %% "spark-streaming" % "0.8.0-incubating"

libraryDependencies += "org.apache.spark" %% "spark-bagel" % "0.8.0-incubating"

libraryDependencies += "org.apache.spark" %% "spark-mllib" % "0.8.0-incubating"

resolvers += "Akka Repository" at "http://repo.akka.io/releases/"

resolvers += "Cloudera Repository" at "https://repository.cloudera.com/artifactory/cloudera-repos/"

//Work around weird ivy bug
ivyXML :=
<dependency org="org.eclipse.jetty.orbit" name="javax.servlet"
rev="2.5.0.v201103041518">
<artifact name="javax.servlet" type="orbit" ext="jar"/>
</dependency>
