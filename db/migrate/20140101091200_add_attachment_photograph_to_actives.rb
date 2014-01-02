class AddAttachmentPhotographToActives < ActiveRecord::Migration
  # def self.up
  #   change_table :actives do |t|
  #     t.attachment :photograph
  #   end
  # end

  # def self.down
  #   drop_attached_file :actives, :photograph
  # end

  def change
    add_attachment :actives, :photograph
  end
end
