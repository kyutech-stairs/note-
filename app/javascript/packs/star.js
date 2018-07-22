import Vue from 'vue/dist/vue'
import App from '../app.vue'
import StarRating from 'vue-star-rating'


var star = new Vue({
  el: "#star-rate",
  components: {
    'star-rating': StarRating
  },
  data: {
    rating: null,
    boundRating: "",
  },
  methods: {
    setRating: function(rating) {
      this.rating = rating;
    },
  }
})
