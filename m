Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925788;
	b=h/xp6ieIl2Zde1jTmCe1vopUDiBk02W6FS6TASWj8lXYqDuPVGOyfI5j3GPupelmLJFC
	 zFu/S4UKN2IiDVWqD4L2h62SLeakG0bJ4V7v4ToUwv7pDCo40TmpUATdWf6VhS5UK+9pg
	 FIW3NvR/YaB65HnFgg2Juu8/V0aNO1eVsWK2XHXSF2ixUrxpIlpY7RY5Tu5zYmDeqjlGW
	 inp7vF66fVa5cOMlAJuqC6RfKGgFjG63pMSi3Pu2j04F97XhEy27HY80CtzakqrK/aEtL
	 zwKRXO0/l0tJnCZdT0gFa6LywXL99bdbC6JlAaltCHlbHSr3138wwg0GeXwskJp8l3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=L+Hzdt+LObwzKPIKo4htZh/cma3z4S09Q2AYbp2zhRQ=;
	b=DITMGpC10uUT51MydAyYPfOIGKSx3ZP91lYrU6Rl3py7GCKqWlzmML3Y5Qswk/VP22tY
	 AIulI2D3yjR4mB5baD2QPjw8R48upHZf1Bc41lIdWafFYGp0FADuF1CKqLxZLs0D+GXQU
	 hxD9t3vQ6m2hltGIuYEzV/lf5V7RlAmXMmUJ1lAwGwDMqffPy+gLdyqMX8Z4c6OSuj20o
	 1JhWjEpVMBKzHGpulqdnjf59Wqt6zlCqRnNvveNlk0h1cncRahaVEDUYnUeyZMu/Utij7
	 Vs06/cBRC2gNr1vIP07+DylcivAVxXoiPZxR1cud3QfobQUJRPhmW1kORtuupoDVPTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GLok5OQK;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64AC606A33D
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 00:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A64AC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GLok5OQK
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-82274137201so285872a34.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 16:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925787; x=1794530587; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+Hzdt+LObwzKPIKo4htZh/cma3z4S09Q2AYbp2zhRQ=;
        b=GLok5OQK4Ow7SgShVorGKp6skp2J/HJx9twfmIJhIcx6leE859yXQiOecxqpe9rbr8
         nJrqbTEjmpXCiCptdC9Sy0ti+NQxzuTEoT1byTGsUvVGLyDDeEuAjm5TCpwDzS5blNaW
         dO338oYXgYWcmN/HW7/AD+1j/jR+UQ4MHjLetWAwtiCaOhVr+hZAYx7U6Qkjz/qia9kD
         K+Nn7u6qcRha4+luZQC9WHcWgm1IVxMYDG05Mri+sVFyEcv9jJIJAlyzKcC7n6HQRa+z
         uMCfzr8ukX/zLg9/JtxI8LLXEoDgn0QtgefxN+HieVce5Iw6HxIajjLDy90E91vSs/Xv
         Doug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925787; x=1794530587;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+Hzdt+LObwzKPIKo4htZh/cma3z4S09Q2AYbp2zhRQ=;
        b=lWd370LShn7BILTasl/t6RdZqXA2QX4opM2XxdcWbLRIQskZzl/7OBdDgT4po+NcfP
         WTfq7JSUHTxaY51PiSqGAEeISBpKL9hEBY2JALzF8ikn1I5RZqpAZ96UCnDkfo/yWE24
         PtXv284pr9BswLn0YQZMB+eON2CaWSAITEj4DlEjjx2BbEFV79GHJzHg0PBoeF2Nfme3
         eibDeADgwQiw8tT/HIgpogE8NV7OWU/VFyaE40rNsxUVrlvV0sM0sc1z8yoU8HW0VR/Y
         rzMqPs+lC8PR9RI+picinqj1LLRd3Gi2HKAmxdWCrjeG1d0/GuHyo3HZbVzpixU/Qnb0
         m9+g==
X-Forwarded-Encrypted: i=1; AKwUvBxh24BJTVwqscb0ZOoHVQ7X54ZYBz43jvSXUs52EzfOyXMknRoxD+TrmEEKxsoiz9rTtPVim1mFZ7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tkbkCja3NI5n+ui11zWTeXxHrl2VsF7xrltNnKypxyH6ckiMh
	7rvEbesXVrUsPld5HXkCXTUHc8yCCAtjHnO3dsaKGKpds202U5rHw8KYTP6fosiOPzH7MQGygXe
	z2QaJBbeyM953Jw==
X-Received: from iozd24.prod.google.com ([2002:a05:6602:3298:b0:9c7:85f4:7637])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:23cf:b0:532:d9f5:1de6 with SMTP id 5614622812f47-567e182dc9fmr636250b6e.65.1793925786350;
 Thu, 05 Nov 2026 16:43:06 -0800 (PST)
Date: Fri,  6 Nov 2026 00:42:09 +0000
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
Message-ID: <20261106004218.604799-9-dmatlack@google.com>
Subject: [PATCH v2 08/17] PCI/AER: Save AER state in the saved capability store
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

Save and restore the AER mask, severity, capability and root command
registers through the per-device saved capability store instead of a
private pci_cap_saved_state buffer.

Describe the registers in aer_saved_regs[] and drive the reservation, save,
and restore loops from it. Previously the three had to be kept in the same
order by hand, and pci_aer_init() encoded the register count as a bare 4 or
5.

Reserve the registers in pci_reserve_aer_state(), called from
pci_aer_init(), and report a refused reservation. pci_aer_init() ignored
the return value of pci_add_ext_cap_save_buffer(), so a failed
allocation left AER state unsaved without any message. An allocation
failure is now reported once by pci_saved_caps_finalize().

No other functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pcie/aer.c | 85 +++++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 39 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index d8dcd238fda1..25436bcf9fb9 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -352,54 +352,68 @@ int pci_aer_clear_status(struct pci_dev *dev)
 	return pci_aer_raw_clear_status(dev);
 }
 
-void pci_save_aer_state(struct pci_dev *dev)
+/*
+ * AER registers saved and restored by the PCI core. PCI_ERR_ROOT_COMMAND is
+ * only implemented by Root Ports and Root Complex Event Collectors (PCIe
+ * r6.0, sec 7.8.4.9) and so must come last.
+ */
+static const u16 aer_saved_regs[] = {
+	PCI_ERR_UNCOR_MASK,
+	PCI_ERR_UNCOR_SEVER,
+	PCI_ERR_COR_MASK,
+	PCI_ERR_CAP,
+	PCI_ERR_ROOT_COMMAND,
+};
+
+static unsigned int aer_nr_saved_regs(struct pci_dev *dev)
 {
-	int aer = dev->aer_cap;
-	struct pci_cap_saved_state *save_state;
-	u32 *cap;
+	if (pcie_cap_has_rtctl(dev))
+		return ARRAY_SIZE(aer_saved_regs);
 
-	if (!aer)
-		return;
+	return ARRAY_SIZE(aer_saved_regs) - 1;
+}
 
-	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_ERR);
-	if (!save_state)
+void pci_save_aer_state(struct pci_dev *dev)
+{
+	unsigned int i;
+
+	if (!dev->aer_cap)
 		return;
 
-	cap = &save_state->cap.data[0];
-	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, cap++);
-	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_SEVER, cap++);
-	pci_read_config_dword(dev, aer + PCI_ERR_COR_MASK, cap++);
-	pci_read_config_dword(dev, aer + PCI_ERR_CAP, cap++);
-	if (pcie_cap_has_rtctl(dev))
-		pci_read_config_dword(dev, aer + PCI_ERR_ROOT_COMMAND, cap++);
+	for (i = 0; i < aer_nr_saved_regs(dev); i++)
+		pci_save_cap_dword(dev, dev->aer_cap + aer_saved_regs[i]);
 }
 
 void pci_restore_aer_state(struct pci_dev *dev)
 {
-	int aer = dev->aer_cap;
-	struct pci_cap_saved_state *save_state;
-	u32 *cap;
+	unsigned int i;
 
-	if (!aer)
+	if (!dev->aer_cap)
 		return;
 
-	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_ERR);
-	if (!save_state)
-		return;
+	for (i = 0; i < aer_nr_saved_regs(dev); i++)
+		pci_restore_cap_dword(dev, dev->aer_cap + aer_saved_regs[i]);
+}
 
-	cap = &save_state->cap.data[0];
-	pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, *cap++);
-	pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_SEVER, *cap++);
-	pci_write_config_dword(dev, aer + PCI_ERR_COR_MASK, *cap++);
-	pci_write_config_dword(dev, aer + PCI_ERR_CAP, *cap++);
-	if (pcie_cap_has_rtctl(dev))
-		pci_write_config_dword(dev, aer + PCI_ERR_ROOT_COMMAND, *cap++);
+static void pci_reserve_aer_state(struct pci_dev *dev)
+{
+	unsigned int i;
+	int rc;
+
+	for (i = 0; i < aer_nr_saved_regs(dev); i++) {
+		unsigned int off = dev->aer_cap + aer_saved_regs[i];
+
+		rc = pci_reserve_saved_cap(dev, off, sizeof(u32));
+		if (rc) {
+			pci_err(dev, "unable to reserve AER save state (%pe)\n",
+				ERR_PTR(rc));
+			return;
+		}
+	}
 }
 
 void pci_aer_init(struct pci_dev *dev)
 {
-	int n;
-
 	dev->aer_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ERR);
 	if (!dev->aer_cap)
 		return;
@@ -415,14 +429,7 @@ void pci_aer_init(struct pci_dev *dev)
 	ratelimit_state_init(&dev->aer_info->nonfatal_ratelimit,
 			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
 
-	/*
-	 * We save/restore PCI_ERR_UNCOR_MASK, PCI_ERR_UNCOR_SEVER,
-	 * PCI_ERR_COR_MASK, and PCI_ERR_CAP.  Root and Root Complex Event
-	 * Collectors also implement PCI_ERR_ROOT_COMMAND (PCIe r6.0, sec
-	 * 7.8.4.9).
-	 */
-	n = pcie_cap_has_rtctl(dev) ? 5 : 4;
-	pci_add_ext_cap_save_buffer(dev, PCI_EXT_CAP_ID_ERR, sizeof(u32) * n);
+	pci_reserve_aer_state(dev);
 
 	/*
 	 * Advisory Non-Fatal Errors are masked by default (PCIe r7.0, sec
-- 
2.56.0.455.g6c5a503b38-goog

