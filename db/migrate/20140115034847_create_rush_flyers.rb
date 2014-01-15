class CreateRushFlyers < ActiveRecord::Migration
  def change
    create_table :rush_flyers do |t|

      t.timestamps
    end
  end
end
