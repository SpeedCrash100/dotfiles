#!
#! Find packages and resolves its depends
#!

import sys
import os
import subprocess

base_path=os.getenv("BASE_DIR")
packages_dir = base_path + "/packages"

input_str = sys.stdin.read()
packages_list = input_str.split()

hints = sys.argv[1:]

def resolve_package(name, hints):
    package_path = packages_dir + "/" + name + "/wrapper.sh"
    command = [package_path] + hints + ["--depends"]

    result = subprocess.run(command, capture_output=True)
    if result.returncode != 0:
        print(result.stderr.decode())
        exit(result.returncode)
        return
    
    decoded = result.stdout.decode()
    return decoded.split()


# Resolve full package list to install
prev_package_set = {}
package_set = set(packages_list)

while len(package_set.difference(prev_package_set)) > 0:
    prev_package_set = package_set

    for package in prev_package_set:
        # TODO: Check for recursive depends

        package_set = package_set.union(set(resolve_package(package, hints)))

# Build graph

depend_graph = dict()

for package in package_set:
    depend_graph[package] = set(resolve_package(package, hints))

# Get packages wo deps
init_packages = set()
for package in depend_graph:
    if len(depend_graph[package]) == 0:
        init_packages.add(package)


# Sort 
remaining_packages = package_set.difference(init_packages)
sorted_pkgs = list(init_packages)

# TODO: Check if we stuck here
while len(remaining_packages) > 0:
    to_remove = list()

    for pkg in remaining_packages:
        pkg_deps = depend_graph[pkg]
        pkg_deps_exist = map(lambda x: x in sorted_pkgs, pkg_deps)
        pkg_satisfied = all(pkg_deps_exist)
        if pkg_satisfied:
            sorted_pkgs.append(pkg)
            to_remove.append(pkg)

    for pkg in to_remove:
        remaining_packages.remove(pkg)

print(' '.join(sorted_pkgs))