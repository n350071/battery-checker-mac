# battery-checker-mac
This checker alert you if the battery percentage decreased.

## use case
Like this, the battery icon is charging but the mac is not plugged. You'll notice it when the battery power is too low (under 5%), and the mac suddenly become to be so slow.
![use_case.jpg](use_case.jpg)

## Capture
### When battery percentage decreased
![decrease.png](decrease.png)

### When battery percentage increased
This notify is only one time after the plug connection is recovered.
![success.png](success.png)

## Dependency
You need the [terminal-notifier](https://github.com/julienXX/terminal-notifier) in advance.

```sh
brew install terminal-notifier
```

## Usage
```sh
ruby battery_checker_mac.rb
```

