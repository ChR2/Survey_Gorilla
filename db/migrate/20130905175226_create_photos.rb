class CreatePhotos < ActiveRecord::Migration
  def change
  	create_table :photos do |t|
  		t.belongs_to :album
  		t.string :name
  		t.string :file
  	end
  end
end
