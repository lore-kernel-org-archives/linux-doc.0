Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844252F8BCA
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891561; cv=none; b=VvsVlUTs/rbE5zSXN7m6IhfnJ4Qj6J819ad8L+cFmAb0bIzY2lnXCsy6ihRcyNS0viKTzH764smekRbdMj9/XarCEurKj3WcRYVjiCRJIgWd+c2y+Mm72VsmPeEYKCSbwcq9SrVK0lNWhpoqMoZzqIBKwzti0eq3QDAsBvK94Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891561; c=relaxed/simple;
	bh=IEdX/5NoNXEojE3AbdxR2NpAU6JWoKFqu1WWGh6+dqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VoqAczmnmmF+wMeiwMJi0HReNujCGKDuqD/a/UshVvLL9QZZS4bukUgKea0bQ96A+V2Ar6V4nunK8d5joar+a/F69Uh3dZ1vy1EmUM21hAbYrUAO/WQPJnCrdszp8ejjzCgkZkdF2Pm9neVxBNDUwMpPwD0Y9kn/5yjnIjh5Hoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vedhs7oa; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vedhs7oa"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 36E091A2719;
	Thu,  8 Jan 2026 16:59:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BFB66072B;
	Thu,  8 Jan 2026 16:59:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4529E103C8824;
	Thu,  8 Jan 2026 17:59:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891558; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fSGWAo4880GBGohVwH5amGuxHfsnb+vsg8Hq4o36l8E=;
	b=vedhs7oaEeo8qQF/37mjpjEd2q18BDFd1u019iRAUmUOZv5AosrDGwtMlNAm0qfVS7tjA+
	RqJ+oZZ7A796AGr9ESZNjGjxp+ySltqe2pl6ScYqxZ4p+1n3j5sWNbir+JvpU4hzwot08N
	5/LegNkULQwTtgLSf8JOV2HWsDn1oOrvdN9ExSJMDkXN6EZvCxdkvRm6ikZEgAoiOTqODP
	11chydVyNQK1ks4bELJurYHMEpl1IOoRz2lAzpb7Z1/wziaHZuOS+2Nvaud+HCdI+7AK1D
	12jZ3TCRh7yUHb8srDeIBuGKSA1Rm+GwMWXrIj21Tig5L7DTBzyDSRdwnzvMGA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:48 +0100
Subject: [PATCH v2 15/27] mtd: spi-nor: swp: Cosmetic changes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-15-c462ef806130@bootlin.com>
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
index c45a9ddd5788..c3dbc8832025 100644
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
@@ -329,14 +327,11 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
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
2.51.1

