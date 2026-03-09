import Mpris from "gi://AstalMpris"

export function MediaWidget() {
  const mpris = Mpris.get_default()

  return (
    <box class="card" vertical>
      <label class="title" label="Media" />

      <label
        setup={(self) => {
          self.hook(mpris, () => {
            const player = mpris.players[0]
            if (!player) return

            self.label = `${player.title} - ${player.artist}`
          })
        }}
      />
    </box>
  )
}
