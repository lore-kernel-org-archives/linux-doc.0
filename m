Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C974032A3E1
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891575; cv=none; b=PXJurwFlW9l4IyMAdLjovYtutvWce+CDhlQI5woumvYALQRf+U7BcwqdD/NOmOh+gVYILM6YtDWxEQbdE8n9+hsFQwRlpjOpfgTqMi9nsnBC1cdZpQzm4cWxwqRbP5D7dmNU+FG6BSKvPNVkBjv7zDK68eWjSS2q+/73piNj88I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891575; c=relaxed/simple;
	bh=gFu9/k6icYSXldkj0RgQYbbMBRBIp6g8oiUZ/MYvuG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z6wS7Qes4XRPWDDRM59o7xJqdIcFYaQb1LtNOcPKDNd740mSJATwWUVTxjmlWm7dIKHBdwBJ64J5Fhz65DnMjJqOj0TcoTzHs/QJYoBws79H1Yq9/s1Y3ehR47CRKnF3bV9yj4AL/j2040pFZIuT9xv5DfKnp8+vh5zZfwSuLjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xlI1ODuw; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xlI1ODuw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 61BD4C1F6C4;
	Thu,  8 Jan 2026 16:59:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 988A66072B;
	Thu,  8 Jan 2026 16:59:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E863C103C8811;
	Thu,  8 Jan 2026 17:59:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891571; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lS3yKe30oPVtcVh3fJLk4kIteTtM7pxix3f8UVvRihw=;
	b=xlI1ODuw6wsFSj9NYO+iM203MWliHUR9aXJ58v6BlxNrYJXtdKJkULyB8xfvtxXEw3+Z4l
	q8BwBO7N7TQzgnGHXCOioGWxxvOeeC/Z7eRihwciHpetMiRTJXCziZfOu9WhnZgyeMRyR3
	iqfxF0KQ9PQV5haPwxl0pf3SH2B+ZMN1kvjXg46ZTE29A64orZPbuK7Aj4GBSC2EPHp99e
	1YeceMmw2y9ZDMj68OFq4AvyNqpNCcEAsocxeE5dA+qH4gGYoC5XNCcN9j0IS0HgrQuNjp
	NIa7PVezScJUBnv/zYKp0oLz5pBmvZoi8h1h/YKGLCbsddany8bdADzOH63OeA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:53 +0100
Subject: [PATCH v2 20/27] mtd: spi-nor: swp: Add support for the complement
 feature
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-20-c462ef806130@bootlin.com>
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

The current locking implementation allows to select a power of two
number of blocks, which is going to be the protected amount, as well as
telling whether this is the data at the top (end of the device) or the
bottom (beginning of the device). This means at most we can cover half
of the device or the entire device, but nothing in between.

The complement feature allows a much finer grain of configuration, by
allowing to invert what is considered locked and unlocked.

Add support for this feature. The only known position for the CMP bit is
bit 6 of the configuration register.

The locking and unlocking logics are kept unchanged if the CMP bit is
unavailable. Otherwise, once the regular logic has been applied, we
check if we already found an optimal configuration. If not, we try with
the CMP bit set. If the coverage is closer to the request, we use it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c    |   3 +
 drivers/mtd/spi-nor/core.h    |   4 +
 drivers/mtd/spi-nor/debugfs.c |   1 +
 drivers/mtd/spi-nor/swp.c     | 196 +++++++++++++++++++++++++++++++++++-------
 include/linux/mtd/spi-nor.h   |   1 +
 5 files changed, 173 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ca497ea2228c..93fd32d54c12 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2974,6 +2974,9 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
 	}
 
+	if (flags & SPI_NOR_HAS_CMP)
+		nor->flags |= SNOR_F_HAS_SR2_CMP_BIT6;
+
 	if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
 	    !nor->controller_ops)
 		nor->flags |= SNOR_F_RWW;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 99ed6c54b90f..333786913ff1 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -141,6 +141,7 @@ enum spi_nor_option_flags {
 	SNOR_F_ECC		= BIT(15),
 	SNOR_F_NO_WP		= BIT(16),
 	SNOR_F_SWAP16		= BIT(17),
+	SNOR_F_HAS_SR2_CMP_BIT6	= BIT(18),
 };
 
 struct spi_nor_read_command {
@@ -483,6 +484,8 @@ struct spi_nor_id {
  *   SPI_NOR_NO_ERASE:        no erase command needed.
  *   SPI_NOR_QUAD_PP:         flash supports Quad Input Page Program.
  *   SPI_NOR_RWW:             flash supports reads while write.
+ *   SPI_NOR_HAS_CMP:         flash SR2 has complement (CMP) protect bit. Must
+ *                            be used with SPI_NOR_HAS_LOCK.
  *
  * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
  *                  Used when SFDP tables are not defined in the flash. These
@@ -531,6 +534,7 @@ struct flash_info {
 #define SPI_NOR_NO_ERASE		BIT(6)
 #define SPI_NOR_QUAD_PP			BIT(8)
 #define SPI_NOR_RWW			BIT(9)
+#define SPI_NOR_HAS_CMP			BIT(10)
 
 	u8 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index c290bfe20f73..fb6240dbbfc6 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -29,6 +29,7 @@ static const char *const snor_f_names[] = {
 	SNOR_F_NAME(ECC),
 	SNOR_F_NAME(NO_WP),
 	SNOR_F_NAME(SWAP16),
+	SNOR_F_NAME(HAS_SR2_CMP_BIT6),
 };
 #undef SNOR_F_NAME
 
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 8de8459e8e90..ac405b1daf96 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -32,6 +32,15 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
 		return SR_TB_BIT5;
 }
 
+static u8 spi_nor_get_sr_cmp_mask(struct spi_nor *nor)
+{
+	if (!(nor->flags & SNOR_F_NO_READ_CR) &&
+	    nor->flags & SNOR_F_HAS_SR2_CMP_BIT6)
+		return SR2_CMP_BIT6;
+	else
+		return 0;
+}
+
 u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 {
 	unsigned int bp_slots, bp_slots_needed;
@@ -59,8 +68,10 @@ void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
 	u64 min_prot_len;
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
+	u8 cmp_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 bp, val = sr[0] & bp_mask;
 	bool tb = (nor->flags & SNOR_F_HAS_SR_TB) ? sr[0] & tb_mask : 0;
+	bool cmp = sr[1] & cmp_mask;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -68,22 +79,37 @@ void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
 	bp = val >> SR_BP_SHIFT;
 
 	if (!bp) {
-		/* No protection */
-		*ofs = 0;
-		*len = 0;
-		return;
+		if (!cmp) {
+			/* No protection */
+			*ofs = 0;
+			*len = 0;
+			return;
+		} else {
+			/* Full protection */
+			*ofs = 0;
+			*len = nor->params->size;
+		}
 	}
 
 	min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	*len = min_prot_len << (bp - 1);
-
 	if (*len > nor->params->size)
 		*len = nor->params->size;
 
-	if (tb)
-		*ofs = 0;
-	else
-		*ofs = nor->params->size - *len;
+	if (cmp)
+		*len = nor->params->size - *len;
+
+	if (!cmp) {
+		if (tb)
+			*ofs = 0;
+		else
+			*ofs = nor->params->size - *len;
+	} else {
+		if (tb)
+			*ofs = nor->params->size - *len;
+		else
+			*ofs = 0;
+	}
 }
 
 /*
@@ -140,13 +166,15 @@ static int spi_nor_sr_set_bp_mask(struct spi_nor *nor, u8 *sr, u8 pow)
 }
 
 static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
-			    u8 pow, bool use_top)
+			    u8 pow, bool use_top, bool cmp)
 {
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
+	u8 cmp_mask = spi_nor_get_sr_cmp_mask(nor);
 	int ret;
 
 	new_sr[0] = old_sr[0] & ~bp_mask & ~tb_mask;
+	new_sr[1] = old_sr[1] & ~cmp_mask;
 
 	/* Build BP field */
 	ret = spi_nor_sr_set_bp_mask(nor, &new_sr[0], pow);
@@ -154,9 +182,13 @@ static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
 		return ret;
 
 	/* Build TB field */
-	if (!use_top)
+	if ((!cmp && !use_top) || (cmp && use_top))
 		new_sr[0] |= tb_mask;
 
+	/* Build CMP field */
+	if (cmp)
+		new_sr[1] |= cmp_mask;
+
 	return 0;
 }
 
@@ -168,15 +200,22 @@ void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
 {
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
+	u8 cmp_mask = spi_nor_get_sr_cmp_mask(nor);
 
 	if (!sr) {
 		if (spi_nor_read_sr(nor, nor->bouncebuf))
 			return;
 
+		if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+			if (spi_nor_read_cr(nor, nor->bouncebuf + 1))
+				return;
+		}
+
 		sr = nor->bouncebuf;
 	}
 
 	nor->dfs_sr_cache[0] = sr[0] & (bp_mask | tb_mask | SR_SRWD);
+	nor->dfs_sr_cache[1] = sr[1] & cmp_mask;
 }
 
 /*
@@ -185,10 +224,11 @@ void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
  * register
  * (SR). Does not support these features found in newer SR bitfields:
  *   - SEC: sector/block protect - only handle SEC=0 (block protect)
- *   - CMP: complement protect - only support CMP=0 (range is not complemented)
  *
  * Support for the following is provided conditionally for some flash:
  *   - TB: top/bottom protect
+ *   - CMP: complement protect (BP and TP describe the unlocked part, while
+ *          the reminder is locked)
  *
  * Sample table portion for 8MB flash (Winbond w25q64fw):
  *
@@ -215,11 +255,13 @@ void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
 static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
-	u8 status_old[1] = {}, status_new[1] = {};
-	loff_t ofs_old, ofs_new;
-	u64 len_old, len_new;
+	u8 status_old[2] = {}, status_new[2] = {}, status_new_cmp[2] = {};
+	u8 *best_status_new = status_new;
+	loff_t ofs_old, ofs_new, ofs_new_cmp;
+	u64 len_old, len_new, len_new_cmp;
 	loff_t lock_len;
-	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
+	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB,
+		can_be_cmp = spi_nor_get_sr_cmp_mask(nor);
 	bool use_top;
 	int ret;
 	u8 pow;
@@ -230,6 +272,14 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 
 	status_old[0] = nor->bouncebuf[0];
 
+	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+		ret = spi_nor_read_cr(nor, nor->bouncebuf + 1);
+		if (ret)
+			return ret;
+
+		status_old[1] = nor->bouncebuf[1];
+	}
+
 	/* If nothing in our range is unlocked, we don't need to do anything */
 	if (spi_nor_is_locked_sr(nor, ofs, len, status_old))
 		return 0;
@@ -260,24 +310,56 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	else
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 
-	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top);
+	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top, false);
 	if (ret)
 		return ret;
 
+	/*
+	 * In case the region asked is not fully met, maybe we can try with the
+	 * complement feature
+	 */
+	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+	if (can_be_cmp && len_new != lock_len) {
+		pow = ilog2(nor->params->size - lock_len) - ilog2(min_prot_len) + 1;
+		ret = spi_nor_build_sr(nor, status_old, status_new_cmp, pow, use_top, true);
+		if (ret)
+			return ret;
+
+		/*
+		 * ilog2() "floors" the result, which means in some cases we may have to
+		 * manually reduce the scope when the complement feature is used.
+		 * The uAPI is to never lock more than what is requested, but less is accepted.
+		 * Make sure we are not covering a too wide range, reduce it otherwise.
+		 */
+		spi_nor_get_locked_range_sr(nor, status_new_cmp, &ofs_new_cmp, &len_new_cmp);
+		if (len_new_cmp > lock_len) {
+			pow++;
+			ret = spi_nor_build_sr(nor, status_old, status_new_cmp, pow, use_top, true);
+			if (ret)
+				return ret;
+		}
+
+		/* Pick the CMP configuration if we cover a closer range */
+		spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+		spi_nor_get_locked_range_sr(nor, status_new_cmp, &ofs_new_cmp, &len_new_cmp);
+		if (len_new_cmp > len_new)
+			best_status_new = status_new_cmp;
+	}
+
 	/*
 	 * Disallow further writes if WP# pin is neither left floating nor
 	 * wrongly tied to GND (that includes internal pull-downs).
 	 * WP# pin hard strapped to GND can be a valid use case.
 	 */
 	if (!(nor->flags & SNOR_F_NO_WP))
-		status_new[0] |= SR_SRWD;
+		best_status_new[0] |= SR_SRWD;
 
 	/* Don't bother if they're the same */
-	if (status_new[0] == status_old[0])
+	if (best_status_new[0] == status_old[0] && best_status_new[1] == status_old[1])
 		return 0;
 
 	spi_nor_get_locked_range_sr(nor, status_old, &ofs_old, &len_old);
-	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+	spi_nor_get_locked_range_sr(nor, best_status_new, &ofs_new, &len_new);
 
 	/* Don't "lock" with no region! */
 	if (!len_new)
@@ -288,11 +370,11 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_old < ofs_new || (ofs_new + len_new) < (ofs_old + len_old)))
 		return -EINVAL;
 
-	ret = spi_nor_write_sr_and_check(nor, status_new[0]);
+	ret = spi_nor_write_sr_cr_and_check(nor, best_status_new);
 	if (ret)
 		return ret;
 
-	spi_nor_cache_sr_lock_bits(nor, status_new);
+	spi_nor_cache_sr_lock_bits(nor, best_status_new);
 
 	return 0;
 }
@@ -306,11 +388,13 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	int ret;
-	u8 status_old[1], status_new[1];
-	loff_t ofs_old, ofs_new;
-	u64 len_old, len_new;
+	u8 status_old[2], status_new[2], status_new_cmp[2];
+	u8 *best_status_new = status_new;
+	loff_t ofs_old, ofs_new, ofs_new_cmp;
+	u64 len_old, len_new, len_new_cmp;
 	loff_t lock_len;
-	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
+	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB,
+		can_be_cmp = spi_nor_get_sr_cmp_mask(nor);
 	bool use_top;
 	u8 pow;
 
@@ -320,6 +404,14 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 
 	status_old[0] = nor->bouncebuf[0];
 
+	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+		ret = spi_nor_read_cr(nor, nor->bouncebuf + 1);
+		if (ret)
+			return ret;
+
+		status_old[1] = nor->bouncebuf[1];
+	}
+
 	/* If nothing in our range is locked, we don't need to do anything */
 	if (spi_nor_is_unlocked_sr(nor, ofs, len, status_old))
 		return 0;
@@ -357,30 +449,62 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	else
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 
-	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top);
+	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top, false);
 	if (ret)
 		return ret;
 
+	/*
+	 * In case the region asked is not fully met, maybe we can try with the
+	 * complement feature
+	 */
+	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+	if (can_be_cmp && len_new != lock_len) {
+		pow = ilog2(nor->params->size - lock_len) - ilog2(min_prot_len) + 1;
+		ret = spi_nor_build_sr(nor, status_old, status_new_cmp, pow, use_top, true);
+		if (ret)
+			return ret;
+
+		/*
+		 * ilog2() "floors" the result, which means in some cases we may have to
+		 * manually reduce the scope when the complement feature is used.
+		 * The uAPI is to never unlock more than what is requested, but less is accepted.
+		 * Make sure we are not covering a too small range, increase it otherwise.
+		 */
+		spi_nor_get_locked_range_sr(nor, status_new_cmp, &ofs_new_cmp, &len_new_cmp);
+		if (len_new_cmp < lock_len) {
+			pow--;
+			ret = spi_nor_build_sr(nor, status_old, status_new_cmp, pow, use_top, true);
+			if (ret)
+				return ret;
+		}
+
+		/* Pick the CMP configuration if we cover a closer range */
+		spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+		spi_nor_get_locked_range_sr(nor, status_new_cmp, &ofs_new_cmp, &len_new_cmp);
+		if (len_new_cmp > len_new)
+			best_status_new = status_new_cmp;
+	}
+
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
-		status_new[0] &= ~SR_SRWD;
+		best_status_new[0] &= ~SR_SRWD;
 
 	/* Don't bother if they're the same */
-	if (status_new[0] == status_old[0])
+	if (best_status_new[0] == status_old[0] && best_status_new[1] == status_old[1])
 		return 0;
 
 	/* Only modify protection if it will not lock other areas */
 	spi_nor_get_locked_range_sr(nor, status_old, &ofs_old, &len_old);
-	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+	spi_nor_get_locked_range_sr(nor, best_status_new, &ofs_new, &len_new);
 	if (len_old && len_new &&
 	    (ofs_new < ofs_old || (ofs_old + len_old) < (ofs_new + len_new)))
 		return -EINVAL;
 
-	ret = spi_nor_write_sr_and_check(nor, status_new[0]);
+	ret = spi_nor_write_sr_cr_and_check(nor, best_status_new);
 	if (ret)
 		return ret;
 
-	spi_nor_cache_sr_lock_bits(nor, status_new);
+	spi_nor_cache_sr_lock_bits(nor, best_status_new);
 
 	return 0;
 }
@@ -400,6 +524,14 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (ret)
 		return ret;
 
+	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+		ret = spi_nor_read_cr(nor, nor->bouncebuf + 1);
+		if (ret)
+			return ret;
+	} else {
+		nor->bouncebuf[1] = 0;
+	}
+
 	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf);
 }
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 9ad77f9e76c2..4b92494827b1 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -125,6 +125,7 @@
 #define SR2_LB1			BIT(3)	/* Security Register Lock Bit 1 */
 #define SR2_LB2			BIT(4)	/* Security Register Lock Bit 2 */
 #define SR2_LB3			BIT(5)	/* Security Register Lock Bit 3 */
+#define SR2_CMP_BIT6		BIT(6)
 #define SR2_QUAD_EN_BIT7	BIT(7)
 
 /* Supported SPI protocols */

-- 
2.51.1

