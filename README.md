## Monroe: Political Content Aggregator
#### A simple Ruby interface for the Monroe political sentiment API

### Installation

Add this line to your application's Gemfile:

    gem 'monroe'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monroe

### Access & Configuration

There are currently three endpoints accessible from this wrapper:

	Monroe::Articles
	Monroe::Tweets
	Monroe::Records

To access the data from these endpoints, you will first need to request an API key and configure the client with this key. If you do not already have a key, you can generate one by querying the API's generator endpoint with your email as a parameter:

	political-sentiment.herokuapp.com/api_key?email=your_email@example.com

Once you have your key, you can configure the client by setting the key in an initializer file of simply at the top of your program:

	Monroe.key = YOUR_API_KEY

Once the key is configured, you're good to go. Refer to the following documentation to access each endpoint.

### Articles

To return all articles for a politician using their Congressional ID number:

	Monroe::Articles.congressional_id('B001277')

To return all articles for a politician using their full name:

	Monroe::Articles.name('Richard Blumenthal')

To return articles for all listed politicians in a given state: 
	
	Monroe::Articles.state('CT')

### Tweets

To return all tweets for a politician using their Congressional ID number:

	Monroe::Tweets.congressional_id('B001277')

To return all tweets for a politician using their full name:

	Monroe::Tweets.name('Richard Blumenthal')

To return tweets for all listed politicians in a given state: 
	
	Monroe::Tweets.state('CT')

### Political Records

To return all records for a politician using their Congressional ID number:

	Monroe::Records.congressional_id('B001277')

To return all records for a politician using their full name:

	Monroe::Records.name('Richard Blumenthal')


### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
