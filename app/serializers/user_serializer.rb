class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :categorized_notes, :unique_categories
  # has_many :categories

  def categorized_notes
    object.notes.sort_by{|note| note.category.id}
  end

  def unique_categories
    object.categories.uniq
  end
end
