import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="leaderboard"
export default class extends Controller {
    connect() {
        this.refresh()
        this.timer = setInterval(() => this.refresh(), 10000) // alle 10s
    }

    disconnect() {
        clearInterval(this.timer)
    }

    refresh() {
        fetch("/click_game/leaderboard", {
            headers: { "Accept": "text/vnd.turbo-stream.html" }
        })
            .then(response => response.text())
            .then(html => {
                this.element.innerHTML = new DOMParser()
                    .parseFromString(html, "text/html")
                    .querySelector("div[data-controller='leaderboard']").innerHTML
            })
    }
}
