class uwsgi::service {
  $require = Class["uwsgi::config"]

  service { "uwsgi":
    provider => upstart,
    ensure   => running,
    enable   => true,
    require  => $require,
  }
}