#
# Author:: {{ cookiecutter.full_name }} <{{ cookiecutter.email }}>
#
# Copyright 2014, {{ cookiecutter.full_name }}
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Chef
  class Resource::{% for s in cookiecutter.name.replace('-', '_').split('_') %}{{ s.capitalize() }}{% endfor %} < Resource
    include Poise
    actions(:enable)

    attribute(:option, kind_of: String, default: lazy { node['{{ cookiecutter.name }}']['option'] })
  end

  class Provider::{% for s in cookiecutter.name.replace('-', '_').split('_') %}{{ s.capitalize() }}{% endfor %} < Provider
    include Poise

    def action_enable
      converge_by("enable a {{ cookiecutter.name }} resource") do
        notifying_block do
          install_package
        end
      end
    end

    private

    # An example provider step
    def install_package
      package 'example' do
        action :upgrade
      end
    end
  end
end
