
var time = new Vue({
  el: "#for_time",
  data: {
    time: 0,
    card: {
      number: "4242424242424242",
      cvc: "111",
      exp_month: "11",
      exp_year: "2019",
   },
  },
  methods: {
    time_init: function(){
      this.time = 180
    },
     Submit: function(){
       console.log("pushed submit")
       Payjp.createToken(this.card, function(s, response) {
         if (response.error){
           alert(response.error.message)
         }else{
           var token=response.id
           $(".number").removeAttr("name");
           $(".cvc").removeAttr("name");
           $(".exp_month").removeAttr("name");
           $(".exp_year").removeAttr("name");
           $("#charge-form").append($('<input type="hidden" name="payjpToken" />').val(token));
           $("#charge-form").submit()
         }
       })
     } 
  }
})
      
var countdown = function(){
  if ( time.time > 0 ){
    time.time--;
  }else{
    $("#myModal").fadeOut();
  }
}
setInterval(function(){
  countdown()
}, 1000)
