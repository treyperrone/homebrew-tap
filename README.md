# homebrew-warren

Homebrew tap for [warren](https://github.com/treyperrone/warren) — browse AWS accounts and connect to EC2 instances over SSM, with the `session-manager-plugin` embedded so there is nothing else to install.

```sh
brew tap treyperrone/warren
brew install warren
```

The formula tracks tagged releases of warren and installs a prebuilt binary — nothing is compiled locally, so there is no Go toolchain dependency.
