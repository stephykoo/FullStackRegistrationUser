class AddUserToPhones < ActiveRecord::Migration[5.1]
  def change
    add_reference :phones, :user, index: true, null: false, foreign_key: {on_delete: :restrict, on_update: :restrict}
  end
end
