require 'shellwords'

node[:deploy].each do |application, deploy|
  rails_env = deploy[:rails_env]

  Chef::Log.info("Generating dotenv for app: #{application} with env: #{rails_env}...")

  template "#{deploy[:deploy_to]}/shared/.env" do
    mode '0640'
    owner deploy[:user]
    group deploy[:group]
    source '.env.erb'
    variables(
      :environment => OpsWorks::Escape.escape_double_quotes(deploy[:environment_variables])
    )
  end
end
