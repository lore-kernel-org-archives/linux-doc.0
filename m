Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041444;
	b=ggEszKWkUaXWoDczRjtZiEChYADDs+Xab7kZitbhmCBt++tPBpnwn93XjQNR0TGapIMl
	 dZ3NAjmz1nV6ILuELKHBuOqWVD4YWY109ltkCDZ3isiscn2X8NS3YBROq7Xc+Go7jwO0V
	 IX4L3dlfYrVFeaiPFqyAPac0g4zYL8LYtvI7vHAYz9CEFQx6ShkB8rUehKGawqFk23khJ
	 CnzdCOidcndSbFKrKqUk08zmkGc0bZbl6ebVkJr5FQX8a+H3KVPv8thHRhQxqGosd/RRI
	 oofmAp/mD15FBXeGbVIuex6XmyL01hbcNpJ9Emmtjy58sKw7N1kTUq4FPoDkBTlapvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1uW5sdRp5YWPj/rz8uudGhABXbeY/lZgJ5YVMOGqNdk=;
	b=pJYIR7QuWFf1JBJxs0o+Vj7C5OqhItlQVdq0xnN8tQqbqPCph3vqFfnUmAKE9fTjE8KY
	 mkG8EbCoZqGTzTHl4uU6F2ZThjR+DG5E8z56epRhn6iLqoqlentKmgvko5EmiCcj839Lc
	 JTje1/CLjHPCQCNv9paFUfK+X2fS1dICwnjBrjFJu4DS112a1/J/srCkONX1wunmm3UQp
	 XcQFFQJKgFUSkgE0zhlZpogBRN9+pZ+kiD/+gSzzX3ulyS1jkR5YvmsTv3q9hS1xNiXN2
	 D8HMrktA7pAkSOwAJl0dHuC+NcfFoJGdI8aB/FcHfG1hftxfxqRbl/uoh0s1SMjSzgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hwdkym0m;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13BB60A6F73
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 22:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13BB60A6F73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hwdkym0m
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-492f39f29c4so1873644fac.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 14:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795041443; x=1795646243; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uW5sdRp5YWPj/rz8uudGhABXbeY/lZgJ5YVMOGqNdk=;
        b=Hwdkym0mm+dQW6DRCcVFKuSGLpK5leLx541O+IQ/H2v8f0Xi4WH1ja8tuQaRCqShZS
         i6zkyBVsLOETx5/H/0p8bTVFU+qWtFLPbXZWAzCBbzqRfwDbi0Ol49SJYBRQ23F+NNqt
         0qFKW4IYkcUBq/USnAE0xyhmmkQRaXZ4OvqOPsKuePh49HXykR9aK8Ul7Hk/B2Gytqb/
         N9tnSoSw9QjZmihjx6nJ3ZcBahUAbybpCJEinGowrgqgPqJAf1DXXoG+5+bWYV6CUWEx
         mRa+A0mbOn5fg1hmEsNOou9w/OlgPWD5jACcNLR9Fkui5hhZ1HtKujhxYUKHO73Nk1+Q
         YpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041443; x=1795646243;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uW5sdRp5YWPj/rz8uudGhABXbeY/lZgJ5YVMOGqNdk=;
        b=WMMn9GBO+rYWg/Zq7op9mMiWQNXpgFGPSHnSC3j5QJDk4NaXUjxJjJKp9+gbZ8TSAO
         5p2D5oXEndmxfNd+yaOJmNwWgjmthdpmyUIBkKBlx2qL6kXaLKquyvI6kLEFmbayY+QV
         nVPCUCQuiF4jvVr+WzYYApRPIBld+Fl2+KevLYO13sOx1C5HJKKM1KNtL2wCBIXtrwPa
         TRd289+JxPkHBGGtdly1ryazIPN+grAQzG8Utq2H8AWUDg+S7OtSiWY03WFe9d7z7oXY
         vQvRgsoA5swiKUsGCqW6BitHBiXjugopcO8A80/+vG9aCCLwHZw2oZ0xyA0RpYafof7I
         pqyQ==
X-Forwarded-Encrypted: i=1; AL+hErGYbTZrshT3S0bWRZqZEEjrIoH6bENYWeCUXUS0RmC5VQ8FNCynFFQHsQLFSbK3XrnATXeZ9FOA+JI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iTnW4fdh1p9PYBz7nGANh54Jd+oll7Dun/KEvmDrXKWNLxAC+
	HE/3PUpLQtooARaBIjXO2iTKIdv1vd+pgysqs2PuCUtjlDE0P+AjoEBpp8xPvFkAVR1XdB8qSMD
	1beahsz+zzVTiNQ==
X-Received: from iocou22-n1.prod.google.com ([2002:a05:6602:c316:10b0:9ca:dc6e:2262])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:182a:b0:4cb:f21b:6f91 with SMTP id 5614622812f47-57742936db2mr4808486b6e.36.1795041442511;
 Wed, 18 Nov 2026 14:37:22 -0800 (PST)
Date: Wed, 18 Nov 2026 22:37:03 +0000
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
Message-ID: <20261118223704.3286085-13-dmatlack@google.com>
Subject: [PATCH v11 12/13] PCI: liveupdate: Do not disable bus mastering on
 preserved devices during kexec
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

Do not disable bus mastering on outgoing preserved devices during
pci_device_shutdown() for kexec.

Preserved devices must keep performing memory transactions during a Live
Update. Clearing the Bus Master Enable bit would prevent these devices
from issuing any memory requests while the new kernel boots.

Because bridges upstream of preserved endpoint devices are also
automatically preserved, this change also avoids clearing bus mastering
on them. Clearing Bus Master Enable on an upstream bridge prevents the
bridge from forwarding memory requests upstream (i.e. it would prevent
the endpoint device from accessing system RAM and doing peer-to-peer
transactions with devices not downstream of the bridge).

Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/liveupdate.c | 11 +++++++++++
 drivers/pci/liveupdate.h |  6 ++++++
 drivers/pci/pci-driver.c |  6 ++++--
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index e26d2f5c2338..493576119a76 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -196,6 +196,10 @@
  *    preserved devices, even with pci=noari, until all preserved devices below
  *    the bridge have finished. This keeps the preserved devices on the bridge's
  *    secondary bus addressable with the same function numbers.
+ *
+ *  * The PCI core does not disable bus mastering on outgoing preserved devices
+ *    during kexec. This allows preserved devices to issue memory transactions
+ *    throughout the Live Update.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
@@ -946,6 +950,13 @@ int pci_liveupdate_adopt_ari(struct pci_dev *dev)
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
index 03211dbebc7b..e0c21c1f7e78 100644
--- a/drivers/pci/liveupdate.h
+++ b/drivers/pci/liveupdate.h
@@ -18,6 +18,7 @@ bool pci_liveupdate_preserve_bus_numbers(void);
 bool pci_liveupdate_refuse_bus_numbers(struct pci_bus *bus, struct pci_dev *dev);
 int pci_liveupdate_adopt_acs(struct pci_dev *dev);
 int pci_liveupdate_adopt_ari(struct pci_dev *dev);
+bool pci_liveupdate_is_outgoing(struct pci_dev *dev);
 
 static inline bool pci_liveupdate_was_incoming(struct pci_dev *dev)
 {
@@ -57,6 +58,11 @@ static inline int pci_liveupdate_adopt_ari(struct pci_dev *dev)
 	return -EINVAL;
 }
 
+static inline bool pci_liveupdate_is_outgoing(struct pci_dev *dev)
+{
+	return false;
+}
+
 static inline bool pci_liveupdate_was_incoming(struct pci_dev *dev)
 {
 	return false;
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 8b11bd3dc5bc..08b768b9e905 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -569,11 +569,13 @@ static void pci_device_shutdown(struct device *dev)
 	/*
 	 * If this is a kexec reboot, turn off Bus Master bit on the
 	 * device to tell it to not continue to do DMA. Don't touch
-	 * devices in D3cold or unknown states.
+	 * devices being preserved for Live Update or in D3cold or
+	 * unknown states.
 	 * If it is not a kexec reboot, firmware will hit the PCI
 	 * devices with big hammer and stop their DMA any way.
 	 */
-	if (kexec_in_progress && (pci_dev->current_state <= PCI_D3hot))
+	if (kexec_in_progress && !pci_liveupdate_is_outgoing(pci_dev) &&
+	    pci_dev->current_state <= PCI_D3hot)
 		pci_clear_master(pci_dev);
 }
 
-- 
2.56.1.703.gf848ed807c-goog

