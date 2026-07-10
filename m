Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE103BED66
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 21:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718796; cv=none; b=pwcQ07A64dMTgORvoav0bWYEgTzbFjTahJja5MzansubSs+XrXuoC3vHlMEiF5AYjgTV78tSfPTzbFdv1/yFV1FNFKuLVGO10lpebKA6jm6ibAjS1oCqKVprEqW9GJX158U4g9qzX48UTDujSm3frac+aNE2lNT+rxy3l4Pb05Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718796; c=relaxed/simple;
	bh=TT1r+Sc1kpyFY8Swon5dHUVCA+faxMR/hxQ7WWn8eM0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LnENxu4BzH9yKAIBP5oSBczmydfNxTamptMIKbKtJwHZ+UN6cJHnXXlVzOzOWcyTVgnAxcyftJer/dmuQ4pv6sN3ZvvbTHEKDvbdPDpEro2BQUj8aqmO46SMcOTMUCEYdg7dOB7hjhGQH+X9ZYYkUqskIBsU/xnqRMrvJg/jotM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D1XJ9O9O; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D1XJ9O9O"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c6bbd0afffso24661195ad.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 14:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783718790; x=1784323590; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8nXcm3EXUYcPcGCSx60NMKl0mL3TQCPUFy3rNzpS5dk=;
        b=D1XJ9O9OEC20wqBYNiQIVSPAgaZFIDRYzU8eLTZYt4tbc3rZ/SpIo5gncvHvx9TKKh
         kzjyFVctr7oDheGq0V7IW2zithjKEpX+5kQ4Q9hhQbDnmOied9etLymycxS0U00TiX/h
         Sqj8B8W9/8C57a2XSHbm/N63iqNUnkU9+n98cD95KFggApaRaz5q5XfIvuyLzOSAZyBr
         0t3+PgUx3hRwON1Eq0HCTtHzsjM4K0dtu7vzwtnZ/SGvxyPWlbhRmzhhOZnQq01enr5k
         bRV+Q5oKyVXoMdPAjQqfbyX6GGXk2hgvvgTRVoW1uI4oYH7KqXX8U2KIj4ceSXKMHYGq
         3MXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718790; x=1784323590;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nXcm3EXUYcPcGCSx60NMKl0mL3TQCPUFy3rNzpS5dk=;
        b=N2hViaoZjWKmK9zFfkXe7X3Jh2nFpx45nv1k6piEV5nzoEs+g52Oq/ZP/H4Jr+ccpD
         TSpZU7I+1ZFinbWoj6cPfYyU7JDn/Xenju5L/+LZolhEzkmJNbb9a+euGXb2r0COBiBN
         zDLcMDRkLxE9Cwh8whoGPnDbhVNg/niazbPha6XqtnHSkG4erYGNZRUGMLIzlC/LLrfV
         4GaVrTfHTR3o+tAm8lDmim8ImFTxc5R9/0pJF6PNH/AXet5f1vgZYLFniWYvdAAj1sf8
         P1jMLjCLonp5jcARwEVCubGV4gTahEI4r1kov04vJCzsrr9Hud5T4KmNnJvd51Zm5qY9
         D+jA==
X-Forwarded-Encrypted: i=1; AHgh+RqDyXTsfDDiVZUUr4xCOy7q4GwzOUrzVTTCT50v23/2gVBqzfpdlLkg/+/vtJ1ilyR9m5Fk8U2Gq00=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7qYqnXt3rlLnkvody15TyqV+fja2IUAEw5psP5/7QgEjCYrH3
	dxIZk6vp+vIgsaDGJrq6TIIh/Ao3ix05n0mX/VqQPsh6UOLRH1O4AzyqvVQanUxssiu2R4H7lJu
	/wGHR+jNtDkZQWQ==
X-Received: from plal14.prod.google.com ([2002:a17:903:4e:b0:2cc:da2c:8084])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1c8:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2ce9f294803mr7037355ad.45.1783718790387;
 Fri, 10 Jul 2026 14:26:30 -0700 (PDT)
Date: Fri, 10 Jul 2026 21:26:12 +0000
In-Reply-To: <20260710212616.1351130-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260710212616.1351130-10-dmatlack@google.com>
Subject: [PATCH v7 09/12] PCI: liveupdate: Inherit ARI Forwarding Enable on
 preserved bridges
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

Inherit the ARI Forwarding Enable on preserved bridges and update
pci_dev->ari_enabled accordingly during a Live Update. This ensures that
the preserved devices on the bridge's secondary bus can be identified
with the same expanded 8-bit function number after a Live Update.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 18 ++++++++++++++++++
 drivers/pci/liveupdate.h |  6 ++++++
 drivers/pci/pci.c        |  8 +++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index a95bfe5eff77..74a11e520f0d 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -128,6 +128,10 @@
  *    way after Live Update and ensures that IOMMU groups do not change. Note
  *    that a device will use its inherited ACS flags for the lifetime of its
  *    struct pci_dev (i.e. even after pci_liveupdate_finish()).
+ *
+ *  * The PCI core inherits ARI Forwarding Enable on all bridges with downstream
+ *    preserved devices to ensure that all preserved devices on the bridge's
+ *    secondary bus are addressable after the Live Update.
  */
 
 #define pr_fmt(fmt) "PCI: " KBUILD_BASENAME ": " fmt
@@ -816,6 +820,20 @@ int pci_liveupdate_enable_acs(struct pci_dev *dev)
 	return 0;
 }
 
+int pci_liveupdate_configure_ari(struct pci_dev *dev)
+{
+	u16 val;
+
+	guard(rwsem_read)(&pci_liveupdate.rwsem);
+
+	if (!dev->liveupdate.incoming)
+		return -EINVAL;
+
+	pcie_capability_read_word(dev, PCI_EXP_DEVCTL2, &val);
+	dev->ari_enabled = !!(val & PCI_EXP_DEVCTL2_ARI);
+	return 0;
+}
+
 /**
  * pci_liveupdate_is_incoming() - Check if a device is incoming-preserved
  * @dev: The PCI device to check
diff --git a/drivers/pci/liveupdate.h b/drivers/pci/liveupdate.h
index 4e8a01bcb4bb..6f21ec50927b 100644
--- a/drivers/pci/liveupdate.h
+++ b/drivers/pci/liveupdate.h
@@ -18,6 +18,7 @@ bool pci_liveupdate_scan_bridge_begin(struct pci_bus *bus, struct pci_dev *dev,
 void pci_liveupdate_scan_bridge_end(struct pci_dev *dev, int pass);
 void pci_liveupdate_init_acs(struct pci_dev *dev);
 int pci_liveupdate_enable_acs(struct pci_dev *dev);
+int pci_liveupdate_configure_ari(struct pci_dev *dev);
 #else
 static inline void pci_liveupdate_setup_device(struct pci_dev *dev)
 {
@@ -46,6 +47,11 @@ static inline int pci_liveupdate_enable_acs(struct pci_dev *dev)
 {
 	return -EINVAL;
 }
+
+static inline int pci_liveupdate_configure_ari(struct pci_dev *dev)
+{
+	return -EINVAL;
+}
 #endif
 
 #endif /* DRIVERS_PCI_LIVEUPDATE_H */
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 739ecaab2e76..e0c133b66a35 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3528,7 +3528,7 @@ void pci_configure_ari(struct pci_dev *dev)
 	u32 cap;
 	struct pci_dev *bridge;
 
-	if (pcie_ari_disabled || !pci_is_pcie(dev) || dev->devfn)
+	if (!pci_is_pcie(dev) || dev->devfn)
 		return;
 
 	bridge = dev->bus->self;
@@ -3539,6 +3539,12 @@ void pci_configure_ari(struct pci_dev *dev)
 	if (!(cap & PCI_EXP_DEVCAP2_ARI))
 		return;
 
+	if (!pci_liveupdate_configure_ari(bridge))
+		return;
+
+	if (pcie_ari_disabled)
+		return;
+
 	if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ARI)) {
 		pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
 					 PCI_EXP_DEVCTL2_ARI);
-- 
2.55.0.795.g602f6c329a-goog

