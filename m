Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641253D5647
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775232600; cv=none; b=Wgiv9U0n62CUOFqluFQ7SyEhl3ieVV+HMbTRzNjgQHnzXS6hktnb0ZPJWqROEJ2zUB6kwb0Bqw/nhE617owm9X7z6GodiB3jEsKl/kl9bbhsrtoOYxCvQDtXoy4yZi1CdFVn77tBe+HCNCiuXKhLijEpgiAL1EAecDjxguSV1Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775232600; c=relaxed/simple;
	bh=HHzoRfRtO8iPYUe0lAcKZ4cCr9QDdcQCnPB6w3QCSCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z46zcMg/EvXXqD9+d7hm3NPVX4Sj1M/gGUmBD2b1ubq495nn+m+qFbVMqKQ+DTZ7sd3l11y/Bj3NLoI5hNF3lvWSv02VoeODvHaowcpEcoerf7y/IBY3ssNGjWj+WPEiaAfKLUQrjTrEswgjeq/TrR33U4tQWnR1JY6+qwkSJn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RQQscKkl; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RQQscKkl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1AC681A312E
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 16:09:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5D20603C1;
	Fri,  3 Apr 2026 16:09:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE5EE1045010B;
	Fri,  3 Apr 2026 18:09:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232597; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FEEJakSsTWiMfYL5vUeTthcl4clNdNKUdcaA2VGznAA=;
	b=RQQscKklE9JLDBE2pkzvq5SjtLPYh6KpYMqw03+UcsgrhI9SCx8a/SG1gMf+MS8WSm+Ixy
	CsuSgwUJirWj7mwxqG1R1CMKgFPy0E36aM6pmQ+fIZcfevsDuLPgib2GywHU76kRUtVfoF
	rbeuicc4m4egh/lueoGr/0k+AfnrUn/fIp02VrViUYkrcR4H4vl9lONDUppC10lVASFw8a
	Elfto3s8YAQoK7IadWSGGNUcOMGRVAJw/HmDkvAtcsFV6c6Q0TvsdnI1v8Wv6bxtyG4lj+
	0xHV9DMIb/WHduO+8/5jJ+u5h8RNP6HaMVSXmd4P4MaOnjbZksfosT0L16ZrDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:27 +0200
Subject: [PATCH v4 09/27] mtd: spi-nor: swp: Use a pointer for SR instead
 of a single byte
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-9-833dab5e7288@bootlin.com>
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

At this stage, the Status Register is most often seen as a single
byte. This is subject to change when we will need to read the CMP bit
which is located in the Control Register (kind of secondary status
register). Both will need to be carried.

Change a few prototypes to carry a u8 pointer. This way it also makes it
very clear where we access the first register, and where we will access
the second.

There is no functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 48 ++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 246f6d5ca8dd..af6e577d9b42 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -53,13 +53,13 @@ static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 		return sector_size;
 }
 
-static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
+static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
 					u64 *len)
 {
 	u64 min_prot_len;
 	u8 mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
-	u8 bp, val = sr & mask;
+	u8 bp, val = sr[0] & mask;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -79,7 +79,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	if (*len > nor->params->size)
 		*len = nor->params->size;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
+	if (nor->flags & SNOR_F_HAS_SR_TB && sr[0] & tb_mask)
 		*ofs = 0;
 	else
 		*ofs = nor->params->size - *len;
@@ -90,7 +90,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
  * (if @locked is false); false otherwise.
  */
 static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
-					 u64 len, u8 sr, bool locked)
+					 u64 len, const u8 *sr, bool locked)
 {
 	loff_t lock_offs, lock_offs_max, offs_max;
 	u64 lock_len;
@@ -111,13 +111,13 @@ static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
 		return (ofs >= lock_offs_max) || (offs_max <= lock_offs);
 }
 
-static bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, u8 sr)
+static bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr)
 {
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, true);
 }
 
 static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, u64 len,
-				   u8 sr)
+				   const u8 *sr)
 {
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, false);
 }
@@ -158,7 +158,8 @@ static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, u64 len,
 static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	u64 min_prot_len;
-	int ret, status_old, status_new;
+	int ret;
+	u8 status_old[1] = {}, status_new[1] = {};
 	u8 mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
@@ -170,7 +171,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (ret)
 		return ret;
 
-	status_old = nor->bouncebuf[0];
+	status_old[0] = nor->bouncebuf[0];
 
 	/* If nothing in our range is unlocked, we don't need to do anything */
 	if (spi_nor_is_locked_sr(nor, ofs, len, status_old))
@@ -215,7 +216,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask & ~tb_mask) | val;
+	status_new[0] = (status_old[0] & ~mask & ~tb_mask) | val;
 
 	/*
 	 * Disallow further writes if WP# pin is neither left floating nor
@@ -223,20 +224,20 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	 * WP# pin hard strapped to GND can be a valid use case.
 	 */
 	if (!(nor->flags & SNOR_F_NO_WP))
-		status_new |= SR_SRWD;
+		status_new[0] |= SR_SRWD;
 
 	if (!use_top)
-		status_new |= tb_mask;
+		status_new[0] |= tb_mask;
 
 	/* Don't bother if they're the same */
-	if (status_new == status_old)
+	if (status_new[0] == status_old[0])
 		return 0;
 
 	/* Only modify protection if it will not unlock other areas */
-	if ((status_new & mask) < (status_old & mask))
+	if ((status_new[0] & mask) < (status_old[0] & mask))
 		return -EINVAL;
 
-	return spi_nor_write_sr_and_check(nor, status_new);
+	return spi_nor_write_sr_and_check(nor, status_new[0]);
 }
 
 /*
@@ -247,7 +248,8 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	u64 min_prot_len;
-	int ret, status_old, status_new;
+	int ret;
+	u8 status_old[1], status_new[1];
 	u8 mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
@@ -259,7 +261,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (ret)
 		return ret;
 
-	status_old = nor->bouncebuf[0];
+	status_old[0] = nor->bouncebuf[0];
 
 	/* If nothing in our range is locked, we don't need to do anything */
 	if (spi_nor_is_unlocked_sr(nor, ofs, len, status_old))
@@ -308,24 +310,24 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask & ~tb_mask) | val;
+	status_new[0] = (status_old[0] & ~mask & ~tb_mask) | val;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
-		status_new &= ~SR_SRWD;
+		status_new[0] &= ~SR_SRWD;
 
 	if (!use_top)
-		status_new |= tb_mask;
+		status_new[0] |= tb_mask;
 
 	/* Don't bother if they're the same */
-	if (status_new == status_old)
+	if (status_new[0] == status_old[0])
 		return 0;
 
 	/* Only modify protection if it will not lock other areas */
-	if ((status_new & mask) > (status_old & mask))
+	if ((status_new[0] & mask) > (status_old[0] & mask))
 		return -EINVAL;
 
-	return spi_nor_write_sr_and_check(nor, status_new);
+	return spi_nor_write_sr_and_check(nor, status_new[0]);
 }
 
 /*
@@ -343,7 +345,7 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (ret)
 		return ret;
 
-	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf[0]);
+	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf);
 }
 
 /*

-- 
2.53.0

