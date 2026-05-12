Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBB737472A
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 18:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778611742; cv=none; b=nBGMYj7YNTFFmMhYANVdFiEBYMisVgaR+JcK81UXS5k5roYncmS9/kHzyWSmRNftsPUl51xDjTHoTNE4JM0l68mRr2N/KcZE3nZmZBg7SX7yB6y+q/uLI0L6gSfX5o/BmrZoXBkdSqpxTzhrZxhkFLNjViVbvb23sz47JRKSg2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778611742; c=relaxed/simple;
	bh=gWcVhKA3hjPU8Csfp22CPX9edPkpFWJugHmseYOTvg8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L5/5mbPQyieM2/LYD/JyWq0+e9nmKpmFWqf59fTPcpU0w8wPqFrkWtkiutO4fo++TIdbuGT4s0R677uRChw7ZHpOW1l6DYhNw5wEUcRcnuSmPBcUbL7lBj+fCHRNLnFYo42kIjIZa1q7rUBxdMGPGJSBfHFOXrb5eW5u6dJFM4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sl2YDFDo; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sl2YDFDo"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so7387861b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 11:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778611738; x=1779216538; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=suL1O4sFcS7rc/4d5OPs7kFFwy+U1yVMYGR9ND8RmlQ=;
        b=sl2YDFDoAeBSP/Yeu086Tm7a3hSHuXGFZ+AKuhhMRjUnFu9pMBzTBbml/6Cu5nDbAD
         b+NzWQ4fQnMRkQYezky85HnX/P40WT/9NPG6BNOWXGtwtdC5cAsDzsFWdItWV9bCyBm7
         DP2K08tgAdRkGvD74NlYPhXVvYIDP4C9MXg6NAAIccjx3TbteOcaPCm5yzNQRRFXcdbQ
         TvCNNz7qwAvwgP40lds6I8N9oPRAMaXDelQMow+yTbtDtNrgGJQRq+PBeUV3pJ10K4cS
         3JMU2JNIb9kbUp+TQ3ncqCtLPHVW0nAZyXVlfb3YfrMHqT6HjQQze+MwZ6hsly71Kba9
         mzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778611738; x=1779216538;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suL1O4sFcS7rc/4d5OPs7kFFwy+U1yVMYGR9ND8RmlQ=;
        b=ajOWQqJmnDa2mriO62U4omvzrk75VyTpI72UXs7gMgu1RMkOn4SQ+JZW6t3cr5KzeR
         h1MFMq6vW14K45fOjNV0yn51Y36PAJ1kO+TXveWDQAzHFkZubYAjvhexAsmj5XzBLvAz
         gLS0gAbfN9NSuIxbcMPxRm6ZOwK3GNqaU5RrPG6TjtmFcbZbHrDg8yBQTgLlDt236Lay
         4JsSuh59NqBRD3U0aHJIoRIE4ral8yQJy2P8aln52FhnWyRG8EiXIFAukbANl4gG8oiM
         S+iLzdNgRL18jKHTXc0Azqyp+ubB3lq9dwoac+SEg+OlQuA+qhZg5cUMjrCa9vN0MawQ
         2nAg==
X-Forwarded-Encrypted: i=1; AFNElJ8/D5Lx2E7oC7euDPStaVLl4poJn9GhCUdZKuSml9gZ9HKZ81lv62VN0Sl6UzDB9fT+PUvhkEsfQmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDL0nrbv/JgENS15N+1LMlysNkawPSyQdhSasSkfNuyHdNvGPD
	jA81MH2Hm2Nls7Wz2MouWS5w5VU2M+79LM5DD/IKwod4n7cr+p6giLfAhwUpyA6+e99DVS/hVi/
	xcIuETsOd6Hkc+w==
X-Received: from pfbdu1.prod.google.com ([2002:a05:6a00:2b41:b0:82f:5b50:db30])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:8012:b0:82c:d986:e917 with SMTP id d2e1a72fcca58-83eebbaf559mr4596279b3a.22.1778611737978;
 Tue, 12 May 2026 11:48:57 -0700 (PDT)
Date: Tue, 12 May 2026 18:48:43 +0000
In-Reply-To: <20260512184846.119396-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260512184846.119396-1-dmatlack@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260512184846.119396-9-dmatlack@google.com>
Subject: [PATCH v5 08/11] PCI: liveupdate: Inherit ARI Forwarding Enable on
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
index e3cd6d76636c..6ab03bd548b3 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -132,6 +132,10 @@
  *    way after Live Update and ensures that IOMMU groups do not change. Note
  *    that a device will use its inherited ACS flags for the lifetime of its
  *    struct pci_dev (i.e. even after pci_liveupdate_finish()).
+ *
+ *  * The PCI core inherits ARI Forwarding Enable on all bridges with downstream
+ *    preserved devices to ensure that all preserved devices on the bridge's
+ *    secondary bus are addressable after the Live Update.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
@@ -720,6 +724,20 @@ bool pci_liveupdate_inherit_acs(struct pci_dev *dev)
 	return true;
 }
 
+bool pci_liveupdate_inherit_ari(struct pci_dev *dev)
+{
+	u16 val;
+
+	guard(read_lock)(&dev->liveupdate.lock);
+
+	if (!dev->liveupdate.incoming)
+		return false;
+
+	pcie_capability_read_word(dev, PCI_EXP_DEVCTL2, &val);
+	dev->ari_enabled = !!(val & PCI_EXP_DEVCTL2_ARI);
+	return true;
+}
+
 /**
  * pci_liveupdate_is_incoming() - Check if a device is incoming preserved
  * @dev: The PCI device to check
diff --git a/drivers/pci/liveupdate.h b/drivers/pci/liveupdate.h
index c0826ca717e3..fd7693c7ddd2 100644
--- a/drivers/pci/liveupdate.h
+++ b/drivers/pci/liveupdate.h
@@ -16,6 +16,7 @@ void pci_liveupdate_cleanup_device(struct pci_dev *dev);
 bool pci_liveupdate_inherit_buses(void);
 void pci_liveupdate_init_acs(struct pci_dev *dev);
 bool pci_liveupdate_inherit_acs(struct pci_dev *dev);
+bool pci_liveupdate_inherit_ari(struct pci_dev *dev);
 #else
 static inline void pci_liveupdate_setup_device(struct pci_dev *dev)
 {
@@ -38,6 +39,11 @@ static inline bool pci_liveupdate_inherit_acs(struct pci_dev *dev)
 {
 	return false;
 }
+
+static inline bool pci_liveupdate_inherit_ari(struct pci_dev *dev)
+{
+	return false;
+}
 #endif
 
 #endif /* DRIVERS_PCI_LIVEUPDATE_H */
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index cd2c1f2ada92..7e9768dfe092 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3495,7 +3495,7 @@ void pci_configure_ari(struct pci_dev *dev)
 	u32 cap;
 	struct pci_dev *bridge;
 
-	if (pcie_ari_disabled || !pci_is_pcie(dev) || dev->devfn)
+	if (!pci_is_pcie(dev) || dev->devfn)
 		return;
 
 	bridge = dev->bus->self;
@@ -3506,6 +3506,12 @@ void pci_configure_ari(struct pci_dev *dev)
 	if (!(cap & PCI_EXP_DEVCAP2_ARI))
 		return;
 
+	if (pci_liveupdate_inherit_ari(bridge))
+		return;
+
+	if (pcie_ari_disabled)
+		return;
+
 	if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ARI)) {
 		pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
 					 PCI_EXP_DEVCTL2_ARI);
-- 
2.54.0.563.g4f69b47b94-goog

