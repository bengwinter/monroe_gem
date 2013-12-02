require 'spec_helper'

describe Monroe do
  before do
    Monroe.key = "my_key"
  end
    
  it 'should set the the api key' do
    expect(Monroe.key).to eq 'my_key'
  end
end

describe Monroe::Articles do
  Monroe.key = "my_key"
  before do
    stub_request(:get, 'http://political-sentiment.herokuapp.com/articles?first_name=hillary&last_name=clinton&api_key=my_key').to_return(body: fixture('hillary_clinton_articles.json'))

    stub_request(:get, 'http://political-sentiment.herokuapp.com/articles?state=nh&api_key=my_key').to_return(body: fixture('nh_articles.json'))

    stub_request(:get, 'http://political-sentiment.herokuapp.com/articles?congress_id=B000711&api_key=my_key').to_return(body: fixture('B000711_articles.json'))
  end

  it 'fetches articles based on politician name' do
    hclinton = Monroe::Articles.name('hillary clinton')
    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/articles?first_name=hillary&last_name=clinton&api_key=my_key')).to have_been_made
    expect(hclinton[0]['headline']).to eq "Don't buy Warren vs. Clinton"
  end

  it 'fetches articles based on a state' do
    nh_articles = Monroe::Articles.state('nh')
    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/articles?state=nh&api_key=my_key')).to have_been_made
    expect(nh_articles[0]['headline']).to eq "Bill would award Congressional Gold Medal to Massachusetts native killed in Benghazi"
  end

  it 'fetches articles based on a congress id' do
    id_articles = Monroe::Articles.congress_id('B000711')
    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/articles?congress_id=B000711&api_key=my_key')).to have_been_made
    expect(id_articles[0]['headline']).to eq "Vulnerable Senate Incumbents: The 8 Most At-Risk Senators (SLIDESHOW)"
  end
end


describe Monroe::Tweets do
  Monroe.key = "my_key"
  before do
    stub_request(:get, 'http://political-sentiment.herokuapp.com/tweets?first_name=hillary&last_name=clinton&api_key=my_key').to_return(body: fixture('hillary_clinton_tweets.json'))
    stub_request(:get, 'http://political-sentiment.herokuapp.com/tweets?congress_id=B000711&api_key=my_key').to_return(body: fixture('B000711_tweets.json'))
  end

  it 'fetches tweets based on politician name' do
    hclinton = Monroe::Tweets.name('hillary clinton')
    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/tweets?first_name=hillary&last_name=clinton&api_key=my_key')).to have_been_made
    expect(hclinton[0]['text']).to eq "Will on Warren. http://t.co/fFwRn6Ieqr"
  end

  it 'fetches tweets based on a congress id' do
    id_tweets = Monroe::Tweets.congress_id('B000711')
    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/tweets?congress_id=B000711&api_key=my_key')).to have_been_made
    expect(id_tweets[0]['text']).to eq "Thank you Senators Dianne Feinstein(CA) \u0026amp; Barbara Boxer(CA) for signing the Senator Mary Landrieu/Roy Blunt... http://t.co/S3lXSBUdSU"
  end
end

describe Monroe::Bill do
  Monroe.key = "my_key"
  before do
    stub_request(:get, 'http://political-sentiment.herokuapp.com/bills?bill_number=HRES371&api_key=my_key').to_return(body: fixture('HRES371_bill.json'))
  end

  it 'fetches a bill' do
    bill = Monroe::Bill.number('HRES371')
    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/bills?bill_number=HRES371&api_key=my_key')).to have_been_made
    expect(bill).to eq ""
  end
end

describe Monroe::Records do
  Monroe.key = "my_key"
  before do
    stub_request(:get, 'http://political-sentiment.herokuapp.com/records?first_name=Tammy&last_name=Baldwin&api_key=my_key').to_return(body: fixture('tammy_baldwin_records.json'))
    stub_request(:get, 'http://political-sentiment.herokuapp.com/records?congress_id=B000711&api_key=my_key').to_return(body: fixture('B000711_records.json'))
  end

  it 'fetches a record based on name' do
    records = Monroe::Records.name('Tammy Baldwin')
    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/records?first_name=Tammy&last_name=Baldwin&api_key=my_key')).to have_been_made
    expect(records).to eq ""
  end

  it 'fetches a record based on congress id' do
    records = Monroe::Records.congress_id('B000711')
    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/records?congress_id=B000711&api_key=my_key')).to have_been_made
    expect(records).to eq "cat"
  end
end