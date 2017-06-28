class Product < ActiveRecord::Base
  before_save :set_default_image_path
  validates :name, presence: true

  def discount_amount
  	if price_vnd > 800000
  		(price_vnd * 0.59)
  	elsif price_vnd > 200000
  		(price_vnd * 0.69)
  	elsif price_vnd > 100000
  		(price_vnd * 0.79) 
  	else
  		price_vnd
  	end
  end

  def final_price
    discount = (discount_amount / 10000).round * 10000
  end

  def on_sale?
    true
  end

  private

  def set_default_image_path
    self.image_path ||= "http://lorempixel.com/200/200/fashion"
  end

  def self.alphabetical
    Product.all.order(name: 'asc')
  end

  


    # Hats that cost > 100,000 VND are going to be 21% off.
    # Hats that cost > 200,000 VND are going to be 31% off.
    # Hats that cost > 800,000 VND are going to be 41% off.


end
