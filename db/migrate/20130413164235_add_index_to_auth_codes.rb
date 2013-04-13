class AddIndexToAuthCodes < ActiveRecord::Migration
  def change
    add_index(:auth_codes, :name, unique: true)
  end
end
