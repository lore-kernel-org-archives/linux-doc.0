Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05191387563
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 20:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779481463; cv=none; b=MBlCNKXg0vDN10JLybGI+wyRsqz/9ZsQzfhe6N7wpqtBXCBnsJx1euuIP2opgw/fytKa6MSp1eamZzefh2bRdfaniB4THJUMQ222NP+jwGxld/IeXgOYXk0lhbuypi+GERviRZg/YBsSaPI3QvZ2pWVs7Gow/5pAGBV+b1NzTmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779481463; c=relaxed/simple;
	bh=M12PKwo0dxZ6h9CLBntX9VgSZgyJgAD7fUgsyUi7EWo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OLOqWn1icMpGRecEkuFQiI2JnWZS2fKAVQG+x3GgY0JWQUHoJyyfTpAojEROFlwfxHHZ9/j2lUKVLzrMH2EBWzZ6dGvfI9lGlO0Rq9010b+evFqoscD00bBXhCJhuQVzXAA/PKWDqnS5Zm+aWTJB/m7SYTKMGKaIp5xaL5rOLKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FxYK7h4C; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FxYK7h4C"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c8525f0807aso719075a12.3
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779481460; x=1780086260; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=07zUHNcjisF6FOuU9N0CtQnOBIzxNou2anoHgJH+mP8=;
        b=FxYK7h4Crfrtl9ufsAWbjHdznPyS0vFLwO2WYTtW+NeX/xJfutPDg6CFnia2HDadI/
         s7GUqPhf8vJ/nt+qOHtxMpQ0g5zngpBu63bK8J0G6ZufvigJgKrgAhG1m1a7X2Pjw1WR
         64mo25KF2A4rAdqcV4pHqKGcC9kq1W2Mc+ghaC+u6127ggjrO/po8FDddAlcWE4jd/PF
         mDObKbQo2F74NQIijFNTZ3o/re/SRnzcQ1ELFadNAniD1Con8F/3xG4Q4CsKJuqFJw38
         o+eCrRepIZEu2ktCvS7VH7hRbkDpdCA1BF72F235r+ZeAkhQ/oGLE4KoeFaFlaug2hUe
         vlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779481460; x=1780086260;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=07zUHNcjisF6FOuU9N0CtQnOBIzxNou2anoHgJH+mP8=;
        b=XbREpi41TofkV+7jJ2dc8c4Z9KiDDFO3LoYmPhiZJslZvoOS5e8l+tnWPYr4nlZNEV
         2kA7nHoNP3ZiV/yzWGPzAsfmjcX+YrhsO7gEN8xxCD+zi9xAHusgEvJWSgbZZtWoWoQr
         8ldZhq2zTUJC08eWuYaJlw6hGNbGp8LaPBr4h2mWtDZkoFVpTSi8Gq+CImK2EN1uDjhm
         aEFM+oLXdHqiMXv6sn4b8WDp15TwXnBhgEH36XGy2SFMiMPBEHLbFfOj567NYC7NVuiv
         tYJ/somNGMoKSQqUtb1+xWpj6kvZDKAiBTHwzTgxaoi5pmNHMBQ7OxTLmYfOO4iOxM9X
         SXbg==
X-Forwarded-Encrypted: i=1; AFNElJ+pfPMyjPxUjYbOj6OJOQIUs9uZASotZBS0msr06inaOt39BLFrCeknkiGCHaPITGRFjmhVjH36OPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtRmM5vL1wM0IZp7H463LzU1Z/nUaB685zlqzIWFjtgODCpneE
	CNEMfHGLqlcR0ifPOWGwqmoYcdmsVr/B0Wo7JXWBnxKAch2FBOknCmi1P3WfDxNjdM+uLOG2JuO
	RrebN27Fr3M0ryg==
X-Received: from pgt6.prod.google.com ([2002:a63:1346:0:b0:c82:7a06:d5f5])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:d709:b0:3b3:c28:45b3 with SMTP id adf61e73a8af0-3b328e4f8d7mr5132386637.26.1779481459861;
 Fri, 22 May 2026 13:24:19 -0700 (PDT)
Date: Fri, 22 May 2026 20:24:07 +0000
In-Reply-To: <20260522202410.3104264-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260522202410.3104264-1-dmatlack@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260522202410.3104264-10-dmatlack@google.com>
Subject: [PATCH v6 09/12] PCI: liveupdate: Inherit ARI Forwarding Enable on
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
index a93b7ef065f2..701276ef6cfb 100644
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
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
@@ -756,6 +760,20 @@ int pci_liveupdate_enable_acs(struct pci_dev *dev)
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
index 211df4618164..271da55af270 100644
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
2.54.0.746.g67dd491aae-goog

