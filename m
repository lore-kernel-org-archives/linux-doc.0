Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74D240F8D0;
	Tue, 26 May 2026 14:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807427; cv=none; b=LSbVO6huSJ6pFG1apmtoLQEUVlP+7UFSVcH0JPqfuvD3NeP07X9krWIIu/VHHbrXcyjAHnzWZuoiE+IokxnYvTmQF6UGURzgsABG71yIgnJQYWBnyyWDnD4R5qFZjFPLLdKq2alQbnaWoERYTWgAs2VqNWw5ttHQ+M0mimPRzoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807427; c=relaxed/simple;
	bh=0NhpwtjvcZHlnaL3JDUzc3McoMBysNY2GxrJ+BRuGDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYPg8k9S2DAfATlw3fuNbUClBzeFUdikPRgskEiXVf/3NY6dOMJTBgOyQIyCrYA9CUc3oYoV0ganghtAbW/G8kJLd6TzoudMG5+0fHUYQK0F4Zs3gDXvLIHdjzN3IP2S+yjZS6YjWZZzrvJk/Ba/sXB8ueh5lJ/Ll4Dsw3ohtjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TYFWBBrg; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TYFWBBrg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 94F6C1A363F;
	Tue, 26 May 2026 14:57:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64C3C6073E;
	Tue, 26 May 2026 14:57:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8A22108888D5;
	Tue, 26 May 2026 16:57:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6W7hkrB9Ol3hQ/s59VqFJffbxfuvvEc6vOXwL3BRK50=;
	b=TYFWBBrgBtB3JeLDOHyxu7jzI2Pdr2hO6M52WaznlBaq4tJXvzdFcIiLTif/Sznd4oakEV
	VpkYtaLKqAE44/SewR4guIZ+ajxVGZB+0d/wwW+8Bb7MsJa8AOZAWGrkP0Bg0OJuM400Qg
	N0LVLywE3tEMM3ERa3GCv9gsqEuBzVTDVgdH44f9WrJzl1xL2gYAeCs9OFI8pBrLY2+Ip/
	P/p42GgeOvusFO/6MZlhGlslG8HYSo8dV89ugZTFSFLZRpPyhVYucOP3BxbbMvm4IuSy1r
	sS+NQXwrJ9zyhgQsFsKP85zDPH31qFIXVEK6LXNZ3/Stm5a4dzj33L95OSfFYg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:33 +0200
Subject: [PATCH v6 09/28] mtd: spi-nor: swp: Clarify a comment
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-9-4092f1419f8f@bootlin.com>
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

The comment states that some power of two sizes are not supported. This
is very device dependent (based on the size), so modulate a bit the
sentence to make it more accurate.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index d5f4bf555cfc..f221d6361b57 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -305,7 +305,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
 			val = (val & ~SR_BP3) | SR_BP3_BIT6;
 
-		/* Some power-of-two sizes are not supported */
+		/* Some power-of-two sizes may not be supported */
 		if (val & ~mask)
 			return -EINVAL;
 	}

-- 
2.53.0

