#
# == Class: localbackups::params
#
# Defines some variables based on the operating system
#
class localbackups::params {

    include ::os::params

    case $::osfamily {
        'RedHat': { }
        'Debian': { }
        'FreeBSD': { }
        default: {
            fail("Unsupported operating system ${::osfamily}")
        }
    }
}
