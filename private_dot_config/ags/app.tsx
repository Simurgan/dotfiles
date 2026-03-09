#!/usr/bin/env -S ags run

import app from "ags/gtk4/app"

import "./style.css"

import { Dashboard } from "./windows/dashboard"
import { MediaPopup } from "./windows/media-popup"
import { NotificationsPopup } from "./windows/notifications-popup"
import { NotificationBanners } from "./windows/notifications-banner"
import { WorkspacePopup } from "./windows/workspace-popup"

app.start({
  main() {
    Dashboard()
    MediaPopup()
    NotificationsPopup()
    NotificationBanners()
    WorkspacePopup()
  },
})
