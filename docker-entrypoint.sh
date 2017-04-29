#!/bin/sh

set -x

save="saves/latest"
save_file="${save}.zip"
settings_file="data/server-settings.json"

if [ ! -f "$settings_file" ]; then
  cp data/server-settings.example.json "$settings_file"
fi

write () {
  jq -c "setpath([\"${1:-invalid}\"];\"$2\")" $settings_file > ${settings_file}.tmp
  mv ${settings_file}.tmp $settings_file
}

if [ ! -f $save_file ]; then
  bin/x64/factorio --create $save
fi

if [ ! -z "$FACTORIO_NAME" ]; then
  write "name" "$FACTORIO_NAME"
fi

if [ ! -z "$FACTORIO_DESCRIPTION" ]; then
  write "description" $FACTORIO_DESCRIPTION
fi

if [ ! -z "$FACTORIO_MAX_PLAYER" ]; then
  write "max_players" $FACTORIO_MAX_PLAYER
fi

if [ ! -z "$FACTORIO_VISIBILITY_PUBLIC" ]; then
  write "visibility\",\"public" $FACTORIO_VISIBILITY_PUBLIC
fi

if [ ! -z "$FACTORIO_VISIBILITY_LAN" ]; then
  write "visibility\",\"lan" $FACTORIO_VISIBILITY_LAN
fi

if [ ! -z "$FACTORIO_USERNAME" ]; then
  write "username" $FACTORIO_USERNAME
fi

if [ ! -z "$FACTORIO_PASSWORD" ]; then
  write "password" $FACTORIO_PASSWORD
fi

if [ ! -z "$FACTORIO_TOKEN" ]; then
  write "token" $FACTORIO_TOKEN
fi

if [ ! -z "$FACTORIO_GAME_PASSWORD" ]; then
  write "game_password" $FACTORIO_GAME_PASSWORD
fi

if [ ! -z "$FACTORIO_REQUIRE_USER_VERIFICATION" ]; then
  write "require_user_verification" $FACTORIO_REQUIRE_USER_VERIFICATION
fi

if [ ! -z "$FACTORIO_IGNORE_PLAYER_LIMIT_FOR_RETURING_PLAYERS" ]; then
  write "ignore_player_limit_for_returning_players" $FACTORIO_IGNORE_PLAYER_LIMIT_FOR_RETURING_PLAYERS
fi

if [ ! -z "$FACTORIO_ALLOW_COMMANDS" ]; then
  write "allow_commands" $FACTORIO_ALLOW_COMMANDS
fi

if [ ! -z "$FACTORIO_AUTOSAVE_INTERVAL" ]; then
  write "autosave_interval" $FACTORIO_AUTOSAVE_INTERVAL
fi

if [ ! -z "$FACTORIO_AUTOSAVE_SLOTS" ]; then
  write "autosave_slots" $FACTORIO_AUTOSAVE_SLOTS
fi

if [ ! -z "$FACTORIO_AFK_AUTOKICK_INTERVAL" ]; then
  write "afk_autokick_interval" $FACTORIO_AFK_AUTOKICK_INTERVAL
fi

if [ ! -z "$FACTORIO_AUTO_PAUSE" ]; then
  write "auto_pause" $FACTORIO_AUTO_PAUSE
fi

if [ ! -z "$FACTORIO_ONLY_ADMINS_CAN_PAUSE_THE_GAME" ]; then
  write "only_admins_can_pause_the_game" $FACTORIO_ONLY_ADMINS_CAN_PAUSE_THE_GAME
fi

if [ ! -z "$FACTORIO_AUTOSAVE_ONLY_ON_SERVER" ]; then
  write "autosave_only_on_server" $FACTORIO_AUTOSAVE_ONLY_ON_SERVER
fi

if [ ! -z "$FACTORIO_ADMINS" ]; then
  write "admins" $FACTORIO_ADMINS
fi

exec 0<&-
exec $@
