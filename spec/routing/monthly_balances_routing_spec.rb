require "spec_helper"

describe MonthlyBalancesController do
  describe "routing" do

    it "routes to #index" do
      get("/monthly_balances").should route_to("monthly_balances#index")
    end

    it "routes to #new" do
      get("/monthly_balances/new").should route_to("monthly_balances#new")
    end

    it "routes to #show" do
      get("/monthly_balances/1").should route_to("monthly_balances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/monthly_balances/1/edit").should route_to("monthly_balances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/monthly_balances").should route_to("monthly_balances#create")
    end

    it "routes to #update" do
      put("/monthly_balances/1").should route_to("monthly_balances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/monthly_balances/1").should route_to("monthly_balances#destroy", :id => "1")
    end

  end
end
