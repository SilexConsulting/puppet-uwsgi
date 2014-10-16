class uwsgi::install {
  if ! defined(Package["uwsgi"]) {
    package { "uwsgi":
      ensure   => present,
      provider => pip,
      require  => [ Package["python-dev"], Package["python-pip"] ],
    }
  }
}