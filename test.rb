
 

  <% @order.line_items.each do |item| %>

    <%= render 'line_item', product: item[:product_id], quantity: item[:quantity].to_i %>
    <% end %>