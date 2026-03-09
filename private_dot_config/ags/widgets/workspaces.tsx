import Hyprland from "gi://AstalHyprland"

export function WorkspaceWidget() {
  const hypr = Hyprland.get_default()

  return (
    <box class="card" spacing={4}>
      {Array.from({ length: 10 }).map((_, i) => (
        <button
          class="button"
          onClicked={() => hypr.dispatch("workspace", `${i + 1}`)}
        >
          {i + 1}
        </button>
      ))}
    </box>
  )
}
