class CreateKnifeConfigs < ActiveRecord::Migration
  def change
    create_table :knife_configs do |t|
      t.string :aws_key
      t.string :aws_secret_key
      t.text :knife_rb
      t.references :user

      t.timestamps
    end
  end
end
