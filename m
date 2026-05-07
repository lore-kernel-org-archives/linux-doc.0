Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4D6481FB0
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 16:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172466; cv=none; b=VH7JTSf97/ahTljqlITp6XACcs6Mbz7FovJvFIoM1aBxAxb1dQ+YIIiHx3aLlzPowWoRHFu/ojcKnouTPMAKf3mHY72C79iRJe96jtJrEYUkY+pZZeqV6iti84sXrNdm5yu7iZHeSfICSEHCfrsEnXipvW2oYA1UR6vJ430g9Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172466; c=relaxed/simple;
	bh=wR9fLcKMP8jfOUl1u02wruIBJQCBpAmyi7PnHqZUNKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nRg4bKsvgot70Pi33Zfne6gRH4S+X36XLLxuH3qlSv+2M5HRBwNVXpC5g2NIIet4TQUMQgrKfmH9EjNC/FinhkTKgDYDrV2LTMHV74Jc2HoFvgDirhoGgNR7T0NUvtYQ7FXByrU7MAUrOqujmKuO9zUt82OwAc7IuDX/feGx91M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rqFqbMZw; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rqFqbMZw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 598F0C5DC60;
	Thu,  7 May 2026 16:48:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FBF1605CF;
	Thu,  7 May 2026 16:47:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 670BE108194E4;
	Thu,  7 May 2026 18:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BzudXirteyCIpUHAn2PSh0cnsxh8jvQrz2NfKL2yz8c=;
	b=rqFqbMZwEdCfqW2o+ClqRVtVQmm3OWeDk4XGcfZWRMAtYbEE8GhsmkPsLaWG2euWrP3Npx
	cc79bemYuxskGmxsiAVu4GM3/9mn0UUQ0xCV5O2VesnE8q3JbsoIkrAmEWibujGmiBlJ6Z
	4mJflq7+xthqOTZl8jf8rq/8lc+EnU2GfAv3e5ZKIKDx6xlKc9nX1v7FU+1HOJWRW1U7ls
	KKnxj5glOix0lsJeGXUWwbO8Y0fNG8dyAlPD/l8h8HzONNc6Cpw2tDHBBJJR5pi9jVIuNT
	ZD8M9BN5q5twd020YHoLMKlskOHacilHRLW8EvD75N7GPFxgKPYDH13CGDITlQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:47:08 +0200
Subject: [PATCH v5 27/28] mtd: spi-nor: winbond: Add W25Q01NWxxIM CMP
 locking support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-27-93453e1a9597@bootlin.com>
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

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Test run with W25Q01NWxxIM:
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
 drivers/mtd/spi-nor/winbond.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 3eca7baa4d5a..3a3b7f2f1659 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -374,7 +374,8 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q01NWxxIM */
 		.id = SNOR_ID(0xef, 0x80, 0x21),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q02NWxxIM */
 		.id = SNOR_ID(0xef, 0x80, 0x22),

-- 
2.53.0

