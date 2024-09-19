/*
 * Copyright (C) 2024 by Claudio Cambra <claudio.cambra@nextcloud.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * for more details.
 */

import Foundation

enum PackagingError: Error {
    case projectNameSettingError(String)
    case packageBuildError(String)
}

func buildPackage(buildWorkPath: String, productPath: String) throws -> String {
    let projectName = "Nextcloud" // TODO: Get specific name
    let packageFile = "\(projectName).pkg"
    let sparkleFile = "\(packageFile).tbz"
    let pkgprojPath = "\(buildWorkPath)/admin/osx/macosx.pkgproj"

    guard shell("packagesutil --file \(pkgprojPath) set project name \(projectName)") == 0 else {
        throw PackagingError.projectNameSettingError("Could not set project name in pkgproj!")
    }
    guard shell("packagesbuild -v --build-folder \(productPath) -F \(productPath) \(pkgprojPath)") == 0 else {
        throw PackagingError.packageBuildError("Error building pkg file!")
    }
    return "\(productPath)/\(packageFile)"
}

