# originally from github.com/pedroaxl/opsworks-resque/blob/master/recipes/restart.rb
node[:deploy].each do |application, deploy|
  service "resque-#{application}" do
    action [:stop, :start]
    provider Chef::Provider::Service::Upstart
  end
end
