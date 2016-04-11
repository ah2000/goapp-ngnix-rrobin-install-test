require 'spec_helper'

describe package 'golang' do
  it 'it is installed' do
    expect(subject).to be_installed
  end
end

describe file '/usr/local/bin/appserver' do
  it 'it exists' do
    expect(subject).to be_file
  end
  it 'it has permissions 755' do
    expect(subject).to be_mode '755'
  end
end

describe port(8484) do
  it 'it is listening' do
    expect(subject).to be_listening
  end
end

describe command('wget -qO- localhost:8484') do
  it "it contains 'Hi there, I'm served from'" do
    expect(subject.stdout).to contain(/Hi there, I'm served from/)
  end
end