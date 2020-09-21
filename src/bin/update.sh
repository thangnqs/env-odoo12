#!/bin/bash
#
# The command will update modules by using a default list + modules passed in arguments, then the server will stop
# Note: the server should not run during the upgrade
# Usage: ./update.sh [module1] [module2] [moduleN]
#

# config

BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BIN_DIR/func.sh

# put here default modules to update for the project
UPDATE=(pos_sync_menu)
DATABASE="odoo12"

# combine default modules array with command arguments
EXTRA=("$@")
declare -a ALL_UPDATE=($(combine_array 'UPDATE' 'EXTRA'))
UPDATE_MODULES=$(join_array 'ALL_UPDATE')

# run start with special update parameters

echo "Update module(s): ${UPDATE_MODULES}..."
$BIN_DIR/start.sh -d ${DATABASE} -u ${UPDATE_MODULES}
