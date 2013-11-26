require 'spec_helper'

# describe Monroe do
#   before do
#     Monroe.key = "my key"
#   end
#   it 'should set the the api key'
#   expect(Monroe.key).to eq 'my key'
# end

describe Monroe do
  before do
    Monroe.key = "my key"
  end
  it 'should set the the api key' do
    expect(Monroe.key).to eq 'my key'
  end
end