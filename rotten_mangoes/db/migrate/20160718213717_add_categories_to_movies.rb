class AddCategoriesToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :categories, :string
  end
end
