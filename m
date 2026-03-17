Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCCE3A9D9E
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743078; cv=none; b=Y87do6j89gAwNoI4HVB7Kq29rQbLvMqNxoQk2sWlOjB3fODNd/VEVQ4FSpnvl/XutyXdwaDu3GdoITBjtVLO3oaQWOhwxCTnzCCTrwHc56w1RiS2N1qJWVKcS2EulbGa9rVFLmTAtuovLgbGXY0KumKWuk/CTgiBcS1XqPisJAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743078; c=relaxed/simple;
	bh=qZeCE0msR5ojlr1bTKuEzUtB7a//YcKLIUtu1EhJwhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIt7ynl+ZzksuaKI0I+0DFnqHOSYNUOAS8p7i2xJzRsxTASub4z+Oxyfkkm8QzWzgAlbNPxDITha8E6A0r51prbMBN7yJhh0VrXzzO5pomBtYEZxB1xJhXo9v8zndJPZFPRXMp/abYLmO/xHs8syJok/Mw5E6STXqzoArGMGPp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sgN+RKmf; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sgN+RKmf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C5EB64E425F5;
	Tue, 17 Mar 2026 10:24:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C2CF5FC9A;
	Tue, 17 Mar 2026 10:24:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8ACCC1045045A;
	Tue, 17 Mar 2026 11:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773743074; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D52TLeXksnZZDY4Xj5CPfUClEwfCTxQc7ZJZFYNQVjg=;
	b=sgN+RKmfWWKJMb3rQ1EM9SHH3Ab/OV1K3ZngZOJGFAdEfLJMiSRhEFkz2Oz+xKbdL+o057
	OtPh/YRfJQ0GgKEecOG2A8MC/FB1DDYxnsybHXLIxIkW8SBWJcMf2uMLH/FnnteR4oYmiv
	kL5vmJbCUdZlI7F6osc4EqmWgvpjJdqhNhsa7UGipg3vif3feHMkp3pH2Mv+uLS5X4RjC5
	z4onW7YerAGgWFG2//b7jOhnuzK0w/86vOvWPonUi7Vti9/2ZW1kOusTanXRhVJFhTTg9S
	C9Pj84ezuDCDYvtgfMH8PqttiYSkttUGavz3k6FY0pGEGwoVjkZp51c6cjcVRQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 17 Mar 2026 11:24:16 +0100
Subject: [PATCH v3 13/27] mtd: spi-nor: swp: Create helpers for building
 the SR register
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-13-2ca9ea4e7b9b@bootlin.com>
References: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
In-Reply-To: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sean Anderson <sean.anderson@linux.dev>, 
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
index f068cb9c8f6d..e2e423b20989 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -123,6 +123,43 @@ static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, u64 len,
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
+	sr[0] = val;
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
@@ -162,11 +199,10 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
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
@@ -200,24 +236,19 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
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
@@ -227,9 +258,6 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (!(nor->flags & SNOR_F_NO_WP))
 		status_new[0] |= SR_SRWD;
 
-	if (!use_top)
-		status_new[0] |= tb_mask;
-
 	/* Don't bother if they're the same */
 	if (status_new[0] == status_old[0])
 		return 0;
@@ -252,11 +280,10 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
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
@@ -297,29 +324,21 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
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
2.51.1

