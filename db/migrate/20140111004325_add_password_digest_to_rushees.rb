class AddPasswordDigestToRushees < ActiveRecord::Migration
  def change
    add_column :rushees, :password_digest, :string
  end
end
