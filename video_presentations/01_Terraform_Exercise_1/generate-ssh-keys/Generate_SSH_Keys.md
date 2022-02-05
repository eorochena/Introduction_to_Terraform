# Generate SSH Key

To create an SSH key pair run the following command: 

> $ ssh-keygen -t rsa

After you run that command you will be presented with a few prompts

Specify the location for the SSH key pair, you can leave it blank if you don't have an SSH key pair, or if you don't want to overwrite your existing one.

> Enter file in which to save the key (/home/eorochena/.ssh/id_rsa): /home/eorochena/.ssh/new_id_rsa 

Enter a passphrase for additional security, remember security is always a good thing. :smile:

> Enter passphrase (empty for no passphrase): 

Re-enter passphrase.
 
> Enter same passphrase again:  

New *private* key location.

> Your identification has been saved in /home/eorochena/.ssh/new_id_rsa 

New *public* key location.

> Your public key has been saved in /home/eorochena/.ssh/new_id_rsa.pub 

![Generate-SSH-Key-Pair](../../images/generate-ssh-key-pair.png)


## Recommended Reading Materials

* https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/
* https://docs.microsoft.com/en-us/azure/virtual-machines/linux/mac-create-ssh-keys 
