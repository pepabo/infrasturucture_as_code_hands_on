package 'nginx'

service 'nginx' do
  %w(enable start)
end

%w(
  enabled
  available
).each do |n|
  directory "/etc/nginx/sites-#{n}" do
    action :delete
    notifies :restart, 'service[nginx]'
  end
end

template '/etc/nginx/conf.d/www.conf' do
  owner 'root'
  group 'root'
  notifies :restart, 'service[nginx]'
end
