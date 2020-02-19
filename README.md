# Ramper
This is my own "ramp-up/setup" to provision new machines in a quick and painless way.

This configures the following into your machine:
- Terminal (sets up ZSH, Prezto, modules)
- VIM (uses my stored configuration & plugins)
- Commonly used packages & applications

To get started, you can use the following install script using **cURL**:
```
curl -o- https://raw.githubusercontent.com/AChris07/ramper/master/install.sh | bash
```

or **wget**:
```
wget -qO- https://raw.githubusercontent.com/AChris07/ramper/master/install.sh | bash
```
