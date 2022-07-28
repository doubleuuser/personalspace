import { Controller } from "@hotwired/stimulus";

import Typed from "typed.js";


export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings:["Add a post below", "And share it with others"],
      typeSpeed: 40,
      loop: true
    });
  }
}
