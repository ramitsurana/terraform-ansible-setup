resource "google_storage_bucket" "image-store" {
  name     = "store-bucket"
  location = "US"

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

#Not Working Due to Change in method of ACL policies in gcp bucket
#Ref: https://cloud.google.com/storage/docs/access-control/iam?hl=en_US#project-level_roles_vs_bucket-level_roles
#resource "google_storage_bucket_object" "picture" {
#  name   = "gcp-sample-image"
#  source = "/home/ramit/image.png"
#  bucket = "image-store"
#}

