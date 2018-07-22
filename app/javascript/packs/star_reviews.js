import Vue from 'vue/dist/vue'
import StarRating from 'vue-star-rating'


var star = new Vue({
  el: "#reviews-index",
  components: {
    'star-rating': StarRating
  },
})
