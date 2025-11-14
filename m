Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C176234677F
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 17:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142832; cv=none; b=DOljdVD3MDdU2YIj5vV5O65qtVrDxbtmV52WJAYRUSYQZdscw4GtccMyu2RTVL5xclBhR5WYRF8pNi1pVvgNO0fzso6NzAVaL3Tcp7o6O6rPNA96y/zGCwwvuZwx7VM/H3HFf3fUEajjS1cMs7lJ5y8IeIHk7X4zKKJzLFF0spg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142832; c=relaxed/simple;
	bh=p2J4jWsxz8YgibmLHukQoeSlSDmnWJ828HxPpHwbXHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mei7WL8PGWKBsutCLWOLZIA44mNCRRsm4rTJ+sVCVZL8ULKfvEqIzsX+5nEQfQsMDCWS2K3CCHpwfsWEukNFwTlnJ6qyJHMbxmGMAiTWj9keMazpDFk9wDrmOegoSYJHJBn+vXBF69wdj+DWUBXoaVpRB7irvmk4nuvK8XXwoN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bf/erffd; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bf/erffd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E1FF14E416BC;
	Fri, 14 Nov 2025 17:53:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A443D6060E;
	Fri, 14 Nov 2025 17:53:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A45B10371A37;
	Fri, 14 Nov 2025 18:53:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142824; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3ZbcbbKiBq1B/NCjBZWutRFcryxWiOze6dLRol71Ksk=;
	b=bf/erffdDCviSDeHYQVDCdZgyrI+jPaJwhN9f0on2TTuzv/EMDJaAyWOmE53S5G4yKp9AW
	EAhXqu9Dd8cDKA+IbpB79zLNX3viTjB19py5rpl6ZdkXKWOtoJYBbJn8z8imkJ/12Vc5Ls
	biAkkC1FQ/h4paY7dakStmDhYN6Xyyeza664UfV2FVWjDit5rGaum8VSbsw1h22Luc6yo4
	P3kgS1WnakiZCE87h7rRr90/RxGt3xw1WTrFXeqJnXxiB1dEClE61ydEDUuIMswDvDyKKm
	m9VWbsS/aBW7fdJ2Gz3fsUcSnOFNzaULSyih1S2a0yS8hB28G+rgdpH7LLzBoQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:15 +0100
Subject: [PATCH 14/19] mtd: spi-nor: swp: Cosmetic changes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-14-487bc7129931@bootlin.com>
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

As a final preparation step for the introduction of CMP support, make
a few more cosmetic changes to simplify the reading of the diff when
adding the CMP feature. In particular, define "min_prot_len" earlier as
it will be reused and move the definition of the "ret" variable at the
end of the stack just because it looks better.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index c0226b13d85b3f0f340ffca347e847c17fcc727f..f5ec05d6f2680113332f47e0efbcb4d88f0d3e3c 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -195,14 +195,14 @@ static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
  */
 static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
-	u64 min_prot_len;
-	int ret;
+	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	u8 status_old[1] = {}, status_new[1] = {};
 	loff_t ofs_old, ofs_new;
 	u64 len_old, len_new;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
+	int ret;
 	u8 pow;
 
 	ret = spi_nor_read_sr(nor, nor->bouncebuf);
@@ -236,12 +236,10 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	else
 		lock_len = ofs + len;
 
-	if (lock_len == nor->params->size) {
+	if (lock_len == nor->params->size)
 		pow = (nor->flags & SNOR_F_HAS_4BIT_BP) ? GENMASK(3, 0) : GENMASK(2, 0);
-	} else {
-		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
+	else
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
-	}
 
 	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top);
 	if (ret)
@@ -281,7 +279,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
  */
 static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
-	u64 min_prot_len;
+	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	int ret;
 	u8 status_old[1], status_new[1];
 	loff_t ofs_old, ofs_new;
@@ -324,14 +322,11 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	else
 		lock_len = ofs;
 
-	if (lock_len == 0) {
+	if (lock_len == 0)
 		pow = 0; /* fully unlocked */
-	} else {
-		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
+	else
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 
-	}
-
 	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top);
 	if (ret)
 		return ret;

-- 
2.51.0

