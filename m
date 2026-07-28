Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8FD47884B
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 22:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276635; cv=none; b=REq+41u8b0gOJZ9n7Y69r2b7FIxMTpgiPF9L/+Yy4gD+vx/NaqtbBYC1Q3iYJdmcJmSA7Qx2MT0LrLomh7fjAVaumsxAb8noB4GMYsQtLF0PCNOqX1uaheiU34loATJbad7vrCy6E9XBK/PWwhYiyww+jIzhvy4SmFq2VPt1VgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276635; c=relaxed/simple;
	bh=+1okqgFEVMup12nSFgGpuP3kzZnjOLUGUFN4+7jdw2g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HbQtli41lEi8d1WUi/xW0wBq53MPiRWq5afaNnWdgtY5IKEZGswQiBHYh+r7IeNHmt4I1JK9qZfOYzXjRmA8pLSxsiCl+QG+HPsP4RI+Iwyf0WMYuufJHA4xy6bC47TqCjb7K05xL3svgVN9REA6Rp8dzx7yTzaymsiq8ETWYMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OlUyOX4U; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OlUyOX4U"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848568a6f62so483371b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 15:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785276627; x=1785881427; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eD4DOqSzYhDJFPWVLbqkFG2KNi5FrgpbXUF+ODWdEds=;
        b=OlUyOX4Ut8gHSj6itMAmnh8lkVvwAmVHtL5qo5fXAo1NwhfqUGqHOEk9mf7tqRZ+MZ
         P8R//S/3O2apG/5a65fZ8FfofiqOWO4AXsQRLfFU8ZTPMNGc+NGQqgqvJnfh2TK6cRgK
         qEc+yEt4Zmp851ZAlMEr6Ept0QwgkdcW4pRGSp5B42mRq9zCU+fj+99QwxqVg1CW3jMg
         vo23AoPVGVpf58e6oYDcKKUWMMke2uHQdddKzhP3I+RHkwKBtL1UdqiYt7J1FICcbLKz
         V0D9y0YjLV+eaNP6Y7EIYP1qGz1tHS0KWGDIXeBHGx5fiyMS4wRlbjIn/QXy+WodNmB1
         DD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276627; x=1785881427;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eD4DOqSzYhDJFPWVLbqkFG2KNi5FrgpbXUF+ODWdEds=;
        b=dpWq5F7IvZ5XmJuxVvt7XP9DftCD0BBsnLpZhzmt+7Xs1UzwNv9ylkE5X9Uef1LRKO
         u8rjVdbW2wA0ZNwx8KX3ZTCUyBFXiqsJiOHJQGB3i9bEECqaKGJJpQPblGX7wBDj9f9C
         NB9Wc3btSrLMFg3CVtZBPUE4oFSvyEdw5PrN6eLXFyWiw99+6Wslf7ASEToGQlEX04xl
         ibdDA4YBv8GnBtF69K8zVY90XZZPdPplho5O1H9LYgFVKLj6CGPU6Tj5a96Fvw2xzhAe
         ujLW1+Rg8z2zIKPyHVbmhnE3pmkZy0y1b4Rz4pLXJo926JCxzYJ5FMjCUzQi2itBLSJR
         cYKg==
X-Forwarded-Encrypted: i=1; AHgh+RqVwwlDYZ2ktEL4XdJXc1FHFf+oA7F5v0ngENNQo9M+JAA2sFEzgxxCTsYyi3u0IaSoeHdQKwppQOw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4KYFnnaphl1kfECfmzjoPLMC6zF0BSRBcq2u4yC4gyHGog+4G
	Q/LawoeCts+mRtFG/6IHV5EMCx2ktq5RGePkrVHtXK12S7tql5OEvJAC39mor/4262nvDOYp6yz
	leZn09xjwuyzOcQ==
X-Received: from pfoa1.prod.google.com ([2002:aa7:8641:0:b0:845:ebfa:4051])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:23cb:b0:845:363e:12d9 with SMTP id d2e1a72fcca58-84e931f6a77mr4252240b3a.3.1785276626749;
 Tue, 28 Jul 2026 15:10:26 -0700 (PDT)
Date: Tue, 28 Jul 2026 22:10:01 +0000
In-Reply-To: <20260728221007.2098560-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728221007.2098560-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728221007.2098560-8-dmatlack@google.com>
Subject: [PATCH v8 07/12] PCI: Refactor matching logic for pci_dev_acs_ops
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Refactor the logic to match devices to pci_dev_acs_ops by factoring out
the device matching loop into its own routine, pci_dev_acs_ops_get().
This eliminates duplicate code between pci_dev_specific_enable_acs() and
pci_dev_specific_disable_acs_redir(), and will also be used in a
subsequent commit to check if a device requires device-specific
enable_acs() during a Live Update.

No functional change intended.

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/quirks.c | 51 ++++++++++++++++++--------------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index b09f27f7846f..7ac39ec2843e 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5374,9 +5374,6 @@ static void pci_quirk_enable_intel_rp_mpc_acs(struct pci_dev *dev)
  */
 static int pci_quirk_enable_intel_pch_acs(struct pci_dev *dev)
 {
-	if (!pci_quirk_intel_pch_acs_match(dev))
-		return -ENOTTY;
-
 	if (pci_quirk_enable_intel_lpc_acs(dev)) {
 		pci_warn(dev, "Failed to enable Intel PCH ACS quirk\n");
 		return 0;
@@ -5396,9 +5393,6 @@ static int pci_quirk_enable_intel_spt_pch_acs(struct pci_dev *dev)
 	int pos;
 	u32 cap, ctrl;
 
-	if (!pci_quirk_intel_spt_pch_acs_match(dev))
-		return -ENOTTY;
-
 	pos = dev->acs_cap;
 	if (!pos)
 		return -ENOTTY;
@@ -5426,9 +5420,6 @@ static int pci_quirk_disable_intel_spt_pch_acs_redir(struct pci_dev *dev)
 	int pos;
 	u32 cap, ctrl;
 
-	if (!pci_quirk_intel_spt_pch_acs_match(dev))
-		return -ENOTTY;
-
 	pos = dev->acs_cap;
 	if (!pos)
 		return -ENOTTY;
@@ -5448,56 +5439,56 @@ static int pci_quirk_disable_intel_spt_pch_acs_redir(struct pci_dev *dev)
 static const struct pci_dev_acs_ops {
 	u16 vendor;
 	u16 device;
+	bool (*match)(struct pci_dev *dev);
 	int (*enable_acs)(struct pci_dev *dev);
 	int (*disable_acs_redir)(struct pci_dev *dev);
 } pci_dev_acs_ops[] = {
 	{ PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
+	    .match = pci_quirk_intel_pch_acs_match,
 	    .enable_acs = pci_quirk_enable_intel_pch_acs,
 	},
 	{ PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
+	    .match = pci_quirk_intel_spt_pch_acs_match,
 	    .enable_acs = pci_quirk_enable_intel_spt_pch_acs,
 	    .disable_acs_redir = pci_quirk_disable_intel_spt_pch_acs_redir,
 	},
 };
 
-int pci_dev_specific_enable_acs(struct pci_dev *dev)
+static const struct pci_dev_acs_ops *pci_dev_acs_ops_get(struct pci_dev *dev)
 {
 	const struct pci_dev_acs_ops *p;
-	int i, ret;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(pci_dev_acs_ops); i++) {
 		p = &pci_dev_acs_ops[i];
 		if ((p->vendor == dev->vendor ||
 		     p->vendor == (u16)PCI_ANY_ID) &&
 		    (p->device == dev->device ||
-		     p->device == (u16)PCI_ANY_ID) &&
-		    p->enable_acs) {
-			ret = p->enable_acs(dev);
-			if (ret >= 0)
-				return ret;
+		     p->device == (u16)PCI_ANY_ID)) {
+			if (!p->match || p->match(dev))
+				return p;
 		}
 	}
 
+	return NULL;
+}
+
+int pci_dev_specific_enable_acs(struct pci_dev *dev)
+{
+	const struct pci_dev_acs_ops *p = pci_dev_acs_ops_get(dev);
+
+	if (p && p->enable_acs)
+		return p->enable_acs(dev);
+
 	return -ENOTTY;
 }
 
 int pci_dev_specific_disable_acs_redir(struct pci_dev *dev)
 {
-	const struct pci_dev_acs_ops *p;
-	int i, ret;
+	const struct pci_dev_acs_ops *p = pci_dev_acs_ops_get(dev);
 
-	for (i = 0; i < ARRAY_SIZE(pci_dev_acs_ops); i++) {
-		p = &pci_dev_acs_ops[i];
-		if ((p->vendor == dev->vendor ||
-		     p->vendor == (u16)PCI_ANY_ID) &&
-		    (p->device == dev->device ||
-		     p->device == (u16)PCI_ANY_ID) &&
-		    p->disable_acs_redir) {
-			ret = p->disable_acs_redir(dev);
-			if (ret >= 0)
-				return ret;
-		}
-	}
+	if (p && p->disable_acs_redir)
+		return p->disable_acs_redir(dev);
 
 	return -ENOTTY;
 }
-- 
2.55.0.487.gaf234c4eb3-goog

