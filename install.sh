#!/usr/bin/env bash

set -euo pipefail

print_help() {
    cat <<EOF
Usage: ${0##*/} [-n | --dry-run] [-i | --install]

Symlink the dotfiles listed in links.conf into \$HOME.

Options:
  -i, --install   create the symlinks
  -n, --dry-run   show what would happen without changing anything
  -h, --help      show this help

Note:
  Existing files are never overwritten or backed up, they are
reported as failures and skipped.
EOF
}

info() { printf '\033[1;34m==>\033[0m %s\n' "$1"; }
log() { printf '  %s\n' "$1"; }

run() {
    (( DRY )) && return 0
    "$@"
}

say() {
    if (( DRY )); then log "would $1"; else log "$1"; fi
}

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONF="$REPO/links.conf"

DRY=0
INSTALL=0
FAILED=0

for arg in "$@"; do
    case "$arg" in
        -n | --dry-run) DRY=1 ;;
        -i | --install) INSTALL=1 ;;
        -h | --help)
            print_help
            exit 0
            ;;
        *)
            print_help
            exit 1
            ;;
    esac
done

if (( !INSTALL && !DRY)); then
    print_help
    exit 1;
fi

if [[ ! -f "$CONF" ]]; then
    log "missing manifest: $CONF"
    exit 1
fi

if (( DRY )); then
    info "Dry run: no changes will be made"
else
    info "Linking dotfiles"
fi

while IFS='|' read -r src dst; do
    [[ -z "${src// }" || "$src" == \#* ]] && continue

    src="$REPO/$src"
    dst="$HOME/$dst"

    if [[ ! -e "$src" ]]; then
        log "skip   (missing source) $src"
        continue
    fi

    if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
        log "Ok, already linked at: $dst"
        continue
    fi

    if [[ -e "$dst" || -L "$dst" ]]; then
        log "fail   (already exists) $dst"
        FAILED=$((FAILED + 1))
        continue
    fi

    run mkdir -p "$(dirname "$dst")"
    run ln -s "$src" "$dst"
    say "link   $dst -> $src"
done < "$CONF"

if (( FAILED )); then
    info "Done, $FAILED could not be linked"
    exit 1
fi

info "Done"
