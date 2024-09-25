# helm repo add argo https://argoproj.github.io/argo-helm
# helm repo update
# helm search repo argocd
# helm show values argo/argo-cd --version 3.35.4 > argocd-defaults.yaml
# helm ist --pending -A
# kubectl get secrets argocd-initial-admin-secret -o yaml -n argocd
# username admin
# echo "secretpassword" | base64 -d
resource "helm_release" "argocd" {
  name = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "7.6.2"

  values = [file("values/argocd.yaml")]
}
