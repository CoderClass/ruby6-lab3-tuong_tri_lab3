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

  describe ".discount_amount" do
    p = Product.create!(name: "Hats", price_vnd: 120000)
    a = Product.create!(name: "Hats adfsdf", price_vnd: 250000)
    b = Product.create!(name: "Hats fadsf", price_vnd: 1000000)
    c = Product.create!(name: "Hats fadsf", price_vnd: 90000)
    it "return cut off 21% when hats cost > 100" do
      expect(p.discount_amount).to eq (120000*0.79).round
    end

    it "return cut off 31% when hats cost > 200" do
      expect(a.discount_amount.round).to eq (250000*0.69).round(0)
    end

    it "return cut off 41% when hats cost > 800" do
      expect(b.discount_amount.round).to eq (1000000*0.59).round
    end

    it "return original price when hats cost < 100" do 
      expect(c.discount_amount.round).to eq 90000
    end
  end

  describe ".final_price" do
    a = Product.create!(name: "Hats adfsdf", price_vnd: 144000)
    b = Product.create!(name: "Hats fadsf", price_vnd: 147000)
    it "final price should round up" do
      expect(b.final_price).to eq 120000
    end

    it "final price should round down" do
      expect(a.final_price).to eq 110000
    end

  end
end
