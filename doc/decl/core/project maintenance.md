# project maintenance

- unidirectional sync (end slashes required):
```sh
rsync -av ~/metadoc/decl/ ~/decl/lib/
rsync -av ~/decl/lib/ ~/metadoc/decl/
```

- create project directories
```sh
mkdir -p {.vscode,vscode,bin,doc,lib,inc,src,tmp,ref}
touch {.,.vscode,vscode,bin,doc,lib,inc,src,tmp,ref}/.gitignore
```
  - every directory must have some file to be added into git repo
  - every .gitignore must have `!.gitignore` at file end
  - bin,tmp,ref must has `*` to ignore all files in these dirs
