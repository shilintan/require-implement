```shell
sysctl -w kernel.hostname=$(hostname -I|awk '{print $1}')
```

为了兼容电脑网络环境不好的改动
```shell
cp /local_file/sealos/sealos_4.3.0_linux_amd64.tar.gz ~/sealos_4.3.0_linux_amd64.tar.gz
tar -zxvf sealos_4.3.0_linux_amd64.tar.gz sealos &&  chmod +x sealos && mv sealos /usr/bin
```

```shell
yum -y install wget
wget  https://github.com/labring/sealos/releases/download/v4.3.0/sealos_4.3.0_linux_arm64.tar.gz  && \
    tar -zxvf sealos_4.3.0_linux_amd64.tar.gz sealos &&  chmod +x sealos && mv sealos /usr/bin

sealos run labring/kubernetes:v1.25.0 labring/helm:v3.8.2 labring/calico:v3.24.1
kubectl taint node --all node-role.kubernetes.io/control-plane-
kubectl taint nodes --all node-role.kubernetes.io/master:NoSchedule-
kubectl taint nodes --all node.kubernetes.io/unreachable:NoSchedule-
#sealos run labring/openebs:v1.9.0
#sealos run labring/ingress-nginx:4.1.0
```

verify
```shell
kubectl get nodes
#kubectl -n ingress-nginx get pod
#kubectl -n ingress-nginx logs -f --tail 300 ingress-nginx-admission-create-fq5gd
```

导出离线包
```shell
sealos pull labring/kubernetes:v1.25.0
sealos pull labring/helm:v3.8.2
sealos pull labring/calico:v3.24.1
cd /local_file/sealos/
sealos save -o kubernetes-v1.25.0.tar labring/kubernetes:v1.25.0
sealos save -o helm-v3.8.2.tar labring/helm:v3.8.2
sealos save -o calico-v3.24.1.tar labring/calico:v3.24.1
```

导入离线包
```shell
cd /local_file/sealos/
sealos load -i kubernetes-v1.25.0.tar
sealos load -i helm-v3.8.2.tar
sealos load -i calico-v3.24.1.tar
sealos images
sealos run kuberentes:v1.25.0
sealos run helm:v3.8.2
sealos run calico:v3.24.1
```