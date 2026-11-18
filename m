Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041440;
	b=HV9Gs2UnmshKOCm6NleEQMaHdpkyeCM5AWz/zD7pohiASd64vO+hlo+sdeXOq7znM5WG
	 T2ZBJAEriTa/R6Msq4NpCQMq/Dk4uym8XgvrEFUZduTDzp9AT0xAbd3gvigjWGz5BVjCt
	 eSyYatgPdEA0D5DQw0XC2/HjokSJU3FsgUTI/mt+SBJ6KcXArIyqXZK43y0epEJ28udBv
	 dLdsfLwdozSP/Wo2p4qSalf8jsKttWMRMThsbgkRYB1X28AE2IYhiyLMVGR2UPZmPNh/Y
	 QGy+gY3ti3fozXk9KIYN9rDEYFOaRqYsdGy537cJVkWsx0mXviGLzk2rQe6yG+kx22Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=KVjRZjTDUQlUGtechd3ID8jkuJ5EsKID0iByl55GGz4=;
	b=lQnTUO5dGMFvC9Vvvw2qSUTlWzZsM/RfosswMzyky49SBJq4eoUWlvBKelKRfHpxsGNg
	 sIn5vCTQVUMkzqTTceohJBbylfmh0CAfXVNgf2SADbBMxObryePrG+vxfbwyqcmpBwwBf
	 jLUvqbl/P8XfF1xmAT4gBeXc5dyOkjUCkDWgDVeXvH3OiBSlTwcyltX7o3bTgc/hm/nMo
	 A0Aslt5LCptgiPvyhIENFQ2faZ1s2g06mW9TQTzmlUISy3uSBamifea7mZRdqUn/CwFI9
	 MK2tuyYCsFj0yUlYeOLc7H1RTjjSpG+0pnka7+0owfJCFh1Q5NQJvj6o7ewRkv1zBVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Glb6O4ks;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FAA60A5BCF
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 22:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6FAA60A5BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Glb6O4ks
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c55ba309c2so1530004b6e.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 14:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795041439; x=1795646239; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVjRZjTDUQlUGtechd3ID8jkuJ5EsKID0iByl55GGz4=;
        b=Glb6O4ksQTey4OdKgVli/IIBwyAGetVk2/m8QVJFNcXO6CWWgf8gyBIFBFskq0u4lA
         MNOd/6Di1imhk5g0GGLptuJMnIOMqpITe/HYXAhZFgUYKu7M51i/k8xq7rGtHfh6Kzty
         yn6C1/vd3/VO+sCB1Pixu27iHl6Ur9UqDfvdTd6MP9zgSgH5dM5PX8fVlXSsw4DWjHtx
         X7/wZPativkGeYHx0byN+p/yKrFhZavr5crbizoWdT2RenHxV7HUrg0aK83EZggZX3Il
         pl7HfOqXQ8x/S1ZxiVrqOTb01fR4F/ZQKgxA6Z75K3akkYCJu0IpQ3LsBYyzo6lrjCw6
         Y5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041439; x=1795646239;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVjRZjTDUQlUGtechd3ID8jkuJ5EsKID0iByl55GGz4=;
        b=T4mxgtqwE8ExStTYU4Rx7EjFeAZHJwDfJjyTy2/IJbZt34YfOJqhIJJM0s8kfai1Nn
         FF3gaCU/9Ed+tNNX8sEls4C8U1cDkkTtLGVMc+pEX+DZGg/Eu6OY46aP4OC4xVZfHrVR
         7C4QHnvJ6pcIm64CVbXl4T/j8wzBKC2Mo21MjJEtfoWXelG/5ix2Bsr81NKKC8B2uW2j
         XACzIvoYZLnJ5/axMEm7vvWlDe19ncQoesQsD7FfrgjQ3UHVPx6KjD+CetXlbFJ1WxJo
         lX2GArdntvAk69zS8eQiBc53AjS5kamAQyW5SKPxL/UEnUWEJnkd/rY5jBSCUGw6vDxR
         Qe+w==
X-Forwarded-Encrypted: i=1; AL+hErE/cPDTYrqBw6LkMZ67J2gpeZ1gmkF8dR+DU04b0mgzAszrqv6q5ryw9Lr1FSJQraLumFA3nI/MOyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OfWxBc1VGXJG6uWnoPC+tTSbiCBAsdKvbv+dWPEHtvT463LLn
	pXkDrUFUHLaJabYQ8e9W1l/H+e82oYNlAbhzOyYkrKY2PBbv5k5/so6V1MO3MAfWPtZGeZA5X4x
	pHRwZEtkjOmaU6w==
X-Received: from ilb5-n2.prod.google.com ([2002:a05:6e02:5305:20b0:53c:e043:6f2d])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:13c4:b0:572:a102:ad54 with SMTP id 5614622812f47-5773d028248mr4248721b6e.40.1795041438457;
 Wed, 18 Nov 2026 14:37:18 -0800 (PST)
Date: Wed, 18 Nov 2026 22:37:00 +0000
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
Message-ID: <20261118223704.3286085-10-dmatlack@google.com>
Subject: [PATCH v11 09/13] PCI: liveupdate: Adopt ACS controls in incoming
 preserved devices
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

Adopt Access Control Services (ACS) controls on all incoming preserved
devices (endpoints and upstream bridges) during a Live Update.

Adopting ACS controls avoids changing routing rules while memory
transactions are in flight from preserved devices. It also keeps IOMMU
groups from changing during or after Live Update.

The adopted controls are recorded by the pci_save_state() call in
pci_bus_add_device(), which runs before drivers bind, so they are
reapplied by pci_restore_state() if the device is reset. Allocate the
ACS save buffer for incoming preserved devices even if they match a
device-specific ACS quirk, since their adopted controls live in the ACS
capability, and panic if it could not be allocated.

To simplify ACS adoption, reject preserving any devices that require
quirks to enable ACS as those quirks would also have to take Live Update
into account. If such a quirk matches an incoming preserved device
anyway, e.g. because it was added in the new kernel, log a warning and
adopt the device's ACS controls regardless, rather than reprogram a
device in the path of a preserved device's memory transactions.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 75 ++++++++++++++++++++++++++++++++++++++++
 drivers/pci/liveupdate.h | 16 +++++++++
 drivers/pci/pci.c        | 13 +++++--
 3 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 00d6fa5236e9..b99a88c2c199 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -123,6 +123,9 @@
  *
  *  * The device cannot be a Virtual Function (VF).
  *
+ *  * The device cannot require device-specific quirks to enable Access
+ *    Control Services (ACS).
+ *
  * Driver Binding
  * ==============
  *
@@ -174,6 +177,17 @@
  * bus, since the bus numbers of the failed bridge can no longer be read from
  * hardware and handing them to another bridge would let an unrelated device
  * inherit the BDF of a preserved device.
+ *
+ * Handling Preserved Devices
+ * ==========================
+ *
+ * The PCI core handles preserved devices differently in the following ways:
+ *
+ *  * The PCI core adopts all ACS controls enabled on incoming preserved devices
+ *    rather than assigning new ones, so TLP routing and IOMMU groups stay the
+ *    same after Live Update. Note that a device will use its adopted ACS
+ *    controls for the lifetime of its struct pci_dev (i.e. even after
+ *    pci_liveupdate_finish()).
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
@@ -189,6 +203,7 @@
 #include <linux/slab.h>
 
 #include "liveupdate.h"
+#include "pci.h"
 
 /**
  * struct pci_liveupdate_global - Global state for PCI Live Update support
@@ -540,6 +555,15 @@ static int pci_liveupdate_preserve_device(struct pci_flb_outgoing *outgoing,
 		return -EINVAL;
 	}
 
+	/*
+	 * Do not preserve devices that rely on device-specific ACS equivalents
+	 * since that would complicate keeping ACS constant across Live Update.
+	 */
+	if (pci_need_dev_specific_enable_acs(dev)) {
+		pci_warn(dev, "Refusing to preserve device that relies on ACS quirks\n");
+		return -EINVAL;
+	}
+
 	if (dev_ser) {
 		/*
 		 * Endpoint devices can only be preserved once. Bridges are
@@ -816,6 +840,57 @@ void pci_liveupdate_finish(struct pci_dev *dev)
 }
 EXPORT_SYMBOL_GPL(pci_liveupdate_finish);
 
+/**
+ * pci_liveupdate_adopt_acs() - Adopt ACS controls
+ * @dev: The PCI device to adopt ACS controls for
+ *
+ * For devices preserved across a Live Update, leave the ACS controls
+ * established by the previous kernel alone instead of programming new ones.
+ * The adopted controls are recorded by the pci_save_state() call in
+ * pci_bus_add_device(), so they are reapplied by pci_restore_state() if the
+ * device is subsequently reset.
+ *
+ * Panics if the device has an ACS capability but no ACS save buffer, since the
+ * adopted controls would be lost on the first reset.
+ *
+ * Return: 0 if the ACS controls were adopted, or -EINVAL if the device was not
+ * preserved.
+ */
+int pci_liveupdate_adopt_acs(struct pci_dev *dev)
+{
+	/*
+	 * Check if the device was preserved over a previous Live Update (even
+	 * if it has already gone through pci_liveupdate_finish()). This ensures
+	 * that the device continues to use the ACS controls established by the
+	 * previous kernel.
+	 */
+	if (!dev->liveupdate.was_incoming)
+		return -EINVAL;
+
+	/*
+	 * The previous kernel does not preserve devices that require
+	 * device-specific quirks to enable ACS, so the controls being adopted
+	 * live entirely in the ACS capability. If such a quirk matches anyway
+	 * (e.g. it was added in the current kernel), ignore it rather than
+	 * reprogram a device in the path of a preserved device's memory
+	 * transactions.
+	 */
+	if (pci_need_dev_specific_enable_acs(dev))
+		pci_warn(dev, "Ignoring device-specific ACS quirk, adopting ACS controls from previous kernel\n");
+
+	/*
+	 * The adopted controls must be captured in the ACS save buffer so that
+	 * they are reapplied if the device is later reset. Without it, e.g.
+	 * because it could not be allocated, the first reset would silently
+	 * drop them.
+	 */
+	if (dev->acs_cap && !pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_ACS))
+		panic("%s: No ACS save buffer for preserved device\n",
+		      pci_name(dev));
+
+	return 0;
+}
+
 /**
  * pci_liveupdate_is_incoming() - Check if a device is incoming-preserved
  * @dev: The PCI device to check
diff --git a/drivers/pci/liveupdate.h b/drivers/pci/liveupdate.h
index e5d2a19d2ca2..c643f2664296 100644
--- a/drivers/pci/liveupdate.h
+++ b/drivers/pci/liveupdate.h
@@ -15,6 +15,12 @@ void pci_liveupdate_setup_device(struct pci_dev *dev);
 void pci_liveupdate_cleanup_device(struct pci_dev *dev);
 bool pci_liveupdate_preserve_bus_numbers(void);
 bool pci_liveupdate_refuse_bus_numbers(struct pci_bus *bus, struct pci_dev *dev);
+int pci_liveupdate_adopt_acs(struct pci_dev *dev);
+
+static inline bool pci_liveupdate_was_incoming(struct pci_dev *dev)
+{
+	return dev->liveupdate.was_incoming;
+}
 #else
 static inline void pci_liveupdate_setup_device(struct pci_dev *dev)
 {
@@ -34,6 +40,16 @@ static inline bool pci_liveupdate_refuse_bus_numbers(struct pci_bus *bus,
 {
 	return false;
 }
+
+static inline int pci_liveupdate_adopt_acs(struct pci_dev *dev)
+{
+	return -EINVAL;
+}
+
+static inline bool pci_liveupdate_was_incoming(struct pci_dev *dev)
+{
+	return false;
+}
 #endif
 
 #endif /* DRIVERS_PCI_LIVEUPDATE_H */
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index fc4307a2327d..ebc565b4780a 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -35,6 +35,8 @@
 #include <linux/aer.h>
 #include <linux/bitfield.h>
 #include <linux/suspend.h>
+
+#include "liveupdate.h"
 #include "pci.h"
 
 DEFINE_MUTEX(pci_slot_mutex);
@@ -1071,9 +1073,13 @@ static void pci_allocate_acs_save_buffer(struct pci_dev *dev)
 	/*
 	 * Devices that rely on device-specific quirks to enable an ACS
 	 * equivalent keep that configuration outside of the ACS Control
-	 * register, so they are configured from scratch on restore.
+	 * register, so they are configured from scratch on restore. The
+	 * exception is devices preserved across a Live Update, which always
+	 * adopt the ACS controls established by the previous kernel and need
+	 * the buffer to keep them across resets.
 	 */
-	if (pci_need_dev_specific_enable_acs(dev))
+	if (pci_need_dev_specific_enable_acs(dev) &&
+	    !pci_liveupdate_was_incoming(dev))
 		return;
 
 	/* dev->acs_cap is not set yet, pci_acs_init() runs later */
@@ -1170,6 +1176,9 @@ void pci_enable_acs(struct pci_dev *dev)
 	bool enable_acs = false;
 	int pos;
 
+	if (!pci_liveupdate_adopt_acs(dev))
+		return;
+
 	/* If an iommu is present we start with kernel default caps */
 	if (pci_acs_enable) {
 		if (pci_dev_specific_enable_acs(dev))
-- 
2.56.1.703.gf848ed807c-goog

