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
    -p -> Panel icons (and any 22x22px icon that is not explicitly handled by the gtk theme)
    -f -> Folder colors (currently 7 different colors are available!)
    -r -> Restore configs
    -u -> update repository (WARNING: it will remove any customization)

******************************************************************************************
EXAMPLE USAGE:
./configure.sh -p \#646464 -> the panel_icons option requires a HEX color to use
./configure.sh -p \#DF253F -> WARNING: the letters in the HEX code must be capital letters!
./configure.sh -f kaki     -> the folder_color option requires the color to use. There are 
                              7 colors to choose from (remember to spell them correctly): 
                              black, lightgray, blue, cyan, ribes, kaki, grass
./configure.sh -r p        -> the restore can be called for any of the customizations
                              above (i.e. either p or f)..
./configure.sh -r all      -> ..or it can be triggered for restore everything
./configure.sh -u          -> the update option does not need any argument. It automatically
                              restores the iconset to default configuration and updates it

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

change_folders_color() {
    C1=$1
    C2=$2
    C3=$3
    C4=$4
    C5=$5
    C6=$6

    FOLDERTOCHANGE=( "folder-new.svg" "folder-home.svg" "folder-icub.svg" "folder-cloud.svg" "folder-music.svg" "folder-video.svg" "folder-icub_B.svg" "folder-dropbox.svg" "folder-sharing.svg" "folder-video_B.svg" "folder-pictures.svg" "folder-bookmarks.svg" "folder-documents.svg" "folder-downloads.svg" "folder-templates.svg" )

    for file in "${FOLDERTOCHANGE[@]}"; do
        sed -i -e "s/ddc08b/${C1}/g" $file
        sed -i -e "s/c29656/${C2}/g" $file
        sed -i -e "s/dab980/${C3}/g" $file
        sed -i -e "s/c29856/${C4}/g" $file
        sed -i -e "s/a2773a/${C5}/g" $file
        # change_folders_color $file $C6
        sed -i -e "s/15686275/${C6}/g" $file
    done
}

folder_colors() {
    COLOR=$1
    echo "Changing folder colors to $COLOR..."

    # rm -rf tst
    # mkdir tst
    # cd tst/
    # cp ../../FlatWoken/scalable/apps/folder-* .
    cd ../FlatWoken/scalable/apps/
    ln -fs folder-$COLOR.svg folder.svg

    case $COLOR in
        black)
            change_folders_color 454545 333333 454545 3d3d3d 303030 23529412
        ;;
        lightgray)
            change_folders_color f0f0f0 c8c8c8 ebebeb bebebe b4b4b4 11764706
        ;;
        blue)
            change_folders_color 95bbd3 589dbe 82b9d8 589bbe 3d809f 15686275
        ;;
        cyan)
            change_folders_color 2dcdd7 04a6b0 66d2d9 2ba9b1 228388 11764706
        ;;
        ribes)
            change_folders_color f83202 bc2602 f83102 bd2401 a92301 15686275
        ;;
        kaki)
            change_folders_color fa8100 c86700 fa8100 be6200 aa5800 11764706
        ;;
        grass)
            change_folders_color 6ecd19 619812 6ecd19 55a113 4c8f11 11764706
        ;;
    esac

    cd ../../../Extra/
    # cd ../
}

restore_folder_colors() {
    echo "Restoring folder icons.."
    cd ../FlatWoken/scalable/apps/
    git checkout folder*
    cd ../../../Extra/
}

##########################################################################################
# "MAIN" FUNCTION:                                                                       #
##########################################################################################
echo "******************************************************************************************"
echo ""

TARGET_KEY=""
TARGET_SUBKEY=""

while getopts "hp:f:r:u" opt; do
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
        f)
            TARGET_KEY="folder_colors"
            
            FOLDERCOLORS[0]=lightgray
            FOLDERCOLORS[1]=black
            FOLDERCOLORS[2]=kaki
            FOLDERCOLORS[3]=ribes
            FOLDERCOLORS[4]=blue
            FOLDERCOLORS[5]=cyan
            FOLDERCOLORS[6]=grass

            TARGET_SUBKEY=$OPTARG

            if [[ " ${FOLDERCOLORS[*]} " == *" $TARGET_SUBKEY "* ]]; then
                restore_folder_colors
                folder_colors $TARGET_SUBKEY
            else
                echo "ERROR $TARGET_SUBKEY is not an accepted folder color!"
                usage
                exit 1                
            fi
        ;;
        ##################################################################################
        r)
            TARGET_KEY="restore"
            TARGET_SUBKEY=$OPTARG

            if [ "$OPTARG" == "a" ]; then
                restore_panel_icons
                restore_folder_colors
            elif [ "$OPTARG" == "p" ]; then
                restore_panel_icons
            elif [ "$OPTARG" == "f" ]; then
                restore_folder_colors
            else
            echo "ERROR: the set was not restored! Invalid $TARGET_SUBKEY option."
            fi
        ;;
        ##################################################################################
        u)
          TARGET_KEY="update"
          
          echo "Restoring the iconset to its original state..."
          restore_panel_icons
          restore_folder_colors
          
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

if [[ $# -eq 0 ]] ; then 
    echo "No options were passed!"
    echo ""
    usage
    exit 1
fi

echo "The set is changed according to the $TARGET_KEY $TARGET_SUBKEY option."