class PageDetailSerializer < ActiveModel::Serializer
  attributes :id, :h1_tags, :h2_tags, :h3_tags, :url
end
