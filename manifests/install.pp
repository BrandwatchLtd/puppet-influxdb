# class to install influxdb
class influxdb::install(
  $version,
){
  case $::osfamily {
    'Debian': {
      package { 'influxdb_deb':
        ensure   => installed,
        name     => 'influxdb',
        provider => 'dpkg',
        source   => "https://dl.influxdata.com/influxdb/releases/influxdb_${version}_amd64.deb"
      }
    }
    'RedHat': {
      package { 'influxdb_rpm':
        ensure   => installed,
        name     => 'influxdb',
        provider => 'rpm',
        source   => "https://dl.influxdata.com/influxdb/releases/influxdb-${version}.x86_64.rpm"
      }
    }
    default: {
      fail("Unsupported managed repository for osfamily: ${::osfamily}, operatingsystem: ${::operatingsystem}, module ${module_name} currently only supports managing repos for osfamily RedHat and Debian")
    }
  }

}
