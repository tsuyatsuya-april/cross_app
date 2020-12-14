class CreateCrossAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :cross_answers do |t|
      t.references :student, foreign_key: true
      t.references :lesson, foreign_key: true
      t.integer :writing, null: false
      t.integer :mark, null: false
      t.timestamps
    end
  end
end
