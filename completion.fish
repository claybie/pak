# Completions for pak

# Disable file completions
complete -c pak -f

# Helper functions for dynamic completions
function __pak_all_packages
    pak -Slq 2>/dev/null
end

function __pak_all_groups
    pak -Sg 2>/dev/null
end

function __pak_installed_packages
    pak -Qq 2>/dev/null
end

function __pak_installed_groups
    pak -Qg 2>/dev/null | cut -d ' ' -f 1 | uniq
end

function __pak_orphan_packages
    pak -Qdtq 2>/dev/null
end

# Condition functions
function __pak_needs_command
    set -l cmd (commandline -opc)
    if test (count $cmd) -eq 1
        return 0
    end
    return 1
end

function __pak_using_command
    set -l cmd (commandline -opc)
    if test (count $cmd) -gt 1
        if contains -- $cmd[2] $argv
            return 0
        end
    end
    return 1
end

# General options (when no command specified)
complete -c pak -n __pak_needs_command -s h -l help -d 'Print help information'
complete -c pak -n __pak_needs_command -s V -l version -d 'Print version information'
complete -c pak -n __pak_needs_command -s s -l status -d 'Print what pak is wrapping'

# Commands
complete -c pak -n __pak_needs_command -a add -d 'Install packages and their dependencies'
complete -c pak -n __pak_needs_command -a del -d 'Remove packages and their dependencies'
complete -c pak -n __pak_needs_command -a clean -d 'Remove dependencies that are no longer needed'
complete -c pak -n __pak_needs_command -a purge -d 'Remove old packages from cache'
complete -c pak -n __pak_needs_command -a upgrade -d 'Sync databases and upgrade installed packages'
complete -c pak -n __pak_needs_command -a up -d 'Sync databases and upgrade installed packages'
complete -c pak -n __pak_needs_command -a search -d 'Search package names and descriptions'
complete -c pak -n __pak_needs_command -a se -d 'Search package names and descriptions'
complete -c pak -n __pak_needs_command -a info -d 'Show information about packages or groups'
complete -c pak -n __pak_needs_command -a if -d 'Show information about packages or groups'
complete -c pak -n __pak_needs_command -a files -d 'List files owned by the specified packages'
complete -c pak -n __pak_needs_command -a owner -d 'Query packages that own the specified files'
complete -c pak -n __pak_needs_command -a mark -d 'Mark packages as explicitly installed'
complete -c pak -n __pak_needs_command -a list -d 'List installed packages'
complete -c pak -n __pak_needs_command -a ls -d 'List installed packages'
complete -c pak -n __pak_needs_command -a world -d 'List packages explicitly installed'

# add command options
complete -c pak -n '__pak_using_command add' -s h -l help -d 'Print help information'
complete -c pak -n '__pak_using_command add' -l asdeps -d 'Install packages as dependencies'
complete -c pak -n '__pak_using_command add' -l asexplicit -d 'Install packages as explicitly installed'
complete -c pak -n '__pak_using_command add' -l needed -d 'Do not reinstall up-to-date packages'
complete -c pak -n '__pak_using_command add' -l overwrite -d 'Overwrite conflicting files'
complete -c pak -n '__pak_using_command add' -s y -l yes -d 'Do not ask for confirmation'
complete -c pak -n '__pak_using_command add' -a '(__pak_all_packages)' -d 'Package'
complete -c pak -n '__pak_using_command add' -a '(__pak_all_groups)' -d 'Group'

# del command options
complete -c pak -n '__pak_using_command del' -s h -l help -d 'Print help information'
complete -c pak -n '__pak_using_command del' -s c -l cascade -d 'Remove also dependent packages'
complete -c pak -n '__pak_using_command del' -s u -l unneeded -d 'Remove only non-dependent packages'
complete -c pak -n '__pak_using_command del' -s n -l nosave -d 'Remove also configuration files'
complete -c pak -n '__pak_using_command del' -s y -l yes -d 'Do not ask for confirmation'
complete -c pak -n '__pak_using_command del' -a '(__pak_installed_packages)' -d 'Package'
complete -c pak -n '__pak_using_command del' -a '(__pak_installed_groups)' -d 'Group'

# clean command options
complete -c pak -n '__pak_using_command clean' -s h -l help -d 'Print help information'
complete -c pak -n '__pak_using_command clean' -s n -l nosave -d 'Remove also configuration files'
complete -c pak -n '__pak_using_command clean' -s y -l yes -d 'Do not ask for confirmation'
complete -c pak -n '__pak_using_command clean' -a '(__pak_orphan_packages)' -d 'Orphan package'

# purge command options
complete -c pak -n '__pak_using_command purge' -s h -l help -d 'Print help information'
complete -c pak -n '__pak_using_command purge' -s a -l all -d 'Remove all packages from cache'
complete -c pak -n '__pak_using_command purge' -s y -l yes -d 'Do not ask for confirmation'

# upgrade command options
complete -c pak -n '__pak_using_command upgrade up' -s h -l help -d 'Print help information'
complete -c pak -n '__pak_using_command upgrade up' -l ignore -d 'Ignore a package upgrade'
complete -c pak -n '__pak_using_command upgrade up' -l ignoregroup -d 'Ignore a group upgrade'
complete -c pak -n '__pak_using_command upgrade up' -l overwrite -d 'Overwrite conflicting files'
complete -c pak -n '__pak_using_command upgrade up' -s y -l yes -d 'Do not ask for confirmation'

# search command options
complete -c pak -n '__pak_using_command search se' -s h -l help -d 'Print help information'
complete -c pak -n '__pak_using_command search se' -s i -l installed -d 'Search only installed packages'
complete -c pak -n '__pak_using_command search se' -s q -l quiet -d 'Show less information'

# info command options
complete -c pak -n '__pak_using_command info if' -s h -l help -d 'Print help information'
complete -c pak -n '__pak_using_command info if' -s e -l extended -d 'Show extended information for packages'
complete -c pak -n '__pak_using_command info if' -s q -l quiet -d 'Show less information for groups'
complete -c pak -n '__pak_using_command info if' -a '(__pak_all_packages)' -d 'Package'
complete -c pak -n '__pak_using_command info if' -a '(__pak_all_groups)' -d 'Group'

# files command options
complete -c pak -n '__pak_using_command files' -s h -l help -d 'Print help information'
complete -c pak -n '__pak_using_command files' -s q -l quiet -d 'Show less information'
complete -c pak -n '__pak_using_command files' -a '(__pak_all_packages)' -d 'Package'

# owner command options
complete -c pak -n '__pak_using_command owner' -s h -l help -d 'Print help information'
complete -c pak -n '__pak_using_command owner' -s q -l quiet -d 'Show less information'
complete -c pak -n '__pak_using_command owner' -F -d 'File'

# mark command options
complete -c pak -n '__pak_using_command mark' -s h -l help -d 'Print help information'
complete -c pak -n '__pak_using_command mark' -s d -l asdeps -d 'Mark packages as dependencies'
complete -c pak -n '__pak_using_command mark' -a '(__pak_installed_packages)' -d 'Package'

# list command options
complete -c pak -n '__pak_using_command list ls' -s h -l help -d 'Print help information'
complete -c pak -n '__pak_using_command list ls' -s e -l explicit -d 'List packages explicitly installed'
complete -c pak -n '__pak_using_command list ls' -s d -l deps -d 'List packages installed as dependencies'
complete -c pak -n '__pak_using_command list ls' -s n -l native -d 'List installed packages found in sync db(s)'
complete -c pak -n '__pak_using_command list ls' -s f -l foreign -d 'List installed packages not found in sync db(s)'
complete -c pak -n '__pak_using_command list ls' -s q -l quiet -d 'Show less information'
complete -c pak -n '__pak_using_command list ls' -a '(__pak_installed_packages)' -d 'Package'

# world command options
complete -c pak -n '__pak_using_command world' -s h -l help -d 'Print help information'
complete -c pak -n '__pak_using_command world' -s n -l native -d 'List installed packages found in sync db(s)'
complete -c pak -n '__pak_using_command world' -s f -l foreign -d 'List installed packages not found in sync db(s)'
complete -c pak -n '__pak_using_command world' -s q -l quiet -d 'Show less information'
complete -c pak -n '__pak_using_command world' -a '(__pak_installed_packages)' -d 'Package'
