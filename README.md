# Pak

Pak is an AUR helper wrapper, intended for use specifically with `paru`, with syntax in the style of the package manager `apk` used on Alpine and Chimera Linux (hence the name "pak" for "paru's alpine kidnapper). 

It is itself a fork of [pac-wrapper](https://github.com/eatsu/pac-wrapper).

## Examples

Command | Description
:-- | :--
`pak upgrade` | Upgrade installed packages.
`pak add foo` | Install package `foo` and its dependencies.
`pak del foo` | Remove package `foo` and its dependencies.
`pac info foo` | Show information about package or group `foo`.
`pac search foo` | Search package names and descriptions with keyword `foo`.
`pak mark -d foo` <br> `pac mark --asdeps foo` | Mark package `foo` as dependencies.
`pak clean` | Remove dependencies that are no longer required by any installed package.
`pac list --explicit --foreign`| List explicitly installed foreign packages (e.g. AUR packages).

Run `pak --help` for more information.

## Configuration

To wrap another pacman-compatible program,
(or pacman itself) set the environment variable `PAC_PACMAN`.

For example, to wrap `pacman`, add

```sh
export PAC_PACMAN='pacman'
```

to your `~/.bash_profile` (or `$ZDOTDIR/.zshenv` for Zsh) and reload your shell.

If using fish, additionally install [omf](https://github.com/oh-my-fish/oh-my-fish) and the [foreign-env](https://github.com/oh-my-fish/plugin-foreign-env) plugin.

## License

MIT
