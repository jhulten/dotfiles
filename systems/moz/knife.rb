log_level                :info
log_location             STDOUT
node_name                'jeffrey'
client_key               File.join(ENV['HOME'], '.chef', 'jeffrey.pem')
validation_client_name   'chef-validator'
validation_key           File.join(ENV['HOME'], '.chef', 'chef-validator.pem')
chef_server_url          'https://chefserver.dal.moz.com/organizations/moz'
syntax_check_cache_path  File.join(ENV['HOME'], '.chef', 'syntax_check_cache')

verify_api_cert      false
ssl_verify_mode      :verify_none
