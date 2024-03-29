# Prosemirror

This gem converts JSON from a [ProseMirror](https://prosemirror.net/) text editor to HTML or text. It was originally inspired by the https://github.com/inputhq/prosemirror_to_html gem, but was reworked to better fit Workstream's needs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prosemirror' , github: 'Workstream-App/prosemirror'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prosemirror

## Usage

```
require 'prosemirror'

json = JSON.parse('{"type": "doc", "content": [{ "type": "paragraph","content": [{ "text": "Test message for email", "type": "text" }, { "type": "hard_break" }] }] }')
Prosemirror::Html::Renderer.new.render(json)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `lib/prosemirror/version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, and push git commits and tags.
