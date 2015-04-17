class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :major
      t.string :rank
	 t.references :group
      t.timestamps
    end
  end
end
