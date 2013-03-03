require 'spec_helper'

describe Api::RandomMappedValueController, type: :controller do
  let(:token) { ENV['API_TOKEN'] }

  context 'Successfuly requests' do
    it 'can get a random mapped value with a tag' do
      mapped_value = create :mapped_value
      get :index, token: token, tag: mapped_value.tag.name
      response.body.should eql mapped_value.to_json
      response.status.should eql 200
    end
    it 'should respond with an empty object if not tags are found' do
      get :index, token: token, tag: 'this-does-not-exist'
      response.body.should eql '{}'
      response.status.should eql 200
    end
    it 'should response with an empty object if the tag has no values associated' do
      tag = create :tag
      get :index, token: token, tag: tag.name
      response.body.should eql '{}'
      response.status.should eql 200
    end 
  end

  context 'Invalid Requests' do
    it 'do not pass through a token' do
      mapped_value = create :mapped_value
      get :index, tag: mapped_value.tag.name
      response.status.should eql 401
    end
    it 'do not pass through a tag' do
      get :index, token: token
      response.status.should eql 400
    end
  end
end
