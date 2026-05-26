Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF80423A80
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807419; cv=none; b=H8hBqXWUvcZMyDHAWBSC7wVyGYl0twyJlaPEz2YJpNEIyqmRs+sWonjBeC1fXI0DCN10OIFbvKNztkLcobKqEQ5AacQl2vuxKc5LEbFvdKs5YbS7giWpJ0wjS4RfpJMP4mqSHz6EQ4XslzIiv0/NJ+oaSd1Hke0xF84awQUJmQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807419; c=relaxed/simple;
	bh=yZMj00763w8r8wUBQCaUh5FU4u4u6hQXAxOsrUapcsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H3rstvR3eAhM8qd8HLSAl8Q64KJwyvNxaUJD/gHXlp2BYGhRC+oxnIkbJvy/l92gup6K2omR1uehrVUtDzlZrbtlU1gJsFD7cJUpv9DZqxnte/RECi0LgOd6COchF1RSq6Zh2pTj4pmu0OT58vn0f68+IJMKHuoRtpm/xohwiyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=taMSkYL1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="taMSkYL1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1F5811A363F;
	Tue, 26 May 2026 14:56:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7A736011D;
	Tue, 26 May 2026 14:56:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21FAF10888865;
	Tue, 26 May 2026 16:56:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807414; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qqYr/KNjLLcJYcEfDklSWHxXQ8BxYrzb3yZHrjztITk=;
	b=taMSkYL1qDlgk/etW3dTvKeRxvvxhLDqAk7HyQixY9VkKLLXBQqUp9D7GWUbMhlvUiTzzT
	s2sjwhSD8aNLtNfLAcSFsl4NPlpbT3EJ1iqFYcoFmx6XnOxT1kNZ1MybfU3Lrymh+3nCjX
	l33FYmzYCOgdCVlpVgqszWxMW8+OteQ4yqDB/jr4kEsXCVcdm2GJJeKDRHTZkcUfbtQyI/
	f3ggsb0ra1diVRGqN5df+M8yMGTUKQYNhfTZqiBGeNbBKbepCi4e6wkAGhu5ih8Eev6XGa
	EC3DqNFDJ4ZpFOUgbyAv7hGnZkivjx3ncbqjKZh6ZBL3O0+uVEGG1NgNdjhEsA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:29 +0200
Subject: [PATCH v6 05/28] mtd: spi-nor: Improve opcodes documentation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-5-4092f1419f8f@bootlin.com>
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

There are two status registers, named 1 and 2. The current wording is
misleading as "1" may refer to the status register ID as well as the
number of bytes required (which, in this case can be 1 or 2).

Clarify the comments by aligning them on the same pattern:
"{read,write} status {1,2} register"

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spi-nor.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index cdcfe0fd2e7d..90a0cf583512 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -21,8 +21,8 @@
 /* Flash opcodes. */
 #define SPINOR_OP_WRDI		0x04	/* Write disable */
 #define SPINOR_OP_WREN		0x06	/* Write enable */
-#define SPINOR_OP_RDSR		0x05	/* Read status register */
-#define SPINOR_OP_WRSR		0x01	/* Write status register 1 byte */
+#define SPINOR_OP_RDSR		0x05	/* Read status register 1 */
+#define SPINOR_OP_WRSR		0x01	/* Write status register 1 */
 #define SPINOR_OP_RDSR2		0x3f	/* Read status register 2 */
 #define SPINOR_OP_WRSR2		0x3e	/* Write status register 2 */
 #define SPINOR_OP_READ		0x03	/* Read data bytes (low frequency) */

-- 
2.53.0

