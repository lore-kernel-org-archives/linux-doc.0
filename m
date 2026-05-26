Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C753F9F4B
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807425; cv=none; b=VB4zt17hhy5CrJnZy52zMEi70JFK7Ho2BvaN8DeCyuvaUqvOzHcWhdaZdNWioRrlCWnU9VXdALKs3aXILd05KDEygvknvjibrzO5S4LKZOrwFQtLUgflX8WCkm12Hw+BUyxLSXTXE4PZlRUNVDiG8E2QatvWtiaNDSzcpszb8bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807425; c=relaxed/simple;
	bh=K3AaeCWgPr9gpKZXwqcP+Kj1IG0WxY+cKUYVM/Mb/Ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t08LwIKXDBoOS8QeQ03H7bb3XBY5/DUyZkzDJ/EGCFDtC32rbKEC6BDxCdQpPVEOSVuyz8+O629Q4sYJzUCp4RpdXATFVORmpjshYnk8rN7oksm3Ai6qeus5jDFxPOcjElXB/YCcJ+xRUNaiPL0R6Pj4W2mJSO7PFlgu6K0ebvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UU+fmt/4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UU+fmt/4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7B96E1A36C7;
	Tue, 26 May 2026 14:57:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 506566073B;
	Tue, 26 May 2026 14:57:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C023108888D1;
	Tue, 26 May 2026 16:56:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807421; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iZVfwXti7mgN9Olb9lOr+m0/DhUZ8APrEW8sGpVUAYk=;
	b=UU+fmt/4GQ50P2IDxoAbpueD3idCqNLIRbvP31PhuXXkj9caJn4JnGbE6Z6VWA7dYtrnIv
	OIkGVG86xL6essWMcMQhueMhfRQT0hWejV7DXJ0djsv9KvDZEFSdmsSyEzaKNRb6+T/bkU
	KnExbWVfV5L4vxo2IktNdG9GIM4a02BYbEfKGPWd2lP8UhkSZZvbPh3rcB8rD8MrJHzgmI
	QfwP+TCOCohVZ8VXc1O/K6vND8Zyy+Jj+w+FrbmjluWHETk9icyqBcsmyv2PrBjtal2yRP
	2B8PALm/PfLE0BBTK0FBMySgf/4RBX0ozqHr5KfROm3rEM47Ud8C90iapsCGuQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:32 +0200
Subject: [PATCH v6 08/28] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-8-4092f1419f8f@bootlin.com>
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

Add more details about how these requests are actually handled in the
SPI NOR core. Their behaviour was not entirely clear to me at first, and
explaining them in plain English sounds the way to go.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
// Lock first 8 blocks
$ flash_lock -l /dev/mtd0 $((0 * $ss)) $((8 * $bps)); show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01ffffff |   locked | 8
 02000000-0fffffff | unlocked | 56
// Unlock exactly 4 blocks (doable)
$ flash_lock -u /dev/mtd0 $((4 * $ss)) $((10 * $bps)); show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00ffffff |   locked | 4
 01000000-0fffffff | unlocked | 60
$ flash_lock -l /dev/mtd0 $((0 * $ss)) $((8 * $bps)); show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01ffffff |   locked | 8
 02000000-0fffffff | unlocked | 56
// Unlock only 3 blocks (impossible) -> rounded up to 4 unlocked blocks
$ flash_lock -u /dev/mtd0 $((5 * $ss)) $((10 * $bps)); show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00ffffff |   locked | 4
 01000000-0fffffff | unlocked | 60
$ flash_lock -l /dev/mtd0 $((0 * $ss)) $((8 * $bps)); show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01ffffff |   locked | 8
 02000000-0fffffff | unlocked | 56
// Unlock 5 blocks (impossible) -> rounded up to 6 unlocked blocks
$ flash_lock -u /dev/mtd0 $((3 * $ss)) $((10 * $bps)); show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007fffff |   locked | 2
 00800000-0fffffff | unlocked | 62
---
 drivers/mtd/spi-nor/core.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index e838c40a2589..65bb4b5e1e2b 100644
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
+ * @unlock:	unlock a region of the SPI NOR, may unlock more than what is
+ *		requested.
+ * @is_locked:	check if a region of the SPI NOR is completely locked, returns
+ *		false otherwise. This feedback may be misleading because users
+ *		may get an "unlocked" status even though a subpart of the region
+ *		is effectively locked.
  */
 struct spi_nor_locking_ops {
 	int (*lock)(struct spi_nor *nor, loff_t ofs, u64 len);

-- 
2.53.0

