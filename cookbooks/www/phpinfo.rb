remote_file '/var/www/html/index.php' do
  owner 'root'
  group 'root'
  mode '755'
end

file '/var/www/html/index.html' do
  action :delete
end
