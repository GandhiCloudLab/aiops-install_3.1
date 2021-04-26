#export CLUSTER_NAME=tec-cp4aiops-3c14aa1ff2da1901bfc7ad8b495c85d9-0000.eu-de.containers.appdomain.cloud



# -------------------------------------------------------------------------------------------------------------------------------------------------
# CREATE EDGES
# -------------------------------------------------------------------------------------------------------------------------------------------------
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["deployment"],"matchTokens": ["web-deployment"],"name": "web-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "web-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["deployment"],"matchTokens": ["shipping-deployment"],"name": "shipping-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "shipping-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["deployment"],"matchTokens": ["cart-deployment"],"name": "cart-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "cart-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["deployment"],"matchTokens": ["user-deployment"],"name": "user-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "user-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["deployment"],"matchTokens": ["catalogue-deployment"],"name": "catalogue-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "catalogue-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["deployment"],"matchTokens": ["cities-deployment"],"name": "cities-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "cities-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["deployment"],"matchTokens": ["redis-deployment"],"name": "redis-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "redis-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["deployment"],"matchTokens": ["payment-deployment"],"name": "payment-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "payment-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["deployment"],"matchTokens": ["dispatch-deployment"],"name": "dispatch-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "dispatch-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["deployment"],"matchTokens": ["mongodb-deployment"],"name": "mongodb-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "mongodb-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["deployment"],"matchTokens": ["mysql-deployment"],"name": "mysql-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "mysql-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["deployment"],"matchTokens": ["rabbitmq-deployment"],"name": "rabbitmq-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "rabbitmq-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["deployment"],"matchTokens": ["ratings-deployment"],"name": "ratings-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "ratings-deployment-id"}'




curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["server"],"matchTokens": ["paypal"],"name": "paypal.com","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "paypal.com-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["server"],"matchTokens": ["paypal"],"name": "www.paypal.com","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "www.paypal.com-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["volume"],"matchTokens": ["catalogue-db"],"name": "catalogue-db-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "catalogue-db-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/resources" --insecure -H 'Content-Type: application/json' -u $NOI_REST_USR':'$NOI_REST_PWD -H 'JobId: listenJob' -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -d $'{"app": "robotshop","availableReplicas": 1,"createdReplicas": 1,"dataCenter": "demo","desiredReplicas": 1,"entityTypes": ["volume"],"matchTokens": ["user-db"],"name": "user-db-deployment","namespace": "robot-shop","readyReplicas": 1,"tags": ["app:robotshop","namespace:robot-shop"],"vertexType": "resource","uniqueId": "user-db-id"}'





# -------------------------------------------------------------------------------------------------------------------------------------------------
# CREATE LINKS
# -------------------------------------------------------------------------------------------------------------------------------------------------
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "web-deployment-id","_toUniqueId": "shipping-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "web-deployment-id","_toUniqueId": "catalogue-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "web-deployment-id","_toUniqueId": "cart-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "web-deployment-id","_toUniqueId": "payment-deployment-id"}'

curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "cart-deployment-id","_toUniqueId": "catalogue-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "cart-deployment-id","_toUniqueId": "redis-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "user-deployment-id","_toUniqueId": "redis-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "user-deployment-id","_toUniqueId": "mongodb-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "catalogue-deployment-id","_toUniqueId": "mongodb-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "ratings-deployment-id","_toUniqueId": "mysql-deployment-id"}'

curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "shipping-deployment-id","_toUniqueId": "cart-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "cart-deployment-id","_toUniqueId": "payment-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "payment-deployment-id","_toUniqueId": "user-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "payment-deployment-id","_toUniqueId": "www.paypal.com-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "payment-deployment-id","_toUniqueId": "paypal.com-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "payment-deployment-id","_toUniqueId": "rabbitmq-deployment-id"}'




curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "user-deployment-id","_toUniqueId": "user-db-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "catalogue-deployment-id","_toUniqueId": "catalogue-db-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "user-db-id","_toUniqueId": "mongodb-deployment-id"}'
curl -X "POST" "https://topology-rest-aiops.$CLUSTER_NAME/1.0/rest-observer/rest/references" --insecure -H 'X-TenantID: cfd95b7e-3bc7-4006-a4a8-a73a79c71255' -H 'JobId: listenJob' -H 'Content-Type: application/json; charset=utf-8' -u $NOI_REST_USR':'$NOI_REST_PWD -d $'{"_edgeType": "dependsOn","_fromUniqueId": "catalogue-db-id","_toUniqueId": "mongodb-deployment-id"}'




