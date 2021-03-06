class Api::WordtasksController < ApplicationController
  
  p WordTree.all

  # GET /wordtasks
  def index
    @tasks = WordTree.all
  end
  
  # POST /wordtasks
  def create
      wordparams=params[:task][:main_word]
      p "https://ja.wikipedia.org" + params[:task][:url]
      if WordTree.find_by(main_word: wordparams) == nil then
          agent = Mechanize.new
          mecab = Natto::MeCab.new(output_format_type: :wakati)
          cr_wiki_url = "https://ja.wikipedia.org" + params[:task][:url] 
          page = agent.get(cr_wiki_url)
          elements = page.links
          txts = page.search('p')
          word_arr = []
          html_arr = []
          txt_arr = []
          elements.each do |ele|
              if ele.href.class == String && ele.href.start_with?("/wiki/%") == true && ele.href.include?('.') == false && ele.href.include?('#') == false && ele.href.include?('=') == false && ele.href.include?(':') == false then
                  word_arr.push(ele.text)
                  html_arr.push(ele.href)
              end
          end
          
          #数文を取得して形態素解析からのマルコフ連鎖
          txts.each do |txt_ele|
              txt_arr.push(txt_ele.inner_text)
          end
          txt = txt_arr.join(" ")
          txt = txt.strip
          txt = txt.split('。').map{|s| s + '。'}
          txt = txt[0..5]
          txt = txt.join(" ")
          data = Array.new
          mecab.parse(txt + "EOS").split(" ").each_cons(3) do |a|
              data.push h = {'head' => a[0], 'middle' => a[1], 'end' => a[2]}
          end
          t1 = data[0]['head']
          t2 = data[0]['middle']
          new_text = t1 + t2  
          while true
              _a = Array.new
              data.each do |hash|
                  _a.push hash if hash['head'] == t1 && hash['middle'] == t2
              end
              break if _a.size == 0
              num = rand(_a.size) # 乱数で次の文節を決定する
              new_text = new_text + _a[num]['end']
              break if _a[num]['end'] == "EOS"
              t1 = _a[num]['middle']
              t2 = _a[num]['end']
          end
          sum_txt =  new_text.gsub!(/EOS$/,'')
          word_arr = word_arr[0..5]
          p word_arr
          html_arr = html_arr[0..5]
          @task = WordTree.new(main_word: wordparams, word1: word_arr[0], html1: html_arr[0], word2: word_arr[1], html2: html_arr[1], word3: word_arr[2], html3: html_arr[2], word4: word_arr[3], html4: html_arr[3], word5: word_arr[4], html5: html_arr[4], word6: word_arr[5], html6: html_arr[5], wiki_url: cr_wiki_url, word_url: cr_wiki_url, text: txt, sum_text: sum_txt, is_done:false)
          p "@taskの中身"
          p @task
    else
      @task = WordTree.find_by(main_word: wordparams)
    end
    
    if @task.save
      render :show, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    @task = WordTree.find(params[:id])
    if @task.update(task_params)
      render :show, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def word_tree_params
      params.require(:task).permit(:main_word)
    end
end

