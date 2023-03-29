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

[pipx](https://pypa.github.io/pipx/): install and run end-user applications written in Python, providing isolated environment.
```bash
python3 -m pip install --user pipx
python3 -m pipx ensurepath
python3 -m pip install --user --upgrade pipx
```

[Ranger](https://github.com/ranger/ranger): A VIM-inspired filemanager for the console
```bash

```

