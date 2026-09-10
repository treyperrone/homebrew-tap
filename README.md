# homebrew-tap

Homebrew tap for [warren](https://github.com/treyperrone/warren) — browse AWS accounts and connect to EC2 instances over SSM, with the `session-manager-plugin` embedded so there is nothing else to install.

```sh
brew tap treyperrone/tap
brew install warren
```

`brew upgrade warren` to update. On Homebrew 6.0+ the first tap also prompts `brew trust treyperrone/tap` — a third-party tap runs its own formula on your machine.

`Formula/warren.rb` is regenerated and committed automatically by goreleaser on every tagged `warren` release. It installs a prebuilt binary, so there is no Go toolchain dependency, and a `brew` install is not quarantined by macOS Gatekeeper.
