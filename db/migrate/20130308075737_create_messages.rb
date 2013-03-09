class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.string :to
      t.string :content
      t.string :from
      t.string :folder
      t.date :date

      t.timestamps
    end
  end
end
