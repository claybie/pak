# pak

pak is an AUR helper wrapper, intended for use specifically with `paru`, with syntax in the style of the package manager `apk` used on Alpine and Chimera Linux (hence the name "pak" or "paru's alpine kidnapper"). Reference [paru's github page](https://github.com/Morganamilo/paru?tab=readme-ov-file#installation) for instructions on installing paru if you do not already have an AUR helper installed.

pak is itself a fork of [pac-wrapper](https://github.com/eatsu/pac-wrapper).

## Examples

Command | Description
:-- | :--
`pak upgrade` | Sync repositories and upgrade all installed packages.
`pak add foo` | Install package `foo` and its dependencies.
`pak del foo` | Remove package `foo` and its dependencies.
`pak info foo` | Show information about package or group `foo`.
`pak search foo` | Search package names and descriptions with keyword `foo`.
`pak mark -d foo` <br> `pak mark --asdeps foo` | Mark package `foo` as dependencies.
`pak clean` | Remove dependencies that are no longer required by any installed package.
`pak list --explicit --foreign`| List explicitly installed foreign packages (e.g. AUR packages).

Run `pak --help` for more information.

## Configuration

To wrap another pacman-compatible program,
(or pacman itself) set the environment variable `PAC_PACMAN`.

For example, to wrap `pacman`, add

```sh
export PAC_PACMAN='pacman'
```

to your `~/.bash_profile` (or `$ZDOTDIR/.zshenv` for Zsh) and reload your shell.

If using fish, additionally install [omf](https://github.com/oh-my-fish/oh-my-fish) and the [foreign-env](https://github.com/oh-my-fish/plugin-foreign-env) plugin. You may then use the same command, but adding "fenv":

```sh
fenv export PAC_PACMAN='yay'
```

## License

MIT
