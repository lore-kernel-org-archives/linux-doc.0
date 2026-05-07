Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56244611E1;
	Thu,  7 May 2026 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172427; cv=none; b=VZrNwTPUckD6nmBr0MNzyOMuAC+bglTc1Xo+YPNdU8JXqgu6Vi4+Bexh8/D0CzA/3S1IhGSltPsIOJk6sOkxt0wa9I+7Ws+C3kmlCM6zJu6urOmEnsipzQT04l3hgJOuYiJUYF2mXm1ecQT5Ee67utRwjAHjQX3yHoR3PemF4Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172427; c=relaxed/simple;
	bh=yZMj00763w8r8wUBQCaUh5FU4u4u6hQXAxOsrUapcsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rX6iXSw2CyKAw4tekNVOME6u7uVGYmPQc5cAxGonCxvatoJAYJXUwkkaYBmU5JO6BA0z9AJ6H8rmmskzHiok9BcEusfmMWGG/QArdxGHr+aQqV0A0mDn6XAnSw7FCwsAkrzJYKd6dIVArj7UocnNgAmEczieSxsuSHjuoWxXW1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=z7JxekzV; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="z7JxekzV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 93335C5DC60;
	Thu,  7 May 2026 16:47:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9736605CF;
	Thu,  7 May 2026 16:47:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2C13108194E4;
	Thu,  7 May 2026 18:47:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172424; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qqYr/KNjLLcJYcEfDklSWHxXQ8BxYrzb3yZHrjztITk=;
	b=z7JxekzVYYgvMD6dwC4xpwKWui7d/me0mDpO95yr/WyHq4RKZJWsDdQiVlyLV7UIA349K2
	G/ICWObZvpMyYv6BvNdwPq+/qExbD0xsmv/BMt95jqr97YCrPDwi19Tm3zbsn1MFzUY2Wo
	WcNeMfdGHLiKakZCGfa+RwiGaL2BaqSA68V+K/Ui6TuzMxp0rIyjC0xjtAW0i6oFefE0Y+
	n8Ocz3RaljqQlTdhoC7TRC6JywVPpiMnjVwtUn8uhMWMGd8J1HIUDbdMBo0inRHaQwLI6z
	qcUGL9s3od7owSMExnEi24ZRmXPeehcd7RXGxzQH2TiFHGl27OlORZ63NTPCjg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:46:46 +0200
Subject: [PATCH v5 05/28] mtd: spi-nor: Improve opcodes documentation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-5-93453e1a9597@bootlin.com>
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

