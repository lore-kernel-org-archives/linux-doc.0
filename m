Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA6227F00A
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891545; cv=none; b=rpVw+lvnLS8PfUG0c3hYForHP+QSSFldqpwss8GTcwglywm1we9HgfjozuQbAKdEoF2PoSVWgshEAzjBuJ/DUuqmbWsmeFPZgfdICe/2hsOEY4up1MrTj/uNlSv7gJDk0aOIu62abNQd1q6ZJQ6sk0XMf/z5n+Xf1ICMuYy5n9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891545; c=relaxed/simple;
	bh=m8EezPdj5/zLpTZs6LAb34kiI2GknFW1YMmMypIYx5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U3Q+D50yZyfr3eTKWVO1H+V9dMrhe1XdRJPselqqNh/wwEMKpmDF7dUBWHGBYpqJC+qsdRZKubJMRqm65m7pd4lXjZSp5AvX1IY+KmK6rGhsR8mhOk38hz3Nt5NKruu37H1NFbqskndMUIc8ATLvyft1B71vSuSS/WWY9/8UMhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p5TMnORk; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p5TMnORk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 11B821A2718;
	Thu,  8 Jan 2026 16:59:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DAE496072B;
	Thu,  8 Jan 2026 16:58:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FB31103C8826;
	Thu,  8 Jan 2026 17:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891539; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uBSfAslupKiDUjYa9VdOz+tUE+1u7aYrr2OFADafudU=;
	b=p5TMnORkhvGqujqrzItf79wUsWyjUlCV+E+vju41eFJ++qmKaf4qaWOLk+009IVSmHZrEG
	L08bNaOVOOBr1e8U91J3p2l4E9+a79klICA+OMCk467mwon+9Iu5M209lRXDsYYUdLtBNh
	zyOnba9EqmmpCRcnGJ7OycYQL5ImNaSC1nmvKb0K2oG3BBBFKt0ss1tBKAEok/12HDjjyy
	oHrUMaW1Jfvd3LM7Dxu5Htba64tM0F35+B3/ub5AzJHtmmaXC2SJ4vLTL2XtcKTMvkvCqJ
	O+q8MHEwJfsL0pwsU8ihQ9/2FxMlOlcF6mj3LArL2zotoSgd8aHCRkQHNyZrtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:40 +0100
Subject: [PATCH v2 07/27] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-7-c462ef806130@bootlin.com>
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

Add comments about how these requests are actually handled in the SPI
NOR core. Their behaviour was not entirely clear to me at first, and
explaining them in plain English sounds the way to go.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 1d50db1ef1a0..64a917543928 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -346,6 +346,14 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf[0]);
 }
 
+/*
+ * These ioctls behave according to the following rules:
+ * ->lock(): Never locks more than what is requested, ie. may lock less
+ * ->unlock(): Never unlocks more than what is requested, ie. may unlock less
+ * -is_locked(): Checks if the region is *fully* locked, returns false otherwise.
+ *               This feeback may be misleading because users may get an "unlocked"
+ *               status even though a subpart of the region is effectively locked.
+ */
 static const struct spi_nor_locking_ops spi_nor_sr_locking_ops = {
 	.lock = spi_nor_sr_lock,
 	.unlock = spi_nor_sr_unlock,

-- 
2.51.1

