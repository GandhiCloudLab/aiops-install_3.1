source ./01_config.sh

banner

echo "***************************************************************************************************************************************************"
echo "***************************************************************************************************************************************************"
echo " 🚀 CP4WAIOPS RESET DEMO"
echo "***************************************************************************************************************************************************"
echo " This will reset:"
echo "    - Stories"
echo "    - Slack Channels"
echo "    - Netcool Events"
echo "***************************************************************************************************************************************************"

oc exec -it $(oc get po |grep aimanager-aio-controller|awk '{print$1}') -- curl -k -X GET https://localhost:9443/v2/connections/application_groups/1000/applications/1000/ > test.json
export CONNECTION_ID=$(jq '.[] | select(.connection_type=="humio") | .connection_id' test.json | tr -d '"')
export CONNECTION_NAME=$(jq '.[] | select(.connection_type=="humio") | .connection_config.display_name' test.json | tr -d '"') 




  read -p "❗ Are you really, really, REALLY sure you want to reset the demo? [y,N] " DO_COMM
  if [[ $DO_COMM == "y" ||  $DO_COMM == "Y" ]]; then
    echo "      🧞‍♂️ OK, as you wish...."
  else
    echo "      ❌ Aborted"
    exit 1
  fi
  



echo ""
echo ""
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "Turn off Data Flow $CONNECTION_NAME"
echo "--------------------------------------------------------------------------------------------------------------------------------"


oc exec -it $(oc get po |grep aimanager-aio-controller|awk '{print$1}') -- curl -k -X PUT https://localhost:9443/v3/connections/$CONNECTION_ID/disable
echo " ✅ OK"



# ----------------------------------------------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------------------------------------------
# Reset Demo - Clean Up
# ----------------------------------------------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------------------------------------------
oc project $WAIOPS_NAMESPACE >/dev/null 2>&1

echo ""
echo ""
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "Scale up RobotShop"
echo "--------------------------------------------------------------------------------------------------------------------------------"

robot_running=$(oc get deployment ratings -n robot-shop)
if [[ $robot_running =~ "0/0" ]];
then
    oc scale --replicas=1 ratings -n robot-shop #>/dev/null 2>&1
    echo " ✅ OK"
else 
    echo " ✅ RobotShop is OK. Skipping..."
fi




echo ""
echo ""
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "Existing kafka topics"
echo "--------------------------------------------------------------------------------------------------------------------------------"

oc get kafkatopic -n $WAIOPS_NAMESPACE| awk '{print $1}' # > all_topics_$(date +%s).yaml
echo " ✅ OK"

export LOGS_TOPIC=$(oc get KafkaTopic -n $WAIOPS_NAMESPACE | grep logs-humio| awk '{print $1;}')


echo ""
echo ""
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "Delete kafka topics"
echo "--------------------------------------------------------------------------------------------------------------------------------"

oc get kafkatopic -n $WAIOPS_NAMESPACE| grep window | awk '{print $1}' | xargs oc delete kafkatopic -n $WAIOPS_NAMESPACE
echo " ✅ OK"

oc get kafkatopic -n $WAIOPS_NAMESPACE| grep normalized | awk '{print $1}'| xargs oc delete kafkatopic -n $WAIOPS_NAMESPACE
echo " ✅ OK"

oc get kafkatopic -n $WAIOPS_NAMESPACE| grep derived | awk '{print $1}'| xargs oc delete kafkatopic -n $WAIOPS_NAMESPACE
echo " ✅ OK"

oc get kafkatopic -n $WAIOPS_NAMESPACE| grep logs-humio | awk '{print $1}' | xargs oc delete kafkatopic -n $WAIOPS_NAMESPACE
echo " ✅ OK"




echo ""
echo ""
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "Recreate Topics"
echo "--------------------------------------------------------------------------------------------------------------------------------"




echo "Creating topics windowed-logs-1000-1000 and normalized-alerts-1000-1000\n\n"
cat <<EOF | oc apply -f -
apiVersion: kafka.strimzi.io/v1beta1
kind: KafkaTopic
metadata:
  name: normalized-alerts-1000-1000 
  namespace: $WAIOPS_NAMESPACE
  labels:
    strimzi.io/cluster: strimzi-cluster
spec:
  config:
    max.message.bytes: '1048588'
    retention.ms: '1800000'
    segment.bytes: '1073741824'
  partitions: 1
  replicas: 1
  topicName: normalized-alerts-1000-1000 
---
apiVersion: kafka.strimzi.io/v1beta1
kind: KafkaTopic
metadata:
  name: windowed-logs-1000-1000 
  namespace: $WAIOPS_NAMESPACE
  labels:
    strimzi.io/cluster: strimzi-cluster
spec:
  config:
    max.message.bytes: '1048588'
    retention.ms: '1800000'
    segment.bytes: '1073741824'
  partitions: 1
  replicas: 1
  topicName: windowed-logs-1000-1000 
EOF
echo " ✅ OK"




cat <<EOF | oc apply -f -
apiVersion: kafka.strimzi.io/v1beta1
kind: KafkaTopic
metadata:
  name: derived-stories
  namespace: $WAIOPS_NAMESPACE
  labels:
    strimzi.io/cluster: strimzi-cluster
spec:
  config:
    max.message.bytes: '1048588'
    retention.ms: '1800000'
    segment.bytes: '1073741824'
  partitions: 1
  replicas: 1
  topicName: derived-stories 
EOF
echo " ✅ OK"




cat <<EOF | oc apply -f -
apiVersion: kafka.strimzi.io/v1beta1
kind: KafkaTopic
metadata:
  name: $LOGS_TOPIC
  namespace: $WAIOPS_NAMESPACE
  labels:
    strimzi.io/cluster: strimzi-cluster
spec:
  config:
    max.message.bytes: '1048588'
    retention.ms: '1800000'
    segment.bytes: '1073741824'
  partitions: 1
  replicas: 1
  topicName: $LOGS_TOPIC
EOF
echo " ✅ OK"





echo ""
echo ""
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "Kafka topics"
echo "--------------------------------------------------------------------------------------------------------------------------------"

oc get kafkatopic -n $WAIOPS_NAMESPACE
echo " ✅ OK"



echo ""
echo ""
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "Empty Slack Channels"
echo "--------------------------------------------------------------------------------------------------------------------------------"
./reset-slack-no-interation.sh &
echo " ✅ OK: Running..."

echo ""
echo ""
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "Clear Stories DB"
echo "--------------------------------------------------------------------------------------------------------------------------------"

oc project $WAIOPS_NAMESPACE

echo "1/8"
oc exec -it $(oc get pods | grep persistence | awk '{print $1;}') -- curl -k -X DELETE https://localhost:8443/v2/similar_incident_lists
echo ""
echo "2/8"
oc exec -it $(oc get pods | grep persistence | awk '{print $1;}') -- curl -k -X DELETE https://localhost:8443/v2/alertgroups
echo ""
echo "3/8"
oc exec -it $(oc get pods | grep persistence | awk '{print $1;}') -- curl -k -X DELETE https://localhost:8443/v2/app_states
echo ""
echo "4/8"
oc exec -it $(oc get pods | grep persistence | awk '{print $1;}') -- curl -k -X DELETE https://localhost:8443/v2/stories
echo ""
echo "5/8"
oc exec -it $(oc get pods | grep persistence | awk '{print $1;}') -- curl -k https://localhost:8443/v2/similar_incident_lists
echo ""
echo "6/8"
oc exec -it $(oc get pods | grep persistence | awk '{print $1;}') -- curl -k https://localhost:8443/v2/alertgroups
echo ""
echo "7/8"
oc exec -it $(oc get pods | grep persistence | awk '{print $1;}') -- curl -k https://localhost:8443/v2/application_groups/1000/app_states
echo ""
echo "8/8"
oc exec -it $(oc get pods | grep persistence | awk '{print $1;}') -- curl -k https://localhost:8443/v2/stories
echo ""
echo " ✅ OK"




echo ""
echo ""
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "Refresh the Flink Jobs"
echo "--------------------------------------------------------------------------------------------------------------------------------"



echo "1/6:  Logs"
oc exec -it $(oc get pods | grep aio-controller | awk '{print $1;}') -- curl -k -X PUT https://localhost:9443/v2/connections/application_groups/1000/applications/1000/refresh?datasource_type=logs
echo " ✅ OK"
echo ""
echo "2/6:  Events"
oc exec -it $(oc get pods | grep aio-controller | awk '{print $1;}') -- curl -k -X PUT https://localhost:9443/v2/connections/application_groups/1000/applications/1000/refresh?datasource_type=alerts
echo " ✅ OK"



echo ""
echo ""
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "Delete RobotShop NOI Events"
echo "--------------------------------------------------------------------------------------------------------------------------------"

password=$(oc get secrets | grep omni-secret | awk '{print $1;}' | xargs oc get secret -o jsonpath --template '{.data.OMNIBUS_ROOT_PASSWORD}' | base64 --decode)
oc get pods | grep ncoprimary-0 | awk '{print $1;}' | xargs -I{} oc exec {} -- bash -c "/opt/IBM/tivoli/netcool/omnibus/bin/nco_sql -server AGG_P -user root -passwd ${password} << EOF
delete from alerts.status where AlertGroup='robot-shop';
go
exit
EOF"
echo " ✅ OK"



echo ""
echo ""
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "Turn on Data Flow $CONNECTION_NAME"
echo "--------------------------------------------------------------------------------------------------------------------------------"


oc exec -it $(oc get po |grep aimanager-aio-controller|awk '{print$1}') -- curl -k -X PUT https://localhost:9443/v3/connections/$CONNECTION_ID/enable
echo " ✅ OK"



echo ""
echo ""
echo ""
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "Check Pods"
echo "--------------------------------------------------------------------------------------------------------------------------------"



oc delete pod $(oc get pods | grep log-anomaly-detector | awk '{print $1;}') --force --grace-period=0|| true
oc delete pod $(oc get pods | grep aimanager-aio-event-grouping | awk '{print $1;}') --force --grace-period=0|| true
oc delete pod $(oc get pods | grep flink-task-manager-0 | awk '{print $1;}') --force --grace-period=0|| true

#echo " ✅ OK"

echo "      🔎 Check derived-stories KafkaTopic" 

TOPIC_READY=$(oc get KafkaTopics -n $WAIOPS_NAMESPACE derived-stories -o jsonpath='{.status.conditions[0].status}' || true)

while  ([[ ! $TOPIC_READY =~ "True" ]] ); do 
    TOPIC_READY=$(oc get KafkaTopics -n $WAIOPS_NAMESPACE derived-stories -o jsonpath='{.status.conditions[0].status}' || true)
    echo "      🕦 wait for derived-stories KafkaTopic" 
    sleep 3
done
echo " ✅ OK"



echo "      🔎 Check windowed-logs KafkaTopic" 

TOPIC_READY=$(oc get KafkaTopics -n $WAIOPS_NAMESPACE windowed-logs-1000-1000 -o jsonpath='{.status.conditions[0].status}' || true)

while  ([[ ! $TOPIC_READY =~ "True" ]] ); do 
    TOPIC_READY=$(oc get KafkaTopics -n $WAIOPS_NAMESPACE windowed-logs-1000-1000 -o jsonpath='{.status.conditions[0].status}' || true)
    echo "      🕦 wait for windowed-logs KafkaTopic" 
    sleep 3
done
echo " ✅ OK"


echo "      🔎 Check normalized-alerts KafkaTopic" 

TOPIC_READY=$(oc get KafkaTopics -n $WAIOPS_NAMESPACE normalized-alerts-1000-1000 -o jsonpath='{.status.conditions[0].status}' || true)

while  ([[ ! $TOPIC_READY =~ "True" ]] ); do 
    TOPIC_READY=$(oc get KafkaTopics -n $WAIOPS_NAMESPACE normalized-alerts-1000-1000 -o jsonpath='{.status.conditions[0].status}' || true)
    echo "      🕦 wait for normalized-alerts KafkaTopic" 
    sleep 3
done
echo " ✅ OK"

echo "      🔎 Check $LOGS_TOPIC KafkaTopic" 

TOPIC_READY=$(oc get KafkaTopics -n $WAIOPS_NAMESPACE $LOGS_TOPIC -o jsonpath='{.status.conditions[0].status}' || true)

while  ([[ ! $TOPIC_READY =~ "True" ]] ); do 
    TOPIC_READY=$(oc get KafkaTopics -n $WAIOPS_NAMESPACE $LOGS_TOPIC -o jsonpath='{.status.conditions[0].status}' || true)
    echo "      🕦 wait for $LOGS_TOPIC KafkaTopic" 
    sleep 3
done
echo " ✅ OK"


#oc delete pod $(oc get pods | grep event-gateway-generic-evtmgrgw | awk '{print $1;}')





echo "      🔎 Check for Anomaly Pod" 

SUCCESFUL_RESTART=$(oc get pods | grep log-anomaly-detector | grep 0/1 || true)

while  ([[ $SUCCESFUL_RESTART =~ "0" ]] ); do 
    SUCCESFUL_RESTART=$(oc get pods | grep log-anomaly-detector | grep 0/1 || true)
    echo "      🕦 wait for Anomaly Pod" 
    sleep 10
done
echo " ✅ OK"

echo "      🔎 Check for Event Grouping Pod" 

SUCCESFUL_RESTART=$(oc get pods | grep aimanager-aio-event-grouping | grep 0/1 || true)

while  ([[ $SUCCESFUL_RESTART =~ "0" ]] ); do 
    SUCCESFUL_RESTART=$(oc get pods | grep aimanager-aio-event-grouping | grep 0/1 || true)
    echo "      🕦 wait for Event Grouping Pod" 
    sleep 10
done
echo " ✅ OK"


echo "      🔎 Check for Task Manager Pod" 

SUCCESFUL_RESTART=$(oc get pods | grep flink-task-manager-0 | grep 0/1 || true)

while  ([[ $SUCCESFUL_RESTART =~ "0" ]] ); do 
    SUCCESFUL_RESTART=$(oc get pods | grep flink-task-manager-0 | grep 0/1 || true)
    echo "      🕦 wait for Flink Task Manager Pod" 
    sleep 10
done
echo " ✅ OK"

echo "      🔎 Check for Gateway Pod" 

SUCCESFUL_RESTART=$(oc get pods | grep event-gateway-generic | grep 0/1 || true)

while  ([[ $SUCCESFUL_RESTART =~ "0" ]] ); do 
    SUCCESFUL_RESTART=$(oc get pods | grep event-gateway-generic | grep 0/1 || true)
    echo "      🕦 wait for Gateway Pod" 
    sleep 10
done
echo " ✅ OK"


echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "  ✅ DONE... You're good to go...."
echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------------------------------------------------------------"

