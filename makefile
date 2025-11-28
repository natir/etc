all: ${HOME}/.config/alacritty ${HOME}/.emacs.d/ ${HOME}/.config/environment.d/ ${HOME}/.config/starship.toml ${HOME}/.config/sway/config ${HOME}/.config/waybar ${HOME}/.config/wofi/config ${HOME}/.pixi/config.toml ${HOME}/.pixi/manifests/pixi-global.toml ${HOME}/.config/git/ ${HOME}/.config/fish/ ${HOME}/.ssh/config


${HOME}/.config/alacritty: ${HOME}/etc/alacritty
	mkdir -p ${HOME}/.config/
	ln -sf ${HOME}/etc/alacritty ${HOME}/.config/alacritty


${HOME}/.emacs.d/: ${HOME}/etc/emacs/init.el
	ln -sf ${HOME}/etc/emacs/ ${HOME}/.emacs.d


${HOME}/.config/environment.d/: ${HOME}/etc/environment/$(shell hostname)/
	ln -sf ${HOME}/etc/environment/$(shell hostname)/ ${HOME}/.config/environment.d


${HOME}/.config/starship.toml: ${HOME}/etc/starship/config.toml
	mkdir -p ${HOME}/.config/
	ln -sf ${HOME}/etc/starship/config.toml ${HOME}/.config/starship.toml


${HOME}/.config/sway/config: ${HOME}/etc/sway/config ${HOME}/.config/sway/local/
	mkdir -p ${HOME}/.config/sway
	ln -sf ${HOME}/etc/sway/config ${HOME}/.config/sway/config


${HOME}/.config/sway/local/: ${HOME}/etc/sway/$(shell hostname)/
	mkdir -p ${HOME}/.config/sway
	ln -sf ${HOME}/etc/sway/$(shell hostname)/ ${HOME}/.config/sway/local


${HOME}/.config/waybar: ${HOME}/etc/waybar
	mkdir -p ${HOME}/.config
	ln -sf ${HOME}/etc/waybar ${HOME}/.config/waybar


${HOME}/.config/wofi/config: ${HOME}/etc/wofi/config
	mkdir -p ${HOME}/.config/wofi
	ln -sf ${HOME}/etc/wofi/config ${HOME}/.config/wofi/config


${HOME}/.pixi/config.toml: ${HOME}/etc/pixi/config.toml
	mkdir -p ${HOME}/.pixi/
	ln -sf ${HOME}/etc/pixi/config.toml ${HOME}/.pixi/config.toml


${HOME}/.pixi/manifests/pixi-global.toml: ${HOME}/etc/pixi/manifest.toml
	mkdir -p ${HOME}/.pixi/manifests/
	ln -sf ${HOME}/etc/pixi/manifest.toml ${HOME}/.pixi/manifests/pixi-global.toml


${HOME}/.config/git/: ${HOME}/etc/gitconfig/
	ln -sf ${HOME}/etc/gitconfig/ ${HOME}/.config/git


${HOME}/.config/fish/: ${HOME}/etc/fish/
	ln -sf ${HOME}/etc/fish/ ${HOME}/.config/fish


${HOME}/.ssh/config: ${HOME}/etc/ssh/config
	ln -sf ${HOME}/etc/ssh/config ${HOME}/.ssh/config
