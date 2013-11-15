# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131115090456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gemms", force: true do |t|
    t.string   "name"
    t.string   "documentation_url"
    t.string   "frequency"
    t.string   "category"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "downloads"
    t.string   "version"
    t.string   "project_url"
    t.string   "real_name"
    t.string   "version_downloads"
    t.text     "gem_uri"
    t.text     "homepage_uri"
    t.text     "wiki_uri"
    t.text     "mailing_list_uri"
    t.text     "source_code_uri"
    t.text     "bug_tracker_uri"
    t.string   "platform"
  end

  create_table "gemms_repos", id: false, force: true do |t|
    t.integer "gemm_id"
    t.integer "repo_id"
  end

  add_index "gemms_repos", ["gemm_id", "repo_id"], name: "index_gemms_repos_on_gemm_id_and_repo_id", using: :btree
  add_index "gemms_repos", ["gemm_id"], name: "index_gemms_repos_on_gemm_id", using: :btree
  add_index "gemms_repos", ["repo_id"], name: "index_gemms_repos_on_repo_id", using: :btree

  create_table "repos", force: true do |t|
    t.string   "repo_name"
    t.string   "repo_username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.string   "site_name"
    t.string   "site_url"
    t.text     "site_description"
    t.integer  "user_id"
    t.integer  "gemm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "url"
    t.string   "html_url"
    t.string   "repos_url"
    t.string   "gists_url"
    t.string   "avatar_url"
    t.integer  "public_repos"
    t.integer  "followers"
    t.integer  "following"
    t.integer  "github_id"
    t.string   "login"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gravatar_id"
    t.string   "followers_url"
    t.string   "following_url"
    t.string   "starred_url"
    t.string   "subscriptions_url"
    t.string   "organizations_url"
    t.string   "events_url"
    t.string   "received_events_url"
    t.string   "type"
    t.string   "site_admin"
    t.string   "public_gists"
    t.datetime "created_profile"
    t.datetime "last_updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer "up_votes"
    t.integer "down_votes"
    t.integer "user_id"
    t.integer "resource_id"
    t.boolean "up"
    t.boolean "down"
  end

end
