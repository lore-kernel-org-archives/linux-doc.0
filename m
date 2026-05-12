Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD25357D07
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 18:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778611744; cv=none; b=ThTiNb+cF/S59oi0yHgoHlq+9vR5TdcJT3ZnVdBL1U0cV3f+2RJ+eUm/djOCU8s/3JoB86PnFJUrOp889TC3DAC/MKlNn8H4GZ+2Qz4vG6xaxGQ1QdwUAPrdICc/xdUeNuSZUiMJZUZb2IfZ4f4/anh6PS94Tbcp7norL4G9RMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778611744; c=relaxed/simple;
	bh=DcYUqGBrMjbaUc6Mk7jCfWJIKE6QDjGPDqYU0wUrIlM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rhc1xC5odgQnwABoi/GazekjF3ngMcN/Vk52KSBV7Qxj0rbdVooFZWVJSlgDe3O8KutY7ih/O1MrnmEDreWU4Z4+cN15oTq5L5cGV+n2+R9dRNDEjG3dZBLHPVZ3l45i4OnUYklwmIQmCBGtdZRsHVh2HqeD6iiNJBiFzpxmBvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WhrRhSdw; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WhrRhSdw"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-83836443305so3372582b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778611740; x=1779216540; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zAKIEIbekI8e2jyBQPj/1aDykzqqCbaXW0rj6vQUpoI=;
        b=WhrRhSdwsFz6bAtsRM0A+/LCwBHSHxiVzzcj3kyvkjIwg/0DwsZcyaXXtvqaXJjxAU
         YxsHdZZHlWCojB9UAlWt+yBgfv+qFwZtpZddw6XQMHvcjJbSQAdOhhXl1YV4/f/fMOQt
         LNmupZjXR55NQ2rtw0AvC0VnahiuoXKk7rropEFEfAWGZhWBbuPS0JaZiFRtgPdUjRp+
         kYEC+UKsy9/CdAvt6nVtqcIBzKNxQFc4zzhnuEo3wRRm3NDl4MZ/2W1j3TtJL+tFGYiT
         B2Sy5H5fBWzs0BCCny2V8rOGJw8HS2k3fbUq2mQZr4LZ0QCgL3BFpMunaYBQ7FPsy+tQ
         ndhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778611740; x=1779216540;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zAKIEIbekI8e2jyBQPj/1aDykzqqCbaXW0rj6vQUpoI=;
        b=sYny8cg3vO6ygmvPrah4Bh3GYyThd2KLd7Ng7gHTnj2SrlXmHolNfYAZnxHvqRq15Y
         zihdhqvTgd1nB24HneDpAedEnzNEO9lxwtp19mI2gKtIjeUw5APtMV6aRktJYZzt6OlK
         wQ8WWeKQCWfqEYqx3UwShRnXucFplpXbGmnD/IgWRSqM3FXAMIPPAnVk+d7LoMLaNteA
         iZ3JUBmsIyW3jIJoQ/mja1nqQeGbe4tbOzS7l03UpU4gJoGjiKdzmS5wYp3A1nr+6HsF
         g2EEnj0es9+/uBt8f8jcdwv/KsAi+xDZKC/QY9t3PXfZP3iqguqEYd1UR38u+0YtBLwQ
         1jzw==
X-Forwarded-Encrypted: i=1; AFNElJ+Kq2cuV4a8M1PBf25SzOi9GBehAk0WPMtrx0WjaWdcS8o625bxs1/S+fF7fOYk6uaKnsN4hw8VhgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwKw7qpjzkzCVwXRfQNPTdfFN3gnqOYr3zTT7JHxBJes7msjoQ
	YDhBQyYyD3ebsCMQyhR30iaj5GUEd2hluiklDqmKSuL3i1031Xh9XY0ZEWb39Mrg4wob5E2Q/mL
	OIctPVGXaiQSj1g==
X-Received: from pfbks2.prod.google.com ([2002:a05:6a00:4b82:b0:82f:b296:c01b])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:12e4:b0:82c:f035:6748 with SMTP id d2e1a72fcca58-83a5dd560e6mr29210159b3a.42.1778611739675;
 Tue, 12 May 2026 11:48:59 -0700 (PDT)
Date: Tue, 12 May 2026 18:48:45 +0000
In-Reply-To: <20260512184846.119396-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260512184846.119396-1-dmatlack@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260512184846.119396-11-dmatlack@google.com>
Subject: [PATCH v5 10/11] PCI: liveupdate: Do not disable bus mastering on
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
a Live Update to minimize downtime and ensure continuous operation.
Clearing the bus mastering bit would prevent these devices from issuing
any memory requests while the new kernel boots.

Because bridges upstream of preserved endpoint devices are also
automatically preserved, this change also avoids clearing bus mastering
on them. This is critical because clearing bus mastering on an upstream
bridge prevents the bridge from forwarding memory requests upstream (i.e.
it would prevent the endpoint device from accessing system RAM and doing
peer-to-peer transactions with devices not downstream of the bridge).

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c |  4 ++++
 drivers/pci/liveupdate.h | 12 ++++++++++++
 drivers/pci/pci-driver.c | 31 ++++++++++++++++++++++---------
 3 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 825166a57913..6c4b57d8f780 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -136,6 +136,10 @@
  *  * The PCI core inherits ARI Forwarding Enable on all bridges with downstream
  *    preserved devices to ensure that all preserved devices on the bridge's
  *    secondary bus are addressable after the Live Update.
+ *
+ *  * The PCI core does not disable bus mastering on outgoing preserved devices
+ *    during kexec. This allows preserved devices to issue memory transactions
+ *    throughout the Live Update.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
diff --git a/drivers/pci/liveupdate.h b/drivers/pci/liveupdate.h
index 30deaa673efe..8ad404307a70 100644
--- a/drivers/pci/liveupdate.h
+++ b/drivers/pci/liveupdate.h
@@ -18,6 +18,13 @@ bool pci_liveupdate_inherit_buses(void);
 void pci_liveupdate_init_acs(struct pci_dev *dev);
 bool pci_liveupdate_inherit_acs(struct pci_dev *dev);
 bool pci_liveupdate_inherit_ari(struct pci_dev *dev);
+
+static inline bool pci_liveupdate_is_outgoing(struct pci_dev *dev)
+{
+	guard(read_lock)(&dev->liveupdate.lock);
+	pci_WARN_ONCE(dev, !dev->liveupdate.frozen, "Preservation status is unstable!\n");
+	return dev->liveupdate.outgoing;
+}
 #else
 static inline void pci_liveupdate_setup_device(struct pci_dev *dev)
 {
@@ -49,6 +56,11 @@ static inline bool pci_liveupdate_inherit_ari(struct pci_dev *dev)
 {
 	return false;
 }
+
+static inline bool pci_liveupdate_is_outgoing(struct pci_dev *dev)
+{
+	return false;
+}
 #endif
 
 #endif /* DRIVERS_PCI_LIVEUPDATE_H */
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index f7a5e65a7c75..b6c931ebd3be 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -532,6 +532,27 @@ static void pci_device_remove(struct device *dev)
 	pci_dev_put(pci_dev);
 }
 
+/*
+ * Disable bus mastering on the device so that it does not perform memory
+ * transactions during kexec.
+ *
+ * Don't touch devices that are being preserved across kexec for Live
+ * Update or that are in D3cold or unknown states.
+ */
+static void pci_clear_master_for_shutdown(struct pci_dev *pci_dev)
+{
+	if (!kexec_in_progress)
+		return;
+
+	if (pci_liveupdate_is_outgoing(pci_dev))
+		return;
+
+	if (pci_dev->current_state > PCI_D3hot)
+		return;
+
+	pci_clear_master(pci_dev);
+}
+
 static void pci_device_shutdown(struct device *dev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
@@ -543,15 +564,7 @@ static void pci_device_shutdown(struct device *dev)
 	if (drv && drv->shutdown)
 		drv->shutdown(pci_dev);
 
-	/*
-	 * If this is a kexec reboot, turn off Bus Master bit on the
-	 * device to tell it to not continue to do DMA. Don't touch
-	 * devices in D3cold or unknown states.
-	 * If it is not a kexec reboot, firmware will hit the PCI
-	 * devices with big hammer and stop their DMA any way.
-	 */
-	if (kexec_in_progress && (pci_dev->current_state <= PCI_D3hot))
-		pci_clear_master(pci_dev);
+	pci_clear_master_for_shutdown(pci_dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.54.0.563.g4f69b47b94-goog

