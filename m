Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041437;
	b=yYHOPJzzU1lCOFLhqIWmvO1H0N0tJVRdZaFevkyJGY+LGcKt7yzsuFZdRFPh5QXvI2ht
	 Toh9NTs5puMHPY3bpSjhyw2m/1ASJdahFFj7wD6+F71zPwmpujBNSxNXvkoaUxOxTtLDm
	 kbHe6NpdgGotOffAiOwgFr4g5+exBOzvFjT2gzWdXC36y/n5D3a89un8fpC3xRruk3eIN
	 zqxDGA45sQT2458Sg8coO5twrvZ12cm/hKywNV8mbFZBPojp2SYefWV77u4SwenK6FQ4D
	 mpMcDfskAa6lyh8fS2PDWxLceOW46mJQsONy+cHQdW3HCbTejFQkAX4x1F8g2YZ1JbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=z7tUVoYWeDGeTao0p+AwzKydfdHA75iYT78ktPbXtuY=;
	b=OPVN3iPvsNeMFc5XOpDvkaSHI6wkQX602IwvhvOakE3huEOqCO95JqB0dxL0q0O2Sc28
	 VTJfOzYbmDKtwgfg6qyh3URcYm/okN18v06fqqJje3cvrUTpd7dEklXPacD9BzXSjVQFd
	 cxKUYSIypZ/jCRA5sQhfv9NlsAY/t/aCaFIZVeM8bs0vd0fKIQUGScvP1+bsu1V+INlK7
	 RbxZnEMheozCTROLTCa2QTjY/Pys81+9AYCTrs272hBuUHJLRiQWil90HxYh4+32g/cfn
	 reFckTUVF953sr50SOMmBhapITwFhIk/UVhEro0KBdKVho1g9q623Wk5eB7azizhdQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VZDPvefI;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CCF60A3820
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 22:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68CCF60A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VZDPvefI
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c467e19391so2295879b6e.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 14:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795041436; x=1795646236; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7tUVoYWeDGeTao0p+AwzKydfdHA75iYT78ktPbXtuY=;
        b=VZDPvefIYa4N3KX0KnZIsiU98TngA7GG4Ap3Wjpq2zvxKy2RlpW2dFbq6lIa0CIbwm
         zt0tSs8LczM47zGYnT3X3H0kQzDaPdf1nBU2GsAXc7RU+bAp7MKQ5K5A9JE010hy2LTx
         woKf+GSXFfvIog4QpiiawrqLaCleYP/4deev0STQVmlZ661lpk4lxX5jlSIZi4dAc7tG
         TtorSkvLm5pQU865FpHqk3PH5Oln+YXWyGamHmN8I7ZUeVMsMz4pgQnGMeo7UldA++Yr
         baFWtxe69TPEdNPglc319sHoTg3ZiF+oqz4scPSRm0sijtOVdHocxhLcUULtIdcAEWZP
         aCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041436; x=1795646236;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7tUVoYWeDGeTao0p+AwzKydfdHA75iYT78ktPbXtuY=;
        b=ZJhG01Tl/wwIZmk9GiAu0MX1oQ6Z78+BF43JjAjXQFkP6PDfy4mhAEJAv6iMo/EuEb
         RS/LlbQPC81A1bsz6al2qR3YhtYGr2yJmwNjAmYK1+aAHcXWRvl7LXkJClBvsBdJZ+6H
         g2uv5RWzVtrwPtfgqDCQkrds2J/HrmGfEhe7d1nTduAZt0NgA4jgreR/kh61h1gN9ZF1
         IZpROGrEaqJACr3/3+f2NPciryMDl0SCJDYLScmRIsPbNdfyhmaiYPsuFTbbGR9z947O
         2+p8TxNiKE2IY6jOyxR3hZTHvSa5MTu7RDTPov9VZWwuylxt5bGGzjuUE7MMtSQekmM/
         RW0Q==
X-Forwarded-Encrypted: i=1; AL+hErHhM0kKiYLDY32ZUprwgMSBL3RUYFH5GagV5w/ZL4KEpmKolerKNFYKmb0VS8pp1PG06P55M+hgzzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6lrKU/3ecoTgVNzAkoycZHRihzUHheUQ465RKQMlMNlAaH2zE
	ZPbjbZUTVyfXW9BHrHUynCeaWG1+S45Zgxx3RrmTuSvze+e5G9XpAG5iVn9KQedaDzSV/+tLbed
	d37mK1kPsT88UQw==
X-Received: from ilkj10.prod.google.com ([2002:a05:6e02:eea:b0:549:aa38:c185])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:221d:b0:4f9:bc36:fc5d with SMTP id 5614622812f47-5773dc44bc0mr5135544b6e.35.1795041436008;
 Wed, 18 Nov 2026 14:37:16 -0800 (PST)
Date: Wed, 18 Nov 2026 22:36:58 +0000
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
Message-ID: <20261118223704.3286085-8-dmatlack@google.com>
Subject: [PATCH v11 07/13] PCI: Refactor matching logic for pci_dev_acs_ops
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

Refactor the logic to match devices to pci_dev_acs_ops by factoring out
the device matching loop into its own routine, pci_dev_acs_ops_get().
Move the per-quirk device checks into a new .match callback so that
pci_dev_acs_ops_get() can return the single matching entry.

This eliminates duplicate code between pci_dev_specific_enable_acs() and
pci_dev_specific_disable_acs_redir(), and will also be used in a
subsequent commit to check if a device requires device-specific
enable_acs() during a Live Update.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/quirks.c | 51 ++++++++++++++++++--------------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 7f1f47ea2ee4..0978be9c17db 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5530,9 +5530,6 @@ static void pci_quirk_enable_intel_rp_mpc_acs(struct pci_dev *dev)
  */
 static int pci_quirk_enable_intel_pch_acs(struct pci_dev *dev)
 {
-	if (!pci_quirk_intel_pch_acs_match(dev))
-		return -ENOTTY;
-
 	if (pci_quirk_enable_intel_lpc_acs(dev)) {
 		pci_warn(dev, "Failed to enable Intel PCH ACS quirk\n");
 		return 0;
@@ -5552,9 +5549,6 @@ static int pci_quirk_enable_intel_spt_pch_acs(struct pci_dev *dev)
 	int pos;
 	u32 cap, ctrl;
 
-	if (!pci_quirk_intel_spt_pch_acs_match(dev))
-		return -ENOTTY;
-
 	pos = dev->acs_cap;
 	if (!pos)
 		return -ENOTTY;
@@ -5582,9 +5576,6 @@ static int pci_quirk_disable_intel_spt_pch_acs_redir(struct pci_dev *dev)
 	int pos;
 	u32 cap, ctrl;
 
-	if (!pci_quirk_intel_spt_pch_acs_match(dev))
-		return -ENOTTY;
-
 	pos = dev->acs_cap;
 	if (!pos)
 		return -ENOTTY;
@@ -5604,56 +5595,56 @@ static int pci_quirk_disable_intel_spt_pch_acs_redir(struct pci_dev *dev)
 static const struct pci_dev_acs_ops {
 	u16 vendor;
 	u16 device;
+	bool (*match)(struct pci_dev *dev);
 	int (*enable_acs)(struct pci_dev *dev);
 	int (*disable_acs_redir)(struct pci_dev *dev);
 } pci_dev_acs_ops[] = {
 	{ PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
+	    .match = pci_quirk_intel_pch_acs_match,
 	    .enable_acs = pci_quirk_enable_intel_pch_acs,
 	},
 	{ PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
+	    .match = pci_quirk_intel_spt_pch_acs_match,
 	    .enable_acs = pci_quirk_enable_intel_spt_pch_acs,
 	    .disable_acs_redir = pci_quirk_disable_intel_spt_pch_acs_redir,
 	},
 };
 
-int pci_dev_specific_enable_acs(struct pci_dev *dev)
+static const struct pci_dev_acs_ops *pci_dev_acs_ops_get(struct pci_dev *dev)
 {
 	const struct pci_dev_acs_ops *p;
-	int i, ret;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(pci_dev_acs_ops); i++) {
 		p = &pci_dev_acs_ops[i];
 		if ((p->vendor == dev->vendor ||
 		     p->vendor == (u16)PCI_ANY_ID) &&
 		    (p->device == dev->device ||
-		     p->device == (u16)PCI_ANY_ID) &&
-		    p->enable_acs) {
-			ret = p->enable_acs(dev);
-			if (ret >= 0)
-				return ret;
+		     p->device == (u16)PCI_ANY_ID)) {
+			if (!p->match || p->match(dev))
+				return p;
 		}
 	}
 
+	return NULL;
+}
+
+int pci_dev_specific_enable_acs(struct pci_dev *dev)
+{
+	const struct pci_dev_acs_ops *p = pci_dev_acs_ops_get(dev);
+
+	if (p && p->enable_acs)
+		return p->enable_acs(dev);
+
 	return -ENOTTY;
 }
 
 int pci_dev_specific_disable_acs_redir(struct pci_dev *dev)
 {
-	const struct pci_dev_acs_ops *p;
-	int i, ret;
+	const struct pci_dev_acs_ops *p = pci_dev_acs_ops_get(dev);
 
-	for (i = 0; i < ARRAY_SIZE(pci_dev_acs_ops); i++) {
-		p = &pci_dev_acs_ops[i];
-		if ((p->vendor == dev->vendor ||
-		     p->vendor == (u16)PCI_ANY_ID) &&
-		    (p->device == dev->device ||
-		     p->device == (u16)PCI_ANY_ID) &&
-		    p->disable_acs_redir) {
-			ret = p->disable_acs_redir(dev);
-			if (ret >= 0)
-				return ret;
-		}
-	}
+	if (p && p->disable_acs_redir)
+		return p->disable_acs_redir(dev);
 
 	return -ENOTTY;
 }
-- 
2.56.1.703.gf848ed807c-goog

