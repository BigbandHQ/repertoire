apt-get update

mkdir -p {{ params.root }}

echo "{{ files.index }}" > {{ params.root }}/index.html

echo "{{ files.conf }}" > /etc/nginx/sites-available/{{ params.server_name }}

ln -s /etc/nginx/sites-available/{{ params.server_name }} /etc/nginx/sites-enabled/

rm /etc/nginx/sites-enabled/default
