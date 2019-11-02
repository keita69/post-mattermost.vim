" Version: 0.0.1
" Author: keita69sawada <keita69sawada@gmail.com>
" License: MIT


" command作成
command! -nargs=1 PostMattermost :call s:PostMattermost(<f-args>)

" 関数
function! s:PostMattermost(message)
  let channel = 'info-okiraku'
  let endpoint = 'http://192.168.56.101:8065/hooks/xg7esnm3pbfbfcgwixg76784gy'

  "let url = 'http://ssl-sato/channels/'. channel

  " messageをPOSTする
  let res = webapi#http#post(endpoint, {'text': a:message},
    \ {'Content-Type': 'application/json'})

  let dict = webapi#json#decode(res.content)
  " message_idをecho
  echo dict.message_id
endfunction

" ref url
" https://www.key-p.com/blog/staff/archives/20732
" curl -XPOST -H 'Content-Type: application/json' -d '{"text": "Hello, this is some text\nThis is more text. :tada:"}' http://192.168.56.10:8065/hooks/63mt7dzfmtdn7cegjs35mumxkw
```
curl -XPOST -H 'Content-Type: application/json' -d '{"text": "Hello, this is some text\nThis is more text. :tada:"}' http://192.168.56.101:8065/hooks/xg7esnm3pbfbfcgwixg76784gy
```
" 
" mattermost vagrant 
" https://github.com/ryoutoku/vagrant
" http://{ホストOSのIPアドレス}:8065/
" http://localhost:8065/
"
