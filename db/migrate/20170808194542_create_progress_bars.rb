class CreateProgressBars < ActiveRecord::Migration
  def change
    create_table :progress_bars do |t|
      t.string :process_id
      t.string :status
      t.string :base_url
      t.string :parameter_partner

      t.timestamps null: false
    end
  end
end
