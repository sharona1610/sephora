require_relative '../app/models/product.rb'

describe Product do
  before(:context) do
    @product = Product.new(name:'playstick', price:12, description:'foundation', brand:'etude house', category:'makeup', subcategory:'face')
  end

  describe 'Initialization' do
    it 'is an instance of the Tree class' do
      expect(@product).to be_instance_of(Product)
    end
    it 'should assign name' do
      expect(@product.name).to eq('playstick')
    end
    it 'should assign description' do
      expect(@product.description).to eq('foundation')
    end
    it 'should assign brand' do
      expect(@product.brand).to eq('etude house')
    end
    it 'should assign category' do
      expect(@product.category).to eq('makeup')
    end
    it 'should assign subcategory' do
      expect(@product.subcategory).to eq('face')
    end
    it 'should assign price' do
      expect(@product.price).to eq(12)
    end
    it 'should not assign text to price' do
      @product.price ='hello'
      expect(@product.price).to eq(0)
    end
  end
end
