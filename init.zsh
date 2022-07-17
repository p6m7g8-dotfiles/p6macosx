
######################################################################
#<
#
# Function: p6df::modules::p6macosx::deps()
#
#>
######################################################################
p6df::modules::p6macosx::deps() {
    ModuleDeps=(
        p6m7g8-dotfiles/p6common
    )
}

######################################################################
#<
#
# Function: p6df::modules::p6macosx::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#>
######################################################################
p6df::modules::p6macosx::init() {
  local _module="$1"
  local dir="$2"
  
  p6_bootstrap "$dir"
}
