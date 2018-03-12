export AWS_PROFILE=oktad

okta_creds () {
    initial_profile=${AWS_PROFILE:=oktad-getty-shared}
    export AWS_PROFILE=oktad-getty-shared
    if [ -z $1 ]
    then
        /usr/local/bin/aws sts get-caller-identity 2>&1 > /dev/null && echo "You are already auth'd"
        RETURN=$?
    else
        echo "Skipping auth check..."
        RETURN=1
    fi
    if [ $RETURN -ne 0 ]
    then
        for role in $(grep '^\[profile getty' ${HOME}/.aws/config | awk '{ print $NF }' | tr -d \])
        do
            echo -en "${role}/okta-admin\t\t"
            oktad -w -p ${role} -o oktad-${role}
        done
    fi
    export AWS_PROFILE=${initial_profile}
}
