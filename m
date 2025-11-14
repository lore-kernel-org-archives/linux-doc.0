Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CA92C21F5
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 17:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142816; cv=none; b=kh21sRygzlzullbSMMnS0ONpoGcyfj/fRu51JDnh9IGbWkDGLlAmj644ptkj9vngnVPk2Bk+jOWpFq/6eboeOtP8YPNMXtKOjp5bFKrtQ/Yxf5Z8FQlg5JYKSWGJIPWTgQrcZjBvnjrEXC1FVTGSyH8IGhZmxKM5qFk83F6tf5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142816; c=relaxed/simple;
	bh=gV715r6YqJcYrCmNOUAIKmGnIHt5PDvCnZ9HEFK/2Uo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ewSWdaygMAqNk2gG+nkkZoLg7nSsv5gCZ37PwIYT0MvJDG351RXHJD74vafSCXi/aUuDB6FGFKaxiiswn2dlpW5C9GlvglKxncviQ8jV+HWxxkYkA8v0UPB9BNSDhqvRiTVGfirTgT2l7eftJqdsWALN8+C/520Ln7ycGADI0wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NxdxIImY; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NxdxIImY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6C7E2C10F6B;
	Fri, 14 Nov 2025 17:53:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3EB6A6060E;
	Fri, 14 Nov 2025 17:53:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF83F103719A2;
	Fri, 14 Nov 2025 18:53:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142812; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5mUcSqv3P/W3jSlGGCPFnQK+LV2h4hW5GViH5ccSRv8=;
	b=NxdxIImYIXzLKIYJyauyyWvqCpaMt9zJ3UXrzQYN+HJ9NK64/m77mfiGEEvyokwrFdt28n
	PNzz1oEHnXhaACmW4K2G1VpO4lD7oStnz9kkvOG7Bb6p0IWSaKBV5KsJ/zhbPEArkLzBuI
	m83aEC37wBc6oXoxz2BUcX5YriRZUlJrHb1nwI/G9B56cNTk5six3hv0TbZi9glI+uj0FX
	3MddfnTnZ0InuE+9+n4fYNFb8Amcqb7NOX2xbqehfB9TdgbdBkWigeScHg9WSvCBxqMpEu
	+xdKnQwE7CG4BaJhf7jKfF2ASDmK5yvBycbHR7ka9FmkuoDjZzqs3260+0rbIQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:08 +0100
Subject: [PATCH 07/19] mtd: spi-nor: swp: Clarify a comment
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-7-487bc7129931@bootlin.com>
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

The comment states that all power of two sizes are not supported. This
is very device dependent (based on the size), so modulate a bit the
sentence to make it more accurate.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index ede03f26de3c65ff53c1cb888c2c43aea268b85a..350fb8cd67dbafa3c62201c8c06bff7131143c04 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -298,7 +298,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
 			val = (val & ~SR_BP3) | SR_BP3_BIT6;
 
-		/* Some power-of-two sizes are not supported */
+		/* Some power-of-two sizes may not be supported */
 		if (val & ~mask)
 			return -EINVAL;
 	}

-- 
2.51.0

