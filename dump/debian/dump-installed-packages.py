#!/usr/bin/env python3

from apt import cache

EXCLUDE = ["linux-image-amd64", "task-laptop"]


def pkg_has_remote(pkg):
    for version in pkg.versions:
        if not version.downloadable:
            return False
    return True


manual = [
    pkg
    for pkg in cache.Cache()
    if pkg.is_installed and not pkg.is_auto_installed and not pkg.essential
]

obtainable = [pkg for pkg in manual if pkg_has_remote(pkg)]

dependencies = []

for pkg in obtainable:
    for pkg_version in pkg.versions:
        if pkg_version.is_installed:
            for dependency in pkg_version.get_dependencies("PreDepends", "Depends"):
                for dependency_version in dependency.target_versions:
                    dependencies.append(dependency_version.package.name)


minimal = [pkg for pkg in obtainable if pkg.name not in dependencies]

with open("packages.txt", "w") as packages:
    content = ""
    for pkg in minimal:
        if pkg.name not in EXCLUDE:
            for pkg_version in pkg.versions:
                if pkg_version.is_installed:
                    content += "%s%s\n" % (
                        pkg.name,
                        (":%s" % pkg_version.architecture)
                        if not pkg_version.architecture in ("all", "amd64")
                        else "",
                    )

    packages.write(content)
