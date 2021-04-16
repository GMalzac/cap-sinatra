#!/bin/bash

ssh cap-sinatra "mkdir -p ~/config"
scp ./config/* cap-sinatra:~/config

scp ./scripts/setup.sh cap-sinatra:~/
ssh cap-sinatra "chmod +x ~/setup.sh" 
ssh cap-sinatra "~/setup.sh"
