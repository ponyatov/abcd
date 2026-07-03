# /.unison

This file required in any project to allow Decl be used:
- sync
	- part of obsidian vault shared with all projects
	- and project-local copy of
		- `doc/decl/core`: decl spec
		- target language project specific:
			- `doc/decl/cpp`: if C/C++ used
			- ...
		- other decl or custom decl dialects specific for current project

```
# ln -fs ~/{app}/.unison ~/.unison/{app}.prf
# unison {app}

root = ./doc/{app}
root = /home/dponyatov/metadoc/{app}

prefer = newer
watch  = true
batch  = true

ignore = Name {.git}
ignore = Name {*~,*.log,*.sw?}
ignore = Name {bin,tmp,ref,_build,target}
ignore = Name {doc/html}
ignore = Name {node_modules,.cache}
ignore = Name {*.pyc,__pycache__}
```
