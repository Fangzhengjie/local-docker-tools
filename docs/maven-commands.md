# Maven Command Reference

## Basic Maven Commands

### Project Lifecycle

```bash
# Clean the project (delete target directory)
mvn clean

# Compile the project
mvn compile

# Compile test sources
mvn test-compile

# Run tests
mvn test

# Package the project (create JAR/WAR)
mvn package

# Install to local repository
mvn install

# Deploy to remote repository
mvn deploy

# Validate project structure
mvn validate

# Verify project
mvn verify
```

### Common Command Combinations

```bash
# Clean and compile
mvn clean compile

# Clean and package
mvn clean package

# Clean, compile, and install
mvn clean install

# Clean and install, skip tests
mvn clean install -DskipTests

# Clean and install, skip test compilation and execution
mvn clean install -Dmaven.test.skip=true

# Package without running tests
mvn package -DskipTests

# Run specific test class
mvn test -Dtest=TestClassName

# Run specific test method
mvn test -Dtest=TestClassName#testMethodName

# Run tests matching pattern
mvn test -Dtest=*ServiceTest
```

## Project Creation

```bash
# Create new Maven project (interactive)
mvn archetype:generate

# Create project with specific archetype
mvn archetype:generate -DgroupId=com.example -DartifactId=myapp -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

# Create web application
mvn archetype:generate -DgroupId=com.example -DartifactId=webapp -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

# Create Spring Boot application
mvn archetype:generate -DgroupId=com.example -DartifactId=springapp -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
```

## Dependency Management

```bash
# Display dependency tree
mvn dependency:tree

# Display dependency tree for specific artifact
mvn dependency:tree -Dincludes=com.example:artifact

# Analyze dependencies
mvn dependency:analyze

# List dependencies
mvn dependency:list

# Resolve dependencies
mvn dependency:resolve

# Copy dependencies to target/dependency
mvn dependency:copy-dependencies

# Copy dependencies to specific directory
mvn dependency:copy-dependencies -DoutputDirectory=lib

# Purge local repository
mvn dependency:purge-local-repository

# Download sources
mvn dependency:sources

# Download Javadocs
mvn dependency:resolve -Dclassifier=javadoc

# Check for dependency updates
mvn versions:display-dependency-updates

# Check for plugin updates
mvn versions:display-plugin-updates

# Update dependencies to latest versions
mvn versions:use-latest-versions

```

## Build Information

```bash
# Display effective POM
mvn help:effective-pom

# Display effective settings
mvn help:effective-settings

# Display active profiles
mvn help:active-profiles

# Display all profiles
mvn help:all-profiles

# Describe a plugin
mvn help:describe -Dplugin=compiler

# Describe a plugin goal
mvn help:describe -Dplugin=compiler -Dgoal=compile -Ddetail

# Display system properties
mvn help:system

# Evaluate Maven expression
mvn help:evaluate -Dexpression=project.version -q -DforceStdout
```

## Plugin Execution

```bash
# Run specific plugin goal
mvn plugin-name:goal-name

# Run compiler plugin
mvn compiler:compile

# Run surefire plugin (tests)
mvn surefire:test

# Run jar plugin
mvn jar:jar

# Run war plugin
mvn war:war

# Run exec plugin
mvn exec:java -Dexec.mainClass="com.example.Main"

# Run with arguments
mvn exec:java -Dexec.mainClass="com.example.Main" -Dexec.args="arg1 arg2"

# Run Spring Boot application
mvn spring-boot:run

# Run Tomcat plugin
mvn tomcat7:run

# Run Jetty plugin
mvn jetty:run
```

## Testing

```bash
# Run all tests
mvn test

# Run specific test class
mvn test -Dtest=MyTest

# Run multiple test classes
mvn test -Dtest=MyTest,YourTest

# Run test method
mvn test -Dtest=MyTest#testMethod

# Run tests with pattern
mvn test -Dtest=*ServiceTest

# Run integration tests
mvn verify

# Run integration tests only
mvn failsafe:integration-test

# Skip unit tests
mvn install -DskipTests

# Skip all tests (compilation and execution)
mvn install -Dmaven.test.skip=true

# Run tests in parallel
mvn test -DforkCount=4

# Generate test coverage report (with JaCoCo)
mvn clean test jacoco:report

# Run mutation testing (with PIT)
mvn org.pitest:pitest-maven:mutationCoverage
```

## Code Quality and Analysis

```bash
# Run Checkstyle
mvn checkstyle:check

# Run PMD
mvn pmd:check

# Run SpotBugs (formerly FindBugs)
mvn spotbugs:check

# Run SonarQube analysis
mvn sonar:sonar

# Run SonarQube with specific server
mvn sonar:sonar -Dsonar.host.url=http://localhost:9000

# Generate site documentation
mvn site

# Generate and deploy site
mvn site:deploy

# Generate Javadoc
mvn javadoc:javadoc

# Generate source JAR
mvn source:jar

# Generate test source JAR
mvn source:test-jar
```

## Multi-Module Projects

```bash
# Build all modules
mvn clean install

# Build specific module
mvn clean install -pl module-name

# Build module and its dependencies
mvn clean install -pl module-name -am

# Build modules that depend on specific module
mvn clean install -pl module-name -amd

# Build from specific module
mvn clean install -rf :module-name

# Build multiple modules
mvn clean install -pl module1,module2

# Build in parallel
mvn clean install -T 4

# Build with all available cores
mvn clean install -T 1C
```

## Profiles

```bash
# Activate profile
mvn clean install -P profile-name

# Activate multiple profiles
mvn clean install -P profile1,profile2

# List active profiles
mvn help:active-profiles

# List all profiles
mvn help:all-profiles

# Deactivate profile
mvn clean install -P !profile-name
```

## Release Management

```bash
# Prepare release
mvn release:prepare

# Perform release
mvn release:perform

# Rollback release
mvn release:rollback

# Clean release
mvn release:clean

# Update versions
mvn versions:set -DnewVersion=1.2.0

# Update versions interactively
mvn versions:set

# Commit version change
mvn versions:commit

# Revert version change
mvn versions:revert

# Update parent version
mvn versions:update-parent

# Update child modules
mvn versions:update-child-modules
```

## Repository Management

```bash
# Install artifact to local repository
mvn install:install-file -Dfile=mylib.jar -DgroupId=com.example -DartifactId=mylib -Dversion=1.0 -Dpackaging=jar

# Deploy artifact to remote repository
mvn deploy:deploy-file -Dfile=mylib.jar -DgroupId=com.example -DartifactId=mylib -Dversion=1.0 -Dpackaging=jar -Durl=http://repo.example.com/maven2 -DrepositoryId=my-repo

# Purge local repository
mvn dependency:purge-local-repository

# Download dependencies
mvn dependency:go-offline
```

## Docker Integration

```bash
# Build Docker image (with Jib)
mvn compile jib:build

# Build Docker image to local daemon
mvn compile jib:dockerBuild

# Build Docker image to tar
mvn compile jib:buildTar

# Build with Dockerfile Maven plugin
mvn dockerfile:build

# Push Docker image
mvn dockerfile:push
```

## Debugging and Troubleshooting

```bash
# Run in debug mode
mvn -X clean install

# Run in quiet mode
mvn -q clean install

# Show version
mvn -version
mvn --version

# Display help
mvn -h
mvn --help

# Run offline (use cached dependencies)
mvn -o clean install

# Force update snapshots
mvn clean install -U

# Continue build despite failures
mvn clean install --fail-at-end

# Never fail build
mvn clean install --fail-never

# Use specific settings file
mvn clean install -s /path/to/settings.xml

# Use specific POM file
mvn clean install -f /path/to/pom.xml

# Define property
mvn clean install -Dproperty.name=value

# Encrypt password
mvn --encrypt-password mypassword

# Encrypt master password
mvn --encrypt-master-password mypassword

# Resume from specific module
mvn clean install -rf :module-name
```

## Performance Optimization

```bash
# Build in parallel (4 threads)
mvn clean install -T 4

# Build with all CPU cores
mvn clean install -T 1C

# Skip tests
mvn clean install -DskipTests

# Skip test compilation
mvn clean install -Dmaven.test.skip=true

# Run offline
mvn clean install -o

# Batch mode (non-interactive)
mvn clean install -B

# Increase memory
export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=512m"
mvn clean install

# Use daemon (mvnd - Maven Daemon)
mvnd clean install
```

## Common Maven Properties

```bash
# Skip tests
-DskipTests=true

# Skip test compilation and execution
-Dmaven.test.skip=true

# Skip Javadoc generation
-Dmaven.javadoc.skip=true

# Skip source generation
-Dmaven.source.skip=true

# Set encoding
-Dproject.build.sourceEncoding=UTF-8

# Set Java version
-Dmaven.compiler.source=11
-Dmaven.compiler.target=11

# Set final name
-Dfinal.name=myapp

# Enable verbose output
-Dverbose=true

# Set log level
-Dorg.slf4j.simpleLogger.defaultLogLevel=debug
```

## Maven Wrapper (mvnw)

```bash
# Install Maven Wrapper
mvn wrapper:wrapper

# Install specific Maven version
mvn wrapper:wrapper -Dmaven=3.8.6

# Use Maven Wrapper (Linux/Mac)
./mvnw clean install

# Use Maven Wrapper (Windows)
mvnw.cmd clean install

# Update wrapper
./mvnw wrapper:wrapper
```

## Useful Plugin Configurations

### Compiler Plugin
```bash
# Compile with specific Java version
mvn clean compile -Dmaven.compiler.source=11 -Dmaven.compiler.target=11

# Show compilation warnings
mvn clean compile -Dmaven.compiler.showWarnings=true

# Show deprecation warnings
mvn clean compile -Dmaven.compiler.showDeprecation=true
```

### Surefire Plugin (Unit Tests)
```bash
# Run tests with specific JVM arguments
mvn test -DargLine="-Xmx1024m"

# Generate test reports
mvn surefire-report:report

# Run tests in parallel
mvn test -Dparallel=methods -DthreadCount=4
```

### Failsafe Plugin (Integration Tests)
```bash
# Run integration tests
mvn verify

# Skip integration tests
mvn verify -DskipITs
```

### Assembly Plugin
```bash
# Create distribution
mvn assembly:single

# Create with specific descriptor
mvn assembly:single -Ddescriptor=src/assembly/dist.xml
```

### Shade Plugin
```bash
# Create uber JAR
mvn package shade:shade
```

## Tips

- Use Maven Wrapper (mvnw) for consistent Maven versions across teams
- Always specify encoding: `-Dproject.build.sourceEncoding=UTF-8`
- Use profiles for environment-specific configurations
- Run `mvn clean` before important builds to ensure clean state
- Use `mvn dependency:tree` to debug dependency conflicts
- Enable parallel builds with `-T` for faster builds
- Use `mvn -o` (offline mode) when dependencies are already cached
- Keep your local repository clean with `mvn dependency:purge-local-repository`
- Use `mvn versions:display-dependency-updates` to check for updates
- Consider using Maven Daemon (mvnd) for faster builds
