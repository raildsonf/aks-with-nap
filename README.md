### criar no resource group gerado para mc bla bla bla

az network public-ip create --resource-group mc_dhub_aks-nap-demo_eastus --name myAKSPublicIP2 --sku Standard --allocation-method static --query publicIp.ipAddress -o tsv


### Add the ingress-nginx repository
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx


### Use Helm to deploy an NGINX ingress controller
helm upgrade -i nginx-ingress ingress-nginx/ingress-nginx \
    --namespace ingress-nginx --create-namespace \
    --set controller.replicaCount=2 \
    --set controller.nodeSelector."kubernetes\.io/os"=linux \
    --set controller.admissionWebhooks.patch.nodeSelector."kubernetes\.io/os"=linux \
    --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/healthz \
    --set defaultBackend.nodeSelector."kubernetes\.io/os"=linux \
    --set defaultBackend.image.digest="" \
    --set controller.service.loadBalancerIP=172.190.69.233 \
    --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-dns-label-name"=dhub2webhook