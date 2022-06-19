
import os
from string import Template

def extract_keys(directory='./config/accounts'):
   for filename in os.listdir(directory):
      f = os.path.join(directory, filename)
      # checking if it is a file
      # if os.path.isfile(f):
      #    print(f)
      if f == '%s/keystore' % directory:
         continue
      # print(f)
      key_file = os.path.join(directory, 'keystore', f.split('/')[-1])
      print(key_file)

def render_template():
   with open('genesis.json.template', 'r') as f:
      t = Template(f.read())

   values = {}
   for content in [('nodekey', './config/bootnode/nodekey.key'),
               ('account_password', './config/master-password'),
               ('netrestrict', './config/netrestrict'),
               ('networkid', './config/networkid')]:
      key = content[0]
      file_name = content[1]
      with open(file_name, 'r') as f:
         values[key] = f.read()

   with open('.env', 'w') as f:
      f.write(
         t.safe_substitute(GEN_CHAIN_ID=values.get('networkid', 'N/A'),
                           ACCOUNT_PASSWORD=values.get('account_password', 'N/A'),
                           NODE_KEY_HEX=values.get('nodekey', 'N/A'),
                           BOOT_NODE=values.get('bootnode', 'N/A'),
                           NETRESTRICT=values.get('netrestrict', 'N/A')))

if __name__ == '__main__':
   # render_template()
   extract_keys()