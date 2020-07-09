# Docker
# if command -v boot2docker >/dev/null 2>&1; then
#   if [[ $(boot2docker status) == "poweroff" ]]; then
#     echo Starting boot2docker...
#     boot2docker up
#   fi
#   eval "$(boot2docker shellinit 2>/dev/null)"
# fi

#if which docker-machine > /dev/null; then
  #if docker-machine ls | grep default > /dev/null; then
    #docker-machine status default | grep Running || echo 'starting default docker-machine' && docker-machine start default
    #eval $(docker-machine env default)
  #else
    #echo 'docker-machine installed, but no default machine found'
  #fi
#else
  #echo 'docker-machine not installed, skipping...'
#fi
