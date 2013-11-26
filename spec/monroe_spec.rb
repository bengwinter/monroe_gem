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
    stub_request(:get, 'http://political-sentiment.herokuapp.com/articles?api_key=my_key&first_name=hillary&last_name=clinton').to_return(body: fixture('hillary_clinton_articles.json'))

    stub_request(:get, 'http://political-sentiment.herokuapp.com/articles?api_key=my_key&state=nh').to_return(body: fixture('nh_articles.json'))

    stub_request(:get, 'http://political-sentiment.herokuapp.com/articles?api_key=my_key&congress_id=O000167').to_return(body: fixture('.json'))
  end

  it 'fetches articles based on politician name' do
    hclinton = Monroe::Articles.name('hillary clinton')

    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/articles?first_name=hillary&last_name=clinton&api_key=my_key')).to have_been_made
    expect(hclinton[0]['headline']).to eq "Don't buy Warren vs. Clinton"
  end

  it 'fetches articles based on a congress id' do
    id_articles = Monroe::Articles.state('O000167')

    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/articles&congress_id=O000167&api_key=my_key')).to have_been_made
    expect(id_articles[0]['headline']).to eq "Democrats give White House officials an earful on Obamacare"
  end

  it 'fetches articles based on a state' do
    nh_articles = Monroe::Articles.state('nh')

    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/articles?state=nh&api_key=my_key')).to have_been_made
    expect(nh_articles[0]['headline']).to eq "Bill would award Congressional Gold Medal to Massachusetts native killed in Benghazi"
  end
end


describe Monroe::Tweets do
  Monroe.key = "my_key"
  before do
    stub_request(:get, 'http://political-sentiment.herokuapp.com/tweets?first_name=hillary&last_name=clinton&api_key=my_key').to_return(body: fixture('hillary_clinton_tweets.json'))

    stub_request(:get, 'http://political-sentiment.herokuapp.com/tweets?state=nh&api_key=my_key').to_return(body: fixture('nh_tweets.json'))
    stub_request(:get, 'http://political-sentiment.herokuapp.com/tweets?congressional_id=nh&api_key=my_key').to_return(body: fixture('O000167_tweets.json'))
  end

  it 'fetches tweets based on politician name' do
    hclinton = Monroe::Tweets.name('hillary clinton')

    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/tweets?first_name=hillary&last_name=clinton&api_key=my_key')).to have_been_made
    expect(hclinton[0]['text']).to eq "Don't buy Warren vs. Clinton"
  end

  it 'fetches tweets based on a congress id' do
    id_tweets = Monroe::Tweets.congressional_id('O000167')

    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/tweets?congress_id=O000167&api_key=my_key')).to have_been_made
    expect(hclinton[0]['text']).to eq "i'm barack obama and i approve this message"
  end

  #??????
  it 'fetches tweets based on a state' do
    nh_tweets = Monroe::Tweets.state('nh')

    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/tweets?api_key=my_key&state=nh')).to have_been_made
    expect(nh_articles[0]['text']).to eq "Bill would award Congressional Gold Medal to Massachusetts native killed in Benghazi"
  end
end

describe Monroe::Bill do
  Monroe.key = "my_key"
  before do
    stub_request(:get, 'http://political-sentiment.herokuapp.com/bill?bill=HRES371&api_key=my_key').to_return(body: fixture('bill.json'))
  end

  it 'fetches a bill' do
    bill = Monroe::Bill.name(#####)
    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/bill?bill=HRES371&api_key=my_key')).to have_been_made
    expect(bill).to eq "cat"
  end
end

describe Monroe::Records do
  Monroe.key = "my_key"
  before do
    stub_request(:get, 'http://political-sentiment.herokuapp.com/records?first_name=###&last_name=####&api_key=my_key').to_return(body: fixture('###_records.json'))
    stub_request(:get, 'http://political-sentiment.herokuapp.com/records?congress_id=####&api_key=my_key').to_return(body: fixture('###_records.json'))
  end

  it 'fetches a bill based on name' do
    records = Monroe::Records.name(#####)
    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/records?first_name=###&last_name=####&api_key=my_key')).to have_been_made
    expect(records).to eq "cat"
  end

  it 'fetches a bill based on congress id' do
    records = Monroe::Records.congress_id(#####)
    expect(a_request(:get, 'http://political-sentiment.herokuapp.com/records?congress_id=#####&api_key=my_key')).to have_been_made
    expect(records).to eq "cat"
  end
end