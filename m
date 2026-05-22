Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AD0388E48
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779481464; cv=none; b=JZ+g+wpUuG2xS9AgiH+pCtk2FqhU77NapdhAD2WqqYKK6ceKSeUwc8SiN7JIeeXXhkyZKGOMARIidJ52PUeHByf9NVTfuazCY5Pj6OvV9BWxJxZ+TOA1vRTlS+XMJi0LgxpwTpc4xEqOZ5bqijk0ImUyzcHK4cdjf1a4/+1u0Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779481464; c=relaxed/simple;
	bh=IFpekg4jIy49rcerxosa2lVjkpAOv3scOF7wzuEXqFc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T4Hu2QAed3ZytR+dY3nIc+wsohWbnPhMzQNidfL3c07TNMbN8TTlvwRX4ISVZvecxkXigt8SIUID62waKRxFiEMXWtDCqUWpjjqHlc2xsbyPg8jmQAuh2mOjWCd99PJUH4l7oJ8cQ+jgTftMGPRmXwkhARwxKJ99eaioKuUZYyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qguJmeAE; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qguJmeAE"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ba224c3ffdso182343515ad.0
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779481462; x=1780086262; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ELGOGHy4/KVLZOwsmSfN8vqnsYItcEyHVrWWGLC9A+w=;
        b=qguJmeAEyNwCF//WtcTI/B7p+Q0MIs0bPYpnm8aj1N8w3Q95W9c42wGvOR4TdrUOJr
         5OzHtSSUM4m/m3YMn0BIEwZ9SGyqLm8iG4KlV3JvLDvABA5gMHELreCMhVy+84QkQJbg
         W5mIpjoLopUxUHmwMuXEDQGRRNM27DvQSyUFN6smbFYAzOdc59l56NGClssvQ8p81Aod
         J5v+enlS1Z+/W8zBCOk0RSaO/q7T8OgSTVc1+NOTbH7FbOI495mg/QWsPTLjKMTChyHT
         umPHL4kbEI1zCSRlw3tEU5u4pst841Jn2Vk1erDyZicAF7PFd+WGAR01xx0Wprrc/wGb
         i4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779481462; x=1780086262;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ELGOGHy4/KVLZOwsmSfN8vqnsYItcEyHVrWWGLC9A+w=;
        b=fkppOrAmIzcquffADVDg5hyA/PvbBfwvXoZiULRc/uvLAUJpC3D+t1uSciQFe9PJ1B
         RCdGhGQwSwOJi1Q660HcGNqICqim7vjve7/UuXjrrhCCRt/2JO85xGI9bUOwjo0/Np8N
         q6+0Alr8UyUfnQWeWZ8GICihRd9JTiFj53AW41ll+2I2Z6yv2Ead+GhNqfEBrXB2ZCs5
         h12yTfNZDbLpj4Xt5pONg1NXpL8bYw0pi1v8DmtR3b+/IoElzbOZZ56gj4So93zveCPg
         qEDbIJeABgyxonXbW6LwRZjluGQJMlmJvQsqP3036iCBS+jCZgfyCkOvzNGAhse4hAvI
         x5Mg==
X-Forwarded-Encrypted: i=1; AFNElJ+w/xJt2IxoYY4fu189jwe+phgoTOvN2jh1/twKKcbCvT+AdZzYbLkfhw7pDvn4ucVyRVd0KjUgTx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8oE7uECpNDkT56pW/g/LPNoSW6LOaNNGVdIEAnn7CNbYPjYLv
	5q/OgvJvJWpc9TFgNyxwuYJqWXpTy4is8plsPoTU1zETrQ6nrLN9bTW+WrDE7pl/xzyZlAd0ICT
	E9QQ2ixHrW5M6iQ==
X-Received: from plgm11.prod.google.com ([2002:a17:902:f64b:b0:2ae:c50f:f4ec])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2b0e:b0:2bc:7c62:187 with SMTP id d9443c01a7336-2beb06133f5mr57599895ad.29.1779481461788;
 Fri, 22 May 2026 13:24:21 -0700 (PDT)
Date: Fri, 22 May 2026 20:24:09 +0000
In-Reply-To: <20260522202410.3104264-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260522202410.3104264-1-dmatlack@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260522202410.3104264-12-dmatlack@google.com>
Subject: [PATCH v6 11/12] PCI: liveupdate: Do not disable bus mastering on
 preserved devices during kexec
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

Do not disable bus mastering on outgoing preserved devices during
pci_device_shutdown() for kexec.

Preserved devices must be allowed to perform memory transactions during
a Live Update to ensure continuous operation.  Clearing the bus
mastering bit would prevent these devices from issuing any memory
requests while the new kernel boots.

Because bridges upstream of preserved endpoint devices are also
automatically preserved, this change also avoids clearing bus mastering
on them. This is critical because clearing bus mastering on an upstream
bridge prevents the bridge from forwarding memory requests upstream (i.e.
it would prevent the endpoint device from accessing system RAM and doing
peer-to-peer transactions with devices not downstream of the bridge).

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 11 +++++++++++
 drivers/pci/liveupdate.h |  6 ++++++
 drivers/pci/pci-driver.c |  7 +++++--
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index d404e64a4e55..a6f2790bc1bf 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -132,6 +132,10 @@
  *  * The PCI core inherits ARI Forwarding Enable on all bridges with downstream
  *    preserved devices to ensure that all preserved devices on the bridge's
  *    secondary bus are addressable after the Live Update.
+ *
+ *  * The PCI core does not disable bus mastering on outgoing preserved devices
+ *    during kexec. This allows preserved devices to issue memory transactions
+ *    throughout the Live Update.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
@@ -790,6 +794,13 @@ int pci_liveupdate_configure_ari(struct pci_dev *dev)
 	return 0;
 }
 
+bool pci_liveupdate_is_outgoing(struct pci_dev *dev)
+{
+	guard(rwsem_read)(&pci_liveupdate.rwsem);
+	pci_WARN_ONCE(dev, !dev->liveupdate.frozen, "Preservation status is unstable!\n");
+	return dev->liveupdate.outgoing;
+}
+
 /**
  * pci_liveupdate_is_incoming() - Check if a device is incoming-preserved
  * @dev: The PCI device to check
diff --git a/drivers/pci/liveupdate.h b/drivers/pci/liveupdate.h
index bcb0bc73d684..b266406aaac8 100644
--- a/drivers/pci/liveupdate.h
+++ b/drivers/pci/liveupdate.h
@@ -20,6 +20,7 @@ void pci_liveupdate_scan_bridge_end(struct pci_dev *dev, int pass);
 void pci_liveupdate_init_acs(struct pci_dev *dev);
 int pci_liveupdate_enable_acs(struct pci_dev *dev);
 int pci_liveupdate_configure_ari(struct pci_dev *dev);
+bool pci_liveupdate_is_outgoing(struct pci_dev *dev);
 #else
 static inline void pci_liveupdate_setup_device(struct pci_dev *dev)
 {
@@ -57,6 +58,11 @@ static inline int pci_liveupdate_configure_ari(struct pci_dev *dev)
 {
 	return -EINVAL;
 }
+
+static inline bool pci_liveupdate_is_outgoing(struct pci_dev *dev)
+{
+	return false;
+}
 #endif
 
 #endif /* DRIVERS_PCI_LIVEUPDATE_H */
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index f7a5e65a7c75..0b1f8d01d7a5 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -546,11 +546,14 @@ static void pci_device_shutdown(struct device *dev)
 	/*
 	 * If this is a kexec reboot, turn off Bus Master bit on the
 	 * device to tell it to not continue to do DMA. Don't touch
-	 * devices in D3cold or unknown states.
+	 * devices being preserved for Live Update or in D3cold or
+	 * unknown states.
+	 *
 	 * If it is not a kexec reboot, firmware will hit the PCI
 	 * devices with big hammer and stop their DMA any way.
 	 */
-	if (kexec_in_progress && (pci_dev->current_state <= PCI_D3hot))
+	if (kexec_in_progress && !pci_liveupdate_is_outgoing(pci_dev) &&
+	    pci_dev->current_state <= PCI_D3hot)
 		pci_clear_master(pci_dev);
 }
 
-- 
2.54.0.746.g67dd491aae-goog

