module ProductsHelper
	def self.product_discount_info(product)
		if product.on_sale?
			return "More than 25\% off"
		end
	end
end