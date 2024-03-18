

## Vlan & Multicast

WIFI
- Multicast Enhancement: ON
- Multicast and Broadcast Control: OFF
- IGMP Snooping: OFF

NETWORKS
- IGMP Snooping: OFF



## Recovery

After and pvc longhorn restore, re-own the filesystem:
```
cd /usr/lib/unifi
chown unifi.unifi -R .

cd /unifi
chown unifi.unifi -R .
```
