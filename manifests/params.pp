# See README.md for details
class consul_replicate::params {
  # Basic config
  $version    = '0.4.0'
  $user       = 'creplicate'
  $group      = 'creplicate'
  $monitoring = false
  $sensu_subs = []

  case $::architecture {
    'x86_64', 'amd64': { $arch = 'amd64' }
    'i386':            { $arch = '386'   }
    default:           { fail("Unsupported kernel architecture: ${::architecture}") }
  }

  case $::operatingsystem {
    ubuntu: {
      $bin_dir      = '/usr/local/bin'
      $config_dir   = '/etc/consul_replicate'
      $download_url = "https://releases.hashicorp.com/consul-replicate/${version}/consul-replicate_${version}_linux_${arch}.zip"
    }
    default: { fail("Unsupported operating system: ${::operatingsystem}") }
  }
}
