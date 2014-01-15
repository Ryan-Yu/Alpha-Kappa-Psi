class AddAttachmentFrontToRushflyers < ActiveRecord::Migration
  
  def change
    add_attachment :rush_flyers, :front
  end

end
