Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6BD428837;
	Tue, 26 May 2026 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807440; cv=none; b=QGFMwrUtVB3Fk4Rs5h4gr5u3JFH9BGxC7sjj3BiMd2YMZNdjpXAgQrfYd7PJzpiv5Z+Bellg4uvzrLW7WDa8vQZ18a4kGhqvoSDEoofyAy+xHhuxc2IxPJJ676WOzWuK7ofN6L3ggeS9fIn6XjQDdUkzpz7uykvymQMifmjI6jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807440; c=relaxed/simple;
	bh=7aCOIrJl/xSI7IoRkk3UWRVy10lI6Ol82GykMYxrmoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NvNku4cZ3dld9Ttka3z4k8WUs7rxwVNiegIrTQty9OHgYugCfsY/aXIPX9XpTuQcILa0fOGPLyIhPklXZ8A08fzmVQlW4BBuKDE3frAhG/pijNCGHctAOCmJ4d2q6OL4tKO2C4N3OF4nvEUlJaiFuZbyM5iz/swrlAjMPeh7wzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nlhM3o6w; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nlhM3o6w"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 018B3C2C678;
	Tue, 26 May 2026 14:57:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95BBA6011D;
	Tue, 26 May 2026 14:57:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D4D510888865;
	Tue, 26 May 2026 16:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807433; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zSQ+aI3fe/iySHfn2flrhb1xBf/EUhtQcj9F72N322o=;
	b=nlhM3o6wDwpCzjXiEv4VA6AfelNGy6oxUuk8G9MOYP5/KyE4ha3I8Xc2MrSA3IM2miOKql
	25ORS3qRmYy94RELpIzq9lDr/O/UTwI4E4MxEW1zYjKVh/lYlNGW7cLTwFrwSzza2m8YW9
	aYSqZLlx3UuxDIrKvWQYxXnxMpjR6YHLxPeYmCNIxpGdTHRptay0984OFHGHXlHDkYlecl
	Y0GZflm6cd8Ke6vUVs7z+89EEXUOCMioZlFtLpWfhrmv4rzcwt0+aMQ96LOYaUDMo17DVI
	61Lk28eVWxiPLttA1LVRPGKuplp8XGQz9LLcTzHwU0pBWBu0U57E4U692ReBZg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:38 +0200
Subject: [PATCH v6 14/28] mtd: spi-nor: swp: Create helpers for building
 the SR register
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-14-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The status register contains 3 or 4 BP (Block Protect) bits, 0 or 1
TB (Top/Bottom) bit, soon 0 or 1 CMP (Complement) bit. The last BP bit
and the TB bit locations change between vendors. The whole logic of
buildling the content of the status register based on some input
conditions is used two times and soon will be used 4 times.

Create dedicated helpers for these steps.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 83 +++++++++++++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 540cd221c455..8a75cd59cb10 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -125,6 +125,43 @@ static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, u64 len,
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, false);
 }
 
+static int spi_nor_sr_set_bp_mask(struct spi_nor *nor, u8 *sr, u8 pow)
+{
+	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 val = pow << SR_BP_SHIFT;
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
+		val = (val & ~SR_BP3) | SR_BP3_BIT6;
+
+	if (val & ~mask)
+		return -EINVAL;
+
+	sr[0] |= val;
+
+	return 0;
+}
+
+static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
+			    u8 pow, bool use_top)
+{
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
+	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
+	int ret;
+
+	new_sr[0] = old_sr[0] & ~bp_mask & ~tb_mask;
+
+	/* Build BP field */
+	ret = spi_nor_sr_set_bp_mask(nor, &new_sr[0], pow);
+	if (ret)
+		return ret;
+
+	/* Build TB field */
+	if (!use_top)
+		new_sr[0] |= tb_mask;
+
+	return 0;
+}
+
 /*
  * Lock a region of the flash. Compatible with ST Micro and similar flash.
  * Supports the block protection bits BP{0,1,2}/BP{0,1,2,3} in the status
@@ -164,11 +201,10 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	int ret;
 	u8 status_old[1] = {}, status_new[1] = {};
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
-	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
-	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
+	u8 pow;
 
 	ret = spi_nor_read_sr(nor, nor->bouncebuf);
 	if (ret)
@@ -202,24 +238,19 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		lock_len = ofs + len;
 
 	if (lock_len == nor->params->size) {
-		val = bp_mask;
+		pow = (nor->flags & SNOR_F_HAS_4BIT_BP) ? GENMASK(3, 0) : GENMASK(2, 0);
 	} else {
 		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
-		val = pow << SR_BP_SHIFT;
-
-		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
-			val = (val & ~SR_BP3) | SR_BP3_BIT6;
-
-		if (val & ~bp_mask)
-			return -EINVAL;
-
-		/* Don't "lock" with no region! */
-		if (!(val & bp_mask))
-			return -EINVAL;
 	}
 
-	status_new[0] = (status_old[0] & ~bp_mask & ~tb_mask) | val;
+	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top);
+	if (ret)
+		return ret;
+
+	/* Don't "lock" with no region! */
+	if (!(status_new[0] & bp_mask))
+		return -EINVAL;
 
 	/*
 	 * Disallow further writes if WP# pin is neither left floating nor
@@ -229,9 +260,6 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (!(nor->flags & SNOR_F_NO_WP))
 		status_new[0] |= SR_SRWD;
 
-	if (!use_top)
-		status_new[0] |= tb_mask;
-
 	/* Don't bother if they're the same */
 	if (status_new[0] == status_old[0])
 		return 0;
@@ -254,11 +282,10 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	int ret;
 	u8 status_old[1], status_new[1];
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
-	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
-	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
+	u8 pow;
 
 	ret = spi_nor_read_sr(nor, nor->bouncebuf);
 	if (ret)
@@ -299,29 +326,21 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		lock_len = ofs;
 
 	if (lock_len == 0) {
-		val = 0; /* fully unlocked */
+		pow = 0; /* fully unlocked */
 	} else {
 		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
-		val = pow << SR_BP_SHIFT;
 
-		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
-			val = (val & ~SR_BP3) | SR_BP3_BIT6;
-
-		/* Some power-of-two sizes may not be supported */
-		if (val & ~bp_mask)
-			return -EINVAL;
 	}
 
-	status_new[0] = (status_old[0] & ~bp_mask & ~tb_mask) | val;
+	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top);
+	if (ret)
+		return ret;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
 		status_new[0] &= ~SR_SRWD;
 
-	if (!use_top)
-		status_new[0] |= tb_mask;
-
 	/* Don't bother if they're the same */
 	if (status_new[0] == status_old[0])
 		return 0;

-- 
2.53.0

