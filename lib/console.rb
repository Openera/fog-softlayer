require File.expand_path('../fog/softlayer', __FILE__)

CONN = Fog::Storage.new(provider: "softlayer", 
  softlayer_username: ENV['SOFTLAYER_USERNAME'], 
  softlayer_api_key: ENV['SOFTLAYER_API_KEY'], 
  softlayer_cluster: ENV['CLUSTER_ID'])
