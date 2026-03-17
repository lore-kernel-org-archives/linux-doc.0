Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8943A782E
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 10:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743102; cv=none; b=PIxy5Zw9QVStMpjce+PYoFyvktF9K6Gb9Dkrqgjx5Ow2sTYYCxmdQ2Brmjs25/jqLsowlgTzKBrfoMqNknFBGO2b3urvIhlt6ldzeE7TkHEFCPez2WfSfQe1nX98z9ZIsYxVHSFnGUNZoMsk2A1YGPcthZUCP94fa7rkJNuTGPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743102; c=relaxed/simple;
	bh=OAsshR8taJxBMFFyddHaDNJSHSzI1SzbRqNeGRPBYZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vFxfOxRk50oPmr396BZ7f5XGEttBnYE/3yPP6hdyW9k81eNOY+Cl9MDnI+QsUV9Of98sdz/9WHEP1fR+6ueMlkZCG+/necHFEpDQFkZY+ZYYTaZkg6nNTf5w/46eDTulSor9TTYA/JQKvPJySOB/1OnlPm0K5fBrNIeZ4fxSFas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RLRMk7me; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RLRMk7me"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8E4D61A2E89;
	Tue, 17 Mar 2026 10:24:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64BA05FC9A;
	Tue, 17 Mar 2026 10:24:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5046E10450459;
	Tue, 17 Mar 2026 11:24:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773743098; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wXJyxTh9zUcQqoOPuD+RgDBVRNZuUe3FPkKCommQgVQ=;
	b=RLRMk7medhaQdMZDglFB2RUup/lNY0x+/HHwdND5mrW5cn9USg7Xl15Qg3PNUCt1UtUImZ
	Bqg9O8vPjeBqCenzWiQ6yggPwJBuYexaj09MF7uO6YaDIL5yW+qgOJHFGQSW9gHCsbk6rY
	mvuDKgqx3Z3efilAxN1bGdDHwnZ4YBxIpxCZZcTfdvaIlo5fHYgUQr+q2xHANTdM6sn8iN
	PcSaB1hDmi62xfz/Vi3pp1TXhldkR0mlU6PseRKuqBzMVrt03gUf2r81VnL9eYMdCY3dtQ
	+gIBjI9O6PsVHshQnPh2XKI1VNuzCZQ4+wer2cF3Sj5gODVrUQhYE5ARTY+VSQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 17 Mar 2026 11:24:30 +0100
Subject: [PATCH v3 27/27] mtd: spi-nor: winbond: Add W25Q02NWxxIM CMP
 locking support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-27-2ca9ea4e7b9b@bootlin.com>
References: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
In-Reply-To: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sean Anderson <sean.anderson@linux.dev>, 
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

