all: ${HOME}/.emacs.d/init.el ${HOME}/.config/wofi/config ${HOME}/.config/starship.toml ${HOME}/.config/sway/config ${HOME}/.config/waybar ${HOME}/.zshrc ${HOME}/.config/environment.d/

${HOME}/.emacs.d/init.el: ${HOME}/etc/emacs/init.el
	mkdir -p ${HOME}/.emacs.d/
	ln -sf ${HOME}/etc/emacs/init.el ${HOME}/.emacs.d/init.el

${HOME}/.config/wofi/config: ${HOME}/etc/wofi/config
	mkdir -p ${HOME}/.config/wofi
	ln -sf ${HOME}/etc/wofi/config ${HOME}/.config/wofi/config

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

${HOME}/.zshrc: ${HOME}/etc/zsh/init
	ln -sf ${HOME}/etc/zsh/init ${HOME}/.zshrc

${HOME}/.config/environment.d/: ${HOME}/etc/environment/$(shell hostname)/
	ln -sf ${HOME}/etc/environment/$(shell hostname)/ ${HOME}/.config/environment.d
