# install
##

```sh
git clone -o gh -b dponyatov git@github.com:ponyatov/decl.git ~/decl
cd ~/decl
git remote add flic git@gitflic.ru:dponyatov/decl.git
make install
```

- append to `~/.bashrc` to use `fzf` with bash history search (Ctrl+R)
```sh
echo '. /usr/share/doc/fzf/examples/key-bindings.bash' >> ~/.bashrc
```
