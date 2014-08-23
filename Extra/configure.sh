#!/bin/bash

##########################################################################################
# USEFUL FUNCTIONS:                                                                      #
##########################################################################################
usage() {
  cat << EOF
  **********************************************************************************************
  FLATWOKEN ICON THEME CUSTOMIZATION SCRIPT
  This script configures the iconset. More options will be added
  
  USAGE:
            $0 options

  **********************************************************************************************
  OPTIONS:
    -p -> Panel icons (and any 22x22px icon that is not explicitly handled by the gtk theme)
    -r -> Restore configs
    -u -> update repository (WARNING: it will remove any customization)

  **********************************************************************************************
  EXAMPLE USAGE:
    ./customization -p \#646464  -> the panel_icons option requires a color to use in hex format
    ./customization -r p         -> the restore can be called for any of the customizations
                                    above (for now, only the p option is present)..
    ./customization -r all       -> ..or it can be triggered for restore everything
    ./customization -u           -> the update option does not need any argument
  
  **********************************************************************************************
EOF
}


##########################################################################################
# "MAIN" FUNCTION:                                                                       #
##########################################################################################
while getopts "hp:r:u" opt; do
  case $opt in
    h)
      usage
      exit 1
    ;;
    ######################################################################################
    p)
      TARGET_KEY="panel_icons"
      COLOR=${OPTARG:1}
  
      echo "Changing panel icons to $OPTARG..."
      
      echo "The set is changed according to the $COLOR option."
    ;;
    ######################################################################################
    r)
      TARGET_KEY="restore"
  
      echo "Changing home icon to $OPTARG..."
  
      if [ "$OPTARG" == "color" ]; then
        restore $OPTARG
      fi
      
      echo "The set is changed according to the $OPTARG option."
    ;;
    ######################################################################################
    u)
      TARGET_KEY="update"
      
      echo "Restoring the iconset to its original state..."
      
      echo "Updating the repository..."

    ;;
    ######################################################################################
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

echo "The set is changed according to the $TARGET_KEY option."