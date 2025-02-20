class CreateJoinTableEventSubscriber < ActiveRecord::Migration[8.0]
  def change
    create_table :events_link do |t|
      t.references :event, null: false, foreign_key: true
      t.references :subscriber, null: false, foreign_key: true
      t.string :link
    end
  end
end
