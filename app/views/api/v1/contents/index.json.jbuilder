json.array! @contents do |content|
  json.partial! content, partial: 'content'
end