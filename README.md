This module has been saved from deleted (or privatized) repo ideas/uwsgi

Puppet module for managing uWSGI on Ubuntu
==========================================
The uWSGI project aims at developing a full stack for building (and hosting) clustered/distributed network applications.

Basic usage
-----------
To install uWSGI

    class { "uwsgi": }

Configure an uWSGI app
----------------------

    uwsgi::resource::app { "django":
      options => {
        "socket"    => "127.0.0.1:3031",
        "master"    => "true",
        "processes" => "4",
        "env"       => "DJANGO_SETTINGS_MODULE=djtest.settings",
        "module"    => "django.core.handlers.wsgi:WSGIHandler()".
      }
    }

Copyright and License
---------------------

Copyright (C) 2013 [Ideapod LLC](https://www.ideapod.com/)

Ideapod can be contacted at: info@ideapod.com

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
