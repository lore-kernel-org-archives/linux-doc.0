Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041441;
	b=JoYjbvNn6fDpq7DYtpQaFC0ER5OizWx5IYV6qKkyVhkJB4zeO98dvBlPlePYFS+i+uPd
	 z1x7pOHvI7D/3ho7f5XfoyKlKHDvuZaiTVZA90XFiRnVesJ1CfSNbH6L5qH8+A5x2vE82
	 HQGHxTNrWFDwBvbkmeU7LGoaDMENjOMYEUNUhThz3R6coYzjrgWBJ9U11KchIgXD+N8zc
	 G+aCnm2GXy/J4Z6tIj4JLzu5Nt67YTzT4mZZC5aC/8DPJme+ZUJNROqq8xd1dizKGUB01
	 R3a2tKiy5W0vmja7+JQbLtYe7+gPr9FfTZAwdmZR/g4wivJFDLeFUoWDAs8sMc4fl7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=xKsd+4T8Z5gmC4mac6DyE/MToWM5vKEbChkw2+nF2a0=;
	b=NV4d4hinwtCmgRPRpRJqxdw70Uc9OS+oGy2vgc7XTXXwZj1WYS+esESn5KcslpjZ+g6e
	 Dv5aK+HEOouItLQc1h76XjfAzegZauAKFFIxfTjz4prdbtgmlt/0dKyimbcOzZn9zCawG
	 cfpDcQgN6FtHDLnkZROjISZu+nBF8r0P/rQ1+273NXzuDp4ASvy+CheKiOJc67F56gDhK
	 IDeTTOR7AkAz0MfTHJFyJwhEQCbjOmHuEquTpZsZZuR/jxSGLtQKd1EwjgGhQTST266w7
	 UdQeuvgF69upfYIErfWItxYqbPMTUK8RE3dZPnpxOpnRoKZVXkAx6Qo0o3mnATuX+nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UQbh+9Z6;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F62660A6F4C
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 22:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F62660A6F4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UQbh+9Z6
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b37620eb73so2010389b6e.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 14:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795041440; x=1795646240; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKsd+4T8Z5gmC4mac6DyE/MToWM5vKEbChkw2+nF2a0=;
        b=UQbh+9Z6B+xucjHah9eOB0kKmI5vBP8pSw5ZPXT3FZG9vL+XW8gT59A9SK5p9D6Nrn
         uEOlnJjhuZMldhbgMwkw3oMPDQjH42eeXr5XGArWq0WoYsugJ42zxQ0ruLO8dwX2sti2
         jJftxkpF/d34IZ1bXqU1hrY2ohquRD/SSiFsS6zBeT9rdph824Hh/QUd7XlVf/iWYmTH
         RHXUQmM3aED+S6W7O0swsPNJBUFxDEHJNBy6XBCcXHJm8t1VU6tA2EHl1g48rIm3g/IU
         N685GBI3kVhzxgbZtM6HA2YGW3u1nft73d7mjixEgQvFEqnSObNzXTP+KiwYJdpj8yHT
         t7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041440; x=1795646240;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKsd+4T8Z5gmC4mac6DyE/MToWM5vKEbChkw2+nF2a0=;
        b=yO6QbzWDOCmLO0w0KQJ2b+0DVOMq1v6VTbp0llzqmw9v+2GZn/0RXp8zuaOYcvkdjQ
         dDsrc7n63xbiTb9++HGswytNwt1Y8rUG5DGrBfH5DMBu4FaJw0d4ZXkMCug4Wh2hmMNt
         xRf2kgEoXcsSG7tTlZGCunMOyj048yaQk7zu+XZeBSqDhdhGZzA+bUwWfgMOTedhG5yw
         wqwygYoNgi/ElxBu4EVKEPHnG1GV1oboTMetwlHbawMPJgVjq5zQ72K0VaPAIIckgYKM
         6Kwwi75BiYjG7iC6PWHVSE4sswTIphjXhYRom8pdq8awy2g2eM4L73u3TVEAaaHZM7aP
         DcXA==
X-Forwarded-Encrypted: i=1; AL+hErGtwE6WnVHNL0Z5d8q3yP6u0HWAtvLETj1tyeO+PUzUiao2TGgI+/sxWF925RXerDLoF2Fm7PH5Fng=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GKuMo6jkNVJHa85eLLntXli1jT982x3EtYCCrM/MaHGrSaySh
	z9q7ULf35XBq9GtGlhHjejdTvvi0Pgho8RHD35diVXoF+fu4s/b66uPK0LGqPknbQRB8V8GyiAG
	RbeyWtsiZFie/hQ==
X-Received: from jaac16-n1.prod.google.com ([2002:a05:6638:c750:10b0:61b:3a7f:4e5e])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6f81:b0:577:2888:47b3 with SMTP id 5614622812f47-57742e34681mr4186856b6e.44.1795041439732;
 Wed, 18 Nov 2026 14:37:19 -0800 (PST)
Date: Wed, 18 Nov 2026 22:37:01 +0000
In-Reply-To: <20261118223704.3286085-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118223704.3286085-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118223704.3286085-11-dmatlack@google.com>
Subject: [PATCH v11 10/13] PCI: liveupdate: Adopt ARI Forwarding Enable on
 preserved bridges
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Alex Williamson <alex.williamson@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Down <chris@chrisdown.name>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Adopt the ARI Forwarding Enable bit on preserved bridges and update
pci_dev->ari_enabled accordingly during a Live Update. This ensures that
the preserved devices on the bridge's secondary bus can be identified
with the same expanded 8-bit function number after a Live Update.

Adopt the bit even if pci=noari is passed, and document this in
kernel-parameters.txt. The previous kernel may have enabled ARI
Forwarding, and the preserved devices below the bridge rely on it.

pci_liveupdate_adopt_ari() updates the bridge's ari_enabled the same way,
and from the same context, as pci_configure_ari() already does when it
enables or disables ARI Forwarding on the bridge.

Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  5 ++-
 drivers/pci/liveupdate.c                      | 36 +++++++++++++++++++
 drivers/pci/liveupdate.h                      |  6 ++++
 drivers/pci/pci.c                             |  8 ++++-
 4 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d1ef1c93ec96..cfa5f18a6fb5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5239,7 +5239,10 @@ Kernel parameters
 				off: Turn realloc off
 				on: Turn realloc on
 		realloc		same as realloc=on
-		noari		do not use PCIe ARI.
+		noari		do not use PCIe ARI. Bridges above devices
+				preserved across a Live Update keep the ARI
+				Forwarding Enable setting from the previous
+				kernel.
 		noats		[PCIE, Intel-IOMMU, AMD-IOMMU]
 				do not use PCIe ATS (and IOMMU device IOTLB).
 		pcie_scan_all	Scan all possible PCIe devices.  Otherwise we
diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index b99a88c2c199..a45ad86370d5 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -188,6 +188,11 @@
  *    same after Live Update. Note that a device will use its adopted ACS
  *    controls for the lifetime of its struct pci_dev (i.e. even after
  *    pci_liveupdate_finish()).
+ *
+ *  * The PCI core adopts ARI Forwarding Enable on bridges above incoming
+ *    preserved devices, even with pci=noari, until all preserved devices below
+ *    the bridge have finished. This keeps the preserved devices on the bridge's
+ *    secondary bus addressable with the same function numbers.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
@@ -891,6 +896,37 @@ int pci_liveupdate_adopt_acs(struct pci_dev *dev)
 	return 0;
 }
 
+/**
+ * pci_liveupdate_adopt_ari() - Adopt ARI configuration
+ * @dev: The PCI device to adopt ARI configuration for
+ *
+ * For devices preserved across a Live Update, read the ARI state from
+ * hardware and adopt it. This ensures the device continues to use the ARI
+ * configuration established by the previous kernel.
+ *
+ * Return: 0 on success, or -EINVAL if the device was not preserved.
+ */
+int pci_liveupdate_adopt_ari(struct pci_dev *dev)
+{
+	u16 val;
+
+	guard(rwsem_read)(&pci_liveupdate.rwsem);
+
+	/*
+	 * Unlike ACS, only adopt ARI while the bridge is incoming-preserved.
+	 * Once all devices below the bridge have finished, recomputing ARI
+	 * Forwarding Enable yields the same result for the same device, and
+	 * must be allowed to change if a different device is hot-plugged.
+	 */
+	if (!dev->liveupdate.incoming)
+		return -EINVAL;
+
+	pcie_capability_read_word(dev, PCI_EXP_DEVCTL2, &val);
+
+	dev->ari_enabled = !!(val & PCI_EXP_DEVCTL2_ARI);
+	return 0;
+}
+
 /**
  * pci_liveupdate_is_incoming() - Check if a device is incoming-preserved
  * @dev: The PCI device to check
diff --git a/drivers/pci/liveupdate.h b/drivers/pci/liveupdate.h
index c643f2664296..e1c1d2fa00e4 100644
--- a/drivers/pci/liveupdate.h
+++ b/drivers/pci/liveupdate.h
@@ -16,6 +16,7 @@ void pci_liveupdate_cleanup_device(struct pci_dev *dev);
 bool pci_liveupdate_preserve_bus_numbers(void);
 bool pci_liveupdate_refuse_bus_numbers(struct pci_bus *bus, struct pci_dev *dev);
 int pci_liveupdate_adopt_acs(struct pci_dev *dev);
+int pci_liveupdate_adopt_ari(struct pci_dev *dev);
 
 static inline bool pci_liveupdate_was_incoming(struct pci_dev *dev)
 {
@@ -46,6 +47,11 @@ static inline int pci_liveupdate_adopt_acs(struct pci_dev *dev)
 	return -EINVAL;
 }
 
+static inline int pci_liveupdate_adopt_ari(struct pci_dev *dev)
+{
+	return -EINVAL;
+}
+
 static inline bool pci_liveupdate_was_incoming(struct pci_dev *dev)
 {
 	return false;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index ebc565b4780a..b5b578355a1b 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3748,7 +3748,7 @@ void pci_configure_ari(struct pci_dev *dev)
 	u32 cap;
 	struct pci_dev *bridge;
 
-	if (pcie_ari_disabled || !pci_is_pcie(dev) || dev->devfn)
+	if (!pci_is_pcie(dev) || dev->devfn)
 		return;
 
 	bridge = dev->bus->self;
@@ -3759,6 +3759,12 @@ void pci_configure_ari(struct pci_dev *dev)
 	if (!(cap & PCI_EXP_DEVCAP2_ARI))
 		return;
 
+	if (!pci_liveupdate_adopt_ari(bridge))
+		return;
+
+	if (pcie_ari_disabled)
+		return;
+
 	if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ARI)) {
 		pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
 					 PCI_EXP_DEVCTL2_ARI);
-- 
2.56.1.703.gf848ed807c-goog

