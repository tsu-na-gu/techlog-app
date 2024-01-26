import { Contoller } from "@hotwired/stimulus"

export default class extends Contoller {
    remove() {
        this.element.remove()
    }
}