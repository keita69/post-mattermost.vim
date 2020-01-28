# post-mattermost.vim
This is a plugin for posting selected text to mattermost.

# Features
- This is a plugin for posting selected text to mattermost.
![](https://github.com/keita69/post-mattermost.vim/blob/master/doc/post-mattermost.gif?raw=true)
# Requirement
- [curl](https://curl.haxx.se/)
- [jq](https://stedolan.github.io/jq/)

# Installtion
Add this repo using the plugin manager.
Ex: dein.vim

:information_source: This plug-in test environment is used in Neovim on Windows10.

```toml
[[plugins]]
repo = 'keita69/post-mattermost.vim'
```

# Setting init.vim(.vimrc)

## ~/.config/nvim/init.vim(.vimrc)
```
let g:post_mattermost_access_token = "j9fdrowxq3fhzjm4kt1arswfzh"
let g:post_mattermost_endpoint = "http://192.168.56.101:8065"
let g:post_mattermost_channel_id_default = "kkxt3xsywtyzfjurtst6pmueeh"
let g:post_mattermost_curl_opt = "--noproxy 192.168.56.101" 
```
## get personal access token
![](https://github.com/keita69/post-mattermost.vim/blob/master/doc/personal-token-is-here.gif?raw=true)
	https://docs.mattermost.com/developer/personal-access-tokens.html   
	ex) let g:post_mattermost_access_token = "j9fdrowxq3fhzjm4kt1arswfzh"

## get channel id
![](https://github.com/keita69/post-mattermost.vim/blob/master/doc/channel-id-is-here.gif?raw=true)


