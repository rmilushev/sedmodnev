require 'refile-s3'

aws = {
  access_key_id: ENV['ACCESS_KEY_ID_AMZ'],
  secret_access_key: ENV['SECRET_ACCESS_KEY_AMZ'],
  region: ENV['S3_REGION'],
  bucket: ENV['S3_BUCKET_NAME'],
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)

Refile.cdn_host = ENV['CLOUDFRONT_ENDPOINT']
# Refile.secret_key = ENV['REFILE_KEY']
