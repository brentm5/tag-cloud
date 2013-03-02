require 'spec_helper'

describe Tag do
  it { should validate_uniqueness_of :name }
end
