class PostCategorySerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :post
  belongs_to :category
end
