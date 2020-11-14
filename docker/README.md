# Run in docker
Simple and fast setup of **LeoPays** on Docker is also available.

## Install Dependencies
- [Docker](https://docs.docker.com) Docker 17.05 or higher is required
- [docker-compose](https://docs.docker.com/compose/) version >= 1.10.0

## Docker Requirement
- At least 7GB RAM (Docker -> Preferences -> Advanced -> Memory -> 7GB or above)
- If the build below fails, make sure you've adjusted Docker Memory settings and try again.

## Build, Push and Remove local images
Edit `VERSION` in `.environment` file.
```bash
./bpr.sh
```

## Build leopays image
```bash
git clone https://github.com/leopays-core/leopays.git --recursive  --depth 1
cd leopays/docker
docker build \
  --no-cache \
  --tag leopays/leopays \
  .
```

The above will build off the most recent commit to the master branch by default. If you would like to target a specific `branch/tag`, you may use a build argument. For example, if you wished to generate a docker image based off of the `v1.0.0` tag, you could do the following:
```bash
docker build \
  --no-cache \
  --tag leopays/leopays:v0.1.0 \
  --build-arg branch=v0.1.0 \
  .
```


By default, the symbol in `eosio.system` is set to `LPC`. You can override this using the `symbol` argument while building the docker image.
```bash
docker build \
  --no-cache \
  --tag leopays/leopays \
  --build-arg symbol=<symbol> \
  .
```

## Start leopays-node docker container only
```bash
docker run \
  --name leopays_node \
  --publish 8888:8888 --publish 9876:9876 \
  --tag leopays/leopays \
  leopays-node.sh \
    -e -p eosio \
    --http-alias=leopays_node:8888 \
    --http-alias=127.0.0.1:8888 \
    --http-alias=localhost:8888 \
    arg1 arg2
```

By default, all data is persisted in a docker volume. It can be deleted if the data is outdated or corrupted:
```bash
docker inspect --format '{{ range .Mounts }}{{ .Name }} {{ end }}' leopays_node
fdc265730a4f697346fa8b078c176e315b959e79365fc9cbd11f090ea0cb5cbc
docker volume rm fdc265730a4f697346fa8b078c176e315b959e79365fc9cbd11f090ea0cb5cbc
```

Alternately, you can directly mount host directory into the container
```bash
docker run \
  --name leopays_node \
  --publish 8888:8888 --publish 9876:9876 \
  --tag leopays/leopays \
  --volume /path-to-data-dir:/data \
  leopays-node.sh \
    -e -p eosio \
    --http-alias=leopays_node:8888 \
    --http-alias=127.0.0.1:8888 \
    --http-alias=localhost:8888 \
    arg1 arg2
```

## Get chain info
```bash
curl http://127.0.0.1:8888/v1/chain/get_info
```

## Start both leopays_node and leopays_wallet containers
```bash
docker volume create --name=leopays-node-data-volume
docker volume create --name=leopays-wallet-data-volume
docker-compose up -d
```

After `docker-compose up -d`, two services named `leopays-node` and `leopays-wallet` will be started. `leopays_node` service would expose ports `8888` and `9876` to the host. `leopays_wallet` service does not expose any port to the host, it is only accessible to `leopays-cli` when running `leopays-cli` is running inside the `leopays_wallet` container as described in "Execute leopays-cli commands" section.

### Execute leopays-cli commands
You can run the `leopays-cli` commands via a bash alias.
```bash
alias leopays-cli='docker-compose exec leopays_wallet /opt/leopays/bin/leopays-cli -u http://leopays_node:8888 --wallet-url http://localhost:8900'
leopays-cli get info
leopays-cli get account inita
```

Upload sample example contract:
```bash
leopays-cli set contract example contracts/example/
```

If you don't need `leopays_wallet` afterwards, you can stop the `leopays_wallet` service using
```bash
docker-compose stop leopays_wallet
```

### Develop/Build custom contracts
Due to the fact that the `leopays/leopays` image does not contain the required dependencies for contract development (this is by design, to keep the image size small), you will need to utilize the `leopays/leopays-dev` image. This image contains both the required binaries and dependencies to build contracts using `leopays-cpp`.

You can either use the image available on [Docker Hub](https://hub.docker.com/r/leopays/leopays-dev/) or navigate into the dev folder and build the image manually.
```bash
cd dev
docker build \
  --no-cache \
  --tag leopays/leopays-dev \
  .
```

### Change default configuration
You can use docker compose override file to change the default configurations. For example, create an alternate config file `config2.ini` and a `docker-compose.override.yml` with the following content.
```yml
version: "3"

services:
  leopays_node:
    volumes:
      - leopays-node-data-volume:/data
      - ./config2.ini:/data/config.ini
```

Then restart your docker containers as follows:
```bash
docker-compose down
docker-compose up
```

### Clear data dir
The data volume created by docker-compose can be deleted as follows:
```bash
docker volume rm leopays-node-data-volume
docker volume rm leopays-wallet-data-volume
```

### Docker Hub
Docker Hub images are now deprecated. New build images were discontinued on January 1st, 2019. The existing old images will be removed on June 1st, 2019.

### LeoPays Testnet
We can easily set up a LeoPays local testnet using docker images. Just run the following commands:

Note: if you want to use the mongo db plugin, you have to enable it in your `/data/config.ini` first.
```bash
# create volume
docker volume create --name=leopays-node-data-volume
docker volume create --name=leopays-wallet-data-volume
# pull images and start containers
docker-compose --file docker-compose-leopays-latest.yml up -d
# get chain info
curl http://127.0.0.1:8888/v1/chain/get_info
# get logs
docker-compose logs --file leopays-node
# stop containers
docker-compose --file docker-compose-leopays-latest.yml down
```

The `blocks` data are stored under `--data-dir` by default, and the wallet files are stored under `--wallet-dir` by default, of course you can change these as you want.

### About MongoDB Plugin
Currently, the mongodb plugin is disabled in `config.ini` by default, you have to change it manually in `config.ini` or you can mount a `config.ini` file to `/data/config.ini` in the docker-compose file.
