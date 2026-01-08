Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC0D2DB7BC
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891530; cv=none; b=qt3CnZPfxVYZbAgxfOqDzs0xZJFt4UXV6LAdGIVWMAMVf59xugFxm+jCP67RdpZLBtdRuxDXOkbKJ+H/7ZFDuX52sX3TEqynAtqSW7cls3JKb0Paz5w3P43loejX3ZX1wtnL3HK9GPVZzyZOKber/cPovDeh4zGvSKqDt9pBR7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891530; c=relaxed/simple;
	bh=pDZb0epMDwk6MJdaiEIqcDJe8cxs9bBHkhWkqeoeHyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJFBeIhcG/HkHHmv3qJ9V3A1RZFRoi1dNlPilHSk70goRtHmGfyOUdUJbbsgvj3Lo6LVlzqi5Nt2MJ1DqxzEuwtbBurn1Q1BE6s3M2qJKOkQJNt9JuER1E8dUy/30Nlt3NY9c6utptlM/cTGqTx01mMpYNZ/+/3nxV0xvtVe08s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gqtQnL2O; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gqtQnL2O"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D72DB4E42005;
	Thu,  8 Jan 2026 16:58:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB1726072B;
	Thu,  8 Jan 2026 16:58:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6CA6103C86ED;
	Thu,  8 Jan 2026 17:58:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891526; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=stZFrqO/Xzy7EKE+3DmnORMCs6+d8LeG2HLgrVddfK8=;
	b=gqtQnL2OsdXjNBE3M9/quf5kgyFJI+wHYRhHS4X87X5BdpzOWU2QntXQxPTTfkcgMvgPaV
	cR88U1jJxTHYyfS6poHH1RfMxWnDHfKPR6Mgm2lGDMbYg1vEiZizGk6JWHtCAhk0D40n4F
	cpEU2DRS+obfm/uqu09+mCDv8kSIMneYX+CHCXiGquQ3Nkqd5M3OUiGw6ZIoFcl9y/Naqm
	1HFcuTwFrGjgVrIB+rwwXqy1LQlfCyj/yo4GgfUf6L6Wv02UwcyjQVrHfd8vYcQ9nuu9AQ
	hJi8oNaTUwn6kjzBPcaEQFcCXXrCmijUE0dpUpIb9FUK/HmrbyMlH27i5cj1Rw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:35 +0100
Subject: [PATCH v2 02/27] mtd: spi-nor: debugfs: Fix the flags list
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-2-c462ef806130@bootlin.com>
References: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
In-Reply-To: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
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
2.51.1

