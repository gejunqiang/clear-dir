## Description

Delete a file or directory in each k8s node by DaemonSet

## Example

```
apiVersion: extensions/v1beta1
kind: DaemonSet
metadata:
  name: clear-dir
  namespace: kube-system
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
        name: paused
        resources:
          limits:
            cpu: 50m
            memory: 100Mi
      initContainers:
      - image: gejunqiang/clear-dir:latest
        name: cleaner
        command:
        - clear-dir
        - <dirOrFileToDelete>
        volumeMounts:
        - mountPath: /parent-dir
          name: parent-dir
      tolerations:
      - effect: NoSchedule
        key: node-role.kubernetes.io/master
      volumes:
      - hostPath:
          path: <theParentDirOfDirOrFileToDelete>
        name: parent-dir
```
