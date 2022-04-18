# tmuxLoggingSetup
A pair of scripts intended to quickly set up logging capabilities for Tmux utilizing Tmux Plugin Manager (https://github.com/tmux-plugins/tpm)

### Install
`git clone https://github.com/EOsinski22/tmuxLoggingSetup.git`

`cd tmuxLoggingSetup && chmod +x *`

`./installer.sh`

`tmux new -s abc`

```
# Within the tmux session source the new plugins.
Press: Prefix_key + I
```

`./setup.sh`

```
# Source the plugins 1 more time: 
Press: Prefix_key + I
```

```
# From within tmux use our new keybinds to capture full pane history to ~/tmuxlogs/
Press: Prefix_key + l
```
