from string import Template

with open('env.template', 'r') as f:
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
