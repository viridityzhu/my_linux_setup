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

