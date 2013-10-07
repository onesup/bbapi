require "spec_helper"

describe AccountCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/account_categories").should route_to("account_categories#index")
    end

    it "routes to #new" do
      get("/account_categories/new").should route_to("account_categories#new")
    end

    it "routes to #show" do
      get("/account_categories/1").should route_to("account_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/account_categories/1/edit").should route_to("account_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/account_categories").should route_to("account_categories#create")
    end

    it "routes to #update" do
      put("/account_categories/1").should route_to("account_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/account_categories/1").should route_to("account_categories#destroy", :id => "1")
    end

  end
end
