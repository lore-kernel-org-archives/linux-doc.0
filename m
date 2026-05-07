Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C565A481A92;
	Thu,  7 May 2026 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172464; cv=none; b=Uti++LFIiCg3lJBoiCP8iZaDTJ5W/i+I+Z658erU7aRPZ8z0+FlmUz4X5oTqOYzgnhdp0S+bfADCs2148b7sXhnM37SK8Zk57jjjVK+/FRJBQMrE/+jNH2SfJMQM9FmeL0UBIpUKqAmwYFzG13gDyXGSnk4fwvFu1tZmqVYDavY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172464; c=relaxed/simple;
	bh=0Lupn6UvunZOKLowHQL5ey5eGL54gsUysgzGnV1wdO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rsd9dqHVB1Pg25vCYg0Hhz8Ohlemq7FqE9XEzaC7pCGEIuU7sEilk2bZ9xHYelYj4jSpYEEclu2ln/UA6SXolrSkG9i+gZUJgn0OO/y8b2TNgMitEpt9by0bIfSehONNJyVgUOF+IBrvl0USabje0aUllMoIht9AgUDRnbzYuY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vKwYPBrS; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vKwYPBrS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 712CB1A356C;
	Thu,  7 May 2026 16:47:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45842605CF;
	Thu,  7 May 2026 16:47:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 993E7108194ED;
	Thu,  7 May 2026 18:47:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172460; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=edSYQazxhakuu8k26vId3X0/S/a6bSHMtg1O+5hvsoM=;
	b=vKwYPBrS4YjVoVEO4GxXcjYXKV+h72br8aWoMtv0FhCJ5KuSeBmfu3DIDU4ECsReg6P0ca
	EfguaW25dJKf3N5wm4kQ3tCe6HS4cg1fUNfZfXBOvTxqU70TOC5Oh6z+PtrhlIoBhmPiDD
	hdBgu664mNRAffAJHuC26Q5IOImFvrftq9xCYsK4d/hMlENhGT+3e6QBCqyKkEs5zICihR
	THTxfOZIrdeFRZg4g7lchfeulBO6+SFiq8+UA6TtQDcoar3BIjrQOrgLU4wNdZmfxFHWBu
	ihb7sENefFdmMfUuEw8a6WyHMzZSeTzNF7zg9KfZzYu+En1sxhmtpDiAFb3bow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:47:06 +0200
Subject: [PATCH v5 25/28] mtd: spi-nor: winbond: Add W25H02NWxxAM CMP
 locking support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-25-93453e1a9597@bootlin.com>
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

This chip has support for the locking complement (CMP) feature. Add
the relevant bit to enable it.

Unfortunately, this chip also comes with an incorrect BFPT table,
indicating the Control Register cannot be read back. This is wrong,
reading back the register works and has no (observed) side effect. The
datasheet clearly indicates supporting the 35h command and all bits from
the CR are marked readable. QE and CMP bits are inside, and can be
properly read back.

Add a fixup for this, otherwise it would defeat the use of the CMP
feature.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Test run with W25H02NWxxAM:
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0000ffff | unlocked | 1
 00010000-0fffffff |   locked | 4095
$ flash_lock -u /dev/mtd0 $bs 1 # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0001ffff | unlocked | 2
 00020000-0fffffff |   locked | 4094
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0ffeffff |   locked | 4095
 0fff0000-0fffffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0ffdffff |   locked | 4094
 0ffe0000-0fffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 7628fa7fb64f..2c48d6c4a0aa 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -73,6 +73,26 @@ static const struct spi_nor_fixups w25q256_fixups = {
 	.post_bfpt = w25q256_post_bfpt_fixups,
 };
 
+static int
+winbond_rdcr_post_bfpt_fixup(struct spi_nor *nor,
+			     const struct sfdp_parameter_header *bfpt_header,
+			     const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * W25H02NW, unlike its W25H512NW nor W25H01NW cousins, improperly sets
+	 * the QE BFPT configuration bits, indicating a non readable CR. This is
+	 * both incorrect and impractical, as the chip features a CMP bit for its
+	 * locking scheme that lays in the Control Register, and needs to be read.
+	 */
+	nor->flags &= ~SNOR_F_NO_READ_CR;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups winbond_rdcr_fixup = {
+	.post_bfpt = winbond_rdcr_post_bfpt_fixup,
+};
+
 /**
  * winbond_nor_select_die() - Set active die.
  * @nor:	pointer to 'struct spi_nor'.
@@ -370,7 +390,9 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25H02NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x22),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+		.fixups = &winbond_rdcr_fixup,
 	},
 };
 

-- 
2.53.0

