

```
/opt/adguardhome/work # cat /opt/adguardhome/conf/AdGuardHome.yaml

bind_host: 0.0.0.0
bind_port: 3000
users: []
auth_attempts: 5
block_auth_min: 15
http_proxy: ""
language: en
theme: auto
debug_pprof: false
web_session_ttl: 720
dns:
  bind_hosts:
    - 0.0.0.0
  port: 53
  anonymize_client_ip: false
  protection_enabled: true
  blocking_mode: default
  blocking_ipv4: ""
  blocking_ipv6: ""
  blocked_response_ttl: 10
  parental_block_host: family-block.dns.adguard.com
  safebrowsing_block_host: standard-block.dns.adguard.com
  ratelimit: 0
  ratelimit_whitelist: []
  refuse_any: true
  upstream_dns:
    - https://dns10.quad9.net/dns-query
  upstream_dns_file: ""
  bootstrap_dns:
    - 9.9.9.10
    - 149.112.112.10
    - 2620:fe::10
    - 2620:fe::fe:10
  all_servers: false
  fastest_addr: false
  fastest_timeout: 1s
  allowed_clients: []
  disallowed_clients: []
  blocked_hosts:
    - version.bind
    - id.server
    - hostname.bind
  trusted_proxies:
    - 127.0.0.0/8
    - ::1/128
  cache_size: 4194304
  cache_ttl_min: 0
  cache_ttl_max: 300
  cache_optimistic: false
  bogus_nxdomain: []
  aaaa_disabled: false
  enable_dnssec: false
  edns_client_subnet:
    custom_ip: ""
    enabled: false
    use_custom: false
  max_goroutines: 300
  handle_ddr: true
  ipset: []
  ipset_file: ""
  filtering_enabled: true
  filters_update_interval: 24
  parental_enabled: false
  safesearch_enabled: false
  safebrowsing_enabled: false
  safebrowsing_cache_size: 1048576
  safesearch_cache_size: 1048576
  parental_cache_size: 1048576
  cache_time: 30
  rewrites:
    - domain: git.apealive.net
      answer: 172.31.5.32
    - domain: syncthing.apealive.net
      answer: 172.31.2.35
    - domain: sync.apealive.net
      answer: 172.31.2.35
    - domain: '*.apealive.net'
      answer: 172.31.2.50
  blocked_services:
    - ok
    - mail_ru
    - kakaotalk
    - gog
    - minecraft
    - qq
    - roblox
    - weibo
    - vk
    - tiktok
    - snapchat
    - tinder
    - wechat
    - viber
    - onlyfans
  upstream_timeout: 10s
  private_networks: []
  use_private_ptr_resolvers: true
  local_ptr_upstreams: []
  use_dns64: false
  dns64_prefixes: []
  serve_http3: false
  use_http3_upstreams: false
tls:
  enabled: false
  server_name: ""
  force_https: false
  port_https: 443
  port_dns_over_tls: 853
  port_dns_over_quic: 784
  port_dnscrypt: 0
  dnscrypt_config_file: ""
  allow_unencrypted_doh: false
  certificate_chain: ""
  private_key: ""
  certificate_path: ""
  private_key_path: ""
  strict_sni_check: false
querylog:
  enabled: true
  file_enabled: true
  interval: 2160h
  size_memory: 1000
  ignored: []
statistics:
  enabled: true
  interval: 30
  ignored: []
filters:
  - enabled: true
    url: https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
    name: AdGuard DNS filter
    id: 1
  - enabled: false
    url: https://adaway.org/hosts.txt
    name: AdAway
    id: 2
  - enabled: false
    url: https://www.malwaredomainlist.com/hostslist/hosts.txt
    name: MalwareDomainList.com Hosts List
    id: 4
  - enabled: true
    url: https://raw.githubusercontent.com/Spam404/lists/master/main-blacklist.txt
    name: Spam404
    id: 1657065766
  - enabled: true
    url: https://raw.githubusercontent.com/mitchellkrogza/The-Big-List-of-Hacked-Malware-Web-Sites/master/hosts
    name: The Big List of Hacked Malware Web Sites
    id: 1657065768
whitelist_filters:
  - enabled: true
    url: https://cdn.exponea.com
    name: respekt
    id: 1645574416
user_rules:
  - '# ALLOW'
  - '@@||https://cdn.exponea.com^'
  - '@@||contactmonkey.com^'
  - '@@||contactmonkey.com^'
  - '@||contactmonkey.com^'
  - '## ALLOW youtube music for anyone'
  - '@@||/.*music.youtube.com^/'
  - '@@||music.youtube.com^'
  - '@@||/.*youtube.*/.l.google.com^'
  - '# BLOCK GAMES'
  - '||/.*minecraft.*/'
  - '||/.*roblox.*/'
  - '||/.*desura.*/'
  - '||/.*brawl.*/'
  - '||/.*supercell.*/'
  - '||supercell.com^'
  - '||/.*hypixel.*/^'
  - '||hypixel.net^'
  - '# BLOCK YOUTUBE (except rodice)'
  - '||/.*googlevideo.com/$client=~rodice|deti'
  - '||youtube.com^$client=~rodice|deti'
  - '||/.*ytimg.*/^$client=~rodice|deti'
  - '||/.*yt.*/.l.google.com^$client=~rodice|deti'
dhcp:
  enabled: false
  interface_name: ""
  local_domain_name: lan
  dhcpv4:
    gateway_ip: ""
    subnet_mask: ""
    range_start: ""
    range_end: ""
    lease_duration: 86400
    icmp_timeout_msec: 1000
    options: []
  dhcpv6:
    range_start: ""
    lease_duration: 86400
    ra_slaac_only: false
    ra_allow_slaac: false
clients:
  runtime_sources:
    whois: true
    arp: true
    rdns: true
    dhcp: true
    hosts: true
  persistent:
    - name: kids
      tags:
        - device_pc
        - device_phone
        - device_tablet
      ids:
        - 90:fb:a6:79:98:07
        - 2e:16:31:5a:d9:d0
        - a8:20:66:24:0d:86
        - 172.31.5.130
        - 172.31.5.167
        - 172.31.5.105
        - 64:11:a4:7d:be:d1
        - 172.31.5.194
        - 50:8e:49:00:d4:2a
        - 172.31.5.131
        - a8:9c:ed:a9:99:9e
        - 172.31.5.133
        - 172.31.5.194
        - a8:20:66:24:0d:86
        - 172.31.5.190
        - 20:c9:d0:96:c6:6f
      blocked_services:
        - epic_games
        - mail_ru
        - 9gag
        - dailymotion
        - ebay
        - hulu
        - imgur
        - ok
        - origin
        - qq
        - snapchat
        - tiktok
        - tinder
        - twitch
        - viber
        - vk
        - wechat
        - weibo
        - youtube
        - minecraft
        - onlyfans
        - kakaotalk
        - line
        - zhihu
        - roblox
        - douban
        - iqiyi
      upstreams: []
      use_global_settings: false
      filtering_enabled: true
      parental_enabled: true
      safesearch_enabled: true
      safebrowsing_enabled: true
      use_global_blocked_services: false
    - name: rodice
      tags: []
      ids:
        - 172.31.2.225/27
        - 172.31.5.225/27
      blocked_services: []
      upstreams: []
      use_global_settings: true
      filtering_enabled: false
      parental_enabled: false
      safesearch_enabled: false
      safebrowsing_enabled: false
      use_global_blocked_services: true
log_file: ""
log_max_backups: 0
log_max_size: 100
log_max_age: 3
log_compress: false
log_localtime: false
verbose: false
os:
  group: ""
  user: ""
  rlimit_nofile: 0
schema_version: 17
```
