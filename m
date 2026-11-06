Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925793;
	b=rglc3zxMYZlhWUtPNfUK/eE/zzuZifxa0f41Vb9wR7O6Z0PqX3x6Ogpcwwmdz4uBMrN0
	 u7+k9KomMXwX2DnECRGMtS4AZll+1xs+35unUiER0FzHxZ0S+brzy9eYsJQ1Jwbdx0FC1
	 Ur0IufwB6LG3JsSPPhrwFhYvFmf//QjKmSIesHJKE8in13KzOfpV3cECzfwy34z5ynHfP
	 CLMMNEVBGoQ+ur2S+MvZn9lk183ehEw5ZELIVMU551NvTXbdMzs/jMjZh9DzdPhzsDzeh
	 fYkKmFtFuvpoHadgeGFJjnz7Sb7PFKN77gJYdDo/T8Tf4rhiSC2RTP2o30hcK6QuwlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mFWOpusTgBwcgTKpEgyRpVaqUUx06BhmoFjl8K/HM58=;
	b=U/pOCI4vXxS4mP7GbjPsi1yFK1FUHRQQDBwXnKMSrs0CFKCGUKX3k+JMyMDpw0AZm/zX
	 YFaSbyLFhi6GfGarLCt4aB1cCue8+YFNFE6YNyQ9ByM1Wsqsnd/fRK0rkGiXMIx78Vhku
	 kDEH92l1G0GUO5HSAEf3AUEkKw2fAUfAPhtgBsHpoVqUEqSUkm3LC1X3QDoJJ2/l7zk3R
	 oWeNil896OkeZchE+MaPSOxPK0hAIONReJe5f2Vwv6Nuh4q2ljT3tTHvcNj30GwmaR9th
	 hSBQzAMVT1q3ok6v8yx09kDu/k1tKSGWQ/kHegBTlVaHuTPJvJ7XCFM5E0HTp3jLqrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MTsy0IKF;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D92606D816
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 00:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D92606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MTsy0IKF
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-55bf11583d9so197826b6e.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 16:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925792; x=1794530592; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFWOpusTgBwcgTKpEgyRpVaqUUx06BhmoFjl8K/HM58=;
        b=MTsy0IKFpyxLLVaOm4299dWx6WcmcnErsBTSr+AlXko/9KnB8UjC7jewf2G8Ple4as
         loau05GedXce9+dd4TVTjPJ+rPvu842mjUHhVzvkVumV36Qq1GMuYycPO8iMLdE2Xi7o
         RK3A7LiqkFZCz7mKfc2a6fqfKykSHvnmwvKoTFDhQ4riARhNAORuZ4wJvk7JGYN+DFby
         ROPKtjn7SMG/ken38U33bYARlNrvHAqixPiJA2HwrwEk0QCYvjESscAUvXl38TS9oKWX
         dQVdRBIVWmr25orO1MjNMrGTY1ZuYeBig79RDz+lMmtbci6TIoQyooMbYzqqrqJv+5md
         /Okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925792; x=1794530592;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFWOpusTgBwcgTKpEgyRpVaqUUx06BhmoFjl8K/HM58=;
        b=vuRebBcH5HBs61ysyIR9pqlY4Tut5bXEZwSrqZBKMJBslRoZW4QJ8NtkWHzqR0M8Qn
         L95oZO/+7XJ0z0nSHxaFdaQsEbLh7GynwW6kDCD+1zmm2/116tbtJ6I2aDeMDFcvZj5T
         IGOBWOm4xqlHpDk6MhwBjlVAdX6BrjOeQedJvSBjLOKiFGM2fpRSIybzhImrxMFXBPF5
         d3TGwUg64LzNO+T/5J1MRq3oKEk6a6t1m93NkTO2zLPcCM74Ad2ZEmURtAFGRbWGnayS
         AizzjV/X9YkJtEJ+ivbJWv9rn9TNj0xr0AHKgtmLCRXy2bkEVVfzhNNi84ydzRdsjj+2
         P3Sg==
X-Forwarded-Encrypted: i=1; AKwUvBxOqPxmDYlslK/2RZcSiSgFXUxx4A+SuoKbR/C0yLSQOrLdQYSRxhcCvoIU3TJtCBdpEoNDbZyz0XQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jPKs2Ac2El6woa5SF1slvoc8ojUB8q/zw853cY8l3TIraCz0V
	C/0qXmkWb/o2Sav82L1KZgtnPgTdEh6JGw7u2+NUmCuIJB3TjNuqw4/DqKu/SmO/6xJ0FdBaf6x
	oyOLttpGaYv7tag==
X-Received: from ilbeb27.prod.google.com ([2002:a05:6e02:461b:b0:520:6d86:da98])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1686:b0:546:306d:45eb with SMTP id 5614622812f47-567be662ce8mr2365687b6e.35.1793925791448;
 Thu, 05 Nov 2026 16:43:11 -0800 (PST)
Date: Fri,  6 Nov 2026 00:42:13 +0000
In-Reply-To: <20261106004218.604799-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106004218.604799-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106004218.604799-13-dmatlack@google.com>
Subject: [PATCH v2 12/17] PCI: Save ACS state in the saved capability store
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Cc: Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, David Matlack <dmatlack@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Lukas Wunner <lukas@wunner.de>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Save and restore the ACS Control register and the ACS Egress Control
Vector through the per-device saved capability store instead of a
private pci_cap_saved_state buffer.

Rename pci_allocate_acs_save_buffer() to pci_reserve_acs_state(), to
match pci_save_acs_state() and pci_restore_acs_state().

Reserve the Egress Control Vector using the size the device reports in
its HwInit ACS Capability register during setup, as the save buffer was
sized before. Save or restore the vector only if all of it is reserved,
since its size is read from the device again each time.

pci_liveupdate_adopt_acs() checked for the ACS save buffer to make sure
adopted controls would survive a later reset. Check that the ACS
Control register has room in the store instead, which also fails if the
store could not be allocated.

No functional change intended for devices whose Egress Control Vector
size does not change after setup.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 15 +++----
 drivers/pci/pci.c        | 87 ++++++++++++++++++----------------------
 2 files changed, 46 insertions(+), 56 deletions(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 6f92d4ddca2b..8334e6fdd3ec 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -932,14 +932,15 @@ int pci_liveupdate_adopt_acs(struct pci_dev *dev)
 
 	/*
 	 * Adopting the previous kernel's controls depends on them being
-	 * captured in the ACS save buffer, so that they are reapplied if the
-	 * device is later reset. Without that buffer, e.g. because it could
-	 * not be allocated under memory pressure, the adopted controls would
-	 * be silently lost by the first reset. Program ACS from scratch
-	 * instead, which is a better outcome than leaving ACS disabled.
+	 * captured in the saved capability store, so that they are reapplied
+	 * if the device is later reset. Without room in the store, e.g.
+	 * because it could not be allocated under memory pressure, the adopted
+	 * controls would be silently lost by the first reset. Program ACS from
+	 * scratch instead, which is a better outcome than leaving ACS disabled.
 	 */
-	if (dev->acs_cap && !pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_ACS)) {
-		pci_err(dev, "No ACS save buffer, not adopting ACS controls\n");
+	if (dev->acs_cap &&
+	    !pci_saved_cap_reserved(dev, dev->acs_cap + PCI_ACS_CTRL)) {
+		pci_err(dev, "No ACS save state, not adopting ACS controls\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 29d9474db1ae..977b7dbd19ce 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1023,15 +1023,6 @@ static void pci_std_enable_acs(struct pci_dev *dev, struct pci_acs *caps)
 		caps->ctrl |= (dev->acs_capabilities & PCI_ACS_TB);
 }
 
-/*
- * Layout of the ACS save buffer. @ecv holds the ACS Egress Control Vector, if
- * implemented, and is sized by pci_allocate_acs_save_buffer().
- */
-struct pci_acs_saved_state {
-	u16 ctrl;
-	u32 ecv[];
-};
-
 /*
  * Return the number of DWORDs in the ACS Egress Control Vector, or 0 if the
  * device does not implement P2P Egress Control. The Egress Control Vector
@@ -1055,30 +1046,44 @@ static unsigned int pci_acs_ecv_dwords(struct pci_dev *dev, int pos)
 }
 
 /*
- * Return the number of Egress Control Vector DWORDs held in @save_state, as
- * sized by pci_allocate_acs_save_buffer().
+ * Return the number of Egress Control Vector DWORDs that are reserved in the
+ * saved capability store, or 0 if the device does not implement P2P Egress
+ * Control or the vector was not reserved in full, e.g. because the device
+ * reports a different size than it did during setup.
  */
-static unsigned int
-pci_acs_saved_ecv_dwords(struct pci_cap_saved_state *save_state)
+static unsigned int pci_acs_saved_ecv_dwords(struct pci_dev *dev)
 {
-	return (save_state->cap.size -
-		offsetof(struct pci_acs_saved_state, ecv)) / sizeof(u32);
+	int pos = dev->acs_cap + PCI_ACS_EGRESS_CTL_V;
+	unsigned int i, dwords;
+
+	dwords = pci_acs_ecv_dwords(dev, dev->acs_cap);
+	for (i = 0; i < dwords; i++) {
+		if (!pci_saved_cap_reserved(dev, pos + i * sizeof(u32)))
+			return 0;
+	}
+
+	return dwords;
 }
 
-static void pci_allocate_acs_save_buffer(struct pci_dev *dev)
+static void pci_reserve_acs_state(struct pci_dev *dev)
 {
-	size_t size;
-	int pos;
+	unsigned int dwords;
+	int pos, rc;
 
 	/* dev->acs_cap is not set yet, pci_acs_init() runs later */
 	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS);
 	if (!pos)
 		return;
 
-	size = struct_size_t(struct pci_acs_saved_state, ecv,
-			     pci_acs_ecv_dwords(dev, pos));
-	if (pci_add_ext_cap_save_buffer(dev, PCI_EXT_CAP_ID_ACS, size))
-		pci_err(dev, "unable to allocate suspend buffer for ACS\n");
+	rc = pci_reserve_saved_cap(dev, pos + PCI_ACS_CTRL, sizeof(u16));
+
+	dwords = pci_acs_ecv_dwords(dev, pos);
+	if (!rc && dwords)
+		rc = pci_reserve_saved_cap(dev, pos + PCI_ACS_EGRESS_CTL_V,
+					   dwords * sizeof(u32));
+	if (rc)
+		pci_err(dev, "unable to reserve ACS save state (%pe)\n",
+			ERR_PTR(rc));
 }
 
 /**
@@ -1090,27 +1095,19 @@ static void pci_allocate_acs_save_buffer(struct pci_dev *dev)
  */
 static void pci_save_acs_state(struct pci_dev *dev)
 {
-	struct pci_cap_saved_state *save_state;
-	struct pci_acs_saved_state *acs;
 	unsigned int i, dwords;
 	int ecv_pos;
 
-	if (!dev->acs_cap)
-		return;
-
-	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_ACS);
-	if (!save_state)
+	if (!dev->acs_cap ||
+	    !pci_saved_cap_reserved(dev, dev->acs_cap + PCI_ACS_CTRL))
 		return;
 
-	acs = (struct pci_acs_saved_state *)save_state->cap.data;
-
-	pci_read_config_word(dev, dev->acs_cap + PCI_ACS_CTRL, &acs->ctrl);
+	pci_save_cap_word(dev, dev->acs_cap + PCI_ACS_CTRL);
 
 	ecv_pos = dev->acs_cap + PCI_ACS_EGRESS_CTL_V;
-	dwords = pci_acs_saved_ecv_dwords(save_state);
+	dwords = pci_acs_saved_ecv_dwords(dev);
 	for (i = 0; i < dwords; i++)
-		pci_read_config_dword(dev, ecv_pos + i * sizeof(u32),
-				      &acs->ecv[i]);
+		pci_save_cap_dword(dev, ecv_pos + i * sizeof(u32));
 }
 
 /**
@@ -1120,14 +1117,9 @@ static void pci_save_acs_state(struct pci_dev *dev)
  */
 static void pci_restore_acs_state(struct pci_dev *dev)
 {
-	struct pci_cap_saved_state *save_state = NULL;
-	struct pci_acs_saved_state *acs;
 	unsigned int i, dwords;
 	int ecv_pos;
 
-	if (dev->acs_cap && !pci_need_dev_specific_enable_acs(dev))
-		save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_ACS);
-
 	/*
 	 * Devices that rely on device-specific quirks to enable an ACS
 	 * equivalent keep that configuration outside of the ACS Control
@@ -1135,25 +1127,23 @@ static void pci_restore_acs_state(struct pci_dev *dev)
 	 * ACS from scratch instead, which also covers devices that have no
 	 * saved ACS state at all.
 	 */
-	if (!save_state) {
+	if (!dev->acs_cap || pci_need_dev_specific_enable_acs(dev) ||
+	    !pci_saved_cap_reserved(dev, dev->acs_cap + PCI_ACS_CTRL)) {
 		pci_enable_acs(dev);
 		return;
 	}
 
-	acs = (struct pci_acs_saved_state *)save_state->cap.data;
-
 	/*
 	 * Restore the Egress Control Vector before the ACS Control register.
 	 * The vector resets to zero, so enabling P2P Egress Control first
 	 * would briefly apply the reset vector instead of the saved one.
 	 */
 	ecv_pos = dev->acs_cap + PCI_ACS_EGRESS_CTL_V;
-	dwords = pci_acs_saved_ecv_dwords(save_state);
+	dwords = pci_acs_saved_ecv_dwords(dev);
 	for (i = 0; i < dwords; i++)
-		pci_write_config_dword(dev, ecv_pos + i * sizeof(u32),
-				       acs->ecv[i]);
+		pci_restore_cap_dword(dev, ecv_pos + i * sizeof(u32));
 
-	pci_write_config_word(dev, dev->acs_cap + PCI_ACS_CTRL, acs->ctrl);
+	pci_restore_cap_word(dev, dev->acs_cap + PCI_ACS_CTRL);
 }
 
 /**
@@ -3745,8 +3735,7 @@ void pci_allocate_cap_save_buffers(struct pci_dev *dev)
 	pci_reserve_pcie_state(dev);
 	pci_reserve_pcix_state(dev);
 	pci_reserve_ltr_state(dev);
-
-	pci_allocate_acs_save_buffer(dev);
+	pci_reserve_acs_state(dev);
 	pci_allocate_vc_save_buffers(dev);
 }
 
-- 
2.56.0.455.g6c5a503b38-goog

