require 'spec_helper'

describe Comment do
  it { should validate_presence_of :writer_id }
  it { should validate_presence_of :commentable_id }
end
