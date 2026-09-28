#!/usr/bin/env bash
set -euo pipefail

echo "=================================================="
echo "SRE Validation: Confidential AI TEE Studio"
echo "=================================================="

echo "[1/4] Validating Python Verifier syntax..."
python3 -m py_compile tee_attestation_verifier.py
python3 -m py_compile manim_flow.py
echo "✓ Python compilation clean."

echo "[2/4] Testing remote attestation certificate check..."
python3 tee_attestation_verifier.py > /dev/null
echo "✓ Remote attestation verification verified."

echo "[3/4] Validating TypeScript Secure Client syntax..."
npx --yes tsc --noEmit enclave_secure_client.ts
echo "✓ TypeScript compilation clean."

echo "[4/4] Validating Kubernetes Confidential Pod Manifest..."
grep -q "runtimeClassName: kata-cc" k8s-confidential-pod.yaml
echo "✓ Kubernetes manifest clean."

echo "=================================================="
echo "ALL TESTS PASSED: tp-confidential-ai-tee ready."
echo "=================================================="
