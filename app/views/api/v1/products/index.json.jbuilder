json.array! @products do |p|  
    json.id p.id
    json.name p.name
    json.price p.price
    json.comment p.comment
    json.url URI.join(request.url, p.image.url)
    json.supplier p.supplier
end
