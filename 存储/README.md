目标: ceph集群应用在数据库存储领域



解决思路:

ceph ssd 和 hdd 分离

ceph rbd 优化

​	块大小和数据库块大小保持一致







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

安装vmware

安装vagrant

安装系统

安装k8s

安装ceph

添加hdd盘

添加ssd盘





# 优化

存储网络分离出主干网络