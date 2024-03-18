

```
/etc/sysctl.conf <<EOF
fs.inotify.max_user_instances=1024
fs.inotify.max_user_watches=1048576
EOF

sysctl --system
```
