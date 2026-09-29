# xianxu/ariadne Homebrew tap

Homebrew formulae for [ariadne](https://github.com/xianxu/ariadne).

## weave

`weave` prepares repository layers and compiles agent context for
ariadne-style repositories.

```sh
brew install xianxu/ariadne/weave
weave --version
```

Naming the formula in full lets Homebrew load it from this third-party tap
without trusting the whole tap. For a bare `brew upgrade` to pick up new
releases, trust the tap once:

```sh
brew trust xianxu/ariadne
```

Supported on macOS and Linux, arm64 and amd64. `Formula/weave.rb` is generated
by ariadne's release tooling for each `weave-vX.Y.Z` release; don't edit it by
hand. The release steps are in
[ariadne's README](https://github.com/xianxu/ariadne#preparing-a-weave-release).

## License

MIT, like ariadne.
