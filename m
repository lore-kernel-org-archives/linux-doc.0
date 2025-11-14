Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB6F34A3D6
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 17:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142824; cv=none; b=Oeac8PQd9Ekjlq2j79RUVIKjPewrN2GMl2hhyC5w57lIWuWgK1MZZ17aocYP2pTCCcZyDWrUb0sYWhwg4yj1QrI8GyJ2rPXp8Ufx3qhskgtF4Ph2T+RIYxG9rRa4kjFQ52+txn4mrkUGbDm5B+VQcXUZyyClNZ6+oXwFg2ZcMZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142824; c=relaxed/simple;
	bh=kDTJWMmKN9+MOWIojwGJqMyG0JPZ5KXPAyNT2PUTw2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jBLt4gSWqEiX8eYQBMCJP8IEx899gwG/fxMPPCKV2HsLsDR/hRPkBFPqlQF5X9jsEYNzGnT8CJ68ff05z9uejqPGMYxWgIhLXhCZdBeXPesQFVkVkC0Vt6E17HAfQrcroJZP71SOvfdyy7tk6babSf1LU7INd09+DP8KcGO5GMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HPhbh1vV; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HPhbh1vV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9D83FC10F6F;
	Fri, 14 Nov 2025 17:53:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 726096060E;
	Fri, 14 Nov 2025 17:53:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B942103719A9;
	Fri, 14 Nov 2025 18:53:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bXNGKKPe2xfLrB79EbbpZKWghN08fwXDQNrdCNHKVkA=;
	b=HPhbh1vVY16GcXBe+azcFeketYp/9jtzteLU7B5sKVd/9V2kjQwgoe4MHSk6g0xNnfi2eV
	hNz1qKCcI9w4O1O0yJOAkZYJ1Br/qRhUi6hIvSimiheWo1mRDOCrl78hcA/fyVwHzKTYW/
	AFnCZR62llvcMhReOd+lmzw5SLbaCgrKE0vnXCkHc3j0Ftd5mX816ZdnKxsYAIxFJEiVnt
	R9xyocHWfOfvy6tzPvz8lAazCPwTypcissk2xB4Qru5Hm/j/31ZhWTs/Nj0755Sh/jXaeK
	9AuYK6PU8iKX/YNOa6Vk7WecO+/8PBx+oo1EgpikDauC4Em4Ax/CoClsYamfKg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:12 +0100
Subject: [PATCH 11/19] mtd: spi-nor: swp: Create a TB intermediate variable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-11-487bc7129931@bootlin.com>
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

Ease the future reuse of the tb (Top/Bottom) boolean by creating an
intermediate variable.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 971aac0581db2830a4bbee5603661ec1e6612e6f..61d899b4fbf42b8bd9d86dc4e6b3ffcfe91a90e8 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -60,6 +60,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 bp, val = sr[0] & bp_mask;
+	bool tb = (nor->flags & SNOR_F_HAS_SR_TB) ? sr[0] & tb_mask : 0;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -79,7 +80,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 	if (*len > nor->params->size)
 		*len = nor->params->size;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB && sr[0] & tb_mask)
+	if (tb)
 		*ofs = 0;
 	else
 		*ofs = nor->params->size - *len;

-- 
2.51.0

