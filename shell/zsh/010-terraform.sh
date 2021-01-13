# zsh_terraform() {
#   # break if there is no .terraform directory
#   if [[ -d .terraform ]]; then
#     local tf_workspace=$(/usr/local/bin/terraform workspace show)
#     echo -n "$tf_workspace"
#   fi
# }

# # Terraform Segment
# POWERLEVEL9K_CUSTOM_TERRAFORM="zsh_terraform"
# POWERLEVEL9K_CUSTOM_TERRAFORM_BACKGROUND=057
# POWERLEVEL9K_CUSTOM_TERRAFORM_FOREGROUND=015
