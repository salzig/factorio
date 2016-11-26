# Factorio Server in Docker

## How to use?

```
docker run -d --net=host salzig/factorio
```

## Configuration / Variables

* `FACTORIO_NAME` - Server Name (String)
* `FACTORIO_DESCRIPTION` - Server Description (String)
* `FACTORIO_MAX_PLAYER` - Maximum Number of players (Number)
* `FACTORIO_VISIBILITY_PUBLIC` - Publicly Visible Server (Boolean)
* `FACTORIO_VISIBILITY_LAN` - Lan Visible Server (Boolean)
* `FACTORIO_USERNAME` - Factorio Login Name to use for the server (String)
* `FACTORIO_PASSWORD` - Factorio Login Password to use for the Server (String)
* `FACTORIO_TOKEN` - Factorio Login Token to use instead of Login and Password (String)
* `FACTORIO_GAME_PASSWORD` - Game Password a user needs to join the game (String)
* `FACTORIO_REQUIRE_USER_VERIFICATION` - Should user accounts be verified using factorio.com (String)
* `FACTORIO_IGNORE_PLAYER_LIMIT_FOR_RETURING_PLAYERS` - Should returing players always be allowed to join the server? (Boolean)
* `FACTORIO_ALLOW_COMMANDS` - Allow Ingame Commands (Boolean)
* `FACTORIO_AUTOSAVE_INTERVAL` - Auto Save Interval in minutes (Number)
* `FACTORIO_AUTOSAVE_SLOTS` - Auto Save Slots (Number)
* `FACTORIO_AFK_AUTOKICK_INTERVAL` - Time after AFK user should be kicked (Number)
* `FACTORIO_AUTO_PAUSE` - Pause Game when last player leaves (Boolean)
* `FACTORIO_ONLY_ADMINS_CAN_PAUSE_THE_GAME` - Allow only admins to pause the game (Boolean)
* `FACTORIO_AUTOSAVE_ONLY_ON_SERVER` - Store autosaves only on server side (Boolean)
* `FACTORIO_ADMINS` - List of Factorio Admins (String)

## Advanced usage

### Setting the Server Name

```
docker run -d \
  -p 34197:34917/upd \
  -e FACTORIO_NAME='Running in Docker' \
  --restart always \
  salzig/factorio
```

### Docker-Compose File

```
version: "2"
services:
  server:
    image: salzig/factorio
    restart: always
    volumes:
      - '/var/factorio/saves:/opt/factorio/saves'
    ports:
      - '34197:34197/udp'
    environment:
      - FACTORIO_NAME: My Awesome Factorio Server Running Inside Docker
      - FACTORIO_ADMINS: "MyUserName"
```
