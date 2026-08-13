Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53C9484250;
	Thu, 13 Aug 2026 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634372; cv=none; b=oXgBtTxAvyVBZawKOTHumO++8pQ6HELtXZAbMk5xsQ3UA/qEiKfvbsfFWF9nFFgKfqdfOsslqVRiy4xvm2F8OLKar90REXruWtT4JeuAZhJ29vcDiQ2Yw2KYytZQCL30MrpkvSxhK13f6L8W1O9r8RUsDhQ4G1joM3+Cmz+BOvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634372; c=relaxed/simple;
	bh=mysECAGIM4s6fPNHuYbGKhCpxhd7dzzcbCnK7cca2hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QIHEerZAuf5hMjk/O4/E9Bbh1udV7Tkp1mNG0zl5APS2dTBpgKlnAStsG5N5xBjhfmTEu48q2M3EGmlyq3HGNpTtj4nflwRYQVqfXkwxbj8XxWjSrb6hl239TzyGiNAcGW3wA2pPJJLaQL8dZ2I4EZWLe7+KcIsxe8HQoOUQAUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=o8i4O5w8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o8i4O5w8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 443981A1605;
	Thu, 13 Aug 2026 15:19:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18C26602B8;
	Thu, 13 Aug 2026 15:19:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38A6A11C4E068;
	Thu, 13 Aug 2026 17:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786634364; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tCkzLUO8jupK5Bfyyo1EzqUcURHcXok2YUcg3cdLeVA=;
	b=o8i4O5w88YorGD5OYE8FxiYma8y7rBWE5ZjH1+OTK0Nw3qhtj+nDZi4x9CrqTRB9YSm1hD
	pZmdItUj1ulCmncVUwX/5XicVUWR+OLnq/aHJal2ZaS7GsDZG+vc1yQcxAfnGmo9FOpJjF
	ydQ3imWmPCgInXkEf3cOmMvRYnht9IaUfFaQRIbi+wZ6S2d5xTzgwgbE1sE6RaBprnfCJL
	a/OiLONHoa4/u+8xBbkgnCN60YwTyjb8e1x3scTYjDhVCA8eyG5yWuSCUZOg+AvfwAvAkJ
	JUWLvdOMPZVQ7xav5CcGCha03uAeX/3pNzIjV9cxsbfcAOusvJK4UF2PtT2iWA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 17:19:01 +0200
Subject: [PATCH v3 01/23] mtd: spi-nor: Rename
 BFPT_DWORD15_QER_SR2_BIT1_BUGGY
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-1-b637cf120d5c@bootlin.com>
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

The _BUGGY suffix is not super accurate. There is a behavior that indeed
seems strange, but it is somewhat documented. The fact is, with this QER
field the status register is considered 16-bit wide and if one writes
the first 8 bits (SR1) without the next 8 bits (SR2) then the content of
SR2 will be assumed to be 0x00 and will be cleared.

Rename it BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR to align with the other
namings (_NO_RD) and clarify the meaning of this field.

No functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 2 +-
 drivers/mtd/spi-nor/sfdp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index cf0e2dc7c120..526763c79f55 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -567,7 +567,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		params->quad_enable = NULL;
 		break;
 
-	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
+	case BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR:
 		/*
 		 * Writing only one byte to the Status Register has the
 		 * side-effect of clearing Status Register 2.
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index f74a0eb339ea..d976c6c9a4ad 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -84,7 +84,7 @@ struct sfdp_bfpt {
  */
 #define BFPT_DWORD15_QER_MASK			GENMASK(22, 20)
 #define BFPT_DWORD15_QER_NONE			(0x0UL << 20) /* Micron */
-#define BFPT_DWORD15_QER_SR2_BIT1_BUGGY		(0x1UL << 20)
+#define BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR	(0x1UL << 20)
 #define BFPT_DWORD15_QER_SR1_BIT6		(0x2UL << 20) /* Macronix */
 #define BFPT_DWORD15_QER_SR2_BIT7		(0x3UL << 20)
 #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)

-- 
2.54.0

