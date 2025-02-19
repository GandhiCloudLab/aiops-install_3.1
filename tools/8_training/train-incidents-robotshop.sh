#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT MODIFY BELOW
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

source ./99_config-global.sh

export SCRIPT_PATH=$(pwd)
export LOG_PATH=""
__getClusterFQDN
__getInstallPath


banner
echo ""
echo "***************************************************************************************************************************************************"
echo "***************************************************************************************************************************************************"
echo ""
echo " 🚀  CP4WAIOPS Similar Incidents Training for Robotshop"
echo ""
echo "***************************************************************************************************************************************************"


  read -p "Start Training? [y,N] " DO_COMM
  if [[ $DO_COMM == "y" ||  $DO_COMM == "Y" ]]; then
      echo "✅ Ok, continuing..."
  else
    echo "❌ Aborted"
    exit 1
  fi

oc project $WAIOPS_NAMESPACE

executeInTrainingPod(){
  title=$1
  command=$2
  echo "🛰️   $title:     $command"
  oc exec -it $TRAINING_POD -- $command
}


printForTrainingPod(){
  command=$1
  echo "$command"
}


export TRAINING_POD=$(oc get po |grep model-train-console|awk '{print$1}')
export SIMILAR_INCIDENTS=similar-incident-service



echo "Training pod is $TRAINING_POD"
echo "  "
echo "  "
echo "  "
echo "  "
echo "***************************************************************************************************************************************************"
echo " 🚀  Create Directories in Training Pod"
echo "***************************************************************************************************************************************************"
executeInTrainingPod "Create Incident Directory" "mkdir -p /home/zeno/data/trainingdata/incident/"




echo "  "
echo "  "
echo "  "
echo "  "
echo "***************************************************************************************************************************************************"
echo " 🚀  Upload Data to Training Pod"
echo "***************************************************************************************************************************************************"

# Incident
echo "📥 Copy Incident Data to Learner Pod"
oc cp ./tools/8_training/3_incidents/incidents-robotshop.json $(oc get po |grep model-train-console|awk '{print $1}'):/home/zeno/data/trainingdata/incident/incidents-robotshop.json




echo "  "
echo "  "
echo "  "
echo "  "
echo "***************************************************************************************************************************************************"
echo " 🚀  Execute the following lines in the Training Pod (Copy/Paste)"
echo "***************************************************************************************************************************************************"

echo "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
echo "  "
echo "  "



echo "#----------------------------------------------------------------------------------------------------------------------------------------"
echo "# First Time Launch"
echo "#----------------------------------------------------------------------------------------------------------------------------------------"
# Create S3 Buckets
printForTrainingPod "aws s3 mb s3://$SIMILAR_INCIDENTS"



echo "  "
echo "  "
echo "#----------------------------------------------------------------------------------------------------------------------------------------"
echo "# Train Incident"
echo "#----------------------------------------------------------------------------------------------------------------------------------------"
# Remove existing training data from S3 Buckets
printForTrainingPod "aws s3 rm s3://$SIMILAR_INCIDENTS/incidents-robotshop.json"

# Sync training data to S3 Buckets
printForTrainingPod "aws s3 sync /home/zeno/data/trainingdata/incident/ s3://$SIMILAR_INCIDENTS/"

# Train Incident
printForTrainingPod "cd /home/zeno/incident/"
printForTrainingPod "cp /home/zeno/train/deploy_model.pyc /home/zeno/train/deploy_model.py"
printForTrainingPod "bash index_incidents.sh s3://similar-incident-service/incidents-robotshop.json 1000 1000"
printForTrainingPod "rm /home/zeno/train/deploy_model.py"


echo "  "
echo "  "
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"

echo "  "
echo "  "
echo "  "
echo "  "
echo "***************************************************************************************************************************************************"
echo ""
echo " 🚀  Now entering Learner Pod"
echo ""
echo "***************************************************************************************************************************************************"


oc project aiops
oc exec -it $(oc get po |grep model-train-console|awk '{print$1}') bash



echo "***************************************************************************************************************************************************"
echo "***************************************************************************************************************************************************"
echo ""
echo " ✅  AI OPS Similar Incidents Training.... DONE...."
echo ""
echo "***************************************************************************************************************************************************"
echo "***************************************************************************************************************************************************"
