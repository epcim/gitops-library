

Docs:
* https://velero.io/docs/v1.15/file-system-backup/
* https://velero.io/docs/v1.15/supported-providers/
* https://github.com/vmware-tanzu/helm-charts/blob/main/charts/velero/values.yaml
* https://github.com/vmware-tanzu/velero-plugin-for-aws/blob/main/README.md
* http://172.31.2.12:9001/buckets

* https://medium.com/linux-shots/backup-kubernetes-using-velero-and-csi-volume-snapshot-4155d4e32e5d
* https://github.com/vmware-tanzu/velero-plugin-for-csi
* https://longhorn.io/docs/archives/1.3.0/snapshots-and-backups/csi-snapshot-support/enable-csi-snapshot-support/

* https://microk8s.io/docs/velero


## Mikrok8s

Velero uses Restic for backing up Kubernetes volumes. To let Restic know of the kubelet directory in the MicroK8s context we need to patch its daemonset manifest:
```
sudo microk8s kubectl -n velero patch daemonset.apps/restic --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/volumes/0/hostPath/path", "value":"/var/snap/microk8s/common/var/lib/kubelet/pods"}]'
# or since 2024 renamed to node-agent
sudo microk8s kubectl -n velero patch daemonset.apps/node-agent --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/volumes/0/hostPath/path", "value":"/var/snap/microk8s/common/var/lib/kubelet/pods"}]'

```

## Minio

Docs:
* https://yarboroughtechnologies.com/how-to-install-minio-on-synology-docker/
* https://www.jonaharagon.com/posts/installing-minio-on-synology-diskstation/

Minimal policy:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::your-bucket-name/*",
        "arn:aws:s3:::your-bucket-name"
      ]
    }
  ]
}
```


Better (remove ec2 if applying to MinIO):
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeVolumes",
                "ec2:DescribeSnapshots",
                "ec2:CreateTags",
                "ec2:CreateVolume",
                "ec2:CreateSnapshot",
                "ec2:DeleteSnapshot"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:PutObject",
                "s3:PutObjectTagging",
                "s3:AbortMultipartUpload",
                "s3:ListMultipartUploadParts"
            ],
            "Resource": [
                "arn:aws:s3:::velero/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::velero"
            ]
        }
    ]
}
```
