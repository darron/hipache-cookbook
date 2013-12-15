# encoding: utf-8
#
# Cookbook Name:: hipache
# Attributes:: default
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

default['hipache']['url'] = 'https://github.com/darron/hipache/archive/0.2.4.tar.gz'

default['hipache']['config_dir'] = '/etc/hipache'
default['hipache']['config_file'] = 'https://raw.github.com/octohost/octohost/master/config/hipache.json'
default['hipache']['config_file_path'] = "#{default['hipache']['config_dir']}/hipache.json"

default['hipache']['upstart_file'] = 'https://raw.github.com/octohost/octohost/master/config/hipache.conf'
default['hipache']['upstart_file_path'] = '/etc/init/hipache.conf'

default['hipache']['logrotate_file'] = 'https://raw.github.com/octohost/octohost/master/config/hipache.logrotate'
default['hipache']['logrotate_file_path'] = '/etc/logrotate.d/hipache'
