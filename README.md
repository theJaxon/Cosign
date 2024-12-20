# Cosign
Signing container images with Cosign and using Kyverno for enforcing the signature. 

### Why should you sign container images
Digitally signing container images ensure that our images have not been tampered with once they have been pushed to the container registry.

### How it works
- Cosign is the CLI tool used to generate the public/private key pair.
- It will also be used in the CI to sign container images after they are pushed to container registry.
- Finally an admission controller can be used (Kyverno or [connaisseur](https://github.com/sse-secure-systems/connaisseur) for example) to always check whether the image being pulled is digitally signed.

```bash
# Install Kyverno if it's not already installed
kubectl create -f https://github.com/kyverno/kyverno/releases/download/v1.11.1/install.yaml

# Password to be used for our private key
export COSIGN_PASSWORD=<passwd>

# Generate public and private keys
mkdir -pv cosign_keys && cd cosign_keys
cosign generate-key-pair

> Private key written to cosign.key
> Public key written to cosign.pub

docker build --tag <tag> .

# Digitally sign the image
cosign sign --key <key> --upload=true <image-uri>
```

---

### References 
1. [cosign- tutorial](https://github.com/avisi-cloud/cosign-tutorial)
2. [Kyverno Sigstore policy](https://kyverno.io/docs/writing-policies/verify-images/sigstore/)
