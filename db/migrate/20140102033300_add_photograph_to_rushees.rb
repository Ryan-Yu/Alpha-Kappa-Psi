class AddPhotographToRushees < ActiveRecord::Migration
  def change
    add_attachment :rushees, :photograph
  end
end
