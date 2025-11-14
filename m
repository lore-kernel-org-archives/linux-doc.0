Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606BE34574D
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 17:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142815; cv=none; b=AVKVdouf9sHJsNvU0kpof0nlNdVnyzqfNNcZi4t+sbeOZtoUjE+pCQ8vSfpTbkXRdhNqG9DIVW7iUJk2nrrt7uygzJRCB36LUGoYGDTeX1aKss+hMkZlO2ioPEafRc51Z1QiT4asKZbD79Y0Rz7gzZxQeh5Dcym+TQJ+aO8xCQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142815; c=relaxed/simple;
	bh=rITH1oTXB9QbeqFibxYG19sQVo6xRjVQSg/WRgrNYjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W4YmQ6Usq6CiiM2RrejQNvulZZ3NoiEne3Zhpo5t6rTN31apldqjPsmhLnwoAAXSJiJuIa1tdJ0LXEfYFTQ/Zq3oHuNDtla3AuViDB53Yl1LC1+HvtZAfoO/lMp6ykzhjc93xLLLmF6voFm2e1AmXdVI4GWcSpcAqO3QPfJHa6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QGKdlJrh; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QGKdlJrh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C5F1AC10F6D;
	Fri, 14 Nov 2025 17:53:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 998406060E;
	Fri, 14 Nov 2025 17:53:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E4AF10371997;
	Fri, 14 Nov 2025 18:53:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142810; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=98ui2AWqfgCc/02PfNjFtZFpjS6UsC5GFegQdo9CPOY=;
	b=QGKdlJrhYSNoY+0jlViAn3WjyJdZ3PfqQSnn+NZ/qfc55SgI3IRtcNVbM8oLhcxv/OvSSy
	s+s/G/wvO1VB9etfebFDagPSc3QW+H9rNbdAQ2zG1AUeYO7JK7rXKHfjuUXpFqV6eAX/bY
	57mJTXQS+h+oifWldr6VPLyWLD/gGAeiNkskJ4f2t6k8EpmgGRQf1IWSBPVoJDl0JJO3dX
	FqDIFDf4/1dOcoqv4Xz9grfkxhoJLFxDaJcqaZnJWHHoYEbshTDsa6ghvGxe0oBS78BeKr
	0Rt0DvAsDQFefM/3d5QEinn7yHr/wq5TBwTgy0J9VDvOaBrx09hbWybmq3aLwg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:07 +0100
Subject: [PATCH 06/19] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-6-487bc7129931@bootlin.com>
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

Add comments about how these requests are actually handled in the SPI
NOR core. Their behaviour was not entirely clear to me at first, and
explaining them in plain English sounds the way to go.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 9bc5a356444665ad8824e9e12d679fd551b3e67d..ede03f26de3c65ff53c1cb888c2c43aea268b85a 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -341,6 +341,14 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
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
2.51.0

