describe PagesController do
  describe "routing" do
    it "routes to #show" do
      get("/pages/lorem").should route_to("pages#show", :id => "lorem")
    end
  end
end