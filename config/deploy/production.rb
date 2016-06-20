set :server_name, 'burgas-reporter.com'
server 'nrep', user: 'deployer', roles: %w( web app db ), primary: true
set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"
set :rails_env, :production
set :unocorn_worker_count, 5
set :enable_ssl, false

set :ssh_options,
    forward_agent: true,
    port: ENV['cap_ssh_port']
