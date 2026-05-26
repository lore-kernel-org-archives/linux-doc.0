Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06A1426D29;
	Tue, 26 May 2026 14:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807433; cv=none; b=m5BFQwBR3QUrck3Cj8dk15J7YL4oPQ2r/2Ij9eC0Lni8MU4ffxEvZ6jrjwfAZiEgmNIuwMkpvJdNYCO1va3Kte+y/SsNPETlq5VG1Xw05u3VlWChBDO4ch9rvaWiVg75fPbY1wJW2pwHGGYDGuP8ApSi5U0y1BYzCCaop9xDZkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807433; c=relaxed/simple;
	bh=GPVnC7T7ac/WocxhSfijwew3fEPtoDtpwz508pJ2NP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlJFNppRv9E0FItgwGKKkSizgRTudTuEYjwkkvaPyCkVQIuGkL0UfCqy39kPu/xf3x8NfXvDAZSkvfvnsqJtKgFjc67bB8dPYgxUzF44NAJQ/yHaXp5lZoCLbnxN3r2ldu1ZXa3VU5zak7lif/dukc+DNPT6hkgwlEpM9SUFUmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SH6avdHn; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SH6avdHn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8F5B24E42D61;
	Tue, 26 May 2026 14:57:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E00960735;
	Tue, 26 May 2026 14:57:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F152108888D7;
	Tue, 26 May 2026 16:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807429; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cn6gj6EPWft2JNR9wu/uPci1UgZXJ381Fw0oPGWkVAc=;
	b=SH6avdHnxVZBYCMeCxqQz0WLbRJrNsmkEOhSkhU6NKgG0fNrpaBfdmWdVZ/U0tj/ErJZff
	dIV+0LQHbSyTcm2NKZhCW6lQT1NPJFMlc8j2LZLqPB+bknXJxbQNorrqgThM9mHIJRILBl
	MzPxUAJXAPiUJZQIaMAyAbdDXCN+zhliKa1GNtNReypWdOhIZKFt8gjtLR0UeGgOr+7PBd
	R1cOvI9Isf1Be4ebHM/328WBwy9qRbdxqUDUM6aDMusmjdlLX126sLfqQQwQgANf/7gIgu
	hST/gAca3EL9WgohyOk85gLGnzqK9uC65Nb3g3ZyDyMrvHFASMc+j4ezjNh5Sw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:36 +0200
Subject: [PATCH v6 12/28] mtd: spi-nor: swp: Rename a mask
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-12-4092f1419f8f@bootlin.com>
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

"mask" is not very descriptive when we already manipulate two masks, and
soon will manipulate three. Rename it "bp_mask" to align with the
existing "tb_mask" and soon "cmp_mask".

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/swp.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 61830f18a147..07269e09370a 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -59,9 +59,9 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
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
@@ -162,7 +162,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	u64 min_prot_len;
 	int ret;
 	u8 status_old[1] = {}, status_new[1] = {};
-	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
 	loff_t lock_len;
@@ -201,7 +201,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		lock_len = ofs + len;
 
 	if (lock_len == nor->params->size) {
-		val = mask;
+		val = bp_mask;
 	} else {
 		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
@@ -210,15 +210,15 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
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
@@ -236,7 +236,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		return 0;
 
 	/* Only modify protection if it will not unlock other areas */
-	if ((status_new[0] & mask) < (status_old[0] & mask))
+	if ((status_new[0] & bp_mask) < (status_old[0] & bp_mask))
 		return -EINVAL;
 
 	return spi_nor_write_sr_and_check(nor, status_new[0]);
@@ -252,7 +252,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	u64 min_prot_len;
 	int ret;
 	u8 status_old[1], status_new[1];
-	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
 	loff_t lock_len;
@@ -308,11 +308,11 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
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
@@ -326,7 +326,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		return 0;
 
 	/* Only modify protection if it will not lock other areas */
-	if ((status_new[0] & mask) > (status_old[0] & mask))
+	if ((status_new[0] & bp_mask) > (status_old[0] & bp_mask))
 		return -EINVAL;
 
 	return spi_nor_write_sr_and_check(nor, status_new[0]);

-- 
2.53.0

