class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
	t.string :gname
	t.integer :id1
	t.integer :id2
	t.integer :id3
	t.integer :id4
	t.integer :id5
	t.integer :id6
	t.integer :id7
	t.integer :id8
	t.integer :id9
	t.integer :id10
    end
  end
end
