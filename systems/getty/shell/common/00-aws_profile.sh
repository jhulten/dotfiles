alias aa="security -i unlock-keychain && saml2aws login --skip-prompt"

export AWS_SDK_LOAD_CONFIG=1
export AWS_PROFILE=shared

decodeauth () {
    /usr/local/bin/aws sts decode-authorization-message --encoded-message "$1" | jq ".DecodedMessage | fromjson"
}