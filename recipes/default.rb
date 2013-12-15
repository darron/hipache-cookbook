# encoding: utf-8
#
# Cookbook Name:: hipache
# Recipe:: default
#
# Copyright (C) 2013, Darron Froese <darron@froese.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'nodejs::default'

bash 'install hipache' do
  cwd 'root'
  user 'root'
  code <<-EOF
    npm install #{node['hipache']['url']} -g
  EOF
  not_if "hipache -h | grep 'hipache server'"
end

directory node['hipache']['config_dir'] do
  owner 'root'
  group 'root'
  mode 0755
  action :create
end

remote_file node['hipache']['config_file_path'] do # ~FC005
  source node['hipache']['config_file']
  owner 'root'
  group 'root'
  mode 00644
  action :create
end

remote_file node['hipache']['upstart_file_path'] do
  source node['hipache']['upstart_file']
  owner 'root'
  group 'root'
  mode 00644
  action :create
end

link '/etc/init.d/hipache' do
  to '/lib/init/upstart-job'
end

remote_file node['hipache']['logrotate_file_path'] do
  source node['hipache']['logrotate_file']
  owner 'root'
  group 'root'
  mode 00644
  action :create
end

service 'hipache' do
  action [:enable, :start]
end
