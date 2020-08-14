json.extract! @cart, :id, :name

json.shopping_cart_products do
  json.array! @cart.products do |product|
    json.id product.id
    json.name product.product.name
    json.quantity product.quantity
    json.price product.price
  end
end
