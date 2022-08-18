#!/bin/bash
cat << "EOF" | lolcat

                                                                                                                                              
                                                                                                                                              
WWWWWWWW                           WWWWWWWWPPPPPPPPPPPPPPPPP                       SSSSSSSSSSSSSSS      QQQQQQQQQ     LLLLLLLLLLL             
W::::::W                           W::::::WP::::::::::::::::P                    SS:::::::::::::::S   QQ:::::::::QQ   L:::::::::L             
W::::::W                           W::::::WP::::::PPPPPP:::::P                  S:::::SSSSSS::::::S QQ:::::::::::::QQ L:::::::::L             
W::::::W                           W::::::WPP:::::P     P:::::P                 S:::::S     SSSSSSSQ:::::::QQQ:::::::QLL:::::::LL             
 W:::::W           WWWWW           W:::::W   P::::P     P:::::P                 S:::::S            Q::::::O   Q::::::Q  L:::::L               
  W:::::W         W:::::W         W:::::W    P::::P     P:::::P                 S:::::S            Q:::::O     Q:::::Q  L:::::L               
   W:::::W       W:::::::W       W:::::W     P::::PPPPPP:::::P                   S::::SSSS         Q:::::O     Q:::::Q  L:::::L               
    W:::::W     W:::::::::W     W:::::W      P:::::::::::::PP   ---------------   SS::::::SSSSS    Q:::::O     Q:::::Q  L:::::L               
     W:::::W   W:::::W:::::W   W:::::W       P::::PPPPPPPPP      --Biswajeet--     SSS::::::::SS  Q:::::O     Q:::::Q  L:::::L               
      W:::::W W:::::W W:::::W W:::::W        P::::P             ---------------        SSSSSS::::S Q:::::O     Q:::::Q  L:::::L               
       W:::::W:::::W   W:::::W:::::W         P::::P                                         S:::::SQ:::::O  QQQQ:::::Q  L:::::L               
        W:::::::::W     W:::::::::W          P::::P                                         S:::::SQ::::::O Q::::::::Q  L:::::L         LLLLLL
         W:::::::W       W:::::::W         PP::::::PP                           SSSSSSS     S:::::SQ:::::::QQ::::::::QLL:::::::LLLLLLLLL:::::L
          W:::::W         W:::::W          P::::::::P                           S::::::SSSSSS:::::S QQ::::::::::::::Q L::::::::::::::::::::::L
           W:::W           W:::W           P::::::::P                           S:::::::::::::::SS    QQ:::::::::::Q  L::::::::::::::::::::::L
            WWW             WWW            PPPPPPPPPP                            SSSSSSSSSSSSSSS        QQQQQQQQ::::QQLLLLLLLLLLLLLLLLLLLLLLLL
                                                                                                                Q:::::Q                       
                                                                                                                 QQQQQQ                       
                                                                                                                                              
                                                                                                                                              
                                                                                                                                              
                                                                                                                                              
                                                                                                                                                                             
                                                            
                                                            
                          Author: Biswajeet Ray
                     Github:github.com/BiswajeetRay7
EOF

LISTS=$1

if [[ ! -f ${LISTS} ]]; then
        echo "ERROR: ${LISTS} not found"
        echo "usage: ./wp-sql list.txt"
        exit
fi

for SITE in $(cat $LISTS);
do
    if [[ $(curl --connect-timeout 3 --max-time 3 -kLs "${SITE}/wp-content/mysql.sql" ) =~ 'PHP Notice: ' ]]; then
                echo -e "\e[32m[+] FOUND: ${SITE}/wp-content/mysql.sql"
        else
                echo -e "\e[31m[-] NOT FOUND: ${SITE}"
        fi
    
done
