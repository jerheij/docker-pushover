## Pushover container

### Description

This is a basic image with curl to use for sending a pushover message.

### Sources
Base image: [alpine:latest](https://hub.docker.com/_/alpine/) 
Packages: curl, openssl

### Usage

```
docker run \
-e "TOKEN=1" \
-e "USER=1" \
-e "TITLE=test message" \
-e "MSG=$(cat /tmp/msg)" \
-ti jerheij/pushover:stable
```
Or

```
docker run \
-e "TOKEN=1" \
-e "USER=1" \
-e "TITLE=test message" \
-e "MSG=This is a message" \
-ti jerheij/pushover:stable
```

### Variables
| Variable | Function | Optional |
| --- | --- | --- |
| `TOKEN`| Application token from pushover | no |
| `USER` | User token from pushover | no |
| `TITLE`| Pushover message title | no |
| `MSG`| Pushover message  | no |

### Author
Jerheij
