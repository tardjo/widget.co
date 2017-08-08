class CreateUploadFiles < ActiveRecord::Migration
  def change
    create_table :upload_files do |t|

      t.timestamps null: false
    end
  end
end
