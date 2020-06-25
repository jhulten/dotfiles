export AWS_PROFILE=shared

okta_creds () {
    if [ -z $1 ]
    then
        initial_profile=${AWS_PROFILE:=shared}
        export AWS_PROFILE=shared
        /usr/local/bin/aws sts get-caller-identity 2>&1 > /dev/null && echo "You are already auth'd"
        profiles=$(_okta_aws_profile)
        RETURN=$?
    else
        initial_profile=$1
        export AWS_PROFILE=shared
        profiles=getty-$1
        RETURN=1
    fi
    if [ $RETURN -ne 0 ]
    then
        for profile in ${profiles}
        do
            _okta_aws_login ${profile}
        done
    fi
    export AWS_PROFILE=${initial_profile}
}

okta_login() {
    initial_profile=${AWS_PROFILE:=shared}
    export AWS_PROFILE=shared
    _okta_aws_login getty-shared -f
    export AWS_PROFILE=${initial_profile}
}

okta_switch() {
    profiles=$(_okta_aws_profile | sed 's/getty-//')
    if [[ ${profiles[(ie)$1]} -le ${#profiles} ]]; then
        export AWS_PROFILE=$1
    else
        echo "profile getty-$1 not found"
    fi
}

_okta_aws_profile() {
    grep '^\[profile getty' ${HOME}/.aws/config | awk '{ print $NF }' | tr -d \]
}

_okta_aws_login() { # PROFILE FLAGS
    role=$(echo $1 | sed 's/getty-//')
    oktad $2 -w -p $1 -o ${role} && echo "✅\t${role}"
}

decodeauth () {
    /usr/local/bin/aws sts decode-authorization-message --encoded-message "$1" | jq ".DecodedMessage | fromjson"
}