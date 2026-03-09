import app from "ags/gtk4/app"
import Notifd from "gi://AstalNotifd"

export function NotificationBanners() {
  const notifd = Notifd.get_default()

  return (
    <window
      name="NotificationBanners"
      application={app}
      class="popup"
      anchor={["top", "right"]}
    >
      <box vertical>
        {notifd.notifications.map((n) => (
          <box class="card">
            <label label={n.summary} />
          </box>
        ))}
      </box>
    </window>
  )
}
