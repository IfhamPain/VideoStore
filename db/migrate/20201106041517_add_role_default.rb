class AddRoleDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :users , :role , :integer ,default: User.roles[:member]
  end
end
