variable "heroku_email" {}
variable "heroku_api_key" {}

variable "blog_api_domain" {
  default = "take-five-blog-api.herokuapp.com"
}

provider "heroku" {
    email = "${var.heroku_email}"
    api_key = "${var.heroku_api_key}"
}

resource "heroku_app" "blog-api" {
    name = "take-five-blog-api"
    region = "us"

    config_vars {
      LANG = "en_US.UTF-8"
      DATABASE_URL = "postgres://fhfazymvxnxxpk:Yk9LSuqRr006f8RUe-4DYcwXXh@ec2-54-225-223-40.compute-1.amazonaws.com:5432/d5l8bvv1o3302i"
      RACK_ENV = "production"
      RAILS_ENV = "production"
      NEW_RELIC_LICENSE_KEY = "cbb6a4407bf3a5ccca4ae23ca030f83c8185dff4"
      NEW_RELIC_LOG = "stdout"
      PAPERTRAIL_API_TOKEN = "8TWtRWDhrUEHXYQ8OFuu"
      REDIS_URL = "redis://h:p9engf9nnovu3h8gnp9jn2anbbd@ec2-107-22-213-247.compute-1.amazonaws.com:15799"
    }
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
