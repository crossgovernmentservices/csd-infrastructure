===================
 CSD Infrastructure
===================

Terraform templates to create and manage non-project/product specific
infrastructure. Currently only DNS zones are used.

Requirements
============

- `Terraform <https://www.terraform.io>`_

  Install on OSX with:

  .. code:: shell

    $ brew install terraform

- `BlackBox`_

- AWS account credentials

  Place in ``~/.aws/credentials``:

  .. code:: ini

     [default]
     aws_access_key_id = ACCESS_KEY
     aws_secret_access_key = SECRET_KEY

Usage
=====

Variables
---------

Variables are stored in the GPG encrypted and `BlackBox`_-managed ``terraform.tfvars``.

Shared state
------------

Terraform's remote state storage is used to store Terraform state in Amazon S3, keeping changes in sync between different users.


Applying changes
----------------

Decrypt secrets::

  $ blackbox_edit_start terraform.tfvars

or to decrypt all BlackBox-managed files::

  $ blackbox_postdeploy


Configure remote storage::

  $ terraform remote config
      -backend=s3 -backend-config="bucket=csd-terraform" \
      -backend-config="key=terraform.tfstate" -backend-config="region=eu-west-1"

Sync local state with remote::

  $ terraform remote pull

To see changes to be made (if any)::

  $ terraform plan

To create or update infrastructure::

  $ terraform apply

To delete resources::

  $ terraform destroy


Jenkins
-------

``jenkins.sh`` wraps the above ``terraform`` calls, and is used by the Jenkins CI
server to automatically apply changes.


Usage::

  ./jenkins.sh


.. _BlackBox: https://github.com/StackExchange/blackbox
