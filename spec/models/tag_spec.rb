require 'spec_helper'

describe Tag do
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :name }

  it 'should reformat names to have not spaces and all lowercase' do
    tag = create(:tag, name: 'Tag 01')
    tag.name.should == 'tag-01'
  end
end
