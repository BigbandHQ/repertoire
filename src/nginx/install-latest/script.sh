apt-get update

apt-get install -y software-properties-common

add-apt-repository -y ppa:nginx/development

apt-get update

apt-get install -y nginx

sed -i "s/user www-data;/user {{ params.user }};/" /etc/nginx/nginx.conf
sed -i "s/# server_names_hash_bucket_size.*/server_names_hash_bucket_size {{ params.server_names_hash_bucket_size }};/" /etc/nginx/nginx.conf

sed -i "s/worker_processes.*/worker_processes {{ params.worker_processes }};/" /etc/nginx/nginx.conf
sed -i "s/# multi_accept.*/multi_accept {{ params.multi_accept }};/" /etc/nginx/nginx.conf
