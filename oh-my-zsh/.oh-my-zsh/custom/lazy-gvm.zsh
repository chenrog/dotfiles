_load_gvm() {
  unset -f gvm go gofmt
  [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
}

gvm()   { _load_gvm; gvm "$@"; }
go()    { _load_gvm; go "$@"; }
gofmt() { _load_gvm; gofmt "$@"; }
