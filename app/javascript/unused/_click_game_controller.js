import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="click-game"
export default class extends Controller {
    static targets = ["gameArea", "totalPoints"]

    connect() {
        console.log("ClickGameController verbunden!")
        this.dotSize = 80 // entspricht w-20 h-20 in Tailwind
        this.spawnDot()
    }

    spawnDot() {
        const dot = document.createElement("div")
        dot.className = "absolute w-20 h-20 rounded-full border-4 border-black bg-red-500 z-50"

        // sichere Positionierung innerhalb des gameArea-Containers
        const maxTop = this.gameAreaTarget.offsetHeight - this.dotSize
        const maxLeft = this.gameAreaTarget.offsetWidth - this.dotSize
        dot.style.top = `${Math.random() * maxTop}px`
        dot.style.left = `${Math.random() * maxLeft}px`

        // Startzeit merken
        this.startTime = Date.now()

        // Klick-Event
        dot.addEventListener("click", () => {
            const reactionTime = (Date.now() - this.startTime) / 1000

            fetch("/click_game/score", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
                },
                body: JSON.stringify({ reaction_time: reactionTime }),
            })
                .then((res) => res.json())
                .then((data) => {
                    this.totalPointsTarget.textContent = data.total_points
                    dot.remove()
                    setTimeout(() => this.spawnDot(), 1000)
                })
        })

        this.gameAreaTarget.appendChild(dot)
    }

    randomColor() {
        const rainbow = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]
        return rainbow[Math.floor(Math.random() * rainbow.length)]
    }
}
