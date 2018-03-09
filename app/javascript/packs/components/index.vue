<template>
  <div>
  <div class="container">
    <div class="row">
      <div class="col s12 offset-s4">
        <a v-model="Word1" class="col s2 center btn-floating waves-effect waves-light blue" v-on:click="postword1">{{Word1}}</a>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <div class="col s12 offset-s2">
        <a v-model="Word2" class="col s2 center btn-floating waves-effect waves-light blue" v-on:click="postword2">{{Word2}}</a>
        <a v-model="Word3" class="col s2 center offset-s2 btn-floating waves-effect waves-light blue" v-on:click="postword3">{{Word3}}</a>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <div class="col s12 offset-s4">
        <a v-model="Main_Word"  class="col s2 center btn-floating waves-effect waves-light red" v-on:click="disp">{{Main_Word}}</a>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <div class="col s12 offset-s2">
        <a v-model="Word4" class="col s2 center btn-floating waves-effect waves-light blue" v-on:click="postword4">{{Word4}}</a>
        <a v-model="Word5" class="col s2 center offset-s2 btn-floating waves-effect waves-light blue" v-on:click="postword5">{{Word5}}</a>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <div class="col s12 offset-s4">
        <a v-model="Word6" class="col s2 center btn-floating waves-effect waves-light blue" v-on:click="postword6">{{Word6}}</a>
      </div>
    </div>
  </div>
  <div v-if="bool==='True'" class="container">
    <div class="row">
      <div class="col s6 offset-s2 center">
        <div class="card">
          <div class="card-content">
            <p v-model="Sum_Text">{{Sum_Text}}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
</template>

<script>
  import axios from "axios";
  
  export default{
    data: function(){
      return {
        worddata:[],
        Sum_Text:'こんにちわ',
        Main_Word:'始めましょう',
        Word1:'あ',
        Html1:"/wiki/%E3%81%82",
        Word2:'い',
        Html2:"/wiki/%E3%81%84",
        Word3:'う',
        Html3:"/wiki/%E3%81%86",
        Word4:'え',
        Html4:"/wiki/%E3%81%88",
        Word5:'お',
        Html5:"/wiki/%E3%81%8A",
        Word6:'見出し',
        Html6:"/wiki/%E8%A6%8B%E5%87%BA%E3%81%97",
        bool:"False",
        count:0,
      };
    },
    methods:{
      fetchWords: function(){
        this.worddata=[];
        axios.get('/api/wordtasks').then((response) => {
          for(var i = 0; i < response.data.wordtasks.length; i++) {
            this.worddata.push(response.data.wordtasks[i]);
            this.Sum_Text = this.worddata[this.worddata.length-1]["sum_text"];
            this.Main_Word = this.worddata[this.worddata.length-1]["main_word"];
            this.Word1 = this.worddata[this.worddata.length-1]["word1"];
            this.Html1 = this.worddata[this.worddata.length-1]["html1"];
            this.Word2 = this.worddata[this.worddata.length-1]["word2"];
            this.Html2 = this.worddata[this.worddata.length-1]["html2"];
            this.Word3 = this.worddata[this.worddata.length-1]["word3"];
            this.Html3 = this.worddata[this.worddata.length-1]["html3"];
            this.Word4 = this.worddata[this.worddata.length-1]["word4"];
            this.Html4 = this.worddata[this.worddata.length-1]["html4"];
            this.Word5 = this.worddata[this.worddata.length-1]["word5"];
            this.Html5 = this.worddata[this.worddata.length-1]["html5"];
            this.Word6 = this.worddata[this.worddata.length-1]["word6"];
            this.Html6 = this.worddata[this.worddata.length-1]["html6"];
          }
        }, (error) => {
          console.log(error);
        });
      },
      disp: function(){
        if(this.count % 2 == 0){
          this.bool="True";
        }
        else{
          this.bool="False";
        }
        this.count=this.count+1;
      },
      postword1: function(){
        axios.post('/api/wordtasks', { task: { main_word: this.Word1, url:this.Html1 } });
        this.fetchWords();
      },
      postword2: function(){
        axios.post('/api/wordtasks', { task: { main_word: this.Word2, url:this.Html2 } });
        this.fetchWords();
      },
      postword3: function(){
        axios.post('/api/wordtasks', { task: { main_word: this.Word3, url:this.Html3 } });
        this.fetchWords();
      },
      postword4: function(){
        axios.post('/api/wordtasks', { task: { main_word: this.Word4, url:this.Html4 } });
        this.fetchWords();
      },
      postword5: function(){
        axios.post('/api/wordtasks', { task: { main_word: this.Word5, url:this.Html5 } });
        this.fetchWords();
      },
      postword6: function(){
        axios.post('/api/wordtasks', { task: { main_word: this.Word6, url:this.Html6 } });
        this.fetchWords();
      },
    }
  };
</script>
