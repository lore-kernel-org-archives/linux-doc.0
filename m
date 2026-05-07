Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C173472785
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 16:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172432; cv=none; b=AR83iiWcGeYjsejZ+bw5gVh64J+siFL46D1VzRz6K2CH+0xgtBavNxlwg8hSQwpvr/RhxSUidIwvvLJciUJ+cnnZ600TmwIsP+MsEktjWjctu87jy8tWD9e2eFbIFStQYfIrIAZR9IHIT9UuThsTzWKyKiOndi4G/QvBKjF49sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172432; c=relaxed/simple;
	bh=cgD61f3kJ0Ok5o1W55uyE1PnBczkMq8cG3xlLRmKt2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CcnOUM0aXjNIXmzdPIsVbsVjVbPvd3UzBPt6kh39RbV4U508naRpYYecWV9tBYAqSr9RBwY52dwn3GOoKJHV0BjATN46YrgyTKSKQLaurF0lEn0BbVoeeO/sqx/yY8MS1p4eeMgkQQtE4Vjj2r1n5kxpvZDWoeUgZ7K6WMF9J9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RYLmPhfh; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RYLmPhfh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 08D374E42C34;
	Thu,  7 May 2026 16:47:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1645605CF;
	Thu,  7 May 2026 16:47:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1E61108194E4;
	Thu,  7 May 2026 18:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172429; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DW149RMGV1/vK6x3sFt0RygGY7FkmmkXRKSFTd7Ff0M=;
	b=RYLmPhfh3SJ3G9X1Ki2MPVUIx7P+vpnqqgc+rqVzTt+N6K5Galn1WlAH+X3veVvSxJy63j
	Faxykj9QRUYAZD7MQa/qtwM5v+zsVsCHZpnAwRJFHdwWTHyWmF6IZr/9JqVv/bt1l7UKAg
	g4Bwyrys16IcUYpYmlRjLuUXRETcZCONlEDcegO2LpWClALgtb7aJEphPzefI1S+bY1RRX
	FtTmPwFKOdtWewvD24vWCGH1uW12qYzIDXBL6uakXGGM5uiUkCDlt9PzpRMIrdR4OkB6Nd
	6xJ0RXpl/CH249ybB0elNdcO0jF7UtvJ/NOoti1OlmS2ksjdKh/71TXjyONxCw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:46:49 +0200
Subject: [PATCH v5 08/28] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-8-93453e1a9597@bootlin.com>
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

Add more details about how these requests are actually handled in the
SPI NOR core. Their behaviour was not entirely clear to me at first, and
explaining them in plain English sounds the way to go.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index e838c40a2589..22f21497c720 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -279,9 +279,14 @@ struct spi_nor_erase_map {
 
 /**
  * struct spi_nor_locking_ops - SPI NOR locking methods
- * @lock:	lock a region of the SPI NOR.
- * @unlock:	unlock a region of the SPI NOR.
- * @is_locked:	check if a region of the SPI NOR is completely locked
+ * @lock:	lock a region of the SPI NOR, never locks more than what is
+ *		requested, ie. may lock less.
+ * @unlock:	unlock a region of the SPI NOR, never unlocks more than what is
+ *		requested, ie. may unlock less.
+ * @is_locked:	check if a region of the SPI NOR is completely locked, returns
+ *		false otherwise. This feeback may be misleading because users
+ *		may get an "unlocked" status even though a subpart of the region
+ *		is effectively locked.
  */
 struct spi_nor_locking_ops {
 	int (*lock)(struct spi_nor *nor, loff_t ofs, u64 len);

-- 
2.53.0

