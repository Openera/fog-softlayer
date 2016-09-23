require 'pp'
require File.expand_path('../fog/softlayer', __FILE__)

CONN = Fog::Storage.new(provider: "softlayer", 
  softlayer_username: ENV['SOFTLAYER_USERNAME'], 
  softlayer_api_key: ENV['SOFTLAYER_API_KEY'], 
  softlayer_cluster: ENV['CLUSTER_ID'])

DIR = CONN.directories.get(ENV['STORAGE_BUCKET']) if ENV['STORAGE_BUCKET']

# Abstraction Layer example
# key = DIR.files.head('bar_20162_gat-1474560858.pdf')           # read metadata without loading file
# file = DIR.files.detect { |f| f.key == '10Gb-1473949893.txt' } # find a file without loading its content
#
# Low level queries
# CONN.update_object_metadata('masv-test', 'bar_20162_gat-1474560858.pdf', { 'author-id' => SecureRandom.uuid })