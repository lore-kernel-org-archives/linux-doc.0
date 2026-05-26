Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F48C4279FD
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807441; cv=none; b=mc5KaDmXTaCp5nbxe/vVgf6LE/Fj31+MdLB9JlraQHymdOoSIkQRZeoZJuAYf/W21C1PznoYsXYYlGTxOVCZ1yi6NPLiLv5PzDT6DeiceI9xSBuyz2nLAqN20B9ebf+2cBH+aNd6e9GwuhGX0BKpVUtNzLEoSbdQ3D2enIfyRoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807441; c=relaxed/simple;
	bh=vKeI/8eitRV4UAFHUp6yg36GViA+suYexJuU7bBYfcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QCro1LDZ2WFDSilVXge0Ao2VJqJrp2xLmFZG4/bQB369zZ6/SpqBJvhgcyMSWZ/XCDw23IaroqroWVoYUM5lJLl5+EHvOlOhO0maAUpASPv2TtdzFt+5tXZ4YksoPuEOValENM5GUAt/tgG4/QVM5lIbWkVI1uJ3y2kQNLMD/bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VJvVm+qm; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VJvVm+qm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ADA674E42D5F;
	Tue, 26 May 2026 14:57:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 811276011D;
	Tue, 26 May 2026 14:57:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63C84108888CA;
	Tue, 26 May 2026 16:57:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xSz8lH002GPUpQgEP1oBjyrBoW3KkUAq7QuEKEyUZms=;
	b=VJvVm+qml8mpb1hs6gQHyKXK+5mBXpYnT6gGvtGIjeadCrF5pL8fZMTwcqPXRcca7kGSan
	He/ijehA2cvuidTGqPhg5X/fyumLyUdra8t2LQ3A5C4zxYijBKMFBv3Zgm7zsbDOFuLkKB
	5H9kzTpiNsBuO/mN83BLdhrKSlpTHrXCtzatIBDR689iQ/XFvAj+CUXUkQRDFYgBhDJK7m
	eLUjlWFLibFhzuJrOxwcvA4SFZL3xQfBPXuG5xnZFUk7puiWZSi/Fyd1GzFabthTvrwILj
	ziALhoHEd1evc+RTjPOSdiG+uwlqAgrQNPtGXzRrTPWCMcJDwayrvqyPSHzncw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:40 +0200
Subject: [PATCH v6 16/28] mtd: spi-nor: swp: Cosmetic changes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-16-4092f1419f8f@bootlin.com>
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

As a final preparation step for the introduction of CMP support, make
a few more cosmetic changes to simplify the reading of the diff when
adding the CMP feature. In particular, define "min_prot_len" earlier as
it will be reused and move the definition of the "ret" variable at the
end of the stack just because it looks better.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 229074d4e121..2d1b1c8a535a 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -197,14 +197,14 @@ static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
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
@@ -238,12 +238,10 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
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
@@ -283,14 +281,14 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
  */
 static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
-	u64 min_prot_len;
-	int ret;
+	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	u8 status_old[1], status_new[1];
 	loff_t ofs_old, ofs_new;
 	u64 len_old, len_new;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
+	int ret;
 	u8 pow;
 
 	ret = spi_nor_read_sr(nor, nor->bouncebuf);
@@ -331,14 +329,11 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
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
2.53.0

