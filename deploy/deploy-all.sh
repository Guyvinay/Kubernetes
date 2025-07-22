#!/bin/bash

echo "🚀 Deploying PostgreSQL..."
kubectl apply -f postgres/
sleep 10  # Wait for DB pod to initialize (adjust time as needed)

echo "🚀 Deploying ElasticSearch..."
kubectl apply -f elastic/
sleep 15  # Elastic takes time to initialize

echo "🚀 Deploying dev-auth..."
kubectl apply -f dev-auth/

echo "🚀 Deploying dev-take..."
kubectl apply -f dev-take/

echo "🚀 Deploying dev-revised..."
kubectl apply -f dev-revised/

echo "🚀 Deploying Ingress..."
kubectl apply -f ingress/

echo "✅ All services deployed."
