{{ cookiecutter.name }}
=============

[![Build Status](https://travis-ci.org/{{ cookiecutter.github_username }}/{{ cookiecutter.name }}.png?branch=master)](https://travis-ci.org/{{ cookiecutter.github_username }}/{{ cookiecutter.name }})

Quick Start
-----------


Attributes
----------

* `node['{{ cookiecutter.name }}']['option']` – Description of option. *(default: something)*

Resources
---------

### {{ cookiecutter.name.replace('-', '_') }}

The `{{ cookiecutter.name.replace('-', '_') }}` resource defines a something.

```ruby
{{ cookiecutter.name.replace('-', '_') }} 'name' do
  option 'a'
end
```

* `option` – Description of option. *(default: node['{{ cookiecutter.name }}']['option'])*
