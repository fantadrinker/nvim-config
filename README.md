
### To install on unix system (Mac, WSL tested)

First clone and move this repo to the config folder

```
cd ~/.config
git clone <this repo>
mv nvim-config nvim
```

If it doesn't work or report error like 

```
Cannot find color scheme 'rose-pine'
```

Run the following commands

```
cd ~/.config/nvim
rm after/plugin/. # or remove all files in the folder
cd lua/fredtsui
nvim packer.lua
```

By this time nvim should open without error

Then run `:so` in `packer.lua` to source the file

Then run `:PackerInstall`

Then quit the editor, run 
```
git restore ../../after/plugin/.
```
or
```
git reset HEAD --hard
```
to restore the deleted files

then reopen `nvim`. Everything should work now!