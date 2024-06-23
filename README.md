# Pak

Pak forks pac-wrapper for syntax more similar to apk from Alpine/Chimera Linux (hence the name "pak").

## Examples

Command | Description
:-- | :--
`pak` | Upgrade installed packages.
`pak add foo` | Install package `foo` and its dependencies.
`pak del foo` | Remove package `foo` and its dependencies.
`pak if foo` <br> `pac info foo` | Show information about package or group `foo`.
`pak se foo` <br> `pac search foo` | Search package names and descriptions with keyword `foo`.
`pak mark -d foo` <br> `pac mark --asdeps foo` | Mark package `foo` as dependencies.
`pak clean` | Remove dependencies that are no longer required by any installed package.
`pak ls -ef` <br> `pac list --explicit --foreign`| List explicitly installed foreign packages (e.g. AUR packages).

Run `pak --help` for more information.

## Configuration

By default, `pak` wraps `pacman`. To wrap another pacman-compatible program,
set the environment variable `PAC_PACMAN`.

For example, to wrap [`paru`](https://github.com/Morganamilo/paru) instead of
`pacman`, add

```sh
export PAC_PACMAN='paru'
```

to your `~/.bash_profile` (or `$ZDOTDIR/.zshenv` for Zsh) and reload your shell.

## License

MIT
