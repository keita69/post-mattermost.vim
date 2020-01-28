" Version: 0.1.1
" Author : keita69 <keita69sawada@gmail.com>
" License: MIT

command! -range PostMattermost <line1>,<line2>call s:PostMattermost()

function! s:PostMattermost() range
  let s:access_token = get(g:, "post_mattermost_access_token", "Please set access_token")
  let s:endpoint = get(g:, "post_mattermost_endpoint", "Please set endpoint")
  let s:channel_id = s:GetChannelId()
  let s:curl_opt = get(g:, "post_mattermost_curl_opt", "")

  let s:message = s:GetVisualSelection(a:firstline, a:lastline)
  let s:json_data = { "channel_id" : s:channel_id, "message" : s:message }
  let s:encoded_json_data = json_encode(s:json_data)
  let s:tmp_file = tempname()
  call writefile([s:encoded_json_data], s:tmp_file)
  let s:cmd = "curl " . s:curl_opt . " -sS -X POST -H \"Content-Type: application/json\" -d @" . s:tmp_file . " -H \"Authorization: Bearer " . s:access_token . "\" " . s:endpoint . '/api/v4/posts' . '| jq .'
  let s:result = system(s:cmd)
  call delete(s:tmp_file)

  let s:cmd_err = has_key(json_decode(s:result), 'status_code')

  if s:cmd_err 
    echo s:cmd
    echo s:result
    echo 'ERROR : Cannot post to mattermost !!'
  else
    echo 'OK : Post to mattermost !!'
  endif

endfunction

function! s:GetChannelId()
  let s:channel_id_default= get(g:, "post_mattermost_channel_id", "Please set channel_id_default")
  return s:channel_id_default
endfunction

function! s:GetVisualSelection(lnum1, lnum2)
    let lines = getline(a:lnum1, a:lnum2)
    if a:lnum1 == 0 && a:lnum2 == 0
        return ''
    endif
    return join(lines, "\n")
endfunction

