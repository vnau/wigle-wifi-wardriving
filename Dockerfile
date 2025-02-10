# Use an official OpenJDK runtime as a parent image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    unzip \
    wget \
    curl \
    git \
    dos2unix \
    file \
    && rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

# Install Gradle
RUN wget https://services.gradle.org/distributions/gradle-8.0-bin.zip -P /tmp \
    && unzip /tmp/gradle-8.0-bin.zip -d /opt \
    && rm /tmp/gradle-8.0-bin.zip
ENV GRADLE_HOME=/opt/gradle-8.0
ENV PATH="$GRADLE_HOME/bin:$PATH"

# Install Android SDK
RUN mkdir -p /opt/android-sdk/cmdline-tools/latest && cd /opt/android-sdk/cmdline-tools/latest \
    && wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O android-sdk.zip \
    && unzip android-sdk.zip -d /opt/android-sdk \
    && rm android-sdk.zip

# Set ANDROID_HOME environment variable
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH="$ANDROID_HOME/cmdline-tools/bin:$ANDROID_HOME/platform-tools:$PATH"

# Accept licenses and install required Android SDK packages
RUN yes | sdkmanager --sdk_root=$ANDROID_HOME --licenses && \
    sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "platforms;android-34" "build-tools;34.0.0"

# Set work directory
WORKDIR /app
