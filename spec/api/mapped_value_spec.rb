require 'spec_helper'

describe Api::RandomMappedValueController, type: :controller do
  let(:token) { ENV['API_TOKEN'] }
  let(:tag) { create :tag }
  let(:mapped_value) { create :mapped_value }

  context 'Successfuly requests' do
    it 'can get a random mapped value with a tag' do
      get :index, token: token, tag: mapped_value.tag.name

      response.body.should eql mapped_value.to_json
      response.status.should eql 200
    end

    it 'should respond with an empty object if not tags are found' do
      get :index, token: token, tag: 'this-does-not-exist'

      response.body.should eql '{}'
      response.status.should eql 200
    end

    it 'should respond with an empty object if the tag has no values associated' do
      get :index, token: token, tag: tag.name

      response.body.should eql '{}'
      response.status.should eql 200
    end 
  end

  context 'Invalid Requests' do
    it 'does not pass through a token parameter' do
      get :index, tag: mapped_value.tag.name

      response.status.should eql 401
    end

    it 'does not pass through a tag parameter' do
      get :index, token: token

      response.status.should eql 400
    end

    it 'does not have an API_TOKEN set' do
      ENV['API_TOKEN'] = nil
      get :index, token: token

      response.status.should eql 401
    end
  end
end
