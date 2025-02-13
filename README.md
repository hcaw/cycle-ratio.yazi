# cycle-ratio.yazi

Cycles the layout ratio between set values.

## Installation

```sh
ya pack -a hcaw/cycle-ratio
```

## Usage

Add this to your `~/.config/yazi/keymap.toml`:

```toml
[[manager.prepend_keymap]]
on = "<F2>"
run = "plugin cycle-ratio --sync"
desc = "Cycle the layout ratio"
```
