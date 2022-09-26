# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_26_065612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "line_1"
    t.string "line_2"
    t.string "line_3"
    t.string "city"
    t.string "province"
    t.string "postal_code"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_type", "owner_id"], name: "index_addresses_on_owner_type_and_owner_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "apps", force: :cascade do |t|
    t.string "name", null: false
    t.string "link"
    t.text "logo"
  end

  create_table "auth_factors", force: :cascade do |t|
    t.integer "kind", default: 0
    t.integer "status", default: 0
    t.string "factor_identifier"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_auth_factors_on_user_id"
  end

  create_table "charges", force: :cascade do |t|
    t.string "bundle_type"
    t.integer "amount", default: 0, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_charges_on_user_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "digits"
    t.integer "month"
    t.integer "year"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "stripe_id"
    t.string "cvc"
    t.string "brand"
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "credits", force: :cascade do |t|
    t.datetime "expiry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "credit_type", default: 0, null: false
    t.integer "value", default: 0
    t.string "type"
    t.bigint "owner_id"
    t.bigint "package_subscription_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_credits_on_deleted_at"
    t.index ["package_subscription_id"], name: "index_credits_on_package_subscription_id"
  end

  create_table "features", force: :cascade do |t|
    t.bigint "featureable_id"
    t.string "featureable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.bigint "package_subscription_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_features_on_deleted_at"
    t.index ["featureable_type", "featureable_id", "name", "deleted_at"], name: "index_features_on_featureable_type_id_name_deleted_at", unique: true
    t.index ["featureable_type", "featureable_id"], name: "index_features_on_featureable_type_and_featureable_id"
    t.index ["package_subscription_id"], name: "index_features_on_package_subscription_id"
  end

  create_table "flipper_features", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["key"], name: "index_flipper_features_on_key", unique: true
  end

  create_table "flipper_gates", force: :cascade do |t|
    t.string "feature_key", null: false
    t.string "key", null: false
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feature_key", "key", "value"], name: "index_flipper_gates_on_feature_key_and_key_and_value", unique: true
  end

  create_table "institution_apps", force: :cascade do |t|
    t.bigint "institution_id"
    t.bigint "app_id"
    t.boolean "enabled"
    t.string "error_message"
    t.string "link"
    t.index ["institution_id", "app_id"], name: "index_institution_app_pair_uniqueness", unique: true
  end

  create_table "institutions", force: :cascade do |t|
    t.integer "usage_cap"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "individual_usage_cap"
    t.integer "active_cost"
    t.integer "passive_cost"
    t.integer "user_registration_settings", default: 0, null: false
    t.string "contact", default: "hello@talk-type.com", null: false
    t.string "domains", array: true
    t.boolean "editor_enabled"
    t.integer "views_usage_cap"
    t.boolean "vtt_downloads_enabled", default: false, null: false
    t.boolean "publically_searchable", default: false
    t.string "team_mailbox"
    t.string "hubspot_identifier"
    t.bigint "sso_configuration_id"
    t.string "display_name"
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.boolean "require_mfa", default: false, null: false
    t.index ["sso_configuration_id"], name: "index_institutions_on_sso_configuration_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "code"
  end

  create_table "license_keys", force: :cascade do |t|
    t.string "key"
    t.date "activated_at"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "credit_id"
    t.string "invoice_ref", default: ""
    t.bigint "reseller_order_item_id"
    t.integer "version", default: 2, null: false
    t.index ["credit_id"], name: "index_license_keys_on_credit_id"
    t.index ["key"], name: "index_license_keys_on_key"
    t.index ["reseller_order_item_id"], name: "index_license_keys_on_reseller_order_item_id"
    t.index ["user_id"], name: "index_license_keys_on_user_id"
  end

  create_table "licenses", force: :cascade do |t|
    t.datetime "expiry"
    t.bigint "institution_id", null: false
    t.datetime "deleted_at"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_id"], name: "index_licenses_on_institution_id"
  end

  create_table "medias", force: :cascade do |t|
    t.uuid "uuid", null: false
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "content_type", null: false
    t.string "original_file_name"
    t.index ["owner_type", "owner_id"], name: "index_medias_on_owner_type_and_owner_id"
    t.index ["uuid"], name: "index_medias_on_uuid"
  end

  create_table "note_attachments", force: :cascade do |t|
    t.bigint "note_entry_id", null: false
    t.bigint "upload_id", null: false
    t.datetime "deleted_at"
    t.uuid "uuid"
    t.index ["note_entry_id"], name: "index_note_attachments_on_note_entry_id"
    t.index ["upload_id"], name: "index_note_attachments_on_upload_id"
    t.index ["uuid"], name: "index_note_attachments_on_uuid"
  end

  create_table "note_document_attachments", force: :cascade do |t|
    t.bigint "note_document_id", null: false
    t.bigint "upload_id", null: false
    t.string "attachment_type"
    t.datetime "deleted_at"
    t.uuid "uuid"
    t.index ["note_document_id"], name: "index_note_document_attachments_on_note_document_id"
    t.index ["upload_id"], name: "index_note_document_attachments_on_upload_id"
    t.index ["uuid"], name: "index_note_document_attachments_on_uuid", unique: true
  end

  create_table "note_documents", force: :cascade do |t|
    t.uuid "uuid", null: false
    t.bigint "owner_id", null: false
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "transcription_id", null: false
    t.index ["owner_id"], name: "index_note_documents_on_owner_id"
    t.index ["transcription_id"], name: "index_note_documents_on_transcription_id"
    t.index ["uuid"], name: "index_note_documents_on_uuid", unique: true
  end

  create_table "note_entries", force: :cascade do |t|
    t.uuid "uuid", null: false
    t.bigint "author_id", null: false
    t.bigint "note_document_id", null: false
    t.string "note_entry_type"
    t.text "content"
    t.integer "timestamp_relative_to_media"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "result_id"
    t.index ["author_id"], name: "index_note_entries_on_author_id"
    t.index ["note_document_id"], name: "index_note_entries_on_note_document_id"
    t.index ["uuid"], name: "index_note_entries_on_uuid", unique: true
  end

  create_table "notes", force: :cascade do |t|
    t.string "title", null: false
    t.string "subject_type", null: false
    t.bigint "subject_id", null: false
    t.bigint "author_id", null: false
    t.uuid "share_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["author_id"], name: "index_notes_on_author_id"
    t.index ["deleted_at"], name: "index_notes_on_deleted_at"
    t.index ["share_id"], name: "index_notes_on_share_id"
    t.index ["subject_type", "subject_id"], name: "index_notes_on_subject_type_and_subject_id"
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.bigint "resource_owner_id", null: false
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes", default: "", null: false
    t.string "resource_owner_type", null: false
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["resource_owner_id", "resource_owner_type"], name: "polymorphic_owner_oauth_access_grants"
    t.index ["resource_owner_id"], name: "index_oauth_access_grants_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.bigint "resource_owner_id"
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.string "resource_owner_type"
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id", "resource_owner_type"], name: "polymorphic_owner_oauth_access_tokens"
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "grant_flows", default: [], null: false, array: true
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "oauth_tokens", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.jsonb "credentials", default: {}
    t.jsonb "info", default: {}
    t.jsonb "extra", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "external_primary_uid"
    t.index ["external_primary_uid"], name: "index_oauth_tokens_on_external_primary_uid"
  end

  create_table "package_subscriptions", force: :cascade do |t|
    t.datetime "expiry", null: false
    t.string "package_name", null: false
    t.bigint "subscribable_id"
    t.string "subscribable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "subscription_data"
    t.string "subscription_type"
    t.datetime "deleted_at"
    t.string "status"
    t.string "type", default: "PackageSubscription"
    t.bigint "seat_id"
    t.index ["deleted_at"], name: "index_package_subscriptions_on_deleted_at"
    t.index ["seat_id"], name: "index_package_subscriptions_on_seat_id"
    t.index ["status"], name: "index_package_subscriptions_on_status"
    t.index ["subscribable_id", "subscribable_type"], name: "index_by_subscribable"
  end

  create_table "reseller_accounts", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "stripe_customer_id"
    t.string "session_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "credit", default: 0, null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "company_name", default: "", null: false
    t.string "enabled_stripe_prices", default: [], null: false, array: true
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.index ["email"], name: "index_reseller_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_reseller_accounts_on_reset_password_token", unique: true
    t.index ["stripe_customer_id"], name: "index_reseller_accounts_on_stripe_customer_id", unique: true
  end

  create_table "reseller_order_items", force: :cascade do |t|
    t.string "stripe_invoice_id"
    t.string "stripe_invoice_item_id", null: false
    t.json "stripe_data", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stripe_invoice_item_id"], name: "index_reseller_order_items_on_stripe_invoice_item_id", unique: true
  end

  create_table "reseller_orders", force: :cascade do |t|
    t.bigint "reseller_account_id", null: false
    t.string "stripe_invoice_id", null: false
    t.string "status", null: false
    t.json "stripe_data", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reseller_account_id"], name: "index_reseller_orders_on_reseller_account_id"
    t.index ["stripe_invoice_id"], name: "index_reseller_orders_on_stripe_invoice_id", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating", limit: 2
    t.bigint "transcription_session_id", null: false
    t.bigint "reviewer_id"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
    t.index ["transcription_session_id"], name: "index_reviews_on_transcription_session_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "package_name"
    t.bigint "license_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["license_id"], name: "index_seats_on_license_id"
  end

  create_table "secrets", force: :cascade do |t|
    t.string "user"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "source_permissions", force: :cascade do |t|
    t.string "url"
    t.string "action"
    t.bigint "institution_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_id"], name: "index_source_permissions_on_institution_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "match", null: false
    t.string "name", null: false
    t.text "logo"
  end

  create_table "sso_configurations", force: :cascade do |t|
    t.string "client_id", null: false
    t.string "client_secret", null: false
    t.string "provider", null: false
    t.text "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "uuid", null: false
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "talk_type_dictation_sessions", force: :cascade do |t|
    t.bigint "talk_type_user_id", null: false
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.index ["talk_type_user_id"], name: "index_talk_type_dictation_sessions_on_talk_type_user_id"
    t.index ["uuid"], name: "index_talk_type_dictation_sessions_on_uuid"
  end

  create_table "talk_type_users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "license_key"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "premium"
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.boolean "registered", default: false
    t.integer "session_count", default: 0
    t.integer "billing_usage", default: 0
    t.string "current_listener"
    t.string "license_type"
    t.index ["deleted_at"], name: "index_talk_type_users_on_deleted_at"
    t.index ["email"], name: "index_talk_type_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_talk_type_users_on_reset_password_token", unique: true
  end

  create_table "talk_type_versions", force: :cascade do |t|
    t.string "version_number"
    t.string "supported_os"
    t.string "os_min_version"
    t.string "os_max_version"
    t.string "supported_archs", array: true
    t.string "channels", array: true
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "task_type", null: false
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.bigint "author_id", null: false
    t.bigint "assignee_id", null: false
    t.string "subject_type", null: false
    t.bigint "subject_id", null: false
    t.date "due_date"
    t.datetime "completed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignee_id"], name: "index_tasks_on_assignee_id"
    t.index ["author_id"], name: "index_tasks_on_author_id"
    t.index ["owner_type", "owner_id"], name: "index_tasks_on_owner_type_and_owner_id"
    t.index ["subject_type", "subject_id"], name: "index_tasks_on_subject_type_and_subject_id"
    t.index ["task_type"], name: "index_tasks_on_task_type"
  end

  create_table "transcript_editor_changes", force: :cascade do |t|
    t.bigint "transcript_result_id", null: false
    t.uuid "group_id"
    t.integer "sort_key"
    t.string "lhs"
    t.string "rhs"
    t.string "kind", limit: 1
    t.string "path", array: true
    t.bigint "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_transcript_editor_changes_on_author_id"
    t.index ["group_id"], name: "index_transcript_editor_changes_on_group_id"
    t.index ["transcript_result_id"], name: "index_transcript_editor_changes_on_transcript_result_id"
  end

  create_table "transcript_results", force: :cascade do |t|
    t.integer "transcription_id"
    t.jsonb "result"
    t.json "short_summary"
    t.json "long_summary"
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
  end

  create_table "transcription_session_participants", force: :cascade do |t|
    t.integer "transcription_session_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transcription_session_id", "user_id"], name: "transcription_session_participants_unique", unique: true
  end

  create_table "transcription_sessions", force: :cascade do |t|
    t.string "source_url"
    t.integer "user_id"
    t.integer "duration"
    t.datetime "start_time"
    t.datetime "stop_time"
    t.string "media_urls", array: true
    t.integer "transcription_id"
    t.integer "language_id"
    t.string "transcription_type"
    t.string "product"
    t.datetime "deleted_at"
    t.string "title"
    t.json "cookies"
    t.jsonb "page_content"
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "transcription_source"
    t.integer "billing_duration"
    t.string "external_id_source"
    t.string "external_id_value"
    t.string "client_version"
    t.string "media_sources", default: [], array: true
    t.bigint "credit_id"
    t.index ["credit_id"], name: "index_transcription_sessions_on_credit_id"
    t.index ["deleted_at"], name: "index_transcription_sessions_on_deleted_at"
    t.index ["duration"], name: "index_transcription_sessions_on_duration"
    t.index ["uuid"], name: "index_transcription_sessions_on_uuid", unique: true
  end

  create_table "transcription_transitions", force: :cascade do |t|
    t.string "to_state", null: false
    t.json "metadata", default: {}
    t.integer "sort_key", null: false
    t.integer "transcription_id", null: false
    t.boolean "most_recent", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transcription_id", "most_recent"], name: "index_transcription_transitions_parent_most_recent", unique: true, where: "most_recent"
    t.index ["transcription_id", "sort_key"], name: "index_transcription_transitions_parent_sort", unique: true
  end

  create_table "transcriptions", force: :cascade do |t|
    t.string "url"
    t.boolean "downloaded"
    t.boolean "transcribed"
    t.integer "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "file_name"
    t.integer "duration"
    t.string "title"
    t.string "transcript_editor_snapshot_file_name"
    t.string "google_stt_result_file_name"
    t.float "average_confidence"
    t.string "authenticated_url"
    t.bigint "media_id"
    t.string "video_id"
    t.uuid "uuid", null: false
    t.string "mp3_file_name"
    t.boolean "tmp_google_stt_result_file_missing"
    t.string "source_type"
    t.string "initial_audio_representation_format", default: "words"
    t.index ["media_id"], name: "index_transcriptions_on_media_id"
    t.index ["tmp_google_stt_result_file_missing"], name: "index_transcriptions_on_tmp_google_stt_result_file_missing"
  end

  create_table "uploads", force: :cascade do |t|
    t.uuid "uuid", null: false
    t.string "content_type", null: false
    t.string "original_file_name"
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_type", "owner_id"], name: "index_uploads_on_owner_type_and_owner_id"
    t.index ["uuid"], name: "index_uploads_on_uuid"
  end

  create_table "url_meta_data", force: :cascade do |t|
    t.string "url", null: false
    t.uuid "uuid", null: false
    t.string "title"
    t.text "description"
    t.string "image"
    t.string "author"
    t.string "favicon"
    t.boolean "successful", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["url"], name: "index_url_meta_data_on_url"
  end

  create_table "user_apps", force: :cascade do |t|
    t.integer "user_id"
    t.integer "app_id"
    t.string "link"
    t.index ["user_id", "app_id"], name: "index_user_app_pair_uniqueness", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total_usage", default: 0
    t.string "first_name"
    t.string "last_name"
    t.string "university_name"
    t.string "course_name"
    t.integer "graduation_year"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "admin"
    t.string "customer_id"
    t.boolean "auto_refill", default: true
    t.bigint "reseller_account_id"
    t.bigint "institution_id"
    t.integer "role", default: 0
    t.boolean "missing_active_cc", default: false, null: false
    t.integer "usage_cap"
    t.integer "registration_settings", default: 0, null: false
    t.string "provider"
    t.string "uid"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "last_sign_in_at"
    t.datetime "current_sign_in_at"
    t.datetime "deleted_at"
    t.string "phone"
    t.boolean "opt_in_to_marketing", default: false, null: false
    t.string "auto_refill_plan"
    t.string "registration_status", default: "registered", null: false
    t.string "registration_token"
    t.integer "authy_id"
    t.integer "phone_country_code", limit: 2
    t.datetime "phone_verified_at"
    t.string "phone_verification_session_token"
    t.json "registration_meta"
    t.string "application_access_token", null: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.boolean "demo", default: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "package"
    t.boolean "enable_mfa", default: false, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["institution_id"], name: "index_users_on_institution_id"
    t.index ["phone_verification_session_token"], name: "index_users_on_phone_verification_session_token", unique: true
    t.index ["registration_status"], name: "index_users_on_registration_status"
    t.index ["registration_token"], name: "index_users_on_registration_token", unique: true
    t.index ["reseller_account_id"], name: "index_users_on_reseller_account_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  create_table "zoom_meetings", force: :cascade do |t|
    t.json "event", null: false
    t.bigint "transcription_session_id", null: false
    t.index ["transcription_session_id"], name: "index_zoom_meetings_on_transcription_session_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "charges", "users"
  add_foreign_key "credit_cards", "users"
  add_foreign_key "credits", "package_subscriptions"
  add_foreign_key "features", "package_subscriptions"
  add_foreign_key "institutions", "sso_configurations"
  add_foreign_key "license_keys", "credits"
  add_foreign_key "license_keys", "reseller_order_items"
  add_foreign_key "license_keys", "users"
  add_foreign_key "licenses", "institutions"
  add_foreign_key "note_attachments", "note_entries"
  add_foreign_key "note_attachments", "uploads"
  add_foreign_key "note_document_attachments", "note_documents"
  add_foreign_key "note_document_attachments", "uploads"
  add_foreign_key "note_documents", "transcriptions"
  add_foreign_key "note_documents", "users", column: "owner_id"
  add_foreign_key "note_entries", "note_documents"
  add_foreign_key "note_entries", "users", column: "author_id"
  add_foreign_key "notes", "users", column: "author_id"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "package_subscriptions", "seats"
  add_foreign_key "reseller_orders", "reseller_accounts"
  add_foreign_key "reviews", "transcription_sessions"
  add_foreign_key "reviews", "users", column: "reviewer_id"
  add_foreign_key "roles", "users"
  add_foreign_key "seats", "licenses"
  add_foreign_key "source_permissions", "institutions"
  add_foreign_key "taggings", "tags"
  add_foreign_key "talk_type_dictation_sessions", "talk_type_users"
  add_foreign_key "tasks", "users", column: "assignee_id"
  add_foreign_key "tasks", "users", column: "author_id"
  add_foreign_key "transcript_editor_changes", "transcript_results"
  add_foreign_key "transcript_editor_changes", "users", column: "author_id"
  add_foreign_key "transcription_sessions", "credits"
  add_foreign_key "transcription_transitions", "transcriptions"
  add_foreign_key "users", "institutions"
  add_foreign_key "users", "reseller_accounts"
  add_foreign_key "zoom_meetings", "transcription_sessions"
end
