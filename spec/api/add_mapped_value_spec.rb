require 'spec_helper'

describe Api::MappedValuesController, type: :controller do
  context 'Successful requests' do
    it 'can create a new mapped value' do
      tag = create_tag
      post :create, token: valid_token, tag_name: tag.name, value: 'Hello World'
      verify_mapped_value_added('Hello World', tag)

      response.status.should eql 200
    end

    it 'can create a new mapped value and tag' do
      post :create, token: valid_token, tag_name: 'none', value: 'Hello World'
      verify_mapped_value_added('Hello World')


      response.status.should eql 200
    end
  end

  context 'Invalid Request' do
    it 'does not pass through a token parameter' do
      post :create, value: 'Hello World'

      response.status.should eql 401
    end

    it 'does not pass through a value parameter' do
      post :create, token: valid_token

      response.status.should eql 400
    end

    it 'does not have an API_TOKEN set' do
      post :create, token: invalid_token, value: 'Hello World'

      response.status.should eql 401
    end
  end
end

def verify_mapped_value_added(value, tag = nil)
  new_mapped_value = MappedValue.last
  new_mapped_value.value.should eq value
  new_mapped_value.tag.name.should eq tag.name if tag
end

def create_tag
  create(:tag)
end
