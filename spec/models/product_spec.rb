require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validates :name, presence: true
    # validates :price, presence: true
    # validates :quantity, presence: true
    # validates :category, presence: true

    it 'should create a product' do
      @category = Category.new(name: 'Bushes')
      @product = Product.new(name: 'Yew', price: 1500, quantity: 10, category: @category)
      expect(@product).to be_valid
    end

    it 'should not create a product without a name' do
      @category = Category.new(name: 'Bushes')
      @product = Product.new(name: nil, price: 1500, quantity: 10, category: @category)
      expect(@product).to_not be_valid
    end

    it 'should not create a product without a price' do
      @category = Category.new(name: 'Bushes')
      @product = Product.new(name: 'Yew', quantity: 10, category: @category)
      expect(@product).to_not be_valid
    end

    it 'should not create a product without a quantity' do
      @category = Category.new(name: 'Bushes')
      @product = Product.new(name: 'Yew', price: 1500, quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end

    it 'should not create a product without a category' do
      @product = Product.new(name: 'Yew', price: 1500, quantity: 10, category: nil)
      expect(@product).to_not be_valid
    end
  end
end