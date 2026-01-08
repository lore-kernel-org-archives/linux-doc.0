Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E4B2EAB83
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891536; cv=none; b=UVbfLWMaEV3xmeYpx+C5IRjSkmAnb5UcScpCqw7RnkMZWgLJxjKMKz4ikZRwHlUE3u2DtP4MWEftQ2dby65T8OeKFGxnZDwrPU+YmahZt8wgWP2n52VOHoCfGmN/vcluDw5cS4NBmT19MhQFM08PtKBI9c6/2bH0k/DxW7RrxX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891536; c=relaxed/simple;
	bh=fzE7Kbk6Kb/cBeCT1q00i3uy0oSMCu925oa9vdXVJ6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/kPm597h/pKvil456KxH9UclZpFGtCSSGyshkTpoSjBAsELqb8xYNy5irfPVf1SeWPzOfvcbVlqhZkpte2IX4sDVgM0PFyYgol708vnUyVieUfiQE2Jch4p5EXQfGEu8tqv2j9KvxUP9vYr2LJmyMKQClX15DO7Vc5HnQ3YVtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0oPjzBEY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0oPjzBEY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 98CA84E42000;
	Thu,  8 Jan 2026 16:58:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6C7176072B;
	Thu,  8 Jan 2026 16:58:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBFA6103C8811;
	Thu,  8 Jan 2026 17:58:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hXc+5kjs1EF92jBqcrTSRSedlWRYjsDeVRr6sDpavVg=;
	b=0oPjzBEYYewYJkniJdPwuCKWyuuaIrPAjnqWstVzJx6z8jS/FhpOUQYALTD/69NIvFUnYm
	wIVH7UkbVEWBtOV7l54/6B3UVGGLjtY7Vc9aMtNYUYJNTTC0O6xShyPgAWxpE2VY+7EBAg
	Rf4rYl08zaH398hbVSExB6JqkqqPbMDmXtGkcNbASFjulZy+uMfxSqdj7dbsYMydjO8taf
	/ftg1fCqfV+5+/6QRePKqL25cyR1Q3HJo44xCoL8vxdVpaaC2urbAE/xi8CGMum20gS164
	TOr6HfqHQ7WiJx4xvGzje3ycoAdIr7QNNV5IhdHOzyXqiqqjUxLt+LTxqZZCAA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:37 +0100
Subject: [PATCH v2 04/27] mtd: spi-nor: Improve opcodes documentation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-4-c462ef806130@bootlin.com>
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
2.51.1

