
Kustomization file is encrypted as I was not able to remove postgre password from it (fails to pass init containers)


k exec -ti -n gitops sts/gitea-postgresql -- /bin/bash
cd /opt/bitnami/postgresql/conf

psql -U postgres
psql -h 127.0.0.1 -U postgres
ALTER USER postgres with password '**REDACTED**';

psql -U gitea
ALTER USER gitea with password 'my_secure_password';


## DR

Doc:
* https://docs.gitea.com/administration/backup-and-restore

Backup:
```sh
k exec -ti -n gitops gitea-0 -c gitea -- bash
su git
mkdir /tmp/bkp
gitea dump -c /data/gitea/conf/app.ini
exit 0

mkdir .backups
kubectl cp gitops/gitea-0:/tmp/bkp/gitea-dump-1735657501.zip .backups/gitea-dump-1735657501.zip
```
