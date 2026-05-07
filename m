Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC2044E043
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 16:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172424; cv=none; b=SvpWTXcObMU7vFSZg248dGSb5ouraF4Oq2TyHwW9U6GAapzSDtduaVTTzmHX2UKNykv4+s7njCDib1d8dwxSEVsqsRoIrHDBMUbCnesYQZU/zYRRVXqCIbMhj6z9YxZg3rmQDxZdclOg12doOI0IVKtgq9xEO4WoNnKArpA+TnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172424; c=relaxed/simple;
	bh=TFb7Rh2PuE/3ceANqlCf3EuJxNoo8eZQMz7YT/aYL5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CKjy8Ry/n5oUrI4h6e6qWgyMzOEx1mKc5kFQ5m+eVqkvuG+PUkJ7hgld0JcMpPWNYaWVZd5XsgPAHUVumPVTyIFI3k6Vwc1hPIjIxUXfX4ULL4bDfj3BFygyYnliWDUW9fvLviigg7nKx3k+rbuMhuDfSLOWhKD2dBAs4FFU2Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dcXqUxO2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dcXqUxO2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8B0501A356B;
	Thu,  7 May 2026 16:47:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59213605CF;
	Thu,  7 May 2026 16:47:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4514F108194A8;
	Thu,  7 May 2026 18:46:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172420; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r/I8HpmdlgiZEDA4JzntxIQZil5h8OVsqG1FV3N20+g=;
	b=dcXqUxO2tgoi2qQeatUweuEc3whB+18tPx9IUiJ/OnXR7WUd12k/11SZ2tHzoW6Waq9lqo
	qn/+d6PfFZnHekXaAqy2nl2SC+9Snr6iOHT0EV1Hoho+L1i0OndrLaf136lD6y22VB+AGM
	N9+m2za0qwGZSgAFAx3Et6nYfMLZ1dm9g0cDFqOjLYqVOciCCg8WIt1wWBucVyCQTfA3Ct
	ymk7iysyd6aHVle/0N+5Z7zRdUsMW0iCF+dnqzWr5bs/CD5qJQnJyvhhi9bJbfNMXf00L/
	VNpOvJKPHtIkiCV46EeBds4b/iSHkJ42kO8uZX++PfGbOcwWaUY9JXz55aHQaA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:46:44 +0200
Subject: [PATCH v5 03/28] mtd: spi-nor: Make sure the QE bit is kept
 enabled if useful
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-3-93453e1a9597@bootlin.com>
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

Not all chips implement the 4BAIT table which typically indicates the
program capability, while many of them do implement the relevant SFDP
parts indicating the read capabilities. In such a situation, programs
can happen in single mode (1-1-1) and reads in quad mode (1-1-4 or
1-4-4). For the reads to work in such condition, the QE bit must be set.
In case we later use the spi_nor_write_16bit_sr_and_check() helper with
a chip with such configuration, the QE bit would get incorrectly
cleared.

Make sure this doesn't happen by keeping the QE bit under a simpler
condition:
- the quad enable hook is there (no change)
- and at least one of the two protocols is based on quad I/O cycles

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5dd0b3cb5250..394c27de02d6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -869,8 +869,8 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
 		ret = spi_nor_read_cr(nor, &sr_cr[1]);
 		if (ret)
 			return ret;
-	} else if (spi_nor_get_protocol_width(nor->read_proto) == 4 &&
-		   spi_nor_get_protocol_width(nor->write_proto) == 4 &&
+	} else if ((spi_nor_get_protocol_width(nor->read_proto) == 4 ||
+		    spi_nor_get_protocol_width(nor->write_proto) == 4) &&
 		   nor->params->quad_enable) {
 		/*
 		 * If the Status Register 2 Read command (35h) is not

-- 
2.53.0

