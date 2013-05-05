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

ActiveRecord::Schema.define(version: 20130505230927) do

  create_table "knife_configs", force: true do |t|
    t.string   "aws_key"
    t.string   "aws_secret_key"
    t.text     "knife_rb"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servers", force: true do |t|
    t.string   "instance_id"
    t.string   "name"
    t.string   "public_ip"
    t.string   "private_ip"
    t.string   "flavor"
    t.string   "image"
    t.string   "ssh_key_name"
    t.string   "security_groups"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
