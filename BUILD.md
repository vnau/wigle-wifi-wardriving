# Wigle Wardriving Android Build with Custom Server

This repository contains the Docker configuration for building the **WiGLE WiFi Wardriving** Android application with a custom server instead of `wigle.net`.

## Prerequisites
Ensure you have the following installed before proceeding:
- **Docker**
- **Docker Compose**

## Build the Docker Image
To build the Docker image, run:
```sh
docker-compose build
```

## Run the Build Process

Set the required environment variables and run the build process inside the Docker container.

### Windows (CMD):

``` cmd
set "MAPS_KEY=GOOGLE_MAPS_API_KEY" && set "API_DOMAIN=api.wigle.net" && set "WIGLE_BASE_URL=https://wigle.net" && docker-compose run wigle-builder
```

### Linux / macOS (Bash):

``` cmd
export MAPS_KEY="GOOGLE_MAPS_API_KEY"
export API_DOMAIN="api.wigle.net"
export WIGLE_BASE_URL="https://wigle.net"
docker-compose run wigle-builder
```

### Important Notes:
Replace ```GOOGLE_MAPS_API_KEY``` with your actual Google Maps API key.
Set ```API_DOMAIN``` and ```WIGLE_BASE_URL``` to match your custom server URLs.

### Locate the Built APK
After a successful build, the application APK will be located at:

```
wiglewifiwardriving/build/outputs/apk/debug/wiglewifiwardriving-debug.apk
```

You can install the APK on your Android device for testing.