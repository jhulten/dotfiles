if [[ -d /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest ]]; then
  echo Update PATH for Google Cloud SDK....
  source /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.$(basename $SHELL).inc

  echo Enable shell completion for gcloud...
  source /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.$(basename $SHELL).inc
end
