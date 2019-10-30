module ApplicationHelper
  def self.product_conection
    Product.all.each do |product|
      if (product.jewel.nil? && product.stone.nil? && product.watch.nil? && product.special_request.nil?)
        product.destroy!
      end
    end
  end
end
