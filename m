Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE0D3A9620;
	Tue, 17 Mar 2026 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743076; cv=none; b=Jp/xqA0tj93XzQpEXXm7cC7bcPr81RJ+WKPbfwMRiMCHVyKKtxnmnEbf0rilD/MlV9U7/GfWrljKcIfZ1AcNMOalNWX2WZm5IDhUzr6dMH8HfgU8wFsL0FgamkKakyaeeH1h/ApcrZEflyxCQxJREWm8j2bbXfIBbL7I14enL5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743076; c=relaxed/simple;
	bh=wjIUXafk8VGGbnPY3Dsx9uPr5XXbqRZCmWlNeUX3WCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZ9stMIGUdU7HiY1H/OBPdY+KkrTlXswh0zSrvfHukRzmG6QTSFhjTg2CVpF/TajDMLTXOuT2ZqNiZC4PbNGsalGwwwET6YHMcRMy8tXDBiFAI0zDihi+W8CwCnt358xzG4WpQNULkqLpB1WipUG5zccekqD+l9AdaEwzr2qZZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eqArXNxl; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eqArXNxl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 46FA54E42629;
	Tue, 17 Mar 2026 10:24:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D77B5FC9A;
	Tue, 17 Mar 2026 10:24:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D309810450459;
	Tue, 17 Mar 2026 11:24:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773743073; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oqqmuaxM0JPFUFPYjxJGr40Kx4IWxVfbQQsEuyrgdv8=;
	b=eqArXNxlvSUirqG7WYzTJZP+wQBeFXCc8W2m/+Z9s8KRjGyQgqTAJ2KB37RTOmEG/4aPyF
	h0ZrROygWdEjQAXaiWN0IzdCvoQfz/LQSpKtBVFrA0HWSriJg30UPeenfpRyg71WaryuJf
	G0bwKlryHgfGbsKEY357O1YeuX9LtWSEJKD++XbVzENBpyy4QYZJ3I1V14Gsa9Og+LmBtm
	qg5j2oFMa7iZ2dcILDNBGu2OdDhCeaXxPCsAg2QjKpJmPYkmHI3t7vvEftaskF6S1P3bRP
	lrgrv4xFPY1TgrA6kKkU9GV7T0vs3mEG8f4tBvGjwZIPD1XmHA+Ow0fRCN1qow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 17 Mar 2026 11:24:15 +0100
Subject: [PATCH v3 12/27] mtd: spi-nor: swp: Create a TB intermediate
 variable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-12-2ca9ea4e7b9b@bootlin.com>
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

Ease the future reuse of the tb (Top/Bottom) boolean by creating an
intermediate variable.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 66f85826ba0d..f068cb9c8f6d 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -60,6 +60,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 bp, val = sr[0] & bp_mask;
+	bool tb = (nor->flags & SNOR_F_HAS_SR_TB) ? sr[0] & tb_mask : 0;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -79,7 +80,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 	if (*len > nor->params->size)
 		*len = nor->params->size;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB && sr[0] & tb_mask)
+	if (tb)
 		*ofs = 0;
 	else
 		*ofs = nor->params->size - *len;

-- 
2.51.1

