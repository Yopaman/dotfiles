function nvide --wraps='env -u WAYLAND_DISPLAY neovide --multigrid' --wraps='WINIT_UNIX_BACKEND=x11 neovide' --description 'alias nvide WINIT_UNIX_BACKEND=x11 neovide'
  WINIT_UNIX_BACKEND=x11 neovide $argv
        
end
