
var time = new Vue({
  el: "#for_time",
  data: {
    time: 0
  },
  methods: {
    time_init: function(){
      this.time = 60
    }
  }
})
var countdown = function(){
  if ( time.time > 0 ){
    time.time--;
    console.log("aaa")
  }else{
    $("#myModal").fadeOut();
  }
}
setInterval(function(){
  countdown()
}, 1000)
