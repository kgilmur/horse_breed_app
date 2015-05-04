

# list = flickr.photos.search :text => @search, :sort => 'relevance'

#     @results = list.map do |photo|
#       [FlickRaw.url_s(photo),
#         FlickRaw.url_b(photo)]

      require 'flickraw'

FlickRaw.api_key="f05ebc8053972037f331f7d82d0c6dcb"
FlickRaw.shared_secret="a03fdcbd8e94aece"

list = flickr.photos.search :text => "trakehner horse", :sort => 'relevance'

list.map do |photo|
    [FlickRaw.url_s(photo),
    FlickRaw.url_b(photo)]
end

request = FlickRaw::Request.new(
  "api.flickr.com/services/rest/",
  method: :get,
  params: {term: "trakehner horse"}
  )


response = request.run

puts response

# data = JSON.parse(response.body)

# ap data["results"].map { |t| ["artistName"] }