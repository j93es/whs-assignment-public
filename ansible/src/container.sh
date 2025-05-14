cd UBUNTU24-CIS
ansible-vault encrypt_string '{{secret}}' --name 'root_password'
ansible-playbook -i inventory.yaml playbook.yaml --ask-vault-pass
