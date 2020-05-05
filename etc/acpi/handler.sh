#!/bin/bash
# Default acpi script that takes an entry for all actions
#jack/headphone HEADPHONE unplug
#jack/headphone HEADPHONE plug

case "$1" in
	jack/headphone)
		case $3 in
			plug)
		 		echo "in" > /var/tmp/headphones.log
			;;
			unplug)
		 		echo "out" > /var/tmp/headphones.log
			;;
		esac
		;;
    button/mute)
    	/usr/local/bin/volume mute 
    ;;
button/volumedown)
        /usr/local/bin/volume vdown
    ;;
button/volumeup)
	/usr/local/bin/volume vup
    ;;
video/brightnessup)
	/usr/local/bin/brightness_push up
	;;
video/brightnessdown)
	/usr/local/bin/brightness_push down
	;;
    button/power)
        case "$2" in
            PBTN|PWRF)
                logger 'PowerButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/sleep)
        case "$2" in
            SLPB|SBTN)
                logger 'SleepButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000)
                        logger 'AC unpluged'
                        ;;
                    00000001)
                        logger 'AC pluged'
                        ;;
                esac
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000)
                        logger 'Battery online'
                        ;;
                    00000001)
                        logger 'Battery offline'
                        ;;
                esac
                ;;
            CPU0)
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    button/lid)
        case "$3" in
            close)
                logger 'LID closed'
                ;;
            open)
                logger 'LID opened'
                ;;
            *)
                logger "ACPI action undefined: $3"
                ;;
    esac
    ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac



# vim:set ts=4 sw=4 ft=sh et:
