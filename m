Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEB348123A;
	Thu,  7 May 2026 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172461; cv=none; b=RQyafREDpPpBsE61sqLP0IY57GforKwpz0idQRD0FKLaEBSp9Zwp/UujsRKdzbo6Y2cDo7XlETkt5NB/ZWaJk3UP0b7c2ZfC8tzjtD8PCVwt5BOh3g81BuquU6Y5kB3tzHa5+HAAhbkQ1+tiN+yB+hl5eN1P0AplFHefBHQzofQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172461; c=relaxed/simple;
	bh=jwcN+ovRhYFvQzUykDCoOn8qhaNdPY9IpHRPlxXXTJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mSNpPdpq6f9AjbEplTdDbvON9qPOY31Lo5xFw7Bnk3ClGDM/1LZJhdkVoPb+IEAY2PoCfrO+qtak3XmYKMcnPWPiHopjkdep6eDRODMOQ0HMI8dR+QXNlAvc/1saObIOTf1JgLpKI5xq2GJZEoiWWVwQ3Hj3rKM7AR7k/WCOV2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O8axOUlE; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O8axOUlE"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 506091A356B;
	Thu,  7 May 2026 16:47:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B96F605CF;
	Thu,  7 May 2026 16:47:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA89D108194E4;
	Thu,  7 May 2026 18:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172458; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iRDyQtvFOEnF1iYl8F9VQ/3msDYew8pxy5X8p5VmpqA=;
	b=O8axOUlENVkHbq1q4NxFyS9xYvRxPfXkFYlsGkSwGeGKCAcxfW0FheDLDBGAAZ4TA8oY5S
	o2UqHhbjbSZFxB8gs4ZD0mTZRzNLX7vXCE2++pHd4bMgJUNxBWIkgH0KvxA5w5LG/k6UVU
	+a85KpGVIRwtfAXL6Xul7suPmUf/0cOWNRjxOVOR2RKRM6OLeM8enatqPDrf9Ro1W6rXL3
	GkMaLL/+rCEPi0FIWckdSiN+JaD+In40QVyayReVCfHcnBIvfi5ZNNqQewIbEQWz26bNvX
	AZ0vN3u4io4W7ADlc6/p8CDwb9owyc9TtHlK+g9QdtMZdKervGBJY/qp2POO5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:47:05 +0200
Subject: [PATCH v5 24/28] mtd: spi-nor: winbond: Add W25H01NWxxAM CMP
 locking support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-24-93453e1a9597@bootlin.com>
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

