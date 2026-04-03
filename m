Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1813CFF60
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 16:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775232583; cv=none; b=VXcJmLWUhW2z3tkCdA1M0jYqqydRulHdaKaHfIOVmoHreIfn7LA7nWz8t+iAZa35tT7EiO+wcBaut0ZvpyXbC9/KWcDsXgHx+thPkk/uhANY82gQJKa7DYMmqZl8YM8LtH1+cy2HwlFI4Brf1IcfYQ2cMK9V809SjGxiXE615rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775232583; c=relaxed/simple;
	bh=FUqMuwPe/VeYULAiVeahm1trZi1oXESB2z3mCxIRzWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lhl3EJcw5YqWjdseg6NPTlt/PBaBfh9Jg8+29tin+RCX45M2FfNU20XhLCTSfnyQbmI9qkjApNfbUHftWdKHcnrn5eCdmB1N3y8ciqphR3jZ0EfVpdrfDibNiB6YrC7kt3m8FXrHKEJgT822ZYbsWjtURmnwcFAToCTxRmeuzyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ain+qWEc; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ain+qWEc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5DDE3C59F65
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 16:10:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61187603C1;
	Fri,  3 Apr 2026 16:09:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2290110450102;
	Fri,  3 Apr 2026 18:09:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232579; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p/VrR2zWyEuP7FnbthxkSprPO27GGH7TRyCzje2SKqM=;
	b=Ain+qWEcyhuuX+PCskNbms0GFrH6Fa6gXs37+OO6mzb0XsoVcZZYNGydKLDbaaGKkPP/g4
	ml9KZiGns3hIF3CEpI0jpRV9JIxRA7qvByxPx9Mwy/o5zIGdwNEF2SBM0QrfluQZCt7Ple
	xE/pivzaNzOiN8Fp2h4zEvg3NsVRbPk/cRxcTXy3i2bfYQv7/m7Vu3ailzz/VeVq6plx4Y
	MplF8QC7Ol5LHj6N+2jgfWmqwHvwB3rLeNqVdXyvD17oJx6MDaD/MqjHBX2mArmJnYm6gQ
	i0IxqsIEesk+pyNXnm6kkAo9Rlz4bPscweTG18Wsz0uH6aHIaDZkJQYXIPZlAw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:20 +0200
Subject: [PATCH v4 02/27] mtd: spi-nor: debugfs: Fix the flags list
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-2-833dab5e7288@bootlin.com>
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

As mentioned above the spi_nor_option_flags enumeration in core.h, this
list should be kept in sync with the one in the core.

Add the missing flag.

Fixes: 6a42bc97ccda ("mtd: spi-nor: core: Allow specifying the byte order in Octal DTR mode")
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index fa6956144d2e..d700e0b27182 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -28,6 +28,7 @@ static const char *const snor_f_names[] = {
 	SNOR_F_NAME(RWW),
 	SNOR_F_NAME(ECC),
 	SNOR_F_NAME(NO_WP),
+	SNOR_F_NAME(SWAP16),
 };
 #undef SNOR_F_NAME
 

-- 
2.53.0

