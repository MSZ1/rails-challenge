class HomeController < ApplicationController
  def index
    agent = Mechanize.new
    mecab = Natto::MeCab.new(output_format_type: :wakati)
    page = agent.get("https://ja.wikipedia.org/wiki/%E3%83%95%E3%83%A9%E3%83%B3%E3%82%B9")
    elements = page.links
    txts = page.search('p')
    
    @word_arr = []
    @html_arr = []
    txt_arr = []
    elements.each do |ele|
      if ele.href.class == String && ele.href.start_with?("/wiki/%") == true && ele.href.include?('.') == false && ele.href.include?('#') == false && ele.href.include?('=') == false && ele.href.include?(':') == false then
        @word_arr.push(ele.text)
        @html_arr.push(ele.href)
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
    @txt =  new_text.gsub!(/EOS$/,'')
    @word_arr = @word_arr[0..5]
    @html_arr = @html_arr[0..5]
  end
end