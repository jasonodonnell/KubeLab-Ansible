# Kubernetes Deployment

Built on:

* Ansible 2.4
* Vagrant 2.0.3

This deployment requires `vagrant-hostmanager` plugin:

```bash
$ vagrant plugin install vagrant-hostmanager
```

## Deploy

```bash
$ vagrant up
$ ansible-playbook -i inventory kube.yml
```

## Post Deployment

```bash
$ vagrant ssh kube1
$ kubectl get nodes
$ kubectl get sc
```
