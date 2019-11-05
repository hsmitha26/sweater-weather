class BackgroundImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :image_urls
end
