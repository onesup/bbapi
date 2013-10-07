require "spec_helper"

describe AccountTitlesController do
  describe "routing" do

    it "routes to #index" do
      get("/account_titles").should route_to("account_titles#index")
    end

    it "routes to #new" do
      get("/account_titles/new").should route_to("account_titles#new")
    end

    it "routes to #show" do
      get("/account_titles/1").should route_to("account_titles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/account_titles/1/edit").should route_to("account_titles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/account_titles").should route_to("account_titles#create")
    end

    it "routes to #update" do
      put("/account_titles/1").should route_to("account_titles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/account_titles/1").should route_to("account_titles#destroy", :id => "1")
    end

  end
end
