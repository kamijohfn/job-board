class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string     :name,            null: false
      t.integer    :salary_id,       null: false
      t.integer    :area_id ,        null: false
      t.string     :city,            null: false
      t.string     :address,         null: false
      t.string     :building
      t.string     :phone,           null: false
      t.text       :map
      t.integer    :work1_id,        null: false
      t.integer    :work2_id
      t.integer    :work3_id
      t.integer    :test_month_id,   null: false
      t.integer    :test_day_id
      t.integer    :test_id,         null: false
      t.text       :note
      t.references :user,            foreign_key: true

      t.timestamps
    end
  end
end
