# Getting Scoop and allowing pwsh execution
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
set-executionpolicy unrestricted -s cu

# utils
scoop install 7zip curl coreutils sudo

# make these available to system processes
sudo scoop install git python --global

# Add extras bucket
scoop bucket add extras

# Spotify Stack
scoop bucket add spotify https://github.com/TheRandomLabs/Scoop-Spotify.git
scoop install spotify-latest blockthespot spicetify-cli spicetify-themes genius-spicetify

# Applying the Dribblish theme
cd "$(spicetify -c | Split-Path)\Themes\Dribbblish"
Copy-Item dribbblish.js ..\..\Extensions
spicetify config extensions dribbblish.js
spicetify config current_theme Dribbblish color_scheme nord-dark
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify apply