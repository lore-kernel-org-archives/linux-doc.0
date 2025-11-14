Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FF6345CBB
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 17:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142810; cv=none; b=DHziX9jDF84dQoe4g11B54/ED3KU2PxjpopKo8+27PJ8EDKto9GTM9hEGtfdtjb1ho/woo21+ZwD/4nKUu2KmfhWEDuXZLiZHb5Yus31ugHlQ97jED+4sUcw4od6FNuoV/vGlZrYlSm5LP0MioCyErOAXKtsb7TkmDXSk68/174=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142810; c=relaxed/simple;
	bh=IPyUG7oq6iDPNgeslqpaMnFaKHeSNmdqijlVlD2adRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EygqgnVkXyaI0NRPN0EJxjY2dAQFG/2/K9dJJaeTVmI8o2M8sd3ywj6g1nEtjImcv2kjMexQsMx/hq77Duu8euKuHTBvAiqmQeDOMCRrNSidHB9P5SMyqfc1xdFvV9o2gbJW81bCs5BfHy69QXsovGhPQiRv3jAsHJcvjswDOrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lNkZKijA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lNkZKijA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7FF2F4E416B9;
	Fri, 14 Nov 2025 17:53:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 562706060E;
	Fri, 14 Nov 2025 17:53:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D892C10371986;
	Fri, 14 Nov 2025 18:53:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142805; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=42hw/B5DdDI6uBv7bRhjZ4jC840Rczimu4YvQRSXKI4=;
	b=lNkZKijAJo8o/1JdKv3xq7D8BdyjPFIEEt+V5ESTnQU3QXwKuuzt8F8hQP6nqC4Pwk3QIU
	Wc6Nn9Inai+MPcyRP1GsD+Vg6z6V0mBX5D252uAKTXcohELUiQE7H1J/ehzRQbgfFiC7sS
	/CkCUcAJMCzH4PDbys+GsbBetbKH0K9HxD4o1Jk2tCvhp9RuURKqkOjF+SqUhDn0N8LU7w
	ahld5QAYx7nOIAEBPJMDxzvZXx00zgE38LZNSl30RV2duKL1Gq/yJR337iG6FBLu6h58zI
	3l0Dr645W2ttRcHEc0/TjvZlZvkHwr6g/qmZm+/7IueY0LmWHBQFnCQxRHsTbQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:04 +0100
Subject: [PATCH 03/19] mtd: spi-nor: Improve opcodes documentation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-3-487bc7129931@bootlin.com>
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

There are two status registers, named 1 and 2, all the opcodes imply a 1
byte access. Make it clear by aligning all comments on the same pattern,
for the four "{read,write} status {1,2} registers" definitions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spi-nor.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index cdcfe0fd2e7d624bbb66fefcb87823bce300268e..90a0cf58351295c63baea4f064b49b7390337d37 100644
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
2.51.0

