require "spec_helper"

describe BookkeepingsController do
  describe "routing" do

    it "routes to #index" do
      get("/bookkeepings").should route_to("bookkeepings#index")
    end

    it "routes to #new" do
      get("/bookkeepings/new").should route_to("bookkeepings#new")
    end

    it "routes to #show" do
      get("/bookkeepings/1").should route_to("bookkeepings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bookkeepings/1/edit").should route_to("bookkeepings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bookkeepings").should route_to("bookkeepings#create")
    end

    it "routes to #update" do
      put("/bookkeepings/1").should route_to("bookkeepings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bookkeepings/1").should route_to("bookkeepings#destroy", :id => "1")
    end

  end
end
