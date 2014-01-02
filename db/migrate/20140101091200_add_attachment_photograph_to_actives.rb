class AddAttachmentPhotographToActives < ActiveRecord::Migration
  def change
    add_attachment :actives, :photograph
  end
end
