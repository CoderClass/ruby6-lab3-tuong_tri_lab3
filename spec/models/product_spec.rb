require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # Use .alphabetical because it's a class method. Example: Product.alphabetical
  # Use #long_name when #long_name is an instance method. Example: @product.long_name
  describe ".alphabetical" do
    it "returns [] when there are no products" do
      expect(Product.alphabetical).to eq []
    end

    it "returns [a] when there is only one product a" do
      a = Product.create!(name: 'a')
      expect(Product.alphabetical).to eq [a]
    end

    it "returns [a,b,c] after I create 3 products c, b, a" do
      c = Product.create!(name: 'c')
      b = Product.create!(name: 'b')
      a = Product.create!(name: 'a')
      expect(Product.alphabetical).to eq [a, b, c]
    end
  end
end
