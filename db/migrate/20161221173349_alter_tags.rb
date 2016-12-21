class AlterTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :tags, :url_id
    add_reference :tags, :url, foreign_key: {name: "fk_url_index_on_tag" }, index: {name: "url_index_on_tag" }
  end
end
