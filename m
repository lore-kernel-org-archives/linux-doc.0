Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925784;
	b=UE3df/tmWY4hFvI2T3pdHULpwLJ6lZetPE9HnHsOosrU2hYcZJ4lA3sdE8A4dN3LOjxw
	 g6jy5ORlle214z0xjcjDzjRqVKGOIw+FoaLb+yZboFoAVYFsGLPkL5YJvxLyO83t1CJ+G
	 d4dn+Q0NEbN0LUSZNTM2HjbguaJsh3fEjjuEpr5544uQ66Ai7LFSV/uyYV9zB3OYmBCIi
	 QxgT9e4cszbguFFYnhVcciRJtGrRpcFGku/42iVqjokx+7507rrnNfIxhybBCQrbLZnmB
	 JmDuAg8YE8ubG/m8TN0xd1P6efZUAp/Iempud5KRmzboELRkX0x014OkBF1nDbSE/Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=clDl87D5pggy1VDwhZUzZxM8yGbSHZ+6BQixZZJAVUs=;
	b=mtp51OG61GAkNj4xr1QYmPMm/bfxapoQXoIoqazsSkLRbmKwL0fsWpxU1X+uihWZeOQ8
	 ZiYJ7gZfJ3LuveMde4fyjEgX98fnja3EtxhBBBjG1lsXBjbjaJfXJmXiBtFpguWI6yahL
	 XE43qgR1Xud5rspqqIxpDtzF0RFpsBnV10/VEPRlLtR0+fW5yxjR0tpn3s2M851xUXxYu
	 aSAzKXfNW16wAZmUTCtR5TguVBac75XFGFa8OpiaDAYPoVlrc5Unr1bbH8+ZscoZxLVtb
	 xQX1j90AzO5muFxU/WTGkj8dkC7QHZOBagkw/M13JTFW1GzZk0o72HnBtFRFo0mvvyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LKd1GHhC;
	arc=none smtp.remote-ip=209.85.160.72
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6CA606A33D
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 00:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D6CA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LKd1GHhC
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-49dd26d6f07so63440fac.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 16:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925783; x=1794530583; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clDl87D5pggy1VDwhZUzZxM8yGbSHZ+6BQixZZJAVUs=;
        b=LKd1GHhCX7SaMEw3wOg+ZX7DtaCsfH+3CR3zO3v2rIG7sPNWFfG0BYp96sO2+fcX43
         8bdokgHhBKU1I+OCKMrOFgOQ6liW4MvZkGOz3f5YJKjWwhCz9WWdHSnQc5/1G0l7ktTp
         LcZTDrL9r2eabx1HDEn4knmIsyR6b2TZwKJ/0ZvqT3uygBktktAWOd/ffPGoVzFltyK9
         fx4Vmm0qBWYsZ7DW+WnJ9IzyxvKOr3YZLOPdJ8xF2AodUsR/nLd5mShuPVYGRAP19mRJ
         40L9ot0LiHg0l9SLjZpcsAFGo4U2DpAm8UNxTXUtxNlrer8/h27oJxmNMHibbN4Bf8Y8
         RV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925783; x=1794530583;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clDl87D5pggy1VDwhZUzZxM8yGbSHZ+6BQixZZJAVUs=;
        b=boSpfw7m+PztRscAyvwB13paG4XW7GCEoZ1ASITWYtgRTIh9G9A9WDe4zgU0dyzz6z
         A+5TV3iCTeCB3lZVCsFZbH2F+Ea9OEpFoXYVf3HKPqYqZ2LvxWLvIBKFlnRhoBl0Hbje
         5DDH1SH/B/5kLUzzcFNWjOcfAh0ovRBtPzlda4RhGKbo7Yu45iZWXKtcvHh5eHtRlxG2
         L/jY1IVBRAfXiqscPr3ZlL8WqVvYQCKuwNZ4zgnW/RPvKRYU45Eg7SV4VPEA0nx53Oqq
         82ZgnFeVINl/TzU2FJDGp3ONJNRZZJpPXZdp6NmoAnGYaAtimA4V9lokmyDJXb4HjpUV
         d9/A==
X-Forwarded-Encrypted: i=1; AKwUvBzZgzjkpm+NUKCxSdDrrF9IUZet4XGIgaYTYZ0/bjnSsNBwf5IOx3taWleS6W53hXR6DA//rzedDqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wjUfhrodfKtMBNJpXVw7F2UKVBgIy3gD9CIBj+bEPK2kIV8wW
	b58CHAsGbDc5oHdPwrLB/EKoCow2gc9t5n2Rt5x9XdtVtmgIrp1/bL2pspqtG0q03GEmN5Gwp1l
	RQpAsg3yXPRd4Sg==
X-Received: from iofl4-n1.prod.google.com ([2002:a05:6602:8384:10b0:9e3:4909:2e0c])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3197:b0:564:4f93:707f with SMTP id 5614622812f47-567e1038170mr654365b6e.24.1793925782556;
 Thu, 05 Nov 2026 16:43:02 -0800 (PST)
Date: Fri,  6 Nov 2026 00:42:06 +0000
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
Message-ID: <20261106004218.604799-6-dmatlack@google.com>
Subject: [PATCH v2 05/17] PCI: Save PCI-X state in the saved capability store
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

Save and restore the PCI-X Command register through the per-device saved
capability store instead of a private pci_cap_saved_state buffer.

Reserve the register by its configuration space offset during device
setup, in pci_reserve_pcix_state(), so that the save and restore paths
no longer have to locate a buffer.

Make pci_save_pcix_state() void, so pci_save_state() no longer fails with
-ENOMEM when the PCI-X save buffer is missing. A failure to allocate the
store is reported once during device setup instead.

No other functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pci.c | 47 ++++++++++++++++++++---------------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index fde1dcd99e94..6cf4a64cb7e6 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1900,40 +1900,40 @@ static void pci_restore_pcie_state(struct pci_dev *dev)
 	}
 }
 
-static int pci_save_pcix_state(struct pci_dev *dev)
+static void pci_save_pcix_state(struct pci_dev *dev)
 {
 	int pos;
-	struct pci_cap_saved_state *save_state;
 
 	pos = pci_find_capability(dev, PCI_CAP_ID_PCIX);
 	if (!pos)
-		return 0;
+		return;
 
-	save_state = pci_find_saved_cap(dev, PCI_CAP_ID_PCIX);
-	if (!save_state) {
-		pci_err(dev, "buffer not found in %s\n", __func__);
-		return -ENOMEM;
-	}
+	pci_save_cap_word(dev, pos + PCI_X_CMD);
+}
 
-	pci_read_config_word(dev, pos + PCI_X_CMD,
-			     (u16 *)save_state->cap.data);
+static void pci_reserve_pcix_state(struct pci_dev *dev)
+{
+	int pos, rc;
 
-	return 0;
+	pos = pci_find_capability(dev, PCI_CAP_ID_PCIX);
+	if (!pos)
+		return;
+
+	rc = pci_reserve_saved_cap(dev, pos + PCI_X_CMD, sizeof(u16));
+	if (rc)
+		pci_err(dev, "unable to reserve PCI-X save state (%pe)\n",
+			ERR_PTR(rc));
 }
 
 static void pci_restore_pcix_state(struct pci_dev *dev)
 {
-	int i = 0, pos;
-	struct pci_cap_saved_state *save_state;
-	u16 *cap;
+	int pos;
 
-	save_state = pci_find_saved_cap(dev, PCI_CAP_ID_PCIX);
 	pos = pci_find_capability(dev, PCI_CAP_ID_PCIX);
-	if (!save_state || !pos)
+	if (!pos)
 		return;
-	cap = (u16 *)&save_state->cap.data[0];
 
-	pci_write_config_word(dev, pos + PCI_X_CMD, cap[i++]);
+	pci_restore_cap_word(dev, pos + PCI_X_CMD);
 }
 
 /**
@@ -1953,11 +1953,7 @@ int pci_save_state(struct pci_dev *dev)
 	dev->state_saved = true;
 
 	pci_save_pcie_state(dev);
-
-	i = pci_save_pcix_state(dev);
-	if (i != 0)
-		return i;
-
+	pci_save_pcix_state(dev);
 	pci_save_dpc_state(dev);
 	pci_save_aer_state(dev);
 	pci_save_ptm_state(dev);
@@ -3749,10 +3745,7 @@ void pci_allocate_cap_save_buffers(struct pci_dev *dev)
 	int error;
 
 	pci_reserve_pcie_state(dev);
-
-	error = pci_add_cap_save_buffer(dev, PCI_CAP_ID_PCIX, sizeof(u16));
-	if (error)
-		pci_err(dev, "unable to preallocate PCI-X save buffer\n");
+	pci_reserve_pcix_state(dev);
 
 	error = pci_add_ext_cap_save_buffer(dev, PCI_EXT_CAP_ID_LTR,
 					    2 * sizeof(u16));
-- 
2.56.0.455.g6c5a503b38-goog

