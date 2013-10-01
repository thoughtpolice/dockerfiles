"""SimpleApp.py"""
import sys
from pyspark import SparkContext

def main():
    if len(sys.argv) < 2:
        print "Need spark URI."
        sys.exit(-1)

    logFile = "/usr/local/opt/spark-0.8.0/README.md"  # Should be some file on your system
    sc = SparkContext(sys.argv[1], "Simple Python App")
    logData = sc.textFile(logFile).cache()

    numAs = logData.filter(lambda s: 'a' in s).count()
    numBs = logData.filter(lambda s: 'b' in s).count()
    print "Lines with a: %i, lines with b: %i" % (numAs, numBs)

if __name__ == '__main__':
    main()
