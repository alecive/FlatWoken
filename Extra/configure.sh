#!/bin/bash
##########################################################################################
# FLATWOKEN ICON THEME CONFIGURATION SCRIPT
# Copyright: (C) 2014 FlatWoken icons
# Author:  Alessandro Roncone
# email:   alecive87@gmail.com
# Permission is granted to copy, distribute, and/or modify this program
# under the terms of the GNU General Public License, version 2 or any
# later version published by the Free Software Foundation.
#  *
# A copy of the license can be found at
# http://www.robotcub.org/icub/license/gpl.txt
#  *
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
# Public License for more details
##########################################################################################


##########################################################################################
# USEFUL FUNCTIONS:                                                                      #
##########################################################################################
usage() {
cat << EOF
******************************************************************************************
FLATWOKEN ICON THEME CONFIGURATION SCRIPT
Author:  Alessandro Roncone   <alecive87@gmail.com> 

This script configures the iconset. More options will be added

USAGE:
        $0 options

******************************************************************************************
OPTIONS:
    -p -> Panel icons (and any 22x22px icon that is not explicitly handled by the gtk)
    -r -> Restore configs
    -u -> update repository (WARNING: it will remove any customization)

******************************************************************************************
EXAMPLE USAGE:
./customization -p \#646464 -> the panel_icons option requires a HEX color to use
./customization -r p        -> the restore can be called for any of the customizations
                                above (for now, only the p option is present)..
./customization -r all      -> ..or it can be triggered for restore everything
./customization -u          -> the update option does not need any argument

******************************************************************************************
EOF
}

panel_icons() {
    COLOR=$1
    echo "Changing panel icons to $COLOR..."

    # if [[ -d appss ]]; then
    #     rm -rf appss
    # fi

    # cp -prf apps appss
    # cd appss
    cd ../FlatWoken/22x22/apps/
    for file in *; do
        if ! [[ -L "$file" ]]; then
            sed -i -e "/opacity:0.9/ s/fill:#ffffff/fill:${TARGET_SUBKEY}/g" $file
            sed -i -e "/opacity:0.2/ s/fill:#ffffff/fill:${TARGET_SUBKEY}/g" $file
        fi
    done
    cd ../../../Extra/
}

restore_panel_icons() {
    echo "Restoring panel icons.."
    cd ../FlatWoken/22x22/apps/
    git checkout *
    cd ../../../Extra/
}

##########################################################################################
# "MAIN" FUNCTION:                                                                       #
##########################################################################################
TARGET_KEY=""
TARGET_SUBKEY=""
while getopts "hp:r:u" opt; do
    case $opt in
        h)
            usage
            exit 1
        ;;
        ##################################################################################
        p)
            TARGET_KEY="panel_icons"
            TARGET_SUBKEY=$OPTARG

            if ! [[ $TARGET_SUBKEY =~ ^#[0-9A-F]{6}$ ]] ; then
                echo "ERROR $TARGET_SUBKEY is not a proper hex code!"
                usage
                exit 1
            else
                restore_panel_icons
                panel_icons $TARGET_SUBKEY
            fi            
          
        ;;
        ##################################################################################
        r)
            TARGET_KEY="restore"
            TARGET_SUBKEY=$OPTARG

            if [ "$OPTARG" == "p" ]; then
                restore_panel_icons
            else
            echo "ERROR: the set was not restored! Invalid $TARGET_SUBKEY option."
            fi
        ;;
        ##################################################################################
        u)
          TARGET_KEY="update"
          
          echo "Restoring the iconset to its original state..."
          restore_panel_icons
          
          echo "Updating the repository..."
          git pull origin master
        ;;
        ##################################################################################
        \?)
            echo "Invalid option: -$OPTARG" >&2
            echo ""
            usage
            exit 1
        ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            echo ""
            usage
            exit 1
        ;;
    esac
done

echo "The set is changed according to the $TARGET_KEY $TARGET_SUBKEY option."