function getcover --wraps=playerctl\ metadata\ \|\ tr\ -s\ \'\ \'\ \|\ grep\ mpris:artUrl\ \|\ cut\ -d\ \'\ \'\ -f\ 3\ \|\ xargs\ wget --description alias\ getcover\ playerctl\ metadata\ \|\ tr\ -s\ \'\ \'\ \|\ grep\ mpris:artUrl\ \|\ cut\ -d\ \'\ \'\ -f\ 3\ \|\ xargs\ wget
  playerctl metadata | tr -s ' ' | grep mpris:artUrl | cut -d ' ' -f 3 | xargs wget $argv; 
end
