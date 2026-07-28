Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A4347798B
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 22:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276640; cv=none; b=FX26J/URCcQMDZFc0g3GPjLj1fQOFw+Xf351ftEePGBvASnIZ41ht7bAhVdlQSyXjx749eRehK05phLE/Zc6AVfpn4/Et8fRp7zmsebYqAx/wyjUXgHIfKvJ9fu4FsSjsPsJcy1tyLdOt5jJmPYyAxt/SVHjvnsMsj7E69hc0Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276640; c=relaxed/simple;
	bh=lx0gvaLUapR3DtUuP7DJUxKhFqzySRplFurFf4ebi+8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qye6VSLFdz93iWdB0ZrXwdhwoDA8qJDucXUdeSwy5XGPLJoux1+SjGxDBFts8gzc63nKp6QaUbDq0RIXyqKymudb863ZbCDmVz25w5q5Ehv2cBjti76atltxjbaan4r/y6DMiWbFDLO2A3Ga318oawNLxMnxgMH2UJPQoo7C9UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F3XuU8I3; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F3XuU8I3"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so328188a91.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 15:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785276630; x=1785881430; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5W2sBTENi+WOUrZGfaki9B1D/ksXXAJzGZ/5VFVBZM=;
        b=F3XuU8I3aLGron2YpQqa5soooZaooF1kbzj1U7H+v0qwDhkmqOOL2BetSZGTOD+K7p
         mD3MuWeqWz6ixY1Q6daiz40PM9OJrgvWazB3Rul06VF6+dnKgyoDV2gNOg3aiyCGvZ12
         9rzeE1P0yEorKU7EGYAuZQ6kWNYaCpwWoeFuNmWpv99xGR788gzZtp6FWRrptnjziobQ
         meAGmqUwJiFFTKu0ISi31Z9EK3L7MYOkPJ/IoKjCGJ3hsMW60VL8Ij+G5WfGVFjIhYGl
         jwbXoAXtk+2+7+Cyfm4pVuY1tZmCIao6ZEtIOMCS7euq12nlxitne6GewsJXQyKz158M
         hYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276630; x=1785881430;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5W2sBTENi+WOUrZGfaki9B1D/ksXXAJzGZ/5VFVBZM=;
        b=Hwn+4rm7k957tkXwbxObNsJIaS26mVRKkN4IpMmpdHnh8Rlei6BNZW/zlVwRqvngK2
         hi7+Qkxv9VtT4kV01yHWetNAgQYM8paXzEGthUGMhuvIVI1Vb9By21S2RSh7PcF7vhUP
         hH7XIImhb5f9s5YnIwS8fVxCmRANmD819tQMIRdxjoNWXzOZ/L3bxaH3mR/DlJdKO3lG
         ivfP0c2y2UtNkSG+fGQTfBNIpX3wiUYjcS0nMsG71Z+8/lVN071XfYkmQ6ORQks4bmS1
         62W7ddsIufS8RSNbbTMWHIFG8syBIRog3nNMw/myzc+1EK5Vyc3nDLUFJ/VnTt0xEVqS
         C3+A==
X-Forwarded-Encrypted: i=1; AHgh+Rqdyx2l9bDbM3ZbRvKqQIJMQk58xraaY+g+jYJF9LaU+RDS0y54eT0L1M/pWDHWkpiIK6TYWlvOaAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyytDoRwKzX3A2ckUl+SVrSgqWLeNAjUJBxeNYDT7zWNKTMITFT
	fGkPlYtloSHUutbfmUIdzR72SOgDtbbLZ83fOJWisjYqfGRElvO4aZaYulku4vA6A7e7WLv+Kgw
	fYN1qTWkZEPhUuw==
X-Received: from pjqx19.prod.google.com ([2002:a17:90a:b013:b0:384:f6e1:ff81])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2f0b:b0:38e:7f34:b23d with SMTP id 98e67ed59e1d1-38f6a54897fmr4380325a91.35.1785276629379;
 Tue, 28 Jul 2026 15:10:29 -0700 (PDT)
Date: Tue, 28 Jul 2026 22:10:04 +0000
In-Reply-To: <20260728221007.2098560-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728221007.2098560-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728221007.2098560-11-dmatlack@google.com>
Subject: [PATCH v8 10/12] PCI: liveupdate: Freeze preservation status during shutdown
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

Freeze a device's outgoing preservation status (preserved or not
preserved) during shutdown. This enables the PCI core and drivers to
safely make decisions based on the device's preservation status during
shutdown.

Note that pci_liveupdate_freeze() is triggered by the PCI core rather
than from drivers participating in Live Update so that all devices can
have their status frozen (i.e. prevent non-preserved devices from
getting preserved late).

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c       | 16 ++++++++++++++++
 drivers/pci/liveupdate.h       |  4 ++++
 drivers/pci/pci-driver.c       |  2 ++
 include/linux/pci_liveupdate.h |  3 +++
 4 files changed, 25 insertions(+)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 744513ee11ed..65bcecb1b64e 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -394,6 +394,11 @@ static int pci_liveupdate_unpreserve_device(struct pci_flb_outgoing *outgoing,
 {
 	struct pci_dev_ser *dev_ser = dev->liveupdate.outgoing;
 
+	if (dev->liveupdate.frozen) {
+		pci_warn(dev, "Cannot unpreserve device after it is frozen!\n");
+		return -EINVAL;
+	}
+
 	if (!dev_ser) {
 		pci_warn(dev, "Cannot unpreserve device that is not preserved\n");
 		return -EINVAL;
@@ -447,6 +452,11 @@ static int pci_liveupdate_preserve_device(struct pci_flb_outgoing *outgoing,
 		return -EINVAL;
 	}
 
+	if (dev->liveupdate.frozen) {
+		pci_warn(dev, "Cannot preserve device after it is frozen!\n");
+		return -EINVAL;
+	}
+
 	if (dev->liveupdate.outgoing) {
 		if (!dev->liveupdate.outgoing->refcount) {
 			pci_WARN(dev, 1, "Preserved device with 0 refcount!\n");
@@ -718,6 +728,12 @@ void pci_liveupdate_cleanup_device(struct pci_dev *dev)
 		pci_WARN(dev, 1, "Destroying incoming-preserved device!\n");
 }
 
+void pci_liveupdate_freeze(struct pci_dev *dev)
+{
+	guard(rwsem_write)(&pci_liveupdate.rwsem);
+	dev->liveupdate.frozen = 1;
+}
+
 static int pci_liveupdate_finish_device(struct pci_ser *ser, struct pci_dev *dev)
 {
 	if (!dev->liveupdate.incoming) {
diff --git a/drivers/pci/liveupdate.h b/drivers/pci/liveupdate.h
index ccc23031e99d..49d07fd02132 100644
--- a/drivers/pci/liveupdate.h
+++ b/drivers/pci/liveupdate.h
@@ -13,6 +13,7 @@
 #ifdef CONFIG_PCI_LIVEUPDATE
 void pci_liveupdate_setup_device(struct pci_dev *dev);
 void pci_liveupdate_cleanup_device(struct pci_dev *dev);
+void pci_liveupdate_freeze(struct pci_dev *dev);
 bool pci_liveupdate_preserve_bus_numbers(struct pci_bus *bus,
 					 struct pci_dev *dev);
 void pci_liveupdate_scan_bridge_end(struct pci_dev *dev);
@@ -28,6 +29,9 @@ static inline void pci_liveupdate_cleanup_device(struct pci_dev *dev)
 {
 }
 
+static inline void pci_liveupdate_freeze(struct pci_dev *dev)
+{
+}
 static inline bool pci_liveupdate_preserve_bus_numbers(struct pci_bus *bus,
 						       struct pci_dev *dev)
 {
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index f36778e62ac1..51616e4327d3 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -21,6 +21,7 @@
 #include <linux/acpi.h>
 #include <linux/dma-map-ops.h>
 #include <linux/iommu.h>
+#include "liveupdate.h"
 #include "pci.h"
 #include "pcie/portdrv.h"
 
@@ -536,6 +537,7 @@ static void pci_device_shutdown(struct device *dev)
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	struct pci_driver *drv = pci_dev->driver;
 
+	pci_liveupdate_freeze(pci_dev);
 	pm_runtime_resume(dev);
 
 	if (drv && drv->shutdown)
diff --git a/include/linux/pci_liveupdate.h b/include/linux/pci_liveupdate.h
index 04a2b2a3102a..31898685a406 100644
--- a/include/linux/pci_liveupdate.h
+++ b/include/linux/pci_liveupdate.h
@@ -24,6 +24,8 @@
  * @was_preserved: True if this struct pci_dev was preserved by the previous
  *                 kernel. Unlike @incoming, this field is not cleared after
  *                 the device is finished participating in Live Update.
+ * @frozen: True if the outgoing preservation status of this device is frozen
+ *          and thus cannot be changed.
  */
 struct pci_liveupdate {
 	struct pci_dev_ser *outgoing;
@@ -31,6 +33,7 @@ struct pci_liveupdate {
 	u16 acs_ctrl;
 	bool preserve_bus_numbers;
 	bool was_preserved;
+	bool frozen;
 };
 
 struct pci_dev;
-- 
2.55.0.487.gaf234c4eb3-goog

