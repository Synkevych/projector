# AWS EC2

Working with an instance from its creation to a full-fledged working application

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

6. Install rvm, ruby, nginx, nodejs

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

```

### Create Bitbucket

Create new bitbucket in your AWS Simple Storage Service
Create access to this services

### Create AWS SES

Create new Simple Email Service
Create new access key to enable access

### Run cap

```bash
cap production deploy
```
