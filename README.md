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

- [tldr](https://github.com/tldr-pages/tldr): too long; don't read
  ```bash
  pipx install tldr
  ```
  Usage: `tldr [command]` then it will teach you the common usage of the tool.

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
  cp my_linux_setup/.tmux.conf ~
  ```

