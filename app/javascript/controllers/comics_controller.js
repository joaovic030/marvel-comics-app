import { Controller } from "@hotwired/stimulus"
import debounce from "lodash/debounce"

// Connects to data-controller="comics"
export default class extends Controller {
  static values = { query: String }

  connect() {
    this.searchComicsByCharacters = debounce(this.searchComicsByCharacters, 500);
    console.log("hello from stimulus")
  }

  searchComicsByCharacters() {
    this.element.requestSubmit();
  }
}
