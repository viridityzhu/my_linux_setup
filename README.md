# My Linux Setup

This repo is for me to set up a fresh install of Linux with basic and useful customizations.

## Features

- Set up a fresh install of Linux nicely and lightly (within 10 mins).
- Customized appearances and keybinds for bash, tmux, and vim.
- Light but cool plugins, such as ranger, tldr, and bashmarks.
- Suitable for vim+tmux+conda users.

## Download Useful Softwares

- Conda

  Download a latest Miniconda `.sh` installer: [https://docs.conda.io/en/latest/miniconda.html#linux-installers](https://docs.conda.io/en/latest/miniconda.html#linux-installers);
  Alternately, directly download use wget:
  ```bash
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
  ```
  Then install:
  ```bash
  sh Miniconda3-latest-Linux-x86_64.sh
  ```
  *If you don't have root permission, and you don't even have a `pip3` not to say an `apt`, then installing conda is essential, because after this you can use pip3.*

- [pipx](https://pypa.github.io/pipx/): install and run end-user applications written in Python, providing isolated environment.
  *You may need to reload your server to let conda refresh before going to the following steps.*
  ```bash
  python3 -m pip install --user pipx
  python3 -m pipx ensurepath
  python3 -m pip install --user --upgrade pipx
  ```

- [Ranger](https://github.com/ranger/ranger): A VIM-inspired filemanager for the console. **Now you have a colorful and structural file manager!**
  ```bash
  pipx install ranger-fm
  ```
  Usage: Use command `ranger` to open a file system window that is very cool.
  
  Tip: If you are also using iTerm2 on MacOS, you can easily **preview images** in ranger by following the steps below:
  1. In the menu bar of iTerm2, select `iTerm2 -> Install Shell Integration`. (In a session which is connected to your remote Linux server via ssh)
  2. Config ranger:
     ```bash
     ranger --copy-config=rc
     ```
     Then open `~/.config/ranger/rc.conf` and edit Line 74 to `set preview_images true` and Line 117 to `set preview_images_method iterm2`.
  If you are not using iTerm2, there are also many other plugins supported by ranger for image preview. Just check out its [readme](https://github.com/ranger/ranger).
  
  ![image](https://user-images.githubusercontent.com/39082096/229707017-516f3dd9-d278-4522-ae49-9c1d946291f4.png)
  
- [gpustat](https://github.com/wookayin/gpustat): A simple command-line utility for querying and monitoring GPU status. (colorful and just less than `nvidia-smi`)
  ```bash
  pipx install gpustat
  ```
  ![image](https://user-images.githubusercontent.com/39082096/235125924-21a18062-808e-4dc1-855c-899c5a551938.png)
  **If you have `nvtop` on your server, then forget all the others!**
  
- [imgcat](https://github.com/danielgatis/imgcat): Display images and gifs in your terminal emulator
  ```bash
  curl "https://iterm2.com/utilities/imgcat" > imgcat
  chmod +x imgcat
  mv imgcat ~/.local/bin
  ```

- [tldr](https://github.com/tldr-pages/tldr): too long; don't read. A helper for command usages.
  ```bash
  pipx install tldr
  ```
  Usage: `tldr [command]` then it will teach you the common usage of the command.
  
  ![tldr](https://github.com/tldr-pages/tldr/blob/main/images/tldr-dark.png)

- [bashmarks](https://github.com/huyng/bashmarks): Tag directories and jump quickly.
  ```bash
  git clone https://github.com/huyng/bashmarks.git
  cd bashmarks
  make install
  echo 'source ~/.local/bin/bashmarks.sh' >> ~/.bashrc
  ```
  Usage: `s [tagname]` to set a tag name for the current dir; `g [tagname]` to jump to the specified dir.

- [vundle](https://github.com/VundleVim/Vundle.vim): Plugin manager for Vim
  ```bash
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ```
  *required to clone into `~/.vim/bundle`*
  
- *\[Optional\]* [gh](https://cli.github.com/manual/): Github's client.

  The server that I am using blocks SSH connection. So I insteadly use this gh to login to my github. This is even more convenient than generate a SSH key and put to public key to the github account.
  ```bash
  conda install gh --channel conda-forge
  ```
  Run `gh auth login` to authenticate with your GitHub account.
  

## Configuration Files
Clone this repo to get the configuration files:
```bash
cd
git clone https://github.com/viridityzhu/my_linux_setup.git
```

- `.vimrc`: `vim` configuration file.
  ```bash
  cp my_linux_setup/.vimrc ~
  ```
  To install Vim plugins from command line: 
  ```bash
  vim +PluginInstall +qall
  ```

- `.bashrc`: bash configuration file.
  **Note that it is dangerous and unnecessary to directly copy this bash config, because it will replace the original one. Only do this with confidence. Otherwise, it is recommended to copy and paste required configurations from the `.bashrc` file, e.g., the alias for `gpu [num]` and `notify_me`.**
  ```bash
  cp my_linux_setup/.bashrc ~
  ```

  *\[optional\] Uncomment `force_color_prompt=yes` at around line 46.*

  In this file, I predefined some useful functions:
  1. An aliases for `CUDA_VISIBLE_DEVICES=xxx` by simply using `gpu 0`, `gpu 1,2`, etc before commands.
  2. To ring a bell after finishing a task: `notify_me [command]`

- `.tmux.conf`: `tmux` configuration file. 
  ```bash
  git clone https://github.com/gpakosz/.tmux.git
  ln -s -f .tmux/.tmux.conf
  cp my_linux_setup/.tmux.conf.local ~
  ```
  This `.tmux.conf` config is borrowed from [gpakosz/.tmux](https://github.com/gpakosz/.tmux), containing appearance and shortcut modifications. Do read the source project for better usage.
  My own modifications are separated in `.tmux.conf.local`.
  
  My tmux appearance:
  ![image](https://user-images.githubusercontent.com/39082096/229707926-2f3a6482-a18e-4383-8da2-781472df7f96.png)

  If you are new to `tmux`, I strongly recommend this tutorial: [Tmux使用手册](https://louiszhai.github.io/2017/09/30/tmux/) (in Chinese).

 
## Set Accessibility of your home

Finally, set the accessibility of your home dir. `700` means only yourself can read/write.
```bash
chmod 700 -R .
```

## Set Git global user info

```bash
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

## My Setup v2.0 - zsh shell

> I am now more familiar with zsh rather than bash. Luckily I left brief notes for the zsh setup. Let me copy it here.

### Install zsh

1. Installation requires root permission. You can still check if there is already zsh installed via: `cat /etc/shell`. For example, you may find: `/usr/bin/zsh`
2. Use `chsh --shell zsh` to change user's default shell.
3. However, this requires you to have real user permission. If you don't even have that, for example, on a lab cluster, you can use this semi-permanent way: add this to the end of `~/.bashrc`:
	```bash
	# If this terminal is interactive, switch to zsh
	if [[ $- == *i* ]]; then
	    exec zsh
	fi
	```
4. Before jumping into zsh, let's install `oh-my-zsh` to ease the configuration of everything. It will replace your default `.zshrc` file with its fancy template that is easy to start with.


### Configure zsh

#### 1. old configs

The first thing is to copy the useful configs in `.bashrc` into the new config file: `.zshrc`. For example, conda initialization, and your self-defined functions.

#### 2. zsh theme/prompt

- The original zsh already supports thousands of themes, and you can easily change them by altering `ZSH_THEME='xxx'`. Go to their website to find a favorite.  It even supports randomly selecting a theme each time you log in:
- Otherwise, `powerlevel10k` is all you need. It is faster than the original themes, is easy to configure, and supports proper customization.

#### 3. zsh plugins

In the `.zshrc` file, easily enable plugins like this:

```bash
plugins=(git zsh-syntax-highlighting zsh-autosuggestions autojump fd fzf)
```

`zsh-syntax-highlighting`, `zsh-autosuggestions`, and `fzf` are almost necessary. Search for them and install one by one, and do nothing since oh-my-zsh will help load them.

#### 4. others

1. `fzf` is for fuzzy finder. It needs additional configurations to be more powerful
2. install `bat` for better highlighted `cat [file]`. But it seems not easy to install if I have not root permission ;)

## Useful commands
  
- Check cuda version
  ```bash
  nvcc -V
  ```

- Check gpu status
  ```bash
  nvidia-smi
  ```
  or
  ```bash
  nvtop
  ```

- Check cpu usage: 
  ```bash
  htop
  ```
 
- List all softwares
  ```bash
  dpkg --get-selections
  ```

- Output the results to a `.txt` file by `>`
  ```bash
  dpkg --get-selections > installed-software.txt
  ```

- An alias for `CUDA_VISIBLE_DEVICES=xxx` by simply using `gpu 0`, `gpu 1,2`, etc before commands.
  
- To ring a bell after finishing a task:
  ```bash
  notify_me [command]
  ```

