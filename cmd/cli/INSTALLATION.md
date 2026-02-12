# SICLI Installation Guide

This guide explains how to install the `sicli` CLI tool so you can use it from anywhere.

## Quick Install

### Linux / macOS

#### System-wide installation 
```bash
make install-cli
```

This installs `sicli` to `/usr/local/bin`, making it available system-wide.
``

### Windows

 Currently unavailable but planned to implement in future

# Verify
sicli --help
```

### macOS

#### Using Homebrew (Future)
```bash
# Coming soon
```

#### Manual Installation
```bash
# 1. Build and install
make install

# 2. Verify
sicli --help

# 3. If permission denied
sudo chmod +x /usr/local/bin/sicli
```

### Windows

 Currently unavailable but planned to implement in future


### Changes not taking effect

 <a href="#support">Features</a> 


## Development Installation

For development, you might want to use the binary directly:

```bash
# Build
make build-cli

# Use with ./
./sicli get mykey

# Or create an alias
alias sicli='./sicli'

```
## Verification Checklist

After installation, verify everything works:

- [ ] `sicli --help` shows help message
- [ ] `sicli get mykey` runs without `./` prefix
- [ ] `which sicli` shows installation path
- [ ] Command works from any directory
- [ ] Command persists after terminal restart

## Next Steps

After successful installation:

1. **Configure server URL**:
   ```bash
   sicli config set --server-url http://your-server:8080
   ```

2. **Test connection**:
   ```bash
   sicli put testkey testvalue
   sicli get testkey
   ```

3. **View metrics**:
   ```bash
   sicli metrics
   ```

4. **Read the usage guide**:
   ```bash
   cat cmd/cli/README.md
   ```

## Support

If you encounter issues:

1. Check this guide's troubleshooting section
2. Verify your PATH configuration
3. Try reinstalling with `make install-cli`
4. Open an issue 


## Summary

**Recommended installation**:
- **Linux/macOS**: `make install-cli` 
- **Windows**: Comming soon

After installation, you can use `sicli` from anywhere:
```bash
sicli get mykey
sicli put mykey myvalue
sicli delete mykey
sicli metrics
```


