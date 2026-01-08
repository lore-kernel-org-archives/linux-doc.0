Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314582E1EE5
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891559; cv=none; b=JYg4pXWEmz/CETWJC/5/+RDniy+mhYKdtvNmFvDN3OBMOM/PaqEsX1xs3maGjAi1CV7xdBdvEHLVxrujyi/76uOe7GfQD89JrYItVKe0APTVzEYNuwcqSAko6ZArSCERTmVJ/vtzP0Iuo7gAcFXIpoP/hXj/5F0p9fJvQjYdA9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891559; c=relaxed/simple;
	bh=Csam+1hyCd0eC0C2z5CMUVnDsUYBJSzkCxmNlH5O7hI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fJBFDGxKaIX0ddEKLuuBEZnHX6sDr/Iye7HigrfmR8cBWOUBscZTs0TqaoYxw/IuatyGCIkhP5IA4kYQP8kKnAP5FzsmFMYKXxmCtgS86a5mA6hwTeYUoh8JnkmHAVXD8D4ZTYiZoXaOCY11pUs9mOz9TANuTlMIJODmZrSs5Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=crHhfhBP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="crHhfhBP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DE5024E42000;
	Thu,  8 Jan 2026 16:59:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B1E656072B;
	Thu,  8 Jan 2026 16:59:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E345103C889E;
	Thu,  8 Jan 2026 17:59:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891555; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cErOh0nPQq4JaUTOOkelLy8W6h1AXJeJNMbiy0SldGw=;
	b=crHhfhBP2/DunogaW8ivUXJKzcXKeaGQlnlYho5TAKDEVI/JFCBwmGieUXdSUCIibPllmi
	hLvGh7K82nDLhUkUF1LdCjkMTrmuWS1YDmyyakPR/KAhx2ku6SilWX1VR9U6Jr+h1or8G7
	iWRi6MsTg2ZQBdz27xB6zxFJ5NbDaXSOvXI3RmsDoXDwCKjCDzYflJSVhdFfP03H57QjHi
	PJmSgpTFb05+s944CjjUffqBMQrD18DDRhcjEM3J2X4373aR1gm68dD+o/Yx69BRA4eZJA
	4J+Icy5QZr/Kr1739G5JOGHSXwIvZcsa9Uj6Y8UMXRt0PDe22M+cladFR6wlXA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:47 +0100
Subject: [PATCH v2 14/27] mtd: spi-nor: swp: Simplify checking the
 locked/unlocked range
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-14-c462ef806130@bootlin.com>
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

In both the locking/unlocking steps, at the end we verify whether we do
not lock/unlock more than requested (in which case an error must be
returned).

While being possible to do that with very simple mask comparisons, it
does not scale when adding extra locking features such as the CMP
possibility. In order to make these checks slightly easier to read and
more future proof, use existing helpers to read the (future) status
register, extract the covered range, and compare it with very usual
algebric comparisons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index e2e423b20989..c45a9ddd5788 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -198,7 +198,8 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	u64 min_prot_len;
 	int ret;
 	u8 status_old[1] = {}, status_new[1] = {};
-	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
+	loff_t ofs_old, ofs_new;
+	u64 len_old, len_new;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -246,10 +247,6 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (ret)
 		return ret;
 
-	/* Don't "lock" with no region! */
-	if (!(status_new[0] & bp_mask))
-		return -EINVAL;
-
 	/*
 	 * Disallow further writes if WP# pin is neither left floating nor
 	 * wrongly tied to GND (that includes internal pull-downs).
@@ -262,8 +259,16 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (status_new[0] == status_old[0])
 		return 0;
 
+	spi_nor_get_locked_range_sr(nor, status_old, &ofs_old, &len_old);
+	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+
+	/* Don't "lock" with no region! */
+	if (!len_new)
+		return -EINVAL;
+
 	/* Only modify protection if it will not unlock other areas */
-	if ((status_new[0] & bp_mask) < (status_old[0] & bp_mask))
+	if (len_old &&
+	    (ofs_old < ofs_new || (ofs_new + len_new) < (ofs_old + len_old)))
 		return -EINVAL;
 
 	return spi_nor_write_sr_and_check(nor, status_new[0]);
@@ -279,7 +284,8 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	u64 min_prot_len;
 	int ret;
 	u8 status_old[1], status_new[1];
-	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
+	loff_t ofs_old, ofs_new;
+	u64 len_old, len_new;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -344,7 +350,10 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		return 0;
 
 	/* Only modify protection if it will not lock other areas */
-	if ((status_new[0] & bp_mask) > (status_old[0] & bp_mask))
+	spi_nor_get_locked_range_sr(nor, status_old, &ofs_old, &len_old);
+	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+	if (len_old && len_new &&
+	    (ofs_new < ofs_old || (ofs_old + len_old) < (ofs_new + len_new)))
 		return -EINVAL;
 
 	return spi_nor_write_sr_and_check(nor, status_new[0]);

-- 
2.51.1

