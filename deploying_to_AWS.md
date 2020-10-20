# AWS EC2

Working with an instance from its creation to a full-fledged working application. Phusionpassenger [guide](https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/aws/nginx/oss/launch_server.html).

1. Create instance with ubuntu (Free tier eligible)
2. Generate PEW key to connecting to them
3. Download this key
4. Change file access using `chmod`

```bash
chmod 600 ~/Downloads/pemfile.pem
```

5. Import it into your SSH store

```bash
ssh-add /path/to/pemfile.pem
```

Connect to your instance

```bash
ssh ubuntu@ip.address
#or
ssh -i default.pew ubuntu@ip.address
```

6. Install rvm, ruby, nginx, nodejs, redis

```bash
sudo apt-get install software-properties-common
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm
echo `source "/etc/profile.d/rvm.sh"` >> ~/.bashrc
rvm install ruby-2.5.5

sudo apt-get update
sudo apt-get install -y nginx
sudo service nginx restart

sudo apt install redis-server
sudo systemctl status redis # testing redis-server

# fix rvm/bin path
echo $rvm_bin_path
mkdir ~/.rvm/bin
ln -s /usr/share/rvm/bin/rvm .rvm/bin/rvm
```

### Create AWS S3 Bitbucket

Create new bitbucket in your AWS Simple Storage Service
Create access to this services

region and bucket name you can find in  S3 -> Buckets -> Name of new bucket -> Access point
Change file storage.yml to:
```yml
# Use rails credentials:edit to set the AWS secrets (as aws:access_key_id|secret_access_key)
amazon:
  service: S3
  access_key_id: <%= Rails.application.credentials.aws[:bucket_access_key_id] %>
  secret_access_key: <%= Rails.application.credentials.aws[:bucket_secret_access_key]  %>
  region: 'us-east-2'
  bucket: 'projector-kv065'
```

Go to Permissions -> CORS configuration and past

```xml
<?xml version="1.0" encoding="UTF-8"?>
<CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
<CORSRule>
    <AllowedOrigin>http://3.129.9.9</AllowedOrigin>
    <AllowedMethod>GET</AllowedMethod>
    <AllowedMethod>POST</AllowedMethod>
    <AllowedMethod>PUT</AllowedMethod>
    <AllowedHeader>*</AllowedHeader>
</CORSRule>
</CORSConfiguration>
```

### Create AWS SES

Create new Simple Email Service
Create new access key to enable access

### Run capistrano

```bash
cap production deploy
```

### Reboot Ubuntu

```bash
sudo reboot
# or
/sbin/reboot
```

### Test or reboot Passenger

```bash
passenger-status
sudo passenger-status --show=requests
sudo passenger-config restart-app
# error messages if start doesn't work is in folder tmp
```

Passenger write all requests and errors in the file **production.log**

```bash
tail -f /var/www/yourappname/current/log/staging.log
```

### Edit Nginx configuration file

```bash
cd /etc/nginx/sites-enabled/
sudo vim projector.conf
# put this inside the file:
server {
    listen 80;
    #listen [::]:80 3.129.9.9;
    server_name default_server;
    #listen 80 default_server;
    #listen [::]:80 default_server;

    # Tell Nginx and Passenger where your app's 'public' directory is
    root /home/ubuntu/deploy/projector/production/current;

    # Turn on Passenger
    passenger_enabled on;
    passenger_ruby /home/ubuntu/.rvm/gems/ruby-2.5.5/wrappers/ruby;
}

# copy settings
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# Then restart Nginx
sudo service nginx restart
```

### Create folders for capistrano

```bash
mkdir /home/ubuntu/projector/deploy/production
cd /home/ubuntu/projector/deploy/production
mkdir shared releases

```

### Copying master.key and database.yml files manually

```bash
scp ~/Documents/projector/config/master.key ubuntu@3.129.9.9:/deploy/projector/production/shared/config

scp ~/Documents/projector/config/database.yml ubuntu@3.129.9.9:/deploy/projector/production/shared/config
```

### Handle Sidekiq error

Sidekiq write log in the file

```bahs
tail -f /var/www/yourappname/current/log/sidekiq.log
```
