// app/javascript/application.js
import { Application } from "stimulus";
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers";

window.Stimulus = Application.start();
const context = require.context("controllers", true, /\.js$/);
Stimulus.load(definitionsFromContext(context));
