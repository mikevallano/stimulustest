class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.belongs_to :list, null: false, foreign_key: true
      t.belongs_to :member, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end

    add_index :memberships, %i[list_id member_id], unique: true
  end
end
