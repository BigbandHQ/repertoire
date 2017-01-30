apt-get update

mkdir -p /var/www/{{ params.server_name }}/public_html

echo "{{ files.index }}" > {{ params.document_root }}/index.html

echo "{{ files.conf }}" > /etc/apache2/sites-available/{{ params.server_name }}.conf

a2ensite {{ params.server_name }}.conf
