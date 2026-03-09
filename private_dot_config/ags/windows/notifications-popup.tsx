import app from "ags/gtk4/app"

export function NotificationsPopup() {
  return (
    <window
      name="Notifications"
      application={app}
      visible={false}
      class="popup"
    >
      <label label="Notifications list" />
    </window>
  )
}
