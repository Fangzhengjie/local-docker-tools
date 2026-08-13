# Java and JVM Command Reference

## Java Commands

### Running Java Applications

```bash
# Run a Java class file
java ClassName

# Run a Java class with package
java com.example.ClassName

# Run a JAR file
java -jar application.jar

# Run with classpath
java -cp /path/to/classes ClassName
java -classpath /path/to/classes:lib/* ClassName

# Run with specific JVM memory settings
java -Xms512m -Xmx2g -jar application.jar

# Run with system properties
java -Dproperty.name=value -jar application.jar

# Run with specific Java version (using JAVA_HOME)
/path/to/jdk/bin/java -jar application.jar

# Run in debug mode
java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 -jar application.jar

# Run with garbage collection logging
java -Xlog:gc*:file=gc.log -jar application.jar

# Run with remote JMX monitoring
java -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9010 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -jar application.jar
```

### Compiling Java Code

```bash
# Compile a single Java file
javac HelloWorld.java

# Compile with specific output directory
javac -d bin src/HelloWorld.java

# Compile with classpath
javac -cp lib/* src/HelloWorld.java

# Compile with specific Java version
javac -source 11 -target 11 HelloWorld.java

# Compile with encoding
javac -encoding UTF-8 HelloWorld.java

# Compile all Java files in directory
javac src/**/*.java

# Compile with verbose output
javac -verbose HelloWorld.java

# Compile with deprecation warnings
javac -deprecation HelloWorld.java

# Compile with all warnings
javac -Xlint:all HelloWorld.java
```

### Creating JAR Files

```bash
# Create a JAR file
jar cf myapp.jar -C bin .

# Create a JAR with manifest
jar cfm myapp.jar manifest.txt -C bin .

# Create an executable JAR
jar cfe myapp.jar MainClass -C bin .

# Extract JAR contents
jar xf myapp.jar

# List JAR contents
jar tf myapp.jar

# Update JAR file
jar uf myapp.jar NewClass.class

# Create JAR with verbose output
jar cvf myapp.jar -C bin .
```

### Java Documentation

```bash
# Generate Javadoc
javadoc -d doc src/*.java

# Generate Javadoc with specific packages
javadoc -d doc -sourcepath src com.example

# Generate Javadoc with classpath
javadoc -d doc -classpath lib/* -sourcepath src com.example

# Generate private documentation
javadoc -private -d doc src/*.java

# Generate with custom title
javadoc -doctitle "My Application API" -d doc src/*.java
```

## JVM Diagnostic Commands

### jps - Java Process Status

```bash
# List all Java processes
jps

# List with full class name
jps -l

# List with JVM arguments
jps -v

# List with main method arguments
jps -m

# List all information
jps -lvm
```

### jinfo - Java Configuration Info

```bash
# Display system properties and JVM flags
jinfo <pid>

# Display specific flag
jinfo -flag MaxHeapSize <pid>

# Display all flags
jinfo -flags <pid>

# Set JVM flag (for manageable flags)
jinfo -flag +PrintGC <pid>
jinfo -flag -PrintGC <pid>

# Display system properties
jinfo -sysprops <pid>
```

### jstat - JVM Statistics

```bash
# Display class loader statistics
jstat -class <pid>

# Display garbage collection statistics
jstat -gc <pid>

# Display GC statistics with timestamps
jstat -gc <pid> 1000 10

# Display heap statistics
jstat -gccapacity <pid>

# Display new generation statistics
jstat -gcnew <pid>

# Display old generation statistics
jstat -gcold <pid>

# Display GC summary
jstat -gcutil <pid>

# Display compiler statistics
jstat -compiler <pid>

# Display JIT compilation statistics
jstat -printcompilation <pid>
```

### jmap - Memory Map

```bash
# Print heap summary
jmap -heap <pid>

# Generate heap dump
jmap -dump:format=b,file=heap.bin <pid>

# Generate heap dump (live objects only)
jmap -dump:live,format=b,file=heap.bin <pid>

# Print histogram of heap
jmap -histo <pid>

# Print histogram of live objects
jmap -histo:live <pid>

# Print class loader statistics
jmap -clstats <pid>

# Print finalization queue
jmap -finalizerinfo <pid>
```

### jstack - Thread Dump

```bash
# Print thread dump
jstack <pid>

# Print thread dump with extended information
jstack -l <pid>

# Print thread dump with locks
jstack -m <pid>

# Force thread dump (if process is hung)
jstack -F <pid>

# Save thread dump to file
jstack <pid> > thread_dump.txt
```

### jcmd - JVM Command

```bash
# List available commands for a process
jcmd <pid> help

# Print VM version
jcmd <pid> VM.version

# Print system properties
jcmd <pid> VM.system_properties

# Print JVM flags
jcmd <pid> VM.flags

# Print command line
jcmd <pid> VM.command_line

# Generate heap dump
jcmd <pid> GC.heap_dump filename=heap.hprof

# Run garbage collection
jcmd <pid> GC.run

# Print class histogram
jcmd <pid> GC.class_histogram

# Print thread dump
jcmd <pid> Thread.print

# Print native memory tracking
jcmd <pid> VM.native_memory summary

# Print uptime
jcmd <pid> VM.uptime
```

### jconsole - Java Monitoring Console

```bash
# Launch JConsole
jconsole

# Connect to specific process
jconsole <pid>

# Connect to remote JVM
jconsole <hostname>:<port>
```

### jvisualvm - Java VisualVM

```bash
# Launch VisualVM
jvisualvm

# Launch with specific JDK
/path/to/jdk/bin/jvisualvm
```

### jhat - Heap Analysis Tool

```bash
# Analyze heap dump
jhat heap.bin

# Analyze with specific port
jhat -port 7000 heap.bin

# Analyze with specific heap size
jhat -J-Xmx4g heap.bin
```

## JVM Options

### Memory Options

```bash
# Set initial heap size
-Xms512m

# Set maximum heap size
-Xmx2g

# Set young generation size
-Xmn512m

# Set thread stack size
-Xss1m

# Set metaspace size
-XX:MetaspaceSize=128m
-XX:MaxMetaspaceSize=512m

# Set direct memory size
-XX:MaxDirectMemorySize=512m
```

### Garbage Collection Options

```bash
# Use Serial GC
-XX:+UseSerialGC

# Use Parallel GC
-XX:+UseParallelGC

# Use CMS GC
-XX:+UseConcMarkSweepGC

# Use G1 GC
-XX:+UseG1GC

# Use ZGC (Java 11+)
-XX:+UseZGC

# Use Shenandoah GC
-XX:+UseShenandoahGC

# Set number of GC threads
-XX:ParallelGCThreads=4

# Set GC pause time goal (G1)
-XX:MaxGCPauseMillis=200

# Print GC details
-XX:+PrintGCDetails
-XX:+PrintGCDateStamps
-XX:+PrintGCTimeStamps

# GC logging (Java 9+)
-Xlog:gc*:file=gc.log:time,uptime,level,tags
```

### Performance Options

```bash
# Enable JIT compilation
-XX:+TieredCompilation

# Set compilation threshold
-XX:CompileThreshold=10000

# Enable aggressive optimizations
-XX:+AggressiveOpts

# Enable large pages
-XX:+UseLargePages

# Enable compressed pointers (64-bit)
-XX:+UseCompressedOops

# Disable explicit GC
-XX:+DisableExplicitGC
```

### Debugging Options

```bash
# Enable remote debugging
-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005

# Print all VM options
-XX:+PrintFlagsFinal

# Print command line flags
-XX:+PrintCommandLineFlags

# Enable assertions
-ea
-enableassertions

# Disable assertions
-da
-disableassertions

# Enable system assertions
-esa
-enablesystemassertions

# Verbose class loading
-verbose:class

# Verbose GC
-verbose:gc

# Verbose JNI
-verbose:jni
```

### Monitoring Options

```bash
# Enable JMX
-Dcom.sun.management.jmxremote
-Dcom.sun.management.jmxremote.port=9010
-Dcom.sun.management.jmxremote.authenticate=false
-Dcom.sun.management.jmxremote.ssl=false

# Enable native memory tracking
-XX:NativeMemoryTracking=summary
-XX:NativeMemoryTracking=detail

# Enable flight recorder
-XX:+FlightRecorder
-XX:StartFlightRecording=duration=60s,filename=recording.jfr

# Dump on OutOfMemoryError
-XX:+HeapDumpOnOutOfMemoryError
-XX:HeapDumpPath=/path/to/dumps

# Exit on OutOfMemoryError
-XX:+ExitOnOutOfMemoryError

# Crash on OutOfMemoryError
-XX:+CrashOnOutOfMemoryError
```

## Java Version Management

```bash
# Check Java version
java -version

# Check compiler version
javac -version

# List installed Java versions (Linux/Mac with alternatives)
update-alternatives --list java

# Switch Java version (Linux)
sudo update-alternatives --config java

# Set JAVA_HOME (Linux/Mac)
export JAVA_HOME=/path/to/jdk
export PATH=$JAVA_HOME/bin:$PATH

# Set JAVA_HOME (Windows)
set JAVA_HOME=C:\path\to\jdk
set PATH=%JAVA_HOME%\bin;%PATH%
```

## Java Module System (Java 9+)

```bash
# List modules
java --list-modules

# Describe module
java --describe-module java.base

# Run modular application
java --module-path mods --module com.example.app/com.example.Main

# Compile module
javac -d out --module-source-path src $(find src -name "*.java")

# Create modular JAR
jar --create --file mods/com.example.jar --main-class com.example.Main -C out/com.example .

# Show module resolution
java --show-module-resolution --module-path mods --module com.example.app

# Add modules
java --add-modules java.sql -jar app.jar

# Add exports
java --add-exports java.base/sun.nio.ch=ALL-UNNAMED -jar app.jar

# Add opens
java --add-opens java.base/java.lang=ALL-UNNAMED -jar app.jar
```

## jlink - Custom Runtime Images

```bash
# Create custom runtime image
jlink --module-path $JAVA_HOME/jmods:mods --add-modules com.example.app --output runtime

# Create with compression
jlink --module-path $JAVA_HOME/jmods:mods --add-modules com.example.app --compress=2 --output runtime

# Create with launcher
jlink --module-path $JAVA_HOME/jmods:mods --add-modules com.example.app --launcher app=com.example.app/com.example.Main --output runtime

# List modules in image
runtime/bin/java --list-modules
```

## Common JVM Troubleshooting Commands

```bash
# Check if Java process is running
ps aux | grep java

# Find Java process by port
lsof -i :8080

# Monitor Java process CPU/Memory
top -p <pid>

# Generate thread dump (Linux)
kill -3 <pid>

# Generate heap dump on OutOfMemoryError
java -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp/heap.hprof -jar app.jar

# Analyze heap dump with Eclipse MAT
# Download from: https://www.eclipse.org/mat/

# Profile with async-profiler
./profiler.sh -d 30 -f /tmp/profile.html <pid>

# Check for memory leaks
jmap -histo:live <pid> | head -20

# Monitor GC in real-time
jstat -gcutil <pid> 1000
```

## Tips

- Use `-XX:+PrintFlagsFinal` to see all available JVM flags
- Always set `-Xms` and `-Xmx` to the same value in production
- Use G1GC for applications with large heaps (> 4GB)
- Enable GC logging in production for troubleshooting
- Use jcmd instead of older tools (jstack, jmap, jinfo) when possible
- Monitor JVM metrics with tools like Prometheus + Grafana
- Use heap dumps sparingly as they can pause the application
- Consider using Java Flight Recorder for production profiling
