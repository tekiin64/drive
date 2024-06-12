if(APPLE AND NOT BUILD_LIBRARIES_ONLY AND SPARKLE_FOUND)
    list(APPEND NEXTCLOUD_BUNDLED_RESOURCES ${PROJECT_SOURCE_DIR}/admin/osx/deny_autoupdate_com.owncloud.desktopclient.plist
            ${PROJECT_SOURCE_DIR}/admin/osx/sparkle/dsa_pub.pem)
    set(NEXTCLOUD_BUNDLED_RESOURCES ${NEXTCLOUD_BUNDLED_RESOURCES} PARENT_SCOPE)
endif()

