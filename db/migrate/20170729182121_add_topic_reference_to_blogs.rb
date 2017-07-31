class AddTopicReferenceToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :blogs, :topic, foreign_key: true #not just an integer value, it's referencing another table
  end
end
