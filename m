Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CD643C05C
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807457; cv=none; b=IXjbQQH+jDZVTtJNZPzk668pjgnGz3d48LeVwH/PtkNZKhzeUyn1gOGMkr3EUUeP3udNO/gbemx0J9S0dpqY7W7lmKA4UtWQWKg+1A9PZlFIa5o39mVcOx7+MtAz89LsUYM2PWHO/BS169j1VqQIVH90TfKTAVZf4XD4psXnGqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807457; c=relaxed/simple;
	bh=jwcN+ovRhYFvQzUykDCoOn8qhaNdPY9IpHRPlxXXTJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OT8jBNZq72QDlBbOMd2pCzFdIUzjy/hDqW4hNqaupiK2Ad2srtHZc7++sc1Ikz7dqEbYQxuK74NtwyLi9VRFdyknrhYF6A+Vhhi1JlgQbbaEuftl2pmYrt26AhShO0WY1B3BIn/ij18Z3hZHzdiyf/w8j867uXs9A/O01X/mwtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pAG1USRy; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pAG1USRy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C9A814E42D60;
	Tue, 26 May 2026 14:57:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90B6660733;
	Tue, 26 May 2026 14:57:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A816E108888C9;
	Tue, 26 May 2026 16:57:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807453; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iRDyQtvFOEnF1iYl8F9VQ/3msDYew8pxy5X8p5VmpqA=;
	b=pAG1USRyCiNKx83Vsif48lT5f5rKlxVRLDQ9tVIuTfcTFkB2nn9En1UbUIPNAdZHpAbNGk
	c9BMfVtzv4t53pmY6tS4/ymmuNDfMyUU5/+3L42jQFln0QgL9Ph6KZW29wheKiSOFWzc3G
	O2NhMuLDIDOkgLQgwsQk0uMPvhqX+edv56jAQXnCE7TAT7NNvqne84ocy+3xxxiFr1aGOY
	ygKVyC0OccLKG4XV/QvbsTo+4Qtj6fTymFdzZ3NSlWvUSUxmrBAjyb/k9MbtX2Hvohvwxa
	B4fFWe88vKSjxDzL77DCyPVuLJUDKjEU9Lk1srJvcZ6S/BqnN+wAAbIdEco6Rw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:48 +0200
Subject: [PATCH v6 24/28] mtd: spi-nor: winbond: Add W25H01NWxxAM CMP
 locking support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-24-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
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

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Test run with W25H01NWxxAM:
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0000ffff | unlocked | 1
 00010000-07ffffff |   locked | 2047
$ flash_lock -u /dev/mtd0 $bs 1 # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0001ffff | unlocked | 2
 00020000-07ffffff |   locked | 2046
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-07feffff |   locked | 2047
 07ff0000-07ffffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-07fdffff |   locked | 2046
 07fe0000-07ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index ef73c855cedb..7628fa7fb64f 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -365,7 +365,8 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25H01NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x21),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25H02NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x22),

-- 
2.53.0

