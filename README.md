# Terraform: Aurora MySQL with SSH Tunnel

This directory contains code to deploy an Aurora MySQL cluster and an SSH tunnel. This is to simulate a
pseudo-production environment. We set a cluster parameter group with row-based binary logging on the
Aurora MySQL instance in order to test row-base replication.

This is not meant for production use, just for testing with Aurora MySQL through an SSH tunnel.

## Features

The terraform will:

1. Create new Aurora MySQL instance with one writer and reader.
2. Create a Bastion host SSH tunnel for connecting to the cluster.
3. Output cluster and bastion endpoints and login details.

Once created, you'll need to download the EC2 key pair so you can use the PEM file
to access the SSH tunnel. To connect to the database through the SSH tunnel, run the following command with your
corresponding variables:
```shell script
ssh -N -L {localPort}:{rdsHost}:{remotePort} {user}@{remoteHost} -i {~/path/to/key}
```

*Note*: localPort can be any non-used port you set (I use 3307); {user} for AWS is 'ec2-user'.

_Example_:
```shell script
ssh -N -L 3307:cluster-sample.some_cluster24346.us-east-2.rds.amazonaws.com:3306 ec2-user@ec2-55-555-555-555.us-east-2.compute.amazonaws.com -i ~/Downloads/my_key.pem
```