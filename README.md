# Steps to create cluster.
```bash
1.) terraform init
2.) terraform apply --auto-approve
3.) terraform output -raw kubeconfig > ~/.kube/config
4.) terraform output -raw config_map_aws_auth > configmap.yml
5.) kubectl apply -f configmap.yml
6.) kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.2/deploy/static/provider/aws/deploy.yaml
```