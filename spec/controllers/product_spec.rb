require "rails_helper"
require_relative '../../app/controllers/products_controller.rb'

RSpec.describe ProductsController do
  describe "GET #index" do
    subject { get :index }

    it "renders the index template" do
      expect(subject).to render_template(:index)
      expect(subject).to render_template("index")
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("new")
    end
  end

  describe "GET #new" do
    subject { get :new }

    it "renders the new template" do
      expect(subject).to render_template(:new)
      expect(subject).to render_template("new")
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("index")
    end
  end

  describe "#create" do
    subject { post :create, :product => { :name => "playstick", :description => 'Clay Pallette', :price => 12, :brand =>'Sephora', :category => 'makeup', :subcategory => 'face' } }

    it "redirects to index" do
      expect(subject).to redirect_to(products_path)
    end
  end
end
