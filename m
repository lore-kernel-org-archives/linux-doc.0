Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E1F3BFAC8
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 21:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718797; cv=none; b=ZQpeLhplfhuzKTfQeLmQ9DgnC3vPtYpxEpoWkF0d9bBAMpstjVpcvQXtwuGpKp6yRQH0aYLn8zzJBhqYgKfEORF591RYPhdUuMd0GabpZIVSxD/HMtlOipybQIffc1KKE+CXldKdXZ77lVMwtc2BZ04vI7QZeHdYq/81LIwDPUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718797; c=relaxed/simple;
	bh=4e+6sLDNIk2wfvCbSyulceEmFWyfLO94oPNauemCv6c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C4bU/M//L0GSuMVhsj0L9vYm5GvZggj0jPAyWr1+1XVtvWs0SJLT8XzHk/Sb6oKSeDC1OfA0+R9+l0JjX4kbaLK19LbctkKA1rYssfS+LLjQ8SBku/g++LKDiJDkePEn9KZcLREI5c+hjaZlGikjG182CKVCuGaikcnjl5XDV8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dzuPULIx; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dzuPULIx"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8484b57b98bso2195107b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 14:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783718792; x=1784323592; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kC0I5yGr+D5g0K5ia+KYUwEESYLYNJwODX2HQMDkX0U=;
        b=dzuPULIxfnJDuQZCsxrlyrQ9HiV7atBeekHS28RTW64/kaQ1OSnP7oDmGdd0TYb+Eh
         +DY2DWZ+Fd3RYkz9Q+1I7USghsI8WXlis0Juh2odYIla8IbteyTl6bLMLUGMW25zu2KZ
         i+YxFFNVDUseUU9/j9y3JawZHwk6xAu/Nx6E2Jry+ubKZ6l5U1ey5a+bRZ4m8yf+8lUC
         KUoVZv+hveOtD13wcOgQSBnF1pwxLxfxZrkISmORk05Siy0NcBAJqK76+Immo0g7k2y0
         u9MGEjQ/4vRbmDCncZ4Q3f8i7T41NC+Nbc+C13mYVJQ0tt4klUUatc4q0X8czgbHZN2a
         YwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718792; x=1784323592;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kC0I5yGr+D5g0K5ia+KYUwEESYLYNJwODX2HQMDkX0U=;
        b=VgFLgMvt+gsWsMcPe9GuJNMQCY7LgP5F86EpgqqdYKFRGvtYbc11Uo2+0cW/p17eb+
         gMqVSwr9LA1DAa6asZ22UbFpd3DT9s7cVCjmc//Eo0/AaNB05wM6p0zX7tafUpLFtv5A
         YejFG4/biz1u2QRoRJ2QC/jHC+2lcbc4u4ynk12T6C90Bzc3Kcn3WAuUYj+7tr7SUzsS
         wQfsb30kQNF4nZfrst9ZeWKAoNm9JM+sxZHzUp0q3C17WoZ2cnTDPJgq1lVzrscJ1+4g
         Sg3yiEFfk7yibLxAHsyJMqIRMGEXq73GiuUb5/mjE23bwboxe+BA3smlRKboF9+Wlw39
         DTAw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5jfsSzSQaT31hYDP9fF6wGbs0ILZQFPG2+iBq8lb8O9EAezUsmmgUa6rgq6qEWzxundbq+Zm2H/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhbJolqKAq6iPi1wkPi6Mn72ucNA7VRJ2FJgT3bDOmdFCYaLDT
	inujtOscWCUcEvtPLIEFZuqSDCfzy3bAtwKxqGryfKBc5k+k59aul1VoA7QrThTnbx0QGXoiB21
	sWGf+ttDC7Nu4Lw==
X-Received: from pfcs28.prod.google.com ([2002:a05:6a00:6fdc:b0:847:8189:3c6c])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:14ce:b0:848:2f73:8ff6 with SMTP id d2e1a72fcca58-84889770231mr613896b3a.63.1783718791956;
 Fri, 10 Jul 2026 14:26:31 -0700 (PDT)
Date: Fri, 10 Jul 2026 21:26:14 +0000
In-Reply-To: <20260710212616.1351130-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260710212616.1351130-12-dmatlack@google.com>
Subject: [PATCH v7 11/12] PCI: liveupdate: Do not disable bus mastering on
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

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 11 +++++++++++
 drivers/pci/liveupdate.h |  6 ++++++
 drivers/pci/pci-driver.c |  7 +++++--
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 64052892ea84..5935e88de073 100644
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
 
 #define pr_fmt(fmt) "PCI: " KBUILD_BASENAME ": " fmt
@@ -850,6 +854,13 @@ int pci_liveupdate_configure_ari(struct pci_dev *dev)
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
index 51616e4327d3..47cb3dcaa927 100644
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
2.55.0.795.g602f6c329a-goog

