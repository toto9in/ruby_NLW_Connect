class CreateSubscribers < ActiveRecord::Migration[8.0]
  def change
    create_table :subscribers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :link

      t.timestamps
    end

    add_reference :subscribers, :event, null: true, foreign_key: true
  end
end
