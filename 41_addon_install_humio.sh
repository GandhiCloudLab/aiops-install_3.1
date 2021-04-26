# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# Install Script for Humio
#
# V3.1 
#
# ©2021 nikh@ch.ibm.com
# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------------------------------------------"

source ./99_config-global.sh

# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# Do Not Edit Below
# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------------------------------------------"

headerModuleFileBegin "Install HUMIO " $0



# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# PREREQUISITES
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
header3Begin "Running Prerequisites" "rocket"

        export SCRIPT_PATH=$(pwd)

header3End



# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Install Klusterlet
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
header3Begin "Install HUMIO" "rocket"

        export HUMIO_INSTALLED=$(helm list -n humio-logging | grep deployed)


        if [[ $HUMIO_INSTALLED =~ "deployed" ]];
        then
                __output "    ⭕ HUMIO already installed! Skipping..."
        else
                helm repo add humio https://humio.github.io/humio-helm-charts
                helm repo update

                oc create ns humio-logging

                helm install humio-instance humio/humio-helm-charts \
                --namespace humio-logging \
                --values ./tools/4_integrations/humio/humio-install.yaml

                oc adm policy add-scc-to-user privileged -n humio-logging -z humio-instance
                oc adm policy add-scc-to-user privileged -n humio-logging -z default

                kubectl apply -n humio-logging -f ./tools/4_integrations/humio/humio-route.yaml

                __output "    🕦 Wait 60 seconds..."

                kubectl delete -n humio-logging secret developer-user-password
                kubectl apply -n humio-logging -f ./tools/4_integrations/humio/change-humio-dev-pwd.yaml
                kubectl delete -n humio-logging pod humio-instance-humio-core-0

                __output " ✅ HUMIO Installed"
                __output "  ⚠️ Please check the documentation in order to create the Fluentbit agents!"
        fi


header3End





headerModuleFileEnd "Install HUMIO " $0




