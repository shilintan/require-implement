目标: ceph集群应用在数据库存储领域



解决思路:

ceph ssd 和 hdd 分离

ceph rbd 优化

​	ceph文件块大小和数据库块大小保持一致







在一个集群里面装2套ceph

​	端口会冲突?

​	





创建hdd磁盘的池

```
apiVersion: ceph.rook.io/v1
kind: CephBlockPool
metadata:
  name: ecpool
  namespace: rook-ceph
spec:
  failureDomain: osd
  erasureCoded:
    dataChunks: 2
    codingChunks: 1
  deviceClass: hdd
```





# 实验

安装virtualbox (VirtualBox-7.0.10-158379-Win.exe)

安装vagrant

安装系统

​	运行 `lantern`, 指令运行前配置代理

```
$env:HTTP_PROXY="http://127.0.0.1:51134"
$env:HTTPS_PROXY="http://127.0.0.1:51134"
```

​	手动在virtualbox界面添加ssd磁盘

​		添加 `控制器: NVMe`

​			添加 虚拟硬盘

安装k8s

安装ceph

添加hdd盘

添加ssd盘





# 优化

存储网络分离出主干网络



# 问题

vmware 不支持vagrant disk nvme

virtualbox 的sync folder有问题, vmware 的sync folder 第二次也有问题, 手动设置应该还好