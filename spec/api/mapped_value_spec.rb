require 'spec_helper'

describe Api::RandomMappedValueController, type: :controller do
  context 'Successfuly requests' do
    it 'can get a random mapped value with a tag' do
      mapped_value = create_valid_mapped_value
      get :index, token: valid_token, tag: mapped_value.tag.name

      response.body.should eql mapped_value.to_json
      response.status.should eql 200
    end

    it 'should respond with an empty object if not tags are found' do
      get :index, token: valid_token, tag: 'this-does-not-exist'

      response.body.should eql '{}'
      response.status.should eql 200
    end

    it 'should respond with an empty object if the tag has no values associated' do
      get :index, token: valid_token, tag: create_valid_tag.name

      response.body.should eql '{}'
      response.status.should eql 200
    end

    it 'should update the total value return count' do
      mapped_value = create_valid_mapped_value
      get :index, token: valid_token, tag: mapped_value.tag.name
      mapped_value.reload

      response.status.should eql 200
      mapped_value.return_count.should eql 1
    end
  end

  context 'Invalid Requests' do
    it 'does not pass through a token parameter' do
      get :index, tag: create_valid_mapped_value.tag.name

      response.status.should eql 401
    end

    it 'does not pass through a tag parameter' do
      get :index, token: valid_token

      response.status.should eql 400
    end

    it 'does not have an API_TOKEN set' do
      get :index, token: invalid_token

      response.status.should eql 401
    end
  end
end

def create_valid_tag
  create(:tag)
end

def create_valid_mapped_value
  create(:mapped_value)
end
