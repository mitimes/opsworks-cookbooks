default[:resque][:workers] = {'*' => 1}
default[:resque][:path] = "#{node[:deploy].values[0][:deploy_to]}/current"
