
describe file('/var/www/wordpress') do
  it { should be_directory }
  it { should be_mode 700 }
  it { should be_owned_by 'apache' }
  it { should be_grouped_into 'apache' }
end
