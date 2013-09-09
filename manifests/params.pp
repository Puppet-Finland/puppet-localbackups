#
# == Class: localbackups::params
#
# Defines some variables based on the operating system
#
class localbackups::params {

    case $::osfamily {
        'RedHat': {
            $admingroup = 'root'
        }
        'Debian': {
            $admingroup = 'root'
        }
        'FreeBSD': {
            $admingroup = 'wheel'
        }
        default: {
            $admingroup = 'root'
        }
    }
}
