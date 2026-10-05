# Aethar01 Casks

Homebrew casks for Aethar01's apps.

## Installation

Install GoPDF:

```sh
brew install aethar01/casks/gopdf
```

Or tap the repository first:

```sh
brew tap aethar01/casks
brew install gopdf
```

In a `Brewfile`:

```ruby
tap "aethar01/casks"
cask "gopdf"
```

The cask installs `GoPDF.app` into `/Applications`.

## Updates

`.github/workflows/update.yml` checks for a new GoPDF release every hour, or
straight away when the GoPDF release workflow dispatches `gopdf-release`. It
updates the version and checksums, audits and test-installs the cask, then
pushes to `main`.

## Documentation

Run `brew help`, `man brew`, or see Homebrew's documentation at https://docs.brew.sh.
