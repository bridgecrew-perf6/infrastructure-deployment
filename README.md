# Infrastructure-deployment 

The project creates infrastructure for application deployment:
- Single Master Kubernetes Cluster
- Monitoring server

## Deployment

Set sensitive values with a `secret.tfvars` file and sensitive backend values with `backend-secret.tfvars`.

To deploy this project run

```bash
  make terrafrom-run
  make ansible-run
```
