
if [[ -d /opt/datadog ]]; then


  environmentlc(){
      cat /opt/datadog/etc/environment | cut -c 5-
  }

  environmentuc(){
      environmentlc | tr '[a-z]' '[A-Z]'
  }

  mainroles(){
      cat /etc/update-motd.d/95-roles | tail -n+5 | grep -vE '^Instance Type:|^\*\*|^$' | grep -Ev 'common-node|monitoring-client|dog-base' | paste -d',' -s -
  }

  dd_prompt_prefix() {
    DD_ENV=$(environmentlc)
    DD_ENV_TEXT=dog-${DD_ENV#env-}


    case "$DD_ENV" in
      env-prod)
        echo -n "$(_lp_sr "${BOLD_RED}${DD_ENV_TEXT}${NO_COL}")"
        ;;
      env-staging)
        echo -n "$(_lp_sr "${BOLD_YELLOW}${DD_ENV_TEXT}${NO_COL}")"
        ;;
      *)
        echo -n "$(_lp_sr "${GREEN}dog${NO_COL}")"
    esac
  }

  export LP_PS1_PREFIX="$(dd_prompt_prefix)${LP_PS1_PREFIX}"

fi
