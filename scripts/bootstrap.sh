#!/bin/bash
echo '===================== boostrap.sh'
ssh cap-sinatra "mkdir -p ~/config"
scp ./config/* cap-sinatra:~/config
echo '===================== ./scripts/setup.sh cap-sinatra'
scp ./scripts/setup.sh cap-sinatra:~/
echo '===================== cap-sinatra chmod +x ~/setup.sh'
ssh cap-sinatra "chmod +x ~/setup.sh" 
echo '===================== ~/setup.sh'
ssh cap-sinatra "~/setup.sh"
