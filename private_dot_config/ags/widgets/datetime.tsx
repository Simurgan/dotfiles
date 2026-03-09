import Gtk from "gi://Gtk?version=4.0"

export function DateTime() {
  const label = new Gtk.Label()

  setInterval(() => {
    const now = new Date()
    label.label = now.toLocaleString()
  }, 1000)

  return (
    <Gtk.Box class="card">
      <Gtk.Label class="title" label="Date & Time" />
      {label}
    </Gtk.Box>
  )
}
