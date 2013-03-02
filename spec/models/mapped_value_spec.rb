require 'spec_helper'

describe MappedValue do
  it { should belong_to :tag }
  it { should validate_presence_of :value }
  it { should validate_presence_of :tag }
end
