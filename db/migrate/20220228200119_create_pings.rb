class CreatePings < ActiveRecord::Migration[7.0]
  def change
    create_table :pings do |t|

      t.timestamps
    end
  end
end
