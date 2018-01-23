# Jekyllposter

Jekyllposter is a gem designed to make it easy to generate front matter for files and also subsequently edit them.

There is a current TODO, I've absently made Jekyllposter::Questions::Page the same as ::Post which means pages aren't *allowed* to be a page in actuality, this will be fixed promptly.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyllposter'
```

And then execute:

    $ bundle install

### Standalone

To install to the system/user instead of a project, use the following

#### System-wide
As root or by using sudo, run:

```$ gem install jekyllposter```

or

```$ sudo gem install jekyllposter```

#### User

```$ gem install --user-install jekyllposter```

## Usage

### Using 'mkmatter'

If you want to use 'mkmatter', an executable that ships with `jekyllposter`, all you have to do is run it.

```
$ mkmatter
```

Which will ask you questions about the post you want to put out.

* If you want to make multiple files, the script automatically loops itself and resets its variables.

* The script also will open an editor (the 'editor' command) if allowed to, as to allow the user to begin editing their file, front-matter already included.

## Contributing

* I am open to the idea of adding more questions/modules if there are plugins that require more configuration in the front matter. Just let me know!

* [Bug Reports](https://github.com/IotaSpencer/jekyllposter/issues)
* [Pull Requests](https://github.com/IotaSpencer/jekyllposter/pulls)

## Contact

**E-mail**: [me@iotaspencer.me](mailto:me@iotaspencer.me)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
