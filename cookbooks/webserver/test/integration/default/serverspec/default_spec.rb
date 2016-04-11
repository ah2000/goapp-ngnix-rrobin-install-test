require 'spec_helper'

describe package 'nginx' do
  it 'it is installed' do
    expect(subject).to be_installed
  end
end

describe file '/etc/nginx/sites-available/mysite.com' do
  it 'it exists' do
    expect(subject).to be_file
  end
  it 'it is owned by root' do
    expect(subject).to be_owned_by 'root'
  end
  it 'it has group root' do
    expect(subject).to be_grouped_into 'root'
  end
end

describe file '/etc/nginx/sites-enabled/mysite.com' do
  it 'it exists' do
    expect(subject).to be_symlink
  end
end

describe service 'nginx' do
  it 'it is enabled' do
    expect(subject).to be_enabled
  end
  it 'it is running' do
    expect(subject).to be_running
  end
end

describe command('wget -qO- localhost:80') do
  it "it contains 'Hi there, I'm served from'" do
    expect(subject.stdout).to contain(/Hi there, I'm served from/)
  end
end
