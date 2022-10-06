all: ${HOME}/.config/alacritty ${HOME}/.emacs.d/init.el ${HOME}/.config/environment.d/ ${HOME}/.config/starship.toml ${HOME}/.config/sway/config ${HOME}/.config/waybar ${HOME}/.config/wofi/config ${HOME}/.zshrc


${HOME}/.config/alacritty: ${HOME}/etc/alacritty
	mkdir -p ${HOME}/.config/
	ln -sf ${HOME}/etc/alacritty ${HOME}/.config/alacritty


${HOME}/.emacs.d/init.el: ${HOME}/etc/emacs/init.el
	mkdir -p ${HOME}/.emacs.d/
	ln -sf ${HOME}/etc/emacs/init.el ${HOME}/.emacs.d/init.el


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


${HOME}/.zshrc: ${HOME}/etc/zsh/init
	ln -sf ${HOME}/etc/zsh/init ${HOME}/.zshrc
