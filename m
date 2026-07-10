Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B74D3BCD34
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 21:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718793; cv=none; b=DRmHAu7UDJN1V4Y9fA3uW80u6LHCExqk1ljq+ploBrLqc3scyn3Hq7xprmB1hSxYMQhlzoBjtFSj6nteT3nLJ8RkuwaTJ12NB19bqX2TXNCC71LlB60uKN0FiuwqYSE5C1LJdj344ozUVk3Sru8/b6kWdij6q+TMA+UVlz316LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718793; c=relaxed/simple;
	bh=4mMeD/WJsmKp4i9OQVeLhrR8NDiaTpFSYRFgOS4JvXA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=evmjoSOAQYfBXpzC0FotRZm+UotJAb6OfENQTSPyT9RRp5+zY4b61KdrIcnyXRMU0VvPsif4yN9sR2by8rGCFPzokkbXFRSydwpi4BSc8CzMaJVNa7hP+phXOM+wVUgBp7P2xpAHMIgzHsup7D1DETQAK2Y/SUPKVUjSUlthdW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q2/JzkO+; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q2/JzkO+"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so2497244b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 14:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783718789; x=1784323589; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92/0TGptvABo802k4Z/+83heETiRRWcuAF49mOH2xHs=;
        b=q2/JzkO+OFrnzeztMC/0T6+Ggg4VNqbt64d3Zw/N2Yfu5MbUibc00m//3WbdEomJDt
         BdRQN4PJKg17sO/1gZYCr3fpRUb3MaEhVW1wCQerlmCvJr/WDCvGz1Ae8ncp8RX61/Qa
         wDXPKvmZKd96BWYcEl1rhqOOfFAh2rmZdeT8WBAluhk8lZlIM3rD9DoRSlLz7g0uatuC
         J6b2EbLpmtH0NVb0Pu++O+JXTwgrgQR0Cq8yan7Z50GvVxc9jQIxcSFtyhPlLKh0jhWK
         Xe4tc+6yrsYY6B0nnEaRNrbASbOfHhHOgC6vy2Lw7a+kYx6C68fimBkXsBV4/Tc5H9ee
         fNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718789; x=1784323589;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92/0TGptvABo802k4Z/+83heETiRRWcuAF49mOH2xHs=;
        b=SeHLrkbdoxz5G9zeFKoVDt/Rw31s+4qwdVOLfwm6d9MHTDThhMQgXZ4Tcu8b16iDtF
         MraZGyY6Vr1he9Fju4PTnanTzmja2EJtuqVGY/gxjEeu3BNJjh1xZR/sIo8j9dKSLcp3
         R/F8SPFF3JM2FB2Sx6O/I2cDr6iQaeAgA+MFBN5b3UuakUgrbW1MoUp9Gr0PUf1DPV6/
         uV8kanpiat/N76nic12NSoPIp0fX+LXEkmPpmE3uo1ZasI8goHs7mwUlSiNucp/5wHm1
         6FB5cHIxHLe7X5zu9yblR/+6G6lyrElBezUQSa+mpYMyIEqcRggfkKpfOdFqo7T2x9HS
         YMDw==
X-Forwarded-Encrypted: i=1; AHgh+Rpxvs3JyvjHJHyfigsr/TNs25C6mrW7zpUKGQfCLcbudiQVxOxGdKQUIehMZ8e3Xq+ajUHqoXLh1Ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXJikzHeyjos2gnCQmwnOPmOk+6w6RO33rOzR5t/FDJs6UvS2r
	P+iZlxcm5qU8b1br0C6VOgR6FNX413biaP9q4fWdjQmKeCWJp90YbY4A36gG32byUaB1Cwo6V8D
	QGIL/Hsz0k5zQUg==
X-Received: from pfn17.prod.google.com ([2002:a05:6a00:a211:b0:848:7bbd:284b])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:ab88:b0:848:2f84:f429 with SMTP id d2e1a72fcca58-8488976cfd4mr571193b3a.66.1783718788869;
 Fri, 10 Jul 2026 14:26:28 -0700 (PDT)
Date: Fri, 10 Jul 2026 21:26:10 +0000
In-Reply-To: <20260710212616.1351130-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260710212616.1351130-8-dmatlack@google.com>
Subject: [PATCH v7 07/12] PCI: Refactor matching logic for pci_dev_acs_ops
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

Refactor the logic to match devices to pci_dev_acs_ops by factoring out
the loop and device matching into its own routine. This eliminates some
duplicate code between pci_dev_specific_enable_acs() and
pci_dev_specific_disable_acs_redir(), and will also be used in a
subsequent commit to check if a device requires device-specific
enable_acs() during a Live Update.

No functional change intended.

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/quirks.c | 51 ++++++++++++++++++--------------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index b09f27f7846f..7ac39ec2843e 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5374,9 +5374,6 @@ static void pci_quirk_enable_intel_rp_mpc_acs(struct pci_dev *dev)
  */
 static int pci_quirk_enable_intel_pch_acs(struct pci_dev *dev)
 {
-	if (!pci_quirk_intel_pch_acs_match(dev))
-		return -ENOTTY;
-
 	if (pci_quirk_enable_intel_lpc_acs(dev)) {
 		pci_warn(dev, "Failed to enable Intel PCH ACS quirk\n");
 		return 0;
@@ -5396,9 +5393,6 @@ static int pci_quirk_enable_intel_spt_pch_acs(struct pci_dev *dev)
 	int pos;
 	u32 cap, ctrl;
 
-	if (!pci_quirk_intel_spt_pch_acs_match(dev))
-		return -ENOTTY;
-
 	pos = dev->acs_cap;
 	if (!pos)
 		return -ENOTTY;
@@ -5426,9 +5420,6 @@ static int pci_quirk_disable_intel_spt_pch_acs_redir(struct pci_dev *dev)
 	int pos;
 	u32 cap, ctrl;
 
-	if (!pci_quirk_intel_spt_pch_acs_match(dev))
-		return -ENOTTY;
-
 	pos = dev->acs_cap;
 	if (!pos)
 		return -ENOTTY;
@@ -5448,56 +5439,56 @@ static int pci_quirk_disable_intel_spt_pch_acs_redir(struct pci_dev *dev)
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
2.55.0.795.g602f6c329a-goog

