# Profiles
Profiles specifies what should be installed on system, names MUST be present in
[../packages](/packages) folder.

## Select mechanism
Packages selected from all hints: User-defined hints(in CLI args), OS id 
and common packages. All packages packaging into array and sorted in such way 
that installing packages one by one will result that all packages will meet 
their dependencies requirement by the time they will be installed