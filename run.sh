#!/bin/bash

# Script to run the Demo Maven Project application

# Ensure we have the latest build
echo "Building the project..."
./mvnw clean package -DskipTests

# Run the application
echo "Running the application..."
./mvnw exec:java -Dexec.mainClass="DevOpsDemo.Apps.App"
