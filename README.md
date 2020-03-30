## Description

Delete a file or directory in each k8s node by DaemonSet

## Example

to delete the directory: `/root/parentDir/dirToDelete` :

```
apiVersion: extensions/v1beta1
kind: DaemonSet
metadata:
  name: clear-dir
spec:
  selector:
    matchLabels:
      app: clear-dir
  template:
    metadata:
      labels:
        app: clear-dir
    spec:
      containers:
      - image: gejunqiang/paused:latest
        imagePullPolicy: Always
        name: paused
        resources:
          limits:
            cpu: 50m
            memory: 100Mi
      initContainers:
      - image: gejunqiang/clear-dir:latest
        imagePullPolicy: Always
        name: cleaner
        command:
        - clear-dir
        - /parent-dir/dirToDelete
        volumeMounts:
        - mountPath: /parent-dir
          name: parent-dir
      tolerations: # include master node
      - effect: NoSchedule
        key: node-role.kubernetes.io/master
      volumes:
      - hostPath:
          path: /root/parentDir
        name: parent-dir
```
