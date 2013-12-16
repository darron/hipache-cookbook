# encoding: utf-8
require 'spec_helper'

# Write unit tests with ChefSpec - https://github.com/sethvargo/chefspec#readme
describe 'hipache::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes nodejs' do
    expect(chef_run).to include_recipe('nodejs::default')
  end

  it 'creates the config directory' do
    expect(chef_run).to create_directory('/etc/hipache')
  end

  it 'creates the config file' do
    expect(chef_run).to create_remote_file('/etc/hipache/hipache.json')
  end

  it 'creates the upstart file' do
    expect(chef_run).to create_remote_file('/etc/init/hipache.conf')
  end

  it 'creates the logrotate file' do
    expect(chef_run).to create_remote_file('/etc/logrotate.d/hipache')
  end

  it 'enables the hipache service' do
    expect(chef_run).to enable_service('hipache')
  end

  it 'starts the hipache service' do
    expect(chef_run).to start_service('hipache')
  end

  before do
    stub_command("hipache -h | grep 'hipache server'").and_return(true)
  end
end
