Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1C53CD8B0
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 16:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775232580; cv=none; b=WtozQuS40Og8X8xnuFN6QfhYmsrFz7LcXgi4V/2csnE6U4QQeEL25pzCZxAqR72USJ9J6ZT0pnkSL0qLfVlO8VStGZCKKGgKXh+jDGcXmKZO2MvFDxcUvC8vHCgNPTh19pxBV0ZbOcZM93HSa8NcjJfloeuXf22PK7BEbZ/EgXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775232580; c=relaxed/simple;
	bh=wTTB6e/8ePxI86D4Nfy1cUgRHfcwns176A2TR63+Vjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PZ4d36iOoAToikK/RTLTSB47ZbebZhAMxloP83oQnDAEQVi543ucEg+YrcXLHgSmZBQnNOkwn4he6p/qOYfLUCOoi0ngqfGjHLOtTsAKzfhSwLapO5LjytGX7NO9Vt84lmI6N5yID/G9D9b+MibVsoeXp18ctxk3FloQPHLAQEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Hn4h7qIM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Hn4h7qIM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AE6CB4E428D5;
	Fri,  3 Apr 2026 16:09:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7CE46603C1;
	Fri,  3 Apr 2026 16:09:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EDFF104500FB;
	Fri,  3 Apr 2026 18:09:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=leC2dd2KClzTPcQ+8AI037xoM94Wj2JcMmNh8kB3Pi8=;
	b=Hn4h7qIM4fJSHsGqMHx5JY8OqoBGLRKnqcJvlZopGP+HUvWSPk+5wKvKSgPr2E/5Uvg4Ax
	Q8uAUayCOe7YAnuqfmI+o4y0gnSD5fIQwjE/aBOMa2Z9wqFpkPh2gTavoc3kCqYJd6EkPD
	Su0lLda10KhbJ6wQmZYR/tLoQIWeuh+JVfekdpPK6G1a7cjbRwaVv7vloQ+6xZK+cPaxOE
	pQN21+xK94Vw9DiJJsA0rXZ9/An1Hy6KNpClW3H0el0SQ5NzDnULNOqttbESydTRAxYdB0
	5YhDudGOqNJSuXSGhWOjRQxBcOR3Qz0CjwBdgfyyqS9zsC3IPF+Fsu9zHhUq3w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:19 +0200
Subject: [PATCH v4 01/27] mtd: spi-nor: Drop duplicate Kconfig dependency
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-1-833dab5e7288@bootlin.com>
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I do not think the MTD dependency is needed twice. This is likely a
duplicate coming from a former rebase when the spi-nor core got cleaned
up a while ago. Remove the extra line.

Fixes: b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 24cd25de2b8b..fd05a24d64a9 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig MTD_SPI_NOR
 	tristate "SPI NOR device support"
-	depends on MTD
 	depends on MTD && SPI_MASTER
 	select SPI_MEM
 	help

-- 
2.53.0

