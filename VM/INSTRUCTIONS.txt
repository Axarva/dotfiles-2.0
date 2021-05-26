If you use a VM, the included picom config will not function well, instead, use this more optimised config.

You can further optimise it by disabling blur completely.

Also, in xmonad.hs make sure to change the line that starts picom (spawnOnce "picom --experimental-backends") to spawnOnce "picom"