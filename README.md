# mlir-school.github.io

## Simulate locally 

### With Debian:
```
sudo apt install gem ruby-dev
sudo gem install bundler
bundle config set path 'vendor/bundle'
bundle install
```
And then:
```
bundle exec jekyll serve
```

### With MacOS:

```
xcode-select --install
brew install ruby
echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zshrc
exec zsh
```
Then clone the deposit:
```
git clone https://github.com/<user>/<repo>.git
cd <repo>
```
Check/add a Gemfile to the root directory with:
```
source "https://rubygems.org"
gem "github-pages", group: :jekyll_plugins
gem install bundler
bundle install
# (if Ruby 3 complains about webrick)
bundle add webrick
```
And then:
```
bundle exec jekyll serve --livereload
```
Finally, open http://localhost:4000
