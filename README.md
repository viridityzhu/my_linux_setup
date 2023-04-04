# My Linux Setup

## Useful commands
  
- Check cuda version
  ```bash
  nvcc -V
  ```

- Check gpu status
  ```bash
  nvidia-smi
  ```

- Check cpu usage: 
  ```bash
  htop
  ```
 
- List all softwares
  ```bash
  dpkg --get-selections
  ```

- Output the results to a `.txt` file
  ```bash
  dpkg --get-selections > installed-software.txt
  ```

## Download Useful Softwares

- Conda

  Download a latest Miniconda `.sh` installer: [https://docs.conda.io/en/latest/miniconda.html#linux-installers](https://docs.conda.io/en/latest/miniconda.html#linux-installers)
  ```bash
  sh Miniconda3-latest-Linux-x86_64.sh
  ```
  *If you don't have a root permission, and you don't even have a `pip3` not to say an `apt`, then you can first install conda. Then you can use pip3.*

- [pipx](https://pypa.github.io/pipx/): install and run end-user applications written in Python, providing isolated environment.
  ```bash
  python3 -m pip install --user pipx
  python3 -m pipx ensurepath
  python3 -m pip install --user --upgrade pipx
  ```

- [Ranger](https://github.com/ranger/ranger): A VIM-inspired filemanager for the console
  ```bash
  pipx install ranger-fm
  ```
  Usage: `ranger` to open a file system window that is very cool.
  
  ![image](https://user-images.githubusercontent.com/39082096/229707017-516f3dd9-d278-4522-ae49-9c1d946291f4.png)

- [tldr](https://github.com/tldr-pages/tldr): too long; don't read
  ```bash
  pipx install tldr
  ```
  Usage: `tldr [command]` then it will teach you the common usage of the tool.
  
  ![tldr](https://github.com/tldr-pages/tldr/blob/main/images/tldr.svg)

- [bashmarks](https://github.com/huyng/bashmarks)
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

- `.vimrc`
  ```bash
  cp my_linux_setup/.vimrc ~
  ```
  To install Vim plugins from command line: 
  ```bash
  vim +PluginInstall +qall
  ```

- `.bashrc`

  *\[optional\] Uncommnet `force_color_prompt=yes` at around line 46.*

- `.tmux.conf`
  ```bash
  git clone https://github.com/gpakosz/.tmux.git
  ln -s -f .tmux/.tmux.conf
  cp my_linux_setup/.tmux.conf.local ~
  ```
  This is borrowed from [gpakosz/.tmux](https://github.com/gpakosz/.tmux). My own configurations are stored in `.tmux.conf.local`. The original repo contains many explanations about the features. Do have a look.
  
  My tmux appearance:
  ![image](https://user-images.githubusercontent.com/39082096/229707926-2f3a6482-a18e-4383-8da2-781472df7f96.png)

 
## Set Accessibility of your home

Finally, set the accessibility of your home dir. The 700 means only yourself can read/write.
```bash
chmod 700 -R .
```

