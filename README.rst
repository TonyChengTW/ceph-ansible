# ceph-ansible
============
## Installation Ceph Cluster:
The Ceph playbook is independence from the openstack playbook, you can download it from:
https://github.com/TonyChengTW/ceph-ansible

I've fixed some of the original Ceph playbook bugs , you can refer it from:
- https://github.com/TonyChengTW/ceph-ansible/commit/e3aa3abdee8131ac825416796441a696b3f45bdd
- https://github.com/TonyChengTW/ceph-ansible/commit/9b1ec8754544bc86db00f0d8cda612c56d9d6d7c

You can refer Ceph ansible readme installation guide:
https://github.com/TonyChengTW/ceph-ansible/blob/master/README.rst

Or just a quick start:
Using the same virtualenv to run Ceph ansible-playbook
```
# cd /deploy_u18
# git clone https://github.com/TonyChengTW/ceph-ansible.git
# cd ceph-ansible
# ansible-playbook -i inventory-hosts site.yml
```
The main Ceph configuration files are located in:
- ceph-ansible/group_vars/all.yml
- ceph-ansible/group_vars/osds.yml
- inventory-hosts

- `all.yml` defines every required options such as cluster name , repo source , cephx , config key path ...etc.
- `osds.yml` defines each osds device name when nodes have the same number of disks for osds
- `inventory-hosts` defines mon,osd,mgrs,clients nodes. Also different osd devices for different nodes.

For example:
```
[osds]
ceph-ctrl1 devices="['/dev/sdb']"
ceph-comp1 devices="['/dev/sdb', '/dev/sdc']"
ceph-comp2 devices="['/dev/sdb', '/dev/sdc']"
```

Once ansible-playbook excutes correctly , the next step should return to openstack ansible playbook (cd /deploy_u18/openstack-ansible/lab_staging).
Then continue to run :
`lab_staging/012_recover_hostname.yml` , and so on...


## Add OSDs

1. Modify 'inventory-hosts' file:
add inventory hosts info at the top of line (for [all]) and add each of the inventory host name and devices in [osds]

2. Also modify 'inventory-hosts' file:
edit a osd node which is not in [mons] at [keyring_copy]

3. execute ansible-playbook:
```#ansible-playbook -i inventory-hosts --limit comp3-localdisk infrastructure-playbooks/add-osd.yml``` 

## License

MIT / BSD

## Author Information
104 Job Bank Corp.
[tony.cheng@104.com.tw](mailto:tony.cheng@104.com.tw)
