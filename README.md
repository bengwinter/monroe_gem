# Monroe: Political Content Aggregator

A simple Ruby interface for the Monroe political sentiment API

## Installation

Add this line to your application's Gemfile:

    gem 'monroe'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monroe

## Usage

There are currently three endpoints accessible from this wrapper:
1. Articles
2. Tweets
3. Political Records

### Articles

To return all articles for a politician using their Congressional ID number:

	Monroe::Articles.congressional_id('B001277')

To return all articles for a politician using their full name:

	Monroe::Articles.name('Richard Blumenthal')

To return articles for all listed politicians in a given state: 
	
	Monroe::Articles.state('CT')


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
