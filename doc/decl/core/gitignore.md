# gitignore

```sh
mkdir -p {.vscode,vscode,bin,doc,lib,inc,src,tmp,ref}
touch {.,.vscode,vscode,bin,doc,lib,inc,src,tmp,ref}/.gitignore
```

- every directory must have some file to be added into git repo
- every .gitignore must have `!.gitignore` at file end

- `~/project/.gitignore`
```
*~
*.swp
*.log
!.gitignore
```

- bin,tmp,ref must has `*` to ignore all files in these dirs
```
*
!.gitignore
```
