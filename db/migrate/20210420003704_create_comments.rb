class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string     :text
      t.integer    :think_id
      t.references :user,     foreign_key: true
      t.references :job,      foreign_key: true

      t.timestamps
    end
  end
end
