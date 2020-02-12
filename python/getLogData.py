import os
filename = "var/log/secure"

with open(filename) as f:
    lines = set(f.read().splitlines())