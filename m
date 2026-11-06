Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925794;
	b=usgIP1p4cx9iBp7bzhPFW9Q9lE7uQgQwelmubrNIzbmFqxX+W3MEpPv4/F71Gg8dRFIA
	 uLcL2Wn3Vc7BYx2MyEeqqcwp89Ndp6tkRlFsv763n5FeyKo1dWPYLuawUEa3gVYOF/y9b
	 VzaTxxUR2KVZi7/asXy9nmlO806HnSP7l6+ClEinJYjE6TtozM/XihPg/3JlJlMoD+YWp
	 okrGj4JpS8YEVP4REI/uRnELtYf2khbfvrufxWVSTl2Ue092BCIFLypOBPARkOa6p6KDW
	 pX49OF2UHw9ZGVxJEOR8jl6EglewY/3zsZLfsr0uqC0TBPhV2qFpOVbnA2j6KdcmXvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Ko9lBiZy6mSuKQIVTlOLgBpFZr5J5ifQKI8Or80My08=;
	b=k9tg0JQB0SXGeQteC2fwBnPWoBr6LYb89G1YoIalqAkrwFSm41VAFRg5kG6eJg2KrlWo
	 1rBWrAgbB8cSxo0XVGPCHXEqd8MeQ8NvSjgPLWaUglaWzCb5id/KRBXACn8HnnMouOPGW
	 FfA5/TAIL+s8rd8DmandHJDKujt7egrscEXvoJK2ypdETcbSNo2tZmMQGJJ5+I6IZWnTe
	 I8ahHM9C/XoDSczSoSQJoxbQ28G0hvK4Y4K7nctOYo+X03G+QeaaJFRbGd/VJaFRvslCx
	 T8ZWbuoi1XD5fbbHH8EzS/62R1l62pQQPOgL5VOCLxUDq5seEzIgMb7DkHc/1YFeykw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dMLuccPY;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12625606EE82
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 00:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12625606EE82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dMLuccPY
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5640a2d9708so91754b6e.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 16:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925793; x=1794530593; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ko9lBiZy6mSuKQIVTlOLgBpFZr5J5ifQKI8Or80My08=;
        b=dMLuccPYt2as19f9gKIoyHFm4EQ53K5zyjyxoBEtNOOC3rg27vHMGIiJVFDF7QV2gY
         62JhU0GHW5T1GDNJgNneDXX5ACBr9bKUpwQVGXLuMPgM6rfhSLMMakBSbXiWuVeMJwjY
         WU7CL5ucp/JMsaslIE4CdZ/50ADTpTWcHjdalPHlHYPVWNaWdNV/BUmol1ahM7C1xgBv
         6lZ65/t2gF3J5OiJLSBy7Bg+Mu4eHCguuj8Rn6lH1w+gCK6R/TYe1Y7aw5lzQ45Bu9ed
         GNHGCLSP5NSGKEHKf+BZId/NdQ51tQcZri/ROeZbcfYk0tSCamdL+Y0Am3bhRxf/6ogX
         4t6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925793; x=1794530593;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ko9lBiZy6mSuKQIVTlOLgBpFZr5J5ifQKI8Or80My08=;
        b=JJ0vptzvbSb8oQZgss6D3pC50GjuQGbxKTYn6non2qVXKnsIWCN6DdCTDSZUsmuux7
         couGz+gf46DzEiODIRejN17vqF/JRbFyriHJnRuHyTWIXWcT7nyHhpK7yJC11ejuKTo6
         elflqsJfkGMnVLmv9oYTGA0YOlCqR/Uox7u8yPsrzba9WilY2E8Dhe2d+T0Z75BUfUyp
         WZmx24XqOA6TRSEPCpHwDCvJRogXx3zP7+k8j1cmfc4DimtvTPUUPG5ZEFya3loFqyTw
         RKfKjIsf0hACTV7xze9rgCVnoCM9XECsB9druyLwro/+E0n1S8QjerutP9Pxnya0CQNX
         x5tQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEbTUIYiJ+vVAzjoDbxFPzi8QpCsu4iTLrEDK2eeeBrjXiyg4PWq1g34z1mO2LnBggY8/NEdvDPx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FFHDX6Ey7XE1K5mdFHhq90K8oUjJP4fHUR24gj+SH7HASq2XX
	TCzhvvsYPX7N/ZDuBaYODlamAUrHyDAMbIP7DBIRyl1D90AuLFAKXdogzUneqmCAreX0Y4kg8eN
	RZ5wCcXYMyyKbPQ==
X-Received: from iobgs6.prod.google.com ([2002:a05:6602:4fc6:b0:9c7:69c7:3d52])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:5087:b0:4f4:857c:98ae with SMTP id 5614622812f47-567e0faea86mr686749b6e.11.1793925792669;
 Thu, 05 Nov 2026 16:43:12 -0800 (PST)
Date: Fri,  6 Nov 2026 00:42:14 +0000
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
Message-ID: <20261106004218.604799-14-dmatlack@google.com>
Subject: [PATCH v2 13/17] PCI/VC: Split the VC Resource Control restore into a helper
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

Move the restore of the VC Resource Control register out of
pci_vc_do_save_buffer() and into pci_vc_restore_res_ctrl().

Restoring this register is more involved than the rest of the walk: the
enable bit has to be preserved across the write, the port arbitration
table may have to be reloaded, and the VC may have to be re-enabled
afterwards. Inlined in the middle of a loop that is already sizing,
saving and restoring three kinds of register, it is hard to see where
that sequence begins and ends.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/vc.c | 51 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/vc.c b/drivers/pci/vc.c
index a4ff7f5f66dd..5b507207d56d 100644
--- a/drivers/pci/vc.c
+++ b/drivers/pci/vc.c
@@ -168,6 +168,37 @@ static void pci_vc_enable(struct pci_dev *dev, int pos, int res)
 		pci_err(link, "VC%d negotiation stuck pending\n", id);
 }
 
+/**
+ * pci_vc_restore_res_ctrl - Restore a VC Resource Control Register
+ * @dev: device
+ * @pos: starting position of VC capability (VC/VC9/MFVC)
+ * @res: VC resource number, ie. VCn (0-7)
+ * @ctrl: saved VC Resource Control Register
+ */
+static void pci_vc_restore_res_ctrl(struct pci_dev *dev, int pos, int res,
+				    u32 ctrl)
+{
+	int ctrl_pos = pos + PCI_VC_RES_CTRL + (res * PCI_CAP_VC_PER_VC_SIZEOF);
+	u32 tmp;
+
+	/*
+	 * For an FLR case, the VC config may remain.  Preserve enable bit,
+	 * restore the rest.
+	 */
+	pci_read_config_dword(dev, ctrl_pos, &tmp);
+	tmp &= PCI_VC_RES_CTRL_ENABLE;
+	tmp |= ctrl & ~PCI_VC_RES_CTRL_ENABLE;
+	pci_write_config_dword(dev, ctrl_pos, tmp);
+
+	/* Load port arbitration table if used */
+	if (ctrl & PCI_VC_RES_CTRL_ARB_SELECT)
+		pci_vc_load_port_arb_table(dev, pos, res);
+
+	/* Re-enable if needed */
+	if ((ctrl ^ tmp) & PCI_VC_RES_CTRL_ENABLE)
+		pci_vc_enable(dev, pos, res);
+}
+
 /**
  * pci_vc_do_save_buffer - Size, save, or restore VC state
  * @dev: device
@@ -311,23 +342,9 @@ static int pci_vc_do_save_buffer(struct pci_dev *dev, int pos,
 			if (save)
 				pci_read_config_dword(dev, ctrl_pos,
 						      (u32 *)buf);
-			else {
-				u32 tmp, ctrl = *(u32 *)buf;
-				/*
-				 * For an FLR case, the VC config may remain.
-				 * Preserve enable bit, restore the rest.
-				 */
-				pci_read_config_dword(dev, ctrl_pos, &tmp);
-				tmp &= PCI_VC_RES_CTRL_ENABLE;
-				tmp |= ctrl & ~PCI_VC_RES_CTRL_ENABLE;
-				pci_write_config_dword(dev, ctrl_pos, tmp);
-				/* Load port arbitration table if used */
-				if (ctrl & PCI_VC_RES_CTRL_ARB_SELECT)
-					pci_vc_load_port_arb_table(dev, pos, i);
-				/* Re-enable if needed */
-				if ((ctrl ^ tmp) & PCI_VC_RES_CTRL_ENABLE)
-					pci_vc_enable(dev, pos, i);
-			}
+			else
+				pci_vc_restore_res_ctrl(dev, pos, i,
+							*(u32 *)buf);
 			buf += 4;
 		}
 		len += 4;
-- 
2.56.0.455.g6c5a503b38-goog

