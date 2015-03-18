# Splatter

Expand constructor arguments to instance variables base on `splat`.

This was inspired by [Gourmet Service Objects](http://brewhouse.io/blog/2014/04/30/gourmet-service-objects.html), but to use without Virtus.

## Usage

### Splatter::Init

```ruby
class AcceptInvite
  include Splatter::Init

  splat :invite, :user

  def call
    @invite.accept!(@user)
    UserMailer.invite_accepted(invite).deliver
  end
end

AcceptInvite.new(invite, user).call
```

### Splatter::Service

```ruby
class AcceptInvite
  include Splatter::Init
  include Splatter::Service

  splat :invite, :user

  def call
    @invite.accept!(@user)
    UserMailer.invite_accepted(invite).deliver
  end
end

AcceptInvite.call(invite, user)
```

### Splatter

Use `include Splatter` to include both, `Splatter::Init` and `Splatter::Service`


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'splatter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install splatter


## Contributing

1. Fork it ( https://github.com/exploid/splatter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
