Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB23C489887
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634471; cv=none; b=bJHZPZvJ7tEfc5QnG407LwjRJUu1DENP0EIV9AOD+YPzvzii2yWKUOqYaVAYkuyhbaNqRi5Qj2aVqbH9KYW/X6uXksvzkkq5Pz1kS2HraYWtvXdLAoa6Yp1j9rvpIEc7ijvmehqZAskGzYppQTCJz9dkSSGwaa7/FrhQalto9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634471; c=relaxed/simple;
	bh=XsDzoHtDFCrtDyhczqtRee1HbeRI1UsR0szS/sSKD18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AUrGhw11qx/LuK1RwCM8WQfMmYzIPpoaCHd1DDcH+eL70yXFZZgjarIO/ALnl/6RNrO1jNThXRpqHwZ6ecQ2gNc3cc9j4sgCLtmSkn2E0MMOyLn8VVdnXo/GzGtJHKSHvR2/h7pms4T7tlwTsf6KcSN9iAx+SjhNvVFPxguanZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x01bHdZr; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="x01bHdZr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 33A6E1A1602;
	Thu, 13 Aug 2026 15:21:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 013B1602B8;
	Thu, 13 Aug 2026 15:21:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FC3C11C4E078;
	Thu, 13 Aug 2026 17:21:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786634467; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0vOnNyGZDVVEMHwxhEXU8qma2QM2Rky8jc9YgFawibM=;
	b=x01bHdZr4txGJyzLNTdz1xON5oO3Dn0rzmfBudCUQR7XW0AToHLg9eyzZmuwOvujtyf0Pv
	OpAlmoQ2RYu2f9gOlzn8WZEOIROUv57KRbg1WXVjS4sD/dn9Y1mXGcwusimvKGXQ/T7dyf
	NP2PEaGLgwU3ElReRAdjfeXc1+RV1736S7jGzeqlgGd8XhTfRpWN9pg6PYdvyQtbymxrNj
	kBl41RVCrAs1G1gTbxeHodIPAewsGn8Q+aNPrNHpmu7Y75XTP6pDCarJQOB3wPcwlGeRm1
	PDoJs0FH9DDZVY69DlaUljDCgfkoGhNbskNB58fcFIaXJ8GqJ6AP7AQsDUg72A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 17:19:22 +0200
Subject: [PATCH v3 22/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-Q/N/M
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-22-b637cf120d5c@bootlin.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I currently do not have access to any chips from the W25Q25RV
density. Yet, I successfully tested the entire JV family and all other
chips from the RV family. They all behaved strictly identically, so I
propose to nevertheless add the missing comments for the sake of clarity
and completeness.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 6ad7d4a7da8d..b4ed41c692a8 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -265,7 +265,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25Q256JV-Q/N */
+		/* W25Q256JV-Q/N, W25Q25RV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x19),
 		.name = "w25q256",
 		.size = SZ_32M,
@@ -377,7 +377,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25Q256JV-M */
+		/* W25Q256JV-M, W25Q25RV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |

-- 
2.54.0

