require 'spec_helper'

describe Group do
  it { should validate_uniqueness_of :name }
end
