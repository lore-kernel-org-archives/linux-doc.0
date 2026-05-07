Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FB847D949;
	Thu,  7 May 2026 16:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172446; cv=none; b=tZ52kkE+iTCDQeA8JWq5nFaJiJiQa0gIT06+vgEZfJ5OI+fsdKpVyKOj7Rd6O01kKzCypoqVrH/c/LtCPRP9TwCagzgdIP7fC21/w3OYHHHba/lrGr2a5iTa+ZPQL6vnN/5Sq2tDP0FnERy+EuXQmu1gzgExRN0Cu923FFuovfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172446; c=relaxed/simple;
	bh=EjQtvzypCDZIUtyWHCBLfgncei/SSpaNORo1m0Wuo0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlW28X+uSY0SVTBU7+nmzCKnb5jajLh6tfO37A1/t8M7FFY2TjIZBproNYM6MDZtv6OQ9dbE8yawnTcu9rLlE82vC2ahi/ZI1JRjJspJrUU5KNnk9vaaS20zdA1n1TIxPjUF8S0xGWum2jtduhR9aTw3jEo6hmzS75kBDryWaNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zy6DB3nV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zy6DB3nV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0CECE1A356C;
	Thu,  7 May 2026 16:47:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D224A605CF;
	Thu,  7 May 2026 16:47:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C142410819513;
	Thu,  7 May 2026 18:47:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172442; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VwHLR/6FdLe2ctHkVMRBIz8NPLwLgjKVBhP9hMYrXR0=;
	b=zy6DB3nV6oAE3PJCl5cdzL8PtXv0m6T95+5EHUpdg5IS9ykrueUm4idF9usvfxTrowWle8
	gMasWrMLSBzjqiiaeZ+AVNuDNRN/ZcymD61CT/nB5vfoGz4U4LiHpo92dCCo5C+Wa7jJ3n
	srCjDBfu0mAPNAg1ej/JelEkB9Ij+X8iWB7LdSUYh6mhOqF/uIIhv4DiG67UiiG1ZhCl2a
	7SKTXGTiY0GIO7JCma03J/aeqIHrnwoVV305N5TPc/J7KcYbJ2Uce5mT88aw4YIeoHPnlq
	/8dhAYTtU2hlQ7HCI459GD2eu3kkbbRkR8njGXUCWomUHFwruo8+AqUNAS2q5Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:46:57 +0200
Subject: [PATCH v5 16/28] mtd: spi-nor: swp: Cosmetic changes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-16-93453e1a9597@bootlin.com>
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
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
 drivers/mtd/spi-nor/swp.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index a45627380363..c22cb094b66a 100644
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
@@ -283,7 +281,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
  */
 static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
-	u64 min_prot_len;
+	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	int ret;
 	u8 status_old[1], status_new[1];
 	loff_t ofs_old, ofs_new;
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

