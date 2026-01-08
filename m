Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA64E335555
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891593; cv=none; b=b3ORbcvukJUgiIG3GAdEHzEolSW7/c+l61uprZPVA32ez974vil8qdkDUQx9P4EfIgt/km33ey1e7hqZ2TSXN6dr3JGELLz9qVyaatD188NuhpkCW2blAAlP3U3z9monBtARZvaQAAkr3IaewkG+BInWzTi6BhDP5N/HQTcmImo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891593; c=relaxed/simple;
	bh=OAsshR8taJxBMFFyddHaDNJSHSzI1SzbRqNeGRPBYZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ogf1ELd1CyQK2js58lrxL/Bum9Muu6X8gWflgM58cMfN/2X7xzKjYq+tadwr71CN2DhQLLviAYIo+vFBdnzi0KaawbhLB5DRaSnC8EWT4JGfe1XWl2B73rYRumtlpqc/8psrPtZipPPpRGSsgBSLb/4awBI7kDKeBD0KJd/mbH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mEJDDeqb; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mEJDDeqb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4F362C1F6C7;
	Thu,  8 Jan 2026 16:59:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 85F2A6072B;
	Thu,  8 Jan 2026 16:59:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2F64103C86ED;
	Thu,  8 Jan 2026 17:59:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wXJyxTh9zUcQqoOPuD+RgDBVRNZuUe3FPkKCommQgVQ=;
	b=mEJDDeqb/jbPrF6UXkoJQOsGfgqLRBTNBmBXDtoBoIgn+4TAKsAPVsqIIcrQs7wWG8sHEK
	/W59zlpTdtbaJ0JdW+coJsi0k7J7Ec4zgS58AR1OqjguX+GDF8R6x8xzlaBmwwBq0uG0vS
	RR17Jx8Ehxhlz+d28PJ//I3hZfdx2GR4HmXBCq836bJOyTcKDf8IQyKsw9DEDczS5YS27f
	7uTqtRpr7qgDUDpHFj5YX6iWwoaidrNuh1IDzQUYe2bt31NXyog/4MKD8J2S4/KzevKa7X
	qKINk4FELT5g38+56H3mgFYejZ5RipGLUsEob9prKdYKiEXktCej3i8GN/pljQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:58:00 +0100
Subject: [PATCH v2 27/27] mtd: spi-nor: winbond: Add W25Q02NWxxIM CMP
 locking support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-27-c462ef806130@bootlin.com>
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
Test run with W25Q02NWxxIM:
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
 drivers/mtd/spi-nor/winbond.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 72053a4505f9..639d72f48769 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -377,7 +377,9 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q02NWxxIM */
 		.id = SNOR_ID(0xef, 0x80, 0x22),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+		.fixups = &winbond_rdcr_fixup,
 	}, {
 		/* W25H512NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),

-- 
2.51.1

