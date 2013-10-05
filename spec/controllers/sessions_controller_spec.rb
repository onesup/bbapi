require 'spec_helper'

describe 'SessionsController' do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end
end
