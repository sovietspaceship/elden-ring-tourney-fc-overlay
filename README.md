# ER Example Tourney/FC Overlay

Proof of concept for tourney/fc overlays. To actually use this in multiplayer, use the [Seamless Coop Mod](https://www.nexusmods.com/eldenring/mods/510) and enable pvp mode.

Requires Node 16+ and the [Elden Ring Cheat Table by The Grand Archives](https://github.com/inunorii/Elden-Ring-CT-TGA).

```
bash install # install dependencies
bash compile # compile client
bash start # start server
```

then add `http://localhost:4567` as browser source in OBS.

CE table provided in `table/Table.CT`. Change `filePath` in `FC Hosting` -> `Overlay Data Updater` to an existing directory on your system and then execute the script.

## Player indexing

Players are indexed by numbers from 0 to 3. To show a different player, pass the `index` property to the `PlayerInfo` Vue component in `src/components/PlayerInfo.vue`.
