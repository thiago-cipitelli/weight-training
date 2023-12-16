class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :muscle
      t.string :equipment
      t.float :rating
    end
  end
end
