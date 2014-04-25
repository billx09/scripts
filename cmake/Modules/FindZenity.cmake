# Look for 'zenity'
#

find_program(ZENITY
  zenity
  DOC "display GTK+ dialogs"
  )
mark_as_advanced(ZENITY)

# Handle the QUIETLY and REQUIRED arguments and set GIT_FOUND to TRUE if
# all listed variables are TRUE

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Zenity DEFAULT_MSG ZENITY)
