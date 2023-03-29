# My Linux Setup

## Usefule commands

List all softwares
```bash
dpkg --get-selections
```

Output the results to a `.txt` file
```bash
dpkg --get-selections > installed-software.txt
```

Check gpu status
```bash
nvidia-smi
```

## Download Useful Softwares

- Conda

Download a latest Miniconda `.sh` installer: [https://docs.conda.io/en/latest/miniconda.html#linux-installers](https://docs.conda.io/en/latest/miniconda.html#linux-installers)
```bash
sh Miniconda3-latest-Linux-x86_64.sh
```
*If you don't have a root permission, and you don't even have a pip3 not to say an apt, then you can first install conda. Then you can use pip3.*

[pipx](https://pypa.github.io/pipx/): install and run end-user applications written in Python, providing isolated environment.
```bash
python3 -m pip install --user pipx
python3 -m pipx ensurepath
python3 -m pip install --user --upgrade pipx
```

[Ranger](https://github.com/ranger/ranger): A VIM-inspired filemanager for the console
```bash
pipx install ranger-fm
```

[tldr]: too long; don't read

[tag]

[]

## Configuration Files

`.vimrc`

`.bashrc`

`.tmux.conf`

