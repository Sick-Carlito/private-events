class AddEventIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_id, :integer
  end
end
