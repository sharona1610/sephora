require "spec_helper"

describe "products/index.html.erb" do
  it "displays all the products" do
    assign(:products, [
      stub_model(Product, :name => "3CE"),
      stub_model(Product, :name => "Mascara")
      ])
      render
      rendered.should match("3CE")
      rendered.should match("Mascara")
    end
  end
