require "spec_helper"

describe Admin::PreferencesController do
  describe "routing" do
    it "routes to #index" do
      get("/admin/preferences").should route_to("admin/preferences#index")
    end
    
    it "routes to #new" do
      get("/admin/preferences/new").should route_to("admin/preferences#new")
    end
    
    it "routes to #show" do
      get("/admin/preferences/1").should route_to("admin/preferences#show", :id => "1")
    end
    
    it "routes to #edit" do
      get("/admin/preferences/1/edit").should route_to("admin/preferences#edit", :id => "1")
    end
    
    it "routes to #create" do
      post("/admin/preferences").should route_to("admin/preferences#create")
    end
    
    it "routes to #update" do
      put("/admin/preferences/1").should route_to("admin/preferences#update", :id => "1")
    end
    
    it "routes to #destroy" do
      delete("/admin/preferences/1").should route_to("admin/preferences#destroy", :id => "1")
    end
  end
end