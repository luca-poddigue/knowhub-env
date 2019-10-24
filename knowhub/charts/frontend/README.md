# Frontend service

### Cloud CDN
The service is configured to enable CDN caching on Google Cloud , through the BackendConfig resource.

A prerequisite for it to work is to create a global static ip on the target project with this command:
`gcloud compute addresses create frontend-cdn --global`