Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925804;
	b=E8NzF+rzf2xz6C6fVi/ipAppMDszbzi2XJmfHSI9I/wFmieW0lyJTYjqADlpgTR4NfC8
	 81zPYo+A8E7e4HyP7lmeMiX9Haf83pdLzZlRt3cE7nvn5GgDP586t5dD9CIw7ViPKCanN
	 xYrb2DWHLca5CmdGea30+O7z4hOQJqEcTnCADW9Yfu480HZ1QQsSRZKVFDYeaW4KlAM8Y
	 fXBn6EBaCYNMzD6/IOk7Hz2LoSd4zsA04rWEXpgmKVMhopn6PwZXgRp0joL/LMfSCcGvP
	 HIARQ3m8syZ9uF5GQuCKbLHfmdWZc1acXamfhRCP2ysmwjKr2irKaWrIR/uvPu6fJ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kkvlpSHI6oVXBaKs0yGdR4zokFApEJwfw+eXrMywXPI=;
	b=kYHffKBtDxmMrkWWGZ9URdrGAe2U1nEQpWhotIiYHCnNzxccu5kfdmlcYJ6PE3bzf6cF
	 eGa+538GA0LebHZf3x5RPGNaYC7DG1SLeTGcU5fWK0Vwe8E/Em1OO5p4FVuC6R2RXrRVE
	 cF8px92uDRFxWBV/xfZ3OMhWIGGIWvvFFSNqAcxQHW003b4IG/zQ99aTiBxQqWgc01BW9
	 ZrutgEODSpzd1U6mIY9lsSGS5cb+5RDcswesCyahYbT/T8y7cKIZG+HQtesY+CBzWsv3R
	 +OTQjHAO1w2szGKDoPSndrcYDBhDh6Sz7OTLOTD0MijtDrF+nFCtZpJkWZ54ulnta8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f+dz+ZoY;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12056082BEC
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 00:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F12056082BEC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f+dz+ZoY
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4db3db8687fso127801b6e.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 16:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925798; x=1794530598; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkvlpSHI6oVXBaKs0yGdR4zokFApEJwfw+eXrMywXPI=;
        b=f+dz+ZoYck6G3Ek/8Q3uhDEYWOjFIOJg0+OONmuNDDW1y4mrpgsYDlfGKFQxUYiJU4
         klmoRf8a6wFx9gTfKD37ojCfiSYwuAD7MV3zDJy8yFNdnEOiWzyr7Eno2r/b4wcbJeuS
         k53x7dXNImo9Sos+CqBvIC0EYxbhpsdDnpOaZsnMNUyRJ+2pERveC+3Hl7WM0JopRt+k
         7yrmFpuu0E5HZZqG9zbC4JhtZUwKSBc+GXAz0rmPDFSG6KbKwpKrwmyjiIrXtPos/xkN
         Zz+kgfo+KvM+aMsvouvC4m2Eu+yPFFLxACDkPLvD+wQm/svm/50metkSzVBbarKvWScp
         dJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925798; x=1794530598;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkvlpSHI6oVXBaKs0yGdR4zokFApEJwfw+eXrMywXPI=;
        b=zIrhpQ/co0u8wl1REoEo6q5YMiWHec/6PkPxxSbi+JNwbmCnmcv7zjYKJnx0KO0qfS
         vSN3QsYcUXaEBGWDph0d08NU8UNajMCDmigCyB2JaPKwcBlUHdwrkoTvDepl9Lzj/SPJ
         nHsUIrPhrD5kayxjagqkB1BB/aLjdTceWKfLOhLp6YkVt3pjBrXKNKxkB811bwhkMGgc
         EVoKn5tzZRnZKimKiE9YBhi2oilBeATxmzdpjTvJAzX54t8nGSMLw3Az6OJ5uvkhGswN
         UyNSsH8JE0c01BNbF5R9uc+CHILi4TRdb3lKHN1NyZRVSy7J2VBWUqJs+2o9PAUucn6i
         fcMw==
X-Forwarded-Encrypted: i=1; AKwUvBwGvaM6vEA56wt3B0eguOzYlu4cvJ1Yc0648TjNlDuXUQSf4KvDLLjn/nv80t02YqAIs3hpoDgtI8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AICtYLCl00a4FI3qAazpqClzga0H9jEPsUCS97fLmeN7yXV0+
	sD2/yTAwL2+ytZxscyDVCwVN06i/mpQcqkFhm8KGijps6z3uJTwetzthP4niQu1zTl5z4IuEfr3
	PCb5xGCdEiAW3BA==
X-Received: from jasv5.prod.google.com ([2002:a05:6638:12c5:b0:615:c1f0:a936])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1914:b0:500:5e36:3a9d with SMTP id 5614622812f47-567e106112amr663076b6e.30.1793925797580;
 Thu, 05 Nov 2026 16:43:17 -0800 (PST)
Date: Fri,  6 Nov 2026 00:42:18 +0000
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
Message-ID: <20261106004218.604799-18-dmatlack@google.com>
Subject: [PATCH v2 17/17] PCI: liveupdate: Add helpers to preserve struct pci_saved_state
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

Add pci_liveupdate_preserve_saved_state(), which copies a struct
pci_saved_state into memory preserved with KHO and returns its physical
address, and pci_liveupdate_retrieve_saved_state(), which rebuilds the
struct pci_saved_state from that address in the next kernel and frees
the preserved memory. Add pci_liveupdate_unpreserve_saved_state() to
free the memory if the device ends up not being preserved. If
pci_liveupdate_retrieve_saved_state() fails, it leaves the memory in
place so that the caller can try again.

Drivers that keep a device running across Live Update need to hand the
state they captured with pci_store_saved_state() to the next kernel,
since by the time the next kernel boots the device is no longer in that
state. VFIO, for example, captures it at first open and uses it to
restore the device when the last user closes it. Callers record only
the physical address in their own preserved state, so the layout of the
saved state stays private to the PCI core.

Define the layout as struct pci_saved_state_ser in
include/linux/kho/abi/pci.h: a bitmap with one bit per DWORD of
configuration space, followed by the saved DWORDs in ascending offset
order, mirroring struct pci_saved_state. Each value is identified only
by its offset, so the format does not change when a kernel starts or
stops saving a register.

Drop saved capability registers that the next kernel does not reserve,
since it would never restore them and pci_load_saved_state() would
reject the whole state because of them. This lets the PCI core stop
saving a register without breaking Live Update from older kernels. A
register that the next kernel restores but the previous kernel did not
save keeps its current saved value in the next kernel.

Co-developed-by: Vipin Sharma <vipinsh@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 Documentation/PCI/liveupdate.rst |   3 +
 drivers/pci/liveupdate.c         | 118 +++++++++++++++++++++++++++++++
 drivers/pci/pci.c                |  14 ----
 drivers/pci/pci.h                |  14 ++++
 include/linux/kho/abi/pci.h      |  32 +++++++++
 include/linux/pci_liveupdate.h   |  23 ++++++
 6 files changed, 190 insertions(+), 14 deletions(-)

diff --git a/Documentation/PCI/liveupdate.rst b/Documentation/PCI/liveupdate.rst
index 96b1d7f5df3a..b6cd9621b3b3 100644
--- a/Documentation/PCI/liveupdate.rst
+++ b/Documentation/PCI/liveupdate.rst
@@ -25,6 +25,9 @@ Live Update ABI
 .. kernel-doc:: include/linux/kho/abi/pci.h
    :doc: PCI File-Lifecycle Bound (FLB) Live Update ABI
 
+.. kernel-doc:: include/linux/kho/abi/pci.h
+   :doc: PCI Saved State Live Update ABI
+
 .. kernel-doc:: include/linux/kho/abi/pci.h
    :internal:
 
diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 8334e6fdd3ec..c1f1b71e5959 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -1037,3 +1037,121 @@ void pci_liveupdate_unregister_flb(struct liveupdate_file_handler *fh)
 	liveupdate_unregister_flb(fh, &pci_liveupdate_flb);
 }
 EXPORT_SYMBOL_GPL(pci_liveupdate_unregister_flb);
+
+static_assert(PCI_SAVED_STATE_SER_DWORDS == PCI_CFG_SPACE_EXP_DWORDS);
+
+/**
+ * pci_liveupdate_preserve_saved_state() - Preserve a struct pci_saved_state
+ * @state: Saved state returned by pci_store_saved_state().
+ * @phys: Returns the physical address of the preserved state.
+ *
+ * Copy @state into memory preserved for the next kernel, laid out as struct
+ * pci_saved_state_ser. The caller records @phys in its own preserved state and
+ * passes it to pci_liveupdate_retrieve_saved_state() in the next kernel. If
+ * the device ends up not being preserved, the caller must unpreserve the state
+ * with pci_liveupdate_unpreserve_saved_state().
+ *
+ * Return: 0 on success, <0 on failure.
+ */
+int pci_liveupdate_preserve_saved_state(const struct pci_saved_state *state,
+					u64 *phys)
+{
+	struct pci_saved_state_ser *ser;
+	unsigned int nr_dwords;
+
+	if (!state)
+		return -EINVAL;
+
+	nr_dwords = bitmap_weight(state->dword_map, PCI_CFG_SPACE_EXP_DWORDS);
+
+	ser = kho_alloc_preserve(struct_size(ser, dword_val, nr_dwords));
+	if (IS_ERR(ser))
+		return PTR_ERR(ser);
+
+	bitmap_to_arr64(ser->dword_map, state->dword_map,
+			PCI_CFG_SPACE_EXP_DWORDS);
+	memcpy(ser->dword_val, state->dword_val, nr_dwords * sizeof(u32));
+
+	*phys = virt_to_phys(ser);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_liveupdate_preserve_saved_state);
+
+/**
+ * pci_liveupdate_unpreserve_saved_state() - Unpreserve a struct pci_saved_state
+ * @phys: Physical address returned by pci_liveupdate_preserve_saved_state().
+ *
+ * Unpreserve and free the state, e.g. because the device will not be
+ * preserved after all.
+ */
+void pci_liveupdate_unpreserve_saved_state(u64 phys)
+{
+	kho_unpreserve_free(phys_to_virt(phys));
+}
+EXPORT_SYMBOL_GPL(pci_liveupdate_unpreserve_saved_state);
+
+/*
+ * The configuration space header is always restored. Capability registers are
+ * only restored if this kernel reserved room for them.
+ */
+static bool pci_saved_state_dword_restorable(struct pci_dev *dev,
+					     unsigned int dword)
+{
+	return dword < PCI_STD_HEADER_DWORDS ||
+	       pci_saved_cap_reserved(dev, dword * sizeof(u32));
+}
+
+/**
+ * pci_liveupdate_retrieve_saved_state() - Retrieve a struct pci_saved_state
+ * @dev: The PCI device the state was saved from.
+ * @phys: Physical address that the previous kernel's
+ *        pci_liveupdate_preserve_saved_state() returned.
+ *
+ * Rebuild the struct pci_saved_state that the previous kernel preserved, for
+ * use with pci_load_saved_state(), and free the preserved memory. If this
+ * fails, the preserved memory is left in place so that the caller can try
+ * again.
+ *
+ * The saved configuration space header is always kept. Saved capability
+ * registers that this kernel does not restore for @dev are dropped.
+ *
+ * Return: The saved state, to be freed with kfree(), or an ERR_PTR() on
+ * failure.
+ */
+struct pci_saved_state *
+pci_liveupdate_retrieve_saved_state(struct pci_dev *dev, u64 phys)
+{
+	struct pci_saved_state_ser *ser = phys_to_virt(phys);
+	DECLARE_BITMAP(map, PCI_CFG_SPACE_EXP_DWORDS);
+	unsigned int dword, nr_dwords = 0, i = 0, j = 0;
+	struct pci_saved_state *state;
+
+	bitmap_from_arr64(map, ser->dword_map, PCI_CFG_SPACE_EXP_DWORDS);
+
+	for_each_set_bit(dword, map, PCI_CFG_SPACE_EXP_DWORDS) {
+		if (pci_saved_state_dword_restorable(dev, dword))
+			nr_dwords++;
+	}
+
+	state = kzalloc(struct_size(state, dword_val, nr_dwords), GFP_KERNEL);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	for_each_set_bit(dword, map, PCI_CFG_SPACE_EXP_DWORDS) {
+		u32 val = ser->dword_val[i++];
+
+		if (!pci_saved_state_dword_restorable(dev, dword))
+			continue;
+
+		__set_bit(dword, state->dword_map);
+		state->dword_val[j++] = val;
+	}
+
+	if (i != j)
+		pci_info(dev, "Dropped %u saved DWORDs this kernel does not restore\n",
+			 i - j);
+
+	kho_restore_free(ser);
+	return state;
+}
+EXPORT_SYMBOL_GPL(pci_liveupdate_retrieve_saved_state);
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index d2a9718b6a65..5b3c1fd6ba1e 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1987,20 +1987,6 @@ void pci_restore_state(struct pci_dev *dev)
 }
 EXPORT_SYMBOL(pci_restore_state);
 
-/**
- * struct pci_saved_state - a device's saved configuration space
- * @dword_map: one bit per DWORD of configuration space, set if that DWORD
- *	       was saved
- * @dword_val: saved values, in ascending configuration space offset order
- *
- * Laid out so that the position of every value is described by the device's
- * configuration space rather than by the kernel.
- */
-struct pci_saved_state {
-	unsigned long	dword_map[BITS_TO_LONGS(PCI_CFG_SPACE_EXP_DWORDS)];
-	u32		dword_val[];
-};
-
 /**
  * pci_store_saved_state - Allocate and return an opaque struct containing
  *			   the device saved state.
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index bc92b037b9d1..623f70cb57c1 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -242,6 +242,20 @@ void pci_reserve_saved_caps(struct pci_dev *dev);
 /* DWORDs of the configuration space header, i.e. pci_dev.saved_config_space */
 #define PCI_STD_HEADER_DWORDS	(PCI_STD_HEADER_SIZEOF / sizeof(u32))
 
+/**
+ * struct pci_saved_state - a device's saved configuration space
+ * @dword_map: one bit per DWORD of configuration space, set if that DWORD
+ *	       was saved
+ * @dword_val: saved values, in ascending configuration space offset order
+ *
+ * Laid out so that the position of every value is described by the device's
+ * configuration space rather than by the kernel.
+ */
+struct pci_saved_state {
+	unsigned long	dword_map[BITS_TO_LONGS(PCI_CFG_SPACE_EXP_DWORDS)];
+	u32		dword_val[];
+};
+
 void pci_saved_caps_finalize(struct pci_dev *dev);
 void pci_saved_caps_release(struct pci_dev *dev);
 int pci_reserve_saved_cap(struct pci_dev *dev, unsigned int off, unsigned int len);
diff --git a/include/linux/kho/abi/pci.h b/include/linux/kho/abi/pci.h
index c2e3a5949f73..ee37d7c84758 100644
--- a/include/linux/kho/abi/pci.h
+++ b/include/linux/kho/abi/pci.h
@@ -93,4 +93,36 @@ struct pci_ser {
 	u64 devices;
 } __packed;
 
+/**
+ * DOC: PCI Saved State Live Update ABI
+ *
+ * A driver that keeps a PCI device running across a Live Update can hand the
+ * state it captured with pci_store_saved_state() to the next kernel. The PCI
+ * core copies the state into memory preserved with KHO, laid out as struct
+ * pci_saved_state_ser, and returns the physical address of that memory, which
+ * the driver records in its own preserved state.
+ *
+ * Every saved value is identified only by the configuration space offset of
+ * the register it was read from. The layout therefore does not depend on which
+ * registers the kernel that saved them chose to save, and the next kernel can
+ * drop values for registers it does not restore.
+ */
+
+/* Number of DWORDs in a PCI Express configuration space (4 KiB). */
+#define PCI_SAVED_STATE_SER_DWORDS 1024
+
+/**
+ * struct pci_saved_state_ser - Serialized struct pci_saved_state
+ *
+ * @dword_map: One bit per DWORD of configuration space. Bit N, i.e. bit
+ *             (N % 64) of @dword_map[N / 64], is set if the DWORD at
+ *             configuration space offset N * 4 was saved.
+ * @dword_val: The saved DWORDs, one per bit set in @dword_map, in ascending
+ *             configuration space offset order.
+ */
+struct pci_saved_state_ser {
+	u64 dword_map[PCI_SAVED_STATE_SER_DWORDS / 64];
+	u32 dword_val[];
+} __packed;
+
 #endif /* _LINUX_KHO_ABI_PCI_H */
diff --git a/include/linux/pci_liveupdate.h b/include/linux/pci_liveupdate.h
index bb79348769b7..9fe260fde5ee 100644
--- a/include/linux/pci_liveupdate.h
+++ b/include/linux/pci_liveupdate.h
@@ -32,6 +32,7 @@ struct pci_liveupdate {
 };
 
 struct pci_dev;
+struct pci_saved_state;
 
 #ifdef CONFIG_PCI_LIVEUPDATE
 int pci_liveupdate_register_flb(struct liveupdate_file_handler *fh);
@@ -40,6 +41,11 @@ int pci_liveupdate_preserve(struct pci_dev *dev);
 void pci_liveupdate_unpreserve(struct pci_dev *dev);
 void pci_liveupdate_finish(struct pci_dev *dev);
 bool pci_liveupdate_is_incoming(struct pci_dev *dev);
+int pci_liveupdate_preserve_saved_state(const struct pci_saved_state *state,
+					u64 *phys);
+void pci_liveupdate_unpreserve_saved_state(u64 phys);
+struct pci_saved_state *
+pci_liveupdate_retrieve_saved_state(struct pci_dev *dev, u64 phys);
 #else
 static inline int pci_liveupdate_register_flb(struct liveupdate_file_handler *fh)
 {
@@ -67,6 +73,23 @@ static inline bool pci_liveupdate_is_incoming(struct pci_dev *dev)
 {
 	return false;
 }
+
+static inline int
+pci_liveupdate_preserve_saved_state(const struct pci_saved_state *state,
+				    u64 *phys)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void pci_liveupdate_unpreserve_saved_state(u64 phys)
+{
+}
+
+static inline struct pci_saved_state *
+pci_liveupdate_retrieve_saved_state(struct pci_dev *dev, u64 phys)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
 #endif
 
 #endif /* LINUX_PCI_LIVEUPDATE_H */
-- 
2.56.0.455.g6c5a503b38-goog

