# macOS

## Updates

After doing an update to a new macOS version, the following things have to be
done:

Update commandline tools from Software Update in System Preferences or run:

`softwareupdate --all --install --force`

If that doesn't show you any updates, run:

```bash
sudo rm -rf /Library/Developer/CommandLineTools
sudo xcode-select --install
```

Alternatively, manually download them from:
  https://developer.apple.com/download/all/.
