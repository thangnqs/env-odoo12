#-!/bin/bash

# config

BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BIN_DIR/func.sh

PROJECT_DIR="$(greadlink -e $BIN_DIR/../)"
ADDONS_DIR="$PROJECT_DIR/addons" ; LOAD_DIR="$PROJECT_DIR/load"
ODOO_DIR="$PROJECT_DIR/odoo"

ADDONS=(
  $ODOO_DIR/odoo/addons
  $ODOO_DIR/addons

  # Other addons, ie: OCA

)

# run
ADDONS_PATH=$(join_array 'ADDONS')

echo -e "\n>>>>>\nList Addons path: $ADDONS_PATH\n<<<<<\n"

$ODOO_DIR/odoo-bin -c "$PROJECT_DIR/config/dev.conf" --load="web" \
  --addons-path="$ADDONS_PATH" $@
