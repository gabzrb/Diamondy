module ApplicationHelper
  def self.product_conection
    Product.all.each do |product|
      if (product.jewel.nil? && product.stone.nil? && product.watch.nil? && product.special_request.nil?)
        product.destroy!
      end
    end
  end

  def self.traduct_element(element)
    if element == "Bijou"
      return "jewel"
    elsif element == "Diamant"
      return "stone"
    elsif element == "Montre"
      return "watch"
    else
      return "special_request"
    end
  end
end
