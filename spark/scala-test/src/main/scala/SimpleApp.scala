/*** SimpleApp.scala ***/

import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._

object SimpleApp {
  def main(args: Array[String]) {
    if(args.isEmpty) { println("Need spark URI."); System.exit(1); }

    val logFile = "/usr/local/opt/spark-0.8.0/README.md" // Should be some file on your system
    val sc = new SparkContext(args(0), "Simple Scala App", System.getenv("SPARK_HOME"),
      List("target/scala-2.9.3/simple-project_2.9.3-1.0.jar"))
    val logData = sc.textFile(logFile)
    val numAs = logData.filter(line => line.contains("a")).count()
    val numBs = logData.filter(line => line.contains("b")).count()
    println("Lines with a: %s, Lines with b: %s".format(numAs, numBs))
    System.exit(0)
  }
}
