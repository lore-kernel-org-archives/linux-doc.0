Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2B52E5B1B;
	Thu,  8 Jan 2026 16:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891532; cv=none; b=o035POV4Pd9fXnDTP7poPYRdo7kyaddgKyFwZLIXf19dh+Hh0nb+6BHww4fLvYVvg2BlyEhzokT7GKBOxe2yGxjZPkpcYqlLaUZzQJvBtr2qGrEL5jA5oNs9AthxWv0YsW9WJn4zPuF8eqmYaHuTanHIIxpOBgPtW2JUOYaNI6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891532; c=relaxed/simple;
	bh=dtFRwS67sy+s/gCELFLE+7OhZ68CG7YOcN0xB6PF2IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rSWOUvioa3ntsyEEpCUgoAJhmpFfhkgTiarY50GhQKcsPAxlneePWtxQcxgmX8VhTP9inTm02DacasxGZTER0bBcdsxCUCtrDRbEJN8v8SaXRvgEEDRTTCRGpJ5Lcy2k5BHFiHA6XnHNDXuDxKiSfgPDcXPl9eZ4iPio/gkfpm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KjP3WChm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KjP3WChm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 598871A2716;
	Thu,  8 Jan 2026 16:58:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E09F6072B;
	Thu,  8 Jan 2026 16:58:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75C0E103C8824;
	Thu,  8 Jan 2026 17:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891528; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q23MpHsjNpx/31GAsCENaWRzQgCj7+jsn8PlbmxRMQo=;
	b=KjP3WChmpA7LT9vLlui0fjjL/T2dSN1GlXpbudSe17zO5WTgRiAYRj0GTHNyOk+dM/BpHQ
	OHqVC7bOBnghRybGkzK8mI5lTLIJ/jJW8HK+Xm/FuQPWEEuZgjfIAGEtKVAGtiWosKGRLn
	t9ZGheIGKKWVRv+x9M0v0sNiPwlFHnMoyLmw6l3cvZFBgDktOW65q291KyzlMQZwkRGSqR
	6QuN0ZP1/zG5KAwlocQ6RK4oiY+3aEzkB85QMFgme+v7PVlHwFdQ5VTeXNddgqPd5+D86e
	3ZYnOBIcMhbi5dvKjHgcnCLsufluke40wrX9f9WPbLSOGVlUP3wVwpJJX35rnA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:36 +0100
Subject: [PATCH v2 03/27] mtd: spi-nor: swp: Improve locking user
 experience
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-3-c462ef806130@bootlin.com>
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
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

In the case of the first block being locked (or the few first blocks),
if the user want to fully unlock the device it has two possibilities:
- either it asks to unlock the entire device, and this works;
- or it asks to unlock just the block(s) that are currently locked,
  which fails.

It fails because the conditions "can_be_top" and "can_be_bottom" are
true. Indeed, in this case, we unlock everything, so the TB bit does not
matter. However in the current implementation, use_top would be true (as
this is the favourite option) and lock_len, which in practice should be
reduced down to 0, is set to "nor->params->size - (ofs + len)" which is
a positive number. This is wrong.

An easy way is to simply add an extra condition. In the unlock() path,
if we can achieve the same result from both sides, it means we unlock
everything and lock_len must simply be 0. A comment is added to clarify
that logic.

Fixes: 3dd8012a8eeb ("mtd: spi-nor: add TB (Top/Bottom) protect support")
Cc: stable@kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 9b07f83aeac7..1d50db1ef1a0 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -280,8 +280,15 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	/* Prefer top, if both are valid */
 	use_top = can_be_top;
 
-	/* lock_len: length of region that should remain locked */
-	if (use_top)
+	/*
+	 * lock_len: length of region that should remain locked.
+	 *
+	 * When can_be_top and can_be_bottom booleans are true, both adjacent
+	 * regions are unlocked, thus the entire flash can be unlocked.
+	 */
+	if (can_be_top && can_be_bottom)
+		lock_len = 0;
+	else if (use_top)
 		lock_len = nor->params->size - (ofs + len);
 	else
 		lock_len = ofs;

-- 
2.51.1

