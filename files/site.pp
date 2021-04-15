# Copied to /etc/puppetlabs/code/environments/production/manifests/site.pp
# site.pp is the main manifest for classifying with classes from component modules
# node default means that when the puppet apply command is executed every node will
#have this class incuded

node 'default' {

# the jenkinns module provide the jenkins class located in init.pp - params.pp is used by init.pp and inherits the values from params (legacy configuration we now use hiera for passing paramters)

  class { 'jenkins':

# https://github.com/voxpupuli/puppet-jenkins/issues/659 explains the hash configurations - paramets here are passed as a hash value

    config_hash => {
       'HTTP_PORT' => { 'value' => '8000'},
       'JENKINS_PORT' => { 'value' => '8000'}
    },

# cli disabled because module fails probably due to backward comapitbility but not needed for this exercise
    cli => false,
  }
}
