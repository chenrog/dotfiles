mkcd() {
  mkdir -p "$1" && cd "$1"
  echo "mkdir -p \"$1\" && cd \"$1\""
}

sso-stage() {
  aws sso login --profile "$1" && aws eks update-kubeconfig --region us-west-2 --profile "$1" --name stage-eks
}

sso-prod() {
  aws sso login --profile "$1" && aws eks update-kubeconfig --region us-west-2 --profile "$1" --name prod-eks
}

git-update-all() {
  for dir in */; do
    (
      cd "$dir" &&
      git fetch origin &&
      if git rev-parse --verify origin/master &>/dev/null; then
        git merge origin/master
      elif git rev-parse --verify origin/main &>/dev/null; then
        git merge origin/main
      else
        echo "No master or main branch found in $dir"
      fi
    )
  done
}
