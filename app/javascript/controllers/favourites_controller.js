import { Controller } from "@hotwired/stimulus"
import debounce from "lodash/debounce"

// Connects to data-controller="favourites"
export default class extends Controller {
  connect() {
    this.beatHeart = debounce(this.beatHeart, 200);
  }

  beatHeart(event) {
    event.target.style.display = 'none'
    event.target.nextElementSibling.style.display = 'block'

    setTimeout(() => this.normalHeart(event), 300);
  }

  normalHeart(event) {
    event.target.style.display = 'block'
    event.target.nextElementSibling.style.display = 'none'
  }

  // these two can be the same, but I'll leave it that way in case I change any specific rule for each one
  favouriteComic() {
    this.element.requestSubmit();
  }

  removeFavouriteComic() {
    this.element.requestSubmit();
  }
}
