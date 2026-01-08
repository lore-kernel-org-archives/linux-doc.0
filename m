Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DC13033DB
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891552; cv=none; b=a1nI6q9UZ6KwR0wATLHBlt0pfrD2BUyibWVsShalZKaGRC8OYyWDO0d6xFW37NeDSmwIbfvkgGT4KQG3JXLXMbo6aYkb5vl/+rvVz3bxspqmggN6xmijIJjKvEavBconCDwcop98DXplxGy7pDaSxH3iBjCIplq1SNjXsRvXRqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891552; c=relaxed/simple;
	bh=GHZmXM5aeYs2tOJlVhdumoaqbQGSKeO1/pZkzO0/kP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rKoeOXJNDtP9w0CshYTJOKhgs/zA4vPVvJ7c5aDTkT8hGKMjezFEorT+Ryoo9hVl6ShkQD2JTCqeLA1gZEKcusNq5cYumZTotcYVp1rCT256W9XzTjQpbi7ORyMVTtA/eRXmlG3VDNJCF2Am5euaYhf08IBOJzQeBCEGf8Rg1pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NWgif6BC; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NWgif6BC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BCE061A2717;
	Thu,  8 Jan 2026 16:59:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90D746072B;
	Thu,  8 Jan 2026 16:59:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B66AE103C86ED;
	Thu,  8 Jan 2026 17:59:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891548; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ec0kbPx+edwoqApwKlNsfKYC2JUdHu2CV9kwwUFOJtw=;
	b=NWgif6BCcS+2DSpmnKC8t2Th6/nnQxszo00/P7EgjNMLbNYR5tcfqBgJDl53TFANdnuxY/
	c+a/OeopHJ5JHSegGHaTaSQ8q+c6SkAtUlifrnj8A/PZkmex0HnNuSjGvwr2Ho0HstRJo9
	QkawR2hSgiewE6aic89YreHesLDp9MkcKDpqMX1wnXG5nb0E8w5dOP7Dd2NY6Hqnm3rlD/
	+kjn7UaqAD+EA+xchRr5mPpycpwzB8LVmt+qhv8KK6G+GuD8qVOxBZ82lMvewKbOmMzQ4e
	EUNa0j6I77epOUPkoI2WakJgJb4OEKIFRc6oayn4B09qc1owJ/mK3Pu8dai9dw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:44 +0100
Subject: [PATCH v2 11/27] mtd: spi-nor: swp: Rename a mask
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-11-c462ef806130@bootlin.com>
References: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
In-Reply-To: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

"mask" is not very descriptive when we already manipulate two masks, and
soon will manipulate three. Rename it "bp_mask" to align with the
existing "tb_mask" and soon "cmp_mask".

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index af6e577d9b42..66f85826ba0d 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -57,9 +57,9 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 					u64 *len)
 {
 	u64 min_prot_len;
-	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
-	u8 bp, val = sr[0] & mask;
+	u8 bp, val = sr[0] & bp_mask;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -160,7 +160,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	u64 min_prot_len;
 	int ret;
 	u8 status_old[1] = {}, status_new[1] = {};
-	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
 	loff_t lock_len;
@@ -199,7 +199,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		lock_len = ofs + len;
 
 	if (lock_len == nor->params->size) {
-		val = mask;
+		val = bp_mask;
 	} else {
 		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
@@ -208,15 +208,15 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
 			val = (val & ~SR_BP3) | SR_BP3_BIT6;
 
-		if (val & ~mask)
+		if (val & ~bp_mask)
 			return -EINVAL;
 
 		/* Don't "lock" with no region! */
-		if (!(val & mask))
+		if (!(val & bp_mask))
 			return -EINVAL;
 	}
 
-	status_new[0] = (status_old[0] & ~mask & ~tb_mask) | val;
+	status_new[0] = (status_old[0] & ~bp_mask & ~tb_mask) | val;
 
 	/*
 	 * Disallow further writes if WP# pin is neither left floating nor
@@ -234,7 +234,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		return 0;
 
 	/* Only modify protection if it will not unlock other areas */
-	if ((status_new[0] & mask) < (status_old[0] & mask))
+	if ((status_new[0] & bp_mask) < (status_old[0] & bp_mask))
 		return -EINVAL;
 
 	return spi_nor_write_sr_and_check(nor, status_new[0]);
@@ -250,7 +250,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	u64 min_prot_len;
 	int ret;
 	u8 status_old[1], status_new[1];
-	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
 	loff_t lock_len;
@@ -306,11 +306,11 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 			val = (val & ~SR_BP3) | SR_BP3_BIT6;
 
 		/* Some power-of-two sizes may not be supported */
-		if (val & ~mask)
+		if (val & ~bp_mask)
 			return -EINVAL;
 	}
 
-	status_new[0] = (status_old[0] & ~mask & ~tb_mask) | val;
+	status_new[0] = (status_old[0] & ~bp_mask & ~tb_mask) | val;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
@@ -324,7 +324,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		return 0;
 
 	/* Only modify protection if it will not lock other areas */
-	if ((status_new[0] & mask) > (status_old[0] & mask))
+	if ((status_new[0] & bp_mask) > (status_old[0] & bp_mask))
 		return -EINVAL;
 
 	return spi_nor_write_sr_and_check(nor, status_new[0]);

-- 
2.51.1

