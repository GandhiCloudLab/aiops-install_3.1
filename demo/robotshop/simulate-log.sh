
source ./01_config.sh

banner 

echo ""
echo "***************************************************************************************************************************************************"
echo "***************************************************************************************************************************************************"
echo ""
echo " 🚀  CP4WAIOPS Simulate Ratings Outage for RobotShop"
echo ""
echo "***************************************************************************************************************************************************"
 
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "Simulating robotshop Logs Anomaly"
echo "--------------------------------------------------------------------------------------------------------------------------------"



    echo "--------------------------------------------------------------------------------------------------------------------------------"
    echo "Preparing Logs"
    echo "--------------------------------------------------------------------------------------------------------------------------------"



   echo "" > /tmp/robotshopErrorLogs.json
    input="./robotshop/robErrorTemplate.json"
    while IFS= read -r line
    do
      export my_timestamp=$(date +%s)000
      echo ${line} | gsed "s/@TIMESTAMP@/$my_timestamp/"  >> /tmp/robotshopErrorLogs.json
    done < "$input"


    export LOGS_TOPIC=$(oc get KafkaTopic -n aiops | grep logs-humio| awk '{print $1;}')
    export sasl_password=$(oc get secret token -n aiops --template={{.data.password}} | base64 --decode)
    export BROKER=$(oc get routes strimzi-cluster-kafka-bootstrap -n aiops -o=jsonpath='{.status.ingress[0].host}{"\n"}'):443

    echo "--------------------------------------------------------------------------------------------------------------------------------"
    echo "Injecting into Topic $LOGS_TOPIC"
    echo "--------------------------------------------------------------------------------------------------------------------------------"

    #mv ca.crt ca.crt.old
    oc extract secret/strimzi-cluster-cluster-ca-cert -n aiops --keys=ca.crt --confirm
      
    
    kafkacat -v -X security.protocol=SSL -X ssl.ca.location=./ca.crt -X sasl.mechanisms=SCRAM-SHA-512  -X sasl.username=token -X sasl.password=$sasl_password -b $BROKER -P -t $LOGS_TOPIC -l /tmp/robotshopErrorLogs.json


    echo "--------------------------------------------------------------------------------------------------------------------------------"
    echo "--------------------------------------------------------------------------------------------------------------------------------"
    echo "Done"
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""




echo "robotshop Ratings outage simulation.... Done...."


