add_library(nextcloudsync_vfs_suffix MODULE
    vfs_suffix.h
    vfs_suffix.cpp
)

target_link_libraries(nextcloudsync_vfs_suffix PRIVATE Nextcloud::sync)
install(TARGETS nextcloudsync_vfs_suffix LIBRARY DESTINATION ${KDE_INSTALL_PLUGINDIR})