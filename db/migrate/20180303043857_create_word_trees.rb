class CreateWordTrees < ActiveRecord::Migration[5.1]
  def change
    create_table :word_trees do |t|
      t.string :main_word, null: false
      t.string :word1, default: "a", null: false
      t.string :html1, default: "a", null:false
      t.string :word2, default: "a", null: false
      t.string :html2, default: "a", null:false
      t.string :word3, default: "a", null: false
      t.string :html3, default: "a", null:false
      t.string :word4, default: "a", null: false
      t.string :html4, default: "a", null:false
      t.string :word5, default: "a", null: false
      t.string :html5, default: "a", null:false
      t.string :word6, default: "a", null: false
      t.string :html6, default: "a", null:false
      t.string :wiki_url, default: "a", null: false
      t.string :word_url, default: "a", null: false
      t.string :text, default: "a", null: false
      t.string :sum_text, default: "a", null: false
      t.boolean :is_done, default: false, null: false

      t.timestamps
    end
  end
end