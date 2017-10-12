# note
this repository is now obsolete and has been replaced by https://github.com/callumfrance/vim-settings


# unix-vim
newer vim settings which should flow over into ms-vim

Contains the vimrc, gvimrc, and how to set up vim.
The settings are intended to be used with a visual variant of vim (i.e. not terminal vim) - specifically macvim.

# how to set up macvim on a new computer

1. install xcode for the dependencies
	* run once
	
2. install homebrew

3. install macvim using homebrew
	* `brew install macvim`
	* get it to overwrite the other vims here
	
4. `mkdir $HOME/.vim`
	* make a vimrc, gvimrc
	* make `bundle` `ftplugin` `autoload` etc. files
	
5. copy in a vimrc file
	* for the time being, comment out the vundle bundles
	
6. copy in a gvimrc file

7. install vundle

8. using the prebuilt vimrc and vundle,
	* (uncomment the vundle bundles)
	* run `:PluginInstall`
	
9. make sure to got through all the plugin README files
	* use the plugins to add the `vimrc` `gvimrc` plugin setting you want
	
10. If you wish, create formats of viewing (if you haven't already)
	* word processor
	* editor
	* super saiyan syntax
	
11. wear a crown of circuit boards to pay respects to the computer gods
