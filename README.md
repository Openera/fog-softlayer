### `fog-softlayer` - SoftLayer module for fog.
[![Gem Version](https://badge.fury.io/rb/fog-softlayer.png)](http://badge.fury.io/rb/fog-softlayer)
[![Build Status](https://api.travis-ci.org/fog/fog-softlayer.svg)](https://travis-ci.org/fog/fog-softlayer)
[![Dependency Status](https://gemnasium.com/fog/fog-softlayer.svg)](https://gemnasium.com/fog/fog-softlayer)

This gem is a module for the `fog` gem that allows you to manage resources in
the SoftLayer Cloud.

It is included by the main `fog` metagem but can used as an independent library
in other applications.

Currently supported services:
* Compute
* Storage
* DNS
* Network

Additional services coming soon:
* CDN
* Load Balancer
* Message Queue

## Installation

Add this line to your application's Gemfile:

```ruby
gem "fog-softlayer", github: 
```

And then execute:

```
$ bundle install
```

## Usage

Create a .env file with your personal credentialsas follow

```
SOFTLAYER_USERNAME=X
SOFTLAYER_API_KEY=X
STORAGE_BUCKET=masv-test
CLUSTER_ID=wdc
EXCON_DEBUG=true
```

Then a connection to Object Storage will be automatically created when you run:

```
$ bundle exec rake console
```

See `examples/`

## Contributing

See `CONTRIBUTING.md`

## Development

Getting started:

```
# Install dependencies
$ bundle install
# List available tasks
$ bundle exec rake -T
```

Add the upstream remote to be in sync with the fork:

```
$ git remote add upstream https://github.com/fog/fog-softlayer.git
# Test remote successfully added
$ git remote -v
```

Please push your new code to the *liveqos* branch. Create new branches from the *liveqos* branch.
Push and rebase from master any additions to the original project:

```
$ git fetch upstream
$ git pull upstream master
$ git rebase -i master
```

# References

* [MetadataSearchAPI](https://wiki.openstack.org/wiki/MetadataSearchAPI)
* X-Storage-Policy ??
