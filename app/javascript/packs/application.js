import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import  "../application.css";

import "chartkick"
import "Chart.bundle"

Rails.start()
Turbolinks.start()
ActiveStorage.start()