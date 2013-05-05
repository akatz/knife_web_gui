class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :instance_id
      t.string :name
      t.string :public_ip
      t.string :private_ip
      t.string :flavor
      t.string :image
      t.string :ssh_key_name
      t.string :security_groups
      t.string :state

      t.timestamps
    end
  end
end
