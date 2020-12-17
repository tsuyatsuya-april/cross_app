class CreateBattings < ActiveRecord::Migration[6.0]
  def change
    create_table :battings do |t|
      t.integer     :member_id,      null: false
      t.integer     :batting_number, null: false
      t.integer     :position_id,    null: false
      t.timestamps
    end
  end
end
