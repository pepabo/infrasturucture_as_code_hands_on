describe file('/var/www/html/index.php') do
  it { should be_file }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/var/www/html/index.html') do
  it { should_not exist }
end
