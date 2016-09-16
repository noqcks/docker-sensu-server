# docker-sensu-server

Sensu server and other things on Ubuntu in Docker.

Docker compose will bring up 3 containers:

1. **rabbitmq**: This is used as a transport for sensu. Sensu checks and results are published here.

2. **redis**: This is used as a data store for things such as client registry and check results.

3. **sensu**: This container will contain processes related to sensu (uchiwa, sensu-api, sensu-server).

## Installation

```
git clone git@github.com:noqcks/docker-sensu-server.git
```

## Run

```
cd docker-sensu-server
docker-compose up -d
```

## Access

### uchiwa

* http://your-server:3000/

## License

MIT
