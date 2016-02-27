variable "heroku_email" {}
variable "heroku_api_key" {}

provider "heroku" {
    email = "${var.heroku_email}"
    api_key = "${var.heroku_api_key}"
}

resource "heroku_app" "blog-api" {
    name = "take-five-blog-api"
    region = "us"
}

resource "heroku_addon" "redis-blog-api" {
    app = "${heroku_app.blog-api.name}"
    plan = "heroku-redis:hobby-dev"
}

resource "heroku_addon" "papertrail-blog-api" {
    app = "${heroku_app.blog-api.name}"
    plan = "papertrail:choklad"
}

resource "heroku_addon" "newrelic-blog-api" {
    app = "${heroku_app.blog-api.name}"
    plan = "newrelic:wayne"
}

resource "heroku_addon" "scheduler-blog-api" {
    app = "${heroku_app.blog-api.name}"
    plan = "scheduler:standard"
}
