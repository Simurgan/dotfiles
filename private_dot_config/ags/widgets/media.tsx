import Mpris from "gi://AstalMpris"

export function MediaWidget() {
  const mpris = Mpris.get_default()
  const player = mpris?.players?.[0]
  const nowPlaying = player ? `${player.title} - ${player.artist}` : "Nothing playing"

  return (
    <box class="card" vertical>
      <label class="title" label="Media" />
      <label label={nowPlaying} />
    </box>
  )
}
