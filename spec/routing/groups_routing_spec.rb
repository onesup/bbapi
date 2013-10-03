require "spec_helper"

describe GroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/groups").should route_to("groups#index", format: "json")
    end

    # it "routes to #new" do
    #   get("/groups/new").should route_to("groups#new")
    # end

    it "routes to #show" do
      get("/groups/1").should route_to("groups#show", format: "json", :id => "1")
    end

    # it "routes to #edit" do
    #   get("/groups/1/edit").should route_to("groups#edit", :id => "1")
    # end

    it "routes to #create" do
      post("/groups").should route_to("groups#create", format: "json")
    end

    it "routes to #update" do
      put("/groups/1").should route_to("groups#update", format: "json", :id => "1")
    end

    it "routes to #destroy" do
      delete("/groups/1").should route_to("groups#destroy", format:"json", :id => "1")
    end

  end
end
