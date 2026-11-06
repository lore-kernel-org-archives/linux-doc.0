Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925786;
	b=fXPuyS2yGb+jsA5/vAK3EELSQ5KUmSeaxmrKMrfS87ufdmvefYjVyqhF8PXm5d1r9kuV
	 azCj+W0oEpqX/EgmOwGi8SsTrK0Mz0MqRa8Bg5OlEOn2ywYJAvcYuSmOv2R+qcGG+Pg62
	 ZhJjygFLXc53lIp1/HiGG7aTWsH6CK6qPg33R73UQxY7woS3zY821JasQwA0dWPEvMatk
	 6+oz2dzqt+/S0EqAOfRQxoe2kXAwhs1uNDu4RzNWhjSOLh7Q0nXcnH9tzGb4UP/mexcL/
	 312ht4owe6r/coOgtcUwxf8ZXrj6E+XNEVknkcJKREl8YqEUV8WhhvrvcUbGeBnsSzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ddBqCr/aEaadxkJlxFoZmLz139RBeJBOYwKmQVBOEIY=;
	b=0AVEdKmOv84ynIZzpmO7DP6CjbAAaxgsZjirU7PsUeeL/FRub0Xtv4P4baUrSIcu36g1
	 417N8m6AnmsBTJ/EM8hc5PmtpgZllf3AVSvB5vd/ksiwA3H7/dVZeq/nDqqmgruiRzEpt
	 A35O9gR5jlV56YvziMkm7UhBu3oKTtbaLvQG50HDVEiQCI2DD5OBrIMyND8Ti87hxU9Ie
	 mSXHFpU6LBunRJCTjyudrIhw1x+L3uZQpAotJ2s7lRDBU9vW+Iz983+YykANIJBINrNd5
	 eF8t1cJPSnUIk4HJ6hVP2t3Sda85rBfhgua2pQVvD6OF4EA6cUMrQE9uQOY9xU7jNiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GRXD3J3V;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F02606D831
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 00:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F02606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GRXD3J3V
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45952ce9ee0so68073fac.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 16:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925785; x=1794530585; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddBqCr/aEaadxkJlxFoZmLz139RBeJBOYwKmQVBOEIY=;
        b=GRXD3J3VOcw4yv/Vrvlmc3RGpi31lT5MppCPnPUi/kZ6+en1QhpIi/gHunKi3NU+7D
         I41HoHyhAjHakKs6kVhSRTfJh1vxqz9vVp55WuHs5Fn5aoEb9Nu8eWmHE10+gUaG7UiG
         5mvzx296xi4VXPJipSajDJSuQfy21T18LyYHbTT1tpI7JrwxYMHYmX27+hmjwhH/x5rH
         g3wSNZ9BqAGqF+GJsOMtmfLprgg5yjVMsfHI5WkuHVOYbBpmloYhRA7cOjlsUUp855Av
         OJf+YqG+dK+3au2b3skaY9vPuLF92rpVe8BjWCJqSPGWBf4iKLMycdhtEKJXZVGCAuzT
         dC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925785; x=1794530585;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddBqCr/aEaadxkJlxFoZmLz139RBeJBOYwKmQVBOEIY=;
        b=tK/YaqUE2GhHYt2Z21NMsk2NeNNpcWhbQgQ0ZxHtWu9Sm1m1dDyGF/7+mWFWaIa6n5
         8mcKpxsHcIs5jvCcXip7x+BnsTKuK33SWJEtdLlFeIZ3M9slhEwhpB1hYJ2Br9VztJR3
         7aE0xR8gt3h6Dhkic4Fl2YYNrMj1Q90j7FnjTQAQ8bK/96Qjt/U6ecjpUx1plxsJq3Ep
         H5OaTPfTRGbw0nS6+Yp6gHD2G/vgrLMm+JDSO7qiSQXAHZOaHhPkw16ntVJS6WWxr0fu
         B6cy0UupSlVkINvMaTKiwVfyfvdGfb8wt7qowhEpuMrbw5PWM0R4lNw3x2APz8KKObOD
         3Frg==
X-Forwarded-Encrypted: i=1; AKwUvBxWhdgJJfrXLIYsy7XpZn5FYfGEa7rvn+fa/u693dk8IAxri/l5kLmtQAYX3nJc5Oi2X+wm+/7QFFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HZLCZYGz8UgfJ5q2arT8Er+v54aVpC7fYYjs5+ec60xvRL6Jk
	WZFd61HppYclBCNLJfAI9oIX8An3YpI4zmX9UDHf6zlYdqAA7NlBSnMYH4mltQaS0PXHzvhZMps
	ZmmZdxdfM5jrwGw==
X-Received: from iobmm23-n1.prod.google.com ([2002:a05:6602:7117:10b0:9ca:dec8:c75d])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1987:b0:4f3:68d6:f131 with SMTP id 5614622812f47-567e099488cmr858385b6e.2.1793925785214;
 Thu, 05 Nov 2026 16:43:05 -0800 (PST)
Date: Fri,  6 Nov 2026 00:42:08 +0000
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
Message-ID: <20261106004218.604799-8-dmatlack@google.com>
Subject: [PATCH v2 07/17] PCI/ASPM: Save L1SS state in the saved capability store
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

Save and restore the L1 PM Substates control registers through the
per-device saved capability store instead of a private pci_cap_saved_state
buffer.

pci_restore_aspm_l1ss_state() needs both the Upstream and Downstream
Port's saved L1SS configuration, and had to fetch two buffers and decode
each by index. Read the saved values by configuration space offset
instead, which names the register at every use. Add
pci_read_saved_l1ss_ctl() to read one device's pair, so that the Port
and the device below it are read the same way.

Reserve PCI_L1SS_CTL1 and PCI_L1SS_CTL2 with a single request in
pci_reserve_aspm_l1ss_state(), since they are adjacent DWORDs. Skip the
reservation when the device has no L1SS capability, which
pci_add_ext_cap_save_buffer() did implicitly.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pcie/aspm.c | 63 ++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 39adf2cad331..2978fde87af6 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -68,24 +68,29 @@ void pci_restore_ltr_state(struct pci_dev *dev)
 	pci_restore_cap_dword(dev, ltr + PCI_LTR_MAX_SNOOP_LAT);
 }
 
-void pci_configure_aspm_l1ss(struct pci_dev *pdev)
+static void pci_reserve_aspm_l1ss_state(struct pci_dev *pdev)
 {
 	int rc;
 
-	pdev->l1ss = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_L1SS);
-
-	rc = pci_add_ext_cap_save_buffer(pdev, PCI_EXT_CAP_ID_L1SS,
-					 2 * sizeof(u32));
+	/* PCI_L1SS_CTL1 and PCI_L1SS_CTL2 are adjacent DWORDs */
+	rc = pci_reserve_saved_cap(pdev, pdev->l1ss + PCI_L1SS_CTL1, 2 * sizeof(u32));
 	if (rc)
-		pci_err(pdev, "unable to allocate ASPM L1SS save buffer (%pe)\n",
+		pci_err(pdev, "unable to reserve ASPM L1SS save state (%pe)\n",
 			ERR_PTR(rc));
 }
 
+void pci_configure_aspm_l1ss(struct pci_dev *pdev)
+{
+	pdev->l1ss = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_L1SS);
+	if (!pdev->l1ss)
+		return;
+
+	pci_reserve_aspm_l1ss_state(pdev);
+}
+
 void pci_save_aspm_l1ss_state(struct pci_dev *pdev)
 {
 	struct pci_dev *parent = pdev->bus->self;
-	struct pci_cap_saved_state *save_state;
-	u32 *cap;
 
 	/*
 	 * If this is a Downstream Port, we never restore the L1SS state
@@ -102,32 +107,32 @@ void pci_save_aspm_l1ss_state(struct pci_dev *pdev)
 	 * Save L1 substate configuration. The ASPM L0s/L1 configuration
 	 * in PCI_EXP_LNKCTL_ASPMC is saved by pci_save_pcie_state().
 	 */
-	save_state = pci_find_saved_ext_cap(pdev, PCI_EXT_CAP_ID_L1SS);
-	if (!save_state)
-		return;
-
-	cap = &save_state->cap.data[0];
-	pci_read_config_dword(pdev, pdev->l1ss + PCI_L1SS_CTL2, cap++);
-	pci_read_config_dword(pdev, pdev->l1ss + PCI_L1SS_CTL1, cap++);
+	pci_save_cap_dword(pdev, pdev->l1ss + PCI_L1SS_CTL2);
+	pci_save_cap_dword(pdev, pdev->l1ss + PCI_L1SS_CTL1);
 
 	/*
 	 * Save parent's L1 substate configuration so we have it for
 	 * pci_restore_aspm_l1ss_state(pdev) to restore.
 	 */
-	save_state = pci_find_saved_ext_cap(parent, PCI_EXT_CAP_ID_L1SS);
-	if (!save_state)
-		return;
+	pci_save_cap_dword(parent, parent->l1ss + PCI_L1SS_CTL2);
+	pci_save_cap_dword(parent, parent->l1ss + PCI_L1SS_CTL1);
+}
 
-	cap = &save_state->cap.data[0];
-	pci_read_config_dword(parent, parent->l1ss + PCI_L1SS_CTL2, cap++);
-	pci_read_config_dword(parent, parent->l1ss + PCI_L1SS_CTL1, cap++);
+/*
+ * Read a device's saved L1 substate configuration.
+ *
+ * Return: true if both registers had a saved value, false otherwise.
+ */
+static bool pci_read_saved_l1ss_ctl(struct pci_dev *dev, u32 *ctl1, u32 *ctl2)
+{
+	return pci_read_saved_cap_dword(dev, dev->l1ss + PCI_L1SS_CTL1, ctl1) &&
+	       pci_read_saved_cap_dword(dev, dev->l1ss + PCI_L1SS_CTL2, ctl2);
 }
 
 void pci_restore_aspm_l1ss_state(struct pci_dev *pdev)
 {
-	struct pci_cap_saved_state *pl_save_state, *cl_save_state;
 	struct pci_dev *parent = pdev->bus->self;
-	u32 *cap, pl_ctl1, pl_ctl2, pl_l1_2_enable;
+	u32 pl_ctl1, pl_ctl2, pl_l1_2_enable;
 	u32 cl_ctl1, cl_ctl2, cl_l1_2_enable;
 	u16 clnkctl, plnkctl;
 
@@ -142,18 +147,10 @@ void pci_restore_aspm_l1ss_state(struct pci_dev *pdev)
 	if (!pdev->l1ss || !parent->l1ss)
 		return;
 
-	cl_save_state = pci_find_saved_ext_cap(pdev, PCI_EXT_CAP_ID_L1SS);
-	pl_save_state = pci_find_saved_ext_cap(parent, PCI_EXT_CAP_ID_L1SS);
-	if (!cl_save_state || !pl_save_state)
+	if (!pci_read_saved_l1ss_ctl(pdev, &cl_ctl1, &cl_ctl2) ||
+	    !pci_read_saved_l1ss_ctl(parent, &pl_ctl1, &pl_ctl2))
 		return;
 
-	cap = &cl_save_state->cap.data[0];
-	cl_ctl2 = *cap++;
-	cl_ctl1 = *cap;
-	cap = &pl_save_state->cap.data[0];
-	pl_ctl2 = *cap++;
-	pl_ctl1 = *cap;
-
 	/* Make sure L0s/L1 are disabled before updating L1SS config */
 	pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &clnkctl);
 	pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &plnkctl);
-- 
2.56.0.455.g6c5a503b38-goog

