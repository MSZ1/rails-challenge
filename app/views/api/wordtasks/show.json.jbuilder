json.set! :wordtasks do
  json.extract! @task, :id, :main_word, :word1, :html1, :word2, :html2, :word3, :html3, :word4, :html4, :word5, :html5, :word6, :html6, :wiki_url, :word_url, :text, :sum_text, :is_done, :created_at, :updated_at
end