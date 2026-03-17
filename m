Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8210A3A7842;
	Tue, 17 Mar 2026 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743070; cv=none; b=K3i0VvEr3hjDQtwUggUXLFrTLZPSlHDLZGICG65yyEDYoGzXLPHuCXP3zVXihyEyCijCt72DuUakJnsO7pA5YpgHHWj4Fb4oDfnKfCLeJY+pa4hB8wi/MD55xf2LtaBxuoUPxsvaUJd8FxkS8eJpS5251JOyIaZAHxDUdGwELDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743070; c=relaxed/simple;
	bh=iCfiMsUjEbvsR4lM+7YoHewMae65PTUZGwPNuWcvBuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m6XqUQiQbm9YN/WmWtmPOa+G2FJKX1v9dLOyk/vPhqbrG1ATtNSy7a0hioWlKwb9G0Lke6KFpNcNn2d3ZU7MxJmuesV/a0u3q9FxmmNyNI5ZhHZYmx2ak2WFjK8BIPqHpRE/XuiD1S3UIWGKrgGjjmYbHMps3PJGEg7ZGbpi/ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aKDR/eCH; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aKDR/eCH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2AABBC5505A;
	Tue, 17 Mar 2026 10:24:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F2EE5FC9A;
	Tue, 17 Mar 2026 10:24:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 318B010450453;
	Tue, 17 Mar 2026 11:24:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773743066; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KPr75/L7Q2MSPflmaco7Z/uPl6GqRaTpWsWBClHqZT8=;
	b=aKDR/eCHncmkAJZvKx0YEaEnKk8we87xPMAxoQjzi3jsqrWzgSRr6gJHsTlB9OHfR11Lbp
	FKMLvOcvxEfeDXSJ7hXtcgyOALT1oC0E4kHkbbzUhFAW7sMfBazUYfI9Z9MYU7MZwJJX7y
	GCqDOe+BEUTpm5hGuFqDzzTHMcxW8FuIbYEusInoMT5xx68teNGYc0j8hRF/gzTcK5Hbs4
	mjCX6NhXvF5Ikkd2/o10xNYgtlTf/Gk+DLopDY+52ERuMLMSy1Non44tmjFhPIFGSoJ5wx
	5IcC9GpkN5AsSpqVsZJXHSSJ8p7yoK7ZNfi0PiFnbhoeZ+ZPvgXi9Q9iWBpIfw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 17 Mar 2026 11:24:11 +0100
Subject: [PATCH v3 08/27] mtd: spi-nor: swp: Clarify a comment
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-8-2ca9ea4e7b9b@bootlin.com>
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

The comment states that some power of two sizes are not supported. This
is very device dependent (based on the size), so modulate a bit the
sentence to make it more accurate.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 64a917543928..246f6d5ca8dd 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -303,7 +303,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
 			val = (val & ~SR_BP3) | SR_BP3_BIT6;
 
-		/* Some power-of-two sizes are not supported */
+		/* Some power-of-two sizes may not be supported */
 		if (val & ~mask)
 			return -EINVAL;
 	}

-- 
2.51.1

