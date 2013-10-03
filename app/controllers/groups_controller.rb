class GroupsController < InheritedResources::Base
  include ActionController::ImplicitRender
  respond_to :json
end
