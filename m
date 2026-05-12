Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B59365A19
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 18:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778611739; cv=none; b=LBHxeaeZrULyQyyTXDWPdXcHmJXsCFZOebFFFwR1IUIBC5vkDl7cn4goQf+uZBy4+fLPWQ+kfn87zUWmQhOvvOLg+5dzWoBUhR9ASV1Ef4kS7RWlG+jjgUW0Yd6i+TLndSOw4fG8eywqyst9sx3iFcgSkaXinoFrBMCV9IBCjlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778611739; c=relaxed/simple;
	bh=lBdWDi35NNqFmqXaRbQ2s98ezBbUQje6xGA4iH11lV0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oBA5MVWk4DelfC/9YQawytts/gfX3oyApvDLyJCxX6en16YH3bzLR+JtG+SksYkFXnY0fQKJFfi7yj6tcTYg9PxgCKu6laPbb1BObk/niGPVAvqURwxNGXR8pDpQZ8a4+pebMhHQ0ao/G9YpqnTFXfq57f2Onh0s05tHYMhuXYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o6LhBKGV; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o6LhBKGV"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso3535592b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 11:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778611736; x=1779216536; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f/ffX7NZKMXtWZsAVnQEQAODhtui4k/+NBvalJZrS3c=;
        b=o6LhBKGVd9LJkgPuADowotSV6vxPU4IMX27dr7P/D6eW0i0K20ieKC0io2HITQL3oX
         59C9bz/z7Skr4MRSMa7r/n2WhNEFrq3wwCsusl63+u2Y8N2pJmozMHmcgU81IRb1fvKu
         9gDjqtfA4oxCz/5+gfox5dcwsrzXVn6ezIpDB9t0GJal8mRLDGa3k8HA0I7CPtERvp98
         DnQTeUNGLmR4w8yhXmt6gxOBI/KRLSmS5kcmtINiFH1ZczISpvbWdlYIQfhupZNruchE
         iXYgCv2E0L/iu0ohTcG1qdCxBspYGLU5IbYG8gg9PK7RcbWyUaZxuqgLgNdx6LpvRlT0
         eoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778611736; x=1779216536;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/ffX7NZKMXtWZsAVnQEQAODhtui4k/+NBvalJZrS3c=;
        b=ejf2jsOaBjBj3JxA0V5Hv2Cnudzbo03Ev75CX78ruIgLxxbJy7FjAc4bbVZqN68n6S
         UqHrssjH02MqEw1GqW657DxqYQiiAF9g7ExaynAyURGNi7jsa6tH3p7xybbXIeKbQWiQ
         r3+/zHuzrXJxtdRUNm33joYkcWXf4L2O/LXwt/SkLbNlmqw6EkXaf+C/w4/CTypsto6M
         MwZhEcXgK7Dp0V4UjvPJuNZRLbJXh4fFC56VvykfPI+m52OuLuAZN3QitmmOS9J6tEqA
         LjFOHk6DQZjuf/sMevtbg0MTRDIS5o+RWc/8CRZZMZOYx9VS89o/Pcr8WTbYgnW9nJIp
         GzJw==
X-Forwarded-Encrypted: i=1; AFNElJ+YfZdThO3B69sCvuh6/Xa2UiSEqVNeiNfpNt8R/Xuy1tYsrUGiprEcCM8swzp7Yfi/gsXykXUpSRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPyW2p/q5IzPJJ2s975ebSBifP3IkTCSzF53HOBl4HxMFJJHeN
	KXPSoOaAhjthz1ycpPkwGdsuv9SGbblHG9Q4EuNK72Vg87SsCSKjOu9fxGYsW2oyRXV068H7iMW
	hqMHgVHLk3Hbg+A==
X-Received: from pfoi19.prod.google.com ([2002:aa7:87d3:0:b0:838:1ece:7e7e])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:549d:b0:3a3:5726:7e39 with SMTP id adf61e73a8af0-3aa5a8e8078mr31185030637.23.1778611736203;
 Tue, 12 May 2026 11:48:56 -0700 (PDT)
Date: Tue, 12 May 2026 18:48:41 +0000
In-Reply-To: <20260512184846.119396-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260512184846.119396-1-dmatlack@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260512184846.119396-7-dmatlack@google.com>
Subject: [PATCH v5 06/11] PCI: liveupdate: Auto-preserve upstream bridges
 across Live Update
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

When a PCI device is preserved across a Live Update, all of its upstream
bridges up to the root port must also be preserved. This enables the PCI
core and any drivers bound to the bridges to manage bridges correctly
across a Live Update.

Notably, this will be used in subsequent commits to ensure that
preserved devices can continue performing memory transactions without a
disruption or change in routing.

To preserve bridges, the PCI core tracks the number of downstream
devices preserved under each bridge using a reference count in struct
pci_dev_ser. This allows a bridge to remain preserved until all its
downstream preserved devices are unpreserved or finish their
participation in the Live Update.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 241 ++++++++++++++++++++++++++++++---------
 1 file changed, 184 insertions(+), 57 deletions(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 558fbaec8ddd..d8e06afde2c7 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -108,6 +108,18 @@
  * If a misconfigured or unconfigured bridge is encountered during enumeration
  * while there are preserved devices, itss secondary and subordinate bus numbers
  * will be cleared and devices below it will not be enumerated.
+ *
+ * PCI-to-PCI Bridges
+ * ==================
+ *
+ * Any PCI-to-PCI bridges upstream of a preserved device are automatically
+ * preserved when the device is preserved. The PCI core keeps track of the
+ * number of downstream devices that are preserved under a bridge so that the
+ * bridge is only unpreserved once all downstream devices are unpreserved.
+ *
+ * This enables the PCI core and any drivers bound to the bridge to participate
+ * in the Live Update so that preserved endpoints can continue issuing memory
+ * transactions during the Live Update.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
@@ -300,41 +312,55 @@ static struct liveupdate_flb pci_liveupdate_flb = {
 	.compatible = PCI_LUO_FLB_COMPATIBLE,
 };
 
-/**
- * pci_liveupdate_preserve() - Preserve a PCI device across Live Update
- * @dev: The PCI device to preserve.
- *
- * pci_liveupdate_preserve() notifies the PCI core that a PCI device should be
- * preserved across the next Live Update. Drivers must call
- * pci_liveupdate_preserve() from their struct liveupdate_file_handler
- * preserve() callback to ensure the outgoing struct pci_ser is allocated.
- *
- * Returns: 0 on success, <0 on failure.
- */
-int pci_liveupdate_preserve(struct pci_dev *dev)
+static int pci_liveupdate_unpreserve_device(struct pci_ser *ser, struct pci_dev *dev)
 {
-	struct pci_flb_outgoing *outgoing = NULL;
-	struct pci_ser *ser;
-	int i, ret;
+	struct pci_dev_ser *dev_ser;
 
-	if (dev->is_virtfn)
+	guard(write_lock)(&dev->liveupdate.lock);
+
+	dev_ser = dev->liveupdate.outgoing;
+	if (!dev_ser) {
+		pci_warn(dev, "Cannot unpreserve device that is not preserved\n");
 		return -EINVAL;
+	}
 
-	ret = liveupdate_flb_get_outgoing(&pci_liveupdate_flb, (void **)&outgoing);
-	if (ret)
-		return ret;
+	if (!dev_ser->refcount) {
+		pci_WARN(dev, 1, "Preserved device has a 0 refcount!\n");
+		return -EINVAL;
+	}
 
-	if (!outgoing)
-		return -ENOENT;
+	if (--dev_ser->refcount)
+		return 0;
 
-	guard(mutex)(&outgoing->lock);
-	ser = outgoing->ser;
+	pci_info(dev, "Device will no longer be preserved across next Live Update\n");
+	ser->nr_devices--;
+	memset(dev_ser, 0, sizeof(*dev_ser));
+	dev->liveupdate.outgoing = NULL;
+	return 0;
+}
 
-	guard(write_lock)(&dev->liveupdate.lock);
+static int pci_liveupdate_preserve_device_existing(struct pci_dev *dev)
+{
+	if (!dev->liveupdate.outgoing->refcount) {
+		pci_WARN(dev, 1, "Preserved device with 0 refcount!\n");
+		return -EINVAL;
+	}
 
-	if (dev->liveupdate.outgoing)
+	/*
+	 * Endpoint devices should not be preserved more than once. Bridges are
+	 * preserved once for every downstream device that is preserved.
+	 */
+	if (!dev->subordinate)
 		return -EBUSY;
 
+	dev->liveupdate.outgoing->refcount++;
+	return 0;
+}
+
+static int pci_liveupdate_preserve_device_new(struct pci_ser *ser, struct pci_dev *dev)
+{
+	int i;
+
 	if (ser->nr_devices == ser->max_nr_devices)
 		return -ENOSPC;
 
@@ -363,8 +389,82 @@ int pci_liveupdate_preserve(struct pci_dev *dev)
 
 	return -ENOSPC;
 }
+
+static int pci_liveupdate_preserve_device(struct pci_ser *ser, struct pci_dev *dev)
+{
+	guard(write_lock)(&dev->liveupdate.lock);
+
+	if (dev->liveupdate.outgoing)
+		return pci_liveupdate_preserve_device_existing(dev);
+	else
+		return pci_liveupdate_preserve_device_new(ser, dev);
+}
+
+static int pci_liveupdate_preserve_path(struct pci_ser *ser, struct pci_dev *dev)
+{
+	int ret;
+
+	if (!dev)
+		return 0;
+
+	ret = pci_liveupdate_preserve_device(ser, dev);
+	if (ret)
+		return ret;
+
+	ret = pci_liveupdate_preserve_path(ser, dev->bus->self);
+	if (ret) {
+		pci_liveupdate_unpreserve_device(ser, dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * pci_liveupdate_preserve() - Preserve a PCI device across Live Update
+ * @dev: The PCI device to preserve.
+ *
+ * pci_liveupdate_preserve() notifies the PCI core that a PCI device should be
+ * preserved across the next Live Update. Drivers must call
+ * pci_liveupdate_preserve() from their struct liveupdate_file_handler
+ * preserve() callback to ensure the outgoing struct pci_ser is allocated.
+ *
+ * pci_liveupdate_preserve() automatically preserves all bridges upstream of
+ * @dev.
+ *
+ * Returns: 0 on success, <0 on failure.
+ */
+int pci_liveupdate_preserve(struct pci_dev *dev)
+{
+	struct pci_flb_outgoing *outgoing = NULL;
+	int ret;
+
+	if (dev->is_virtfn)
+		return -EINVAL;
+
+	ret = liveupdate_flb_get_outgoing(&pci_liveupdate_flb, (void **)&outgoing);
+	if (ret)
+		return ret;
+
+	if (!outgoing)
+		return -ENOENT;
+
+	guard(mutex)(&outgoing->lock);
+	return pci_liveupdate_preserve_path(outgoing->ser, dev);
+}
 EXPORT_SYMBOL_GPL(pci_liveupdate_preserve);
 
+static void pci_liveupdate_unpreserve_path(struct pci_ser *ser, struct pci_dev *dev)
+{
+	if (!dev)
+		return;
+
+	if (pci_liveupdate_unpreserve_device(ser, dev))
+		return;
+
+	pci_liveupdate_unpreserve_path(ser, dev->bus->self);
+}
+
 /**
  * pci_liveupdate_unpreserve() - Cancel preservation of a PCI device
  * @dev: The PCI device to preserve.
@@ -373,12 +473,13 @@ EXPORT_SYMBOL_GPL(pci_liveupdate_preserve);
  * longer be preserved across the next Live Update. Drivers must call
  * pci_liveupdate_unpreserve() from their struct liveupdate_file_handler
  * unpreserve() callback to ensure the outgoing struct pci_ser is allocated.
+ *
+ * pci_liveupdate_unpreserve() automatically unpreserves all bridges upstream of
+ * @dev.
  */
 void pci_liveupdate_unpreserve(struct pci_dev *dev)
 {
 	struct pci_flb_outgoing *outgoing = NULL;
-	struct pci_dev_ser *dev_ser;
-	struct pci_ser *ser;
 	int ret;
 
 	ret = liveupdate_flb_get_outgoing(&pci_liveupdate_flb, (void **)&outgoing);
@@ -389,20 +490,7 @@ void pci_liveupdate_unpreserve(struct pci_dev *dev)
 	}
 
 	guard(mutex)(&outgoing->lock);
-	ser = outgoing->ser;
-
-	guard(write_lock)(&dev->liveupdate.lock);
-
-	dev_ser = dev->liveupdate.outgoing;
-	if (!dev_ser) {
-		pci_warn(dev, "Cannot unpreserve device that is not preserved\n");
-		return;
-	}
-
-	pci_info(dev, "Device will no longer be preserved across next Live Update\n");
-	ser->nr_devices--;
-	memset(dev_ser, 0, sizeof(*dev_ser));
-	dev->liveupdate.outgoing = NULL;
+	pci_liveupdate_unpreserve_path(outgoing->ser, dev);
 }
 EXPORT_SYMBOL_GPL(pci_liveupdate_unpreserve);
 
@@ -510,6 +598,55 @@ void pci_liveupdate_cleanup_device(struct pci_dev *dev)
 		pci_liveupdate_flb_put_incoming();
 }
 
+static int __pci_liveupdate_finish_device(struct pci_dev *dev)
+{
+	guard(write_lock)(&dev->liveupdate.lock);
+
+	if (!dev->liveupdate.incoming) {
+		pci_warn(dev, "Cannot finish preserving an unpreserved device\n");
+		return -EINVAL;
+	}
+
+	if (!dev->liveupdate.incoming->refcount) {
+		pci_WARN(dev, 1, "Preserved device has a 0 refcount!\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Decrement the refcount so this device does not get treated as an
+	 * incoming device again, e.g. in case pci_liveupdate_setup_device()
+	 * gets called again because the device is hot-plugged.
+	 */
+	if (--dev->liveupdate.incoming->refcount)
+		return -EBUSY;
+
+	pci_info(dev, "Device is finished participating in Live Update\n");
+	dev->liveupdate.incoming = NULL;
+	return 0;
+}
+
+static int pci_liveupdate_finish_device(struct pci_dev *dev)
+{
+	int ret;
+
+	/*
+	 * If ret == -EBUSY the device is still preserved due to remaining
+	 * references. Return 0 up to the caller to indicate it should proceed
+	 * to finish preserving upstream devices but do not drop the device's
+	 * reference on the incoming FLB below.
+	 */
+	ret = __pci_liveupdate_finish_device(dev);
+	if (ret)
+		return ret == -EBUSY ? 0 : ret;
+
+	/*
+	 * Once the device's refcount reaches zero drop the device's reference
+	 * on the incoming FLB so it can be freed.
+	 */
+	pci_liveupdate_flb_put_incoming();
+	return 0;
+}
+
 /**
  * pci_liveupdate_finish() - Finish the preservation of a PCI device across Live Update
  * @dev: The PCI device
@@ -519,28 +656,18 @@ void pci_liveupdate_cleanup_device(struct pci_dev *dev)
  * Update. Drivers must call pci_liveupdate_finish() from their struct
  * liveupdate_file_handler finish() callback to ensure the incoming struct
  * pci_ser is allocated.
+ *
+ * pci_liveupdate_finish() automatically finishes all bridges upstream of @dev.
  */
 void pci_liveupdate_finish(struct pci_dev *dev)
 {
-	guard(write_lock)(&dev->liveupdate.lock);
-
-	if (!dev->liveupdate.incoming) {
-		pci_warn(dev, "Cannot finish preserving an unpreserved device\n");
+	if (!dev)
 		return;
-	}
-
-	pci_info(dev, "Device is finished participating in Live Update\n");
 
-	/*
-	 * Drop the refcount so this device does not get treated as an incoming
-	 * device again, e.g. in case pci_liveupdate_setup_device() gets called
-	 * again because the device is hot-plugged.
-	 */
-	dev->liveupdate.incoming->refcount = 0;
-	dev->liveupdate.incoming = NULL;
+	if (pci_liveupdate_finish_device(dev))
+		return;
 
-	/* Drop this device's reference on the incoming FLB. */
-	pci_liveupdate_flb_put_incoming();
+	pci_liveupdate_finish(dev->bus->self);
 }
 EXPORT_SYMBOL_GPL(pci_liveupdate_finish);
 
-- 
2.54.0.563.g4f69b47b94-goog

