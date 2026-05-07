Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D3247AF63;
	Thu,  7 May 2026 16:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172440; cv=none; b=bWFGV4fO7mKO47nWlmVkQijdvnTlwwT7JuqF14nkzO7fwX2JVImjWmaVlJsaNqZBChzqXGj//gxFrJPDrGR52RS8lzuzqHWYJpRw2wLZQtKJWHidxUFMtqpJNKsco0TNjPZM7tvAtUdyNYeawwKON2ZLvuByUvEt29/95y4SJls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172440; c=relaxed/simple;
	bh=+X0RS3VotDhmy3wtE0Jz/NogtCZ7bmj7xOsMDCTqNio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNlss866VDJIIenv5jys0Lz2tkz5+gnn9DtrKt2D0YS5pT7Z266Pkn2z2LLgx9ItsO09ee7y5WLP05Ruecak7PrCRL9GllI8rR+ssa8RuZdqy0sD2wSJ7OumN641suwURL9KzPEOtpDMRa9w4FNTBGB9fMiYKkMXzVZVgxYOo+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l+UE8hBc; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l+UE8hBc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2EB9E4E42C36;
	Thu,  7 May 2026 16:47:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F06B1605CF;
	Thu,  7 May 2026 16:47:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1312108194ED;
	Thu,  7 May 2026 18:47:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4eOxwXGdBa/N/cxA091GkSGGYkj0VIM36RQVYQqTbRQ=;
	b=l+UE8hBcMGi3FM8BUtc/M1k87L24nSswk0WyIBHYlmRgnUYKES/RW7AEUFnZaL8wTbbh9i
	G1ZyQw8RwYp89ka2H9wz2bFf0725Rzh1tn0TgBzQ/RcLBB+n2+1E96XSOsWi+QHmIs49OE
	ZzI+GErt4zl7CSusb9TEXVaUs/KxNNCLkiUzkDdfY1QSvmhAkztJO7Y+hNgFH8PzYR65lH
	FMQPnZ+SOBlUXgzBF1YmwAGCCTMPQSS/hly2D7M45yR3/F96eKfrMljRbG5w6TmAx2qS9k
	KwJm5YoXay5k56kx5F/I/+arIjpb0pMxBz8ODrhnTxuz5AUKxZ5KOWQx0zQ48w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:46:54 +0200
Subject: [PATCH v5 13/28] mtd: spi-nor: swp: Create a TB intermediate
 variable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-13-93453e1a9597@bootlin.com>
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

Ease the future reuse of the tb (Top/Bottom) boolean by creating an
intermediate variable.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 07269e09370a..540cd221c455 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -62,6 +62,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 bp, val = sr[0] & bp_mask;
+	bool tb = (nor->flags & SNOR_F_HAS_SR_TB) ? sr[0] & tb_mask : 0;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -81,7 +82,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 	if (*len > nor->params->size)
 		*len = nor->params->size;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB && sr[0] & tb_mask)
+	if (tb)
 		*ofs = 0;
 	else
 		*ofs = nor->params->size - *len;

-- 
2.53.0

