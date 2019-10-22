class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
