Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E0D48988A
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 15:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634415; cv=none; b=iEsvxAgqsGrbBs1UXb+fXCrBYIAnzOhANWySM6tPKi//cADjSERq2BufVIVJJOUJaAjgB3mxAuH9ITT07/1Oyk1MUD+Kk4uXYOUGB/MLENGiGTyxBA0M7rGcZH2KM4f3HxYhlBYt68yuEYUOfkYh1bjJ99bSQmdN9dtM9qF7/+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634415; c=relaxed/simple;
	bh=FPBwK8AvwgJ673KNbiXtfrjFQJtwbiDlaa9oBc06zrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mmatii0xUnrgF44FjS5QC2igbEa3qIEnLcmWDJv8853D8ycdn0CIUG7URk5ONpP5e9WQCf24D9UweA1kUwUpHRYk5xUpKwXjvw/4Q025yD0FaVn71f/3Aeb0dIJfIIPXwk5Z84Iqea+lMYBudqbVgYLhKoyq7CuNz8gLRuOBOQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VaU3o9Tj; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VaU3o9Tj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E67391A15E8;
	Thu, 13 Aug 2026 15:20:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4007602B8;
	Thu, 13 Aug 2026 15:20:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40C5311C4E074;
	Thu, 13 Aug 2026 17:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786634406; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LOA0I4OIjSAj2IPm1iGUjZcRXwqyX2FFHo3g/tnp9uA=;
	b=VaU3o9Tj9vB0eQqDWkKb1gmPzfvOG8Y0qXTBJPTtIABJVi8ysZ3uh6HBn4AQt7xmEqaZ1R
	rrWxtqe/imxkUXgSe01UAd9dAT3us8IUNOhMk1gHkbuZr2ZNMv0jFd0rWEe0KQmCrxngbp
	TjO3UHEkPCfw9MsCJoysrV6dX2vIjNOPx8XRvgZRVhllax5mkoVtw/n2GGfljQ9F/hWeKL
	d36gEw4AeTISMUkyvZrwfsO/mabsQt3fPk1bsDnvMVbQjEuZL2aJnNzp/YKlj4+wdYXGJJ
	ivDBjoflnPV/UwDv57a9+1hJVVbcI8s+FXd4/mrOXt03z20I1wsh1fLAcdZSag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 17:19:08 +0200
Subject: [PATCH v3 08/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-Q/N parts
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-8-b637cf120d5c@bootlin.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

There is an ID collision between the JV and RV families. Both chips are
very similar in practice, it is mostly a matter of electrical
differences (mostly power consumption being lower).

As a significant difference, RV chips identify themselves as supporting
the new SFDP (rev F) field which forces an alternate write SR2 opcode
(0x31). They also do not require the multi-die fixups which must remain
assigned to the JV chips.

Finally, since they share the IDs but not the names, we must hide the
names using a fixup.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 56 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 583b1669270f..8c1cad9e21b4 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -146,6 +146,51 @@ static const struct spi_nor_fixups winbond_nor_multi_die_fixups = {
 	.post_sfdp = winbond_nor_multi_die_post_sfdp_fixups,
 };
 
+static int winbond_nor_partname_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/*
+	 * W25QxxRV parts re-use the JEDEC IDs of the JV family. Their name
+	 * being a legacy field, it is kept for the already established JV parts
+	 * but must not be exposed by the newer RV ones.
+	 */
+	nor->partname = NULL;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups winbond_nor_partname_fixups = {
+	.post_sfdp = winbond_nor_partname_post_sfdp_fixups,
+};
+
+static bool is_w25qxxrv(const struct spi_nor *nor)
+{
+	struct sfdp_header *sfdp_h = (struct sfdp_header *)nor->sfdp->dwords;
+
+	/*
+	 * W25QxxRV chips re-use the same ID as the W25QxxJV family.
+	 *
+	 * Chips are very similar, W25QxxRV brings mostly performance and power
+	 * consumption improvements. The RV family does not require the multi
+	 * die fixup.
+	 *
+	 * They can be distinguished based on their SFDP minor revision:
+	 * W25QxxJV:        JESD216A, minor revision == 05h
+	 * W25Q512/01/02JV: JESD216B, minor revision == 06h
+	 * W25QxxRV:        JESD216F, minor revision >= 0Ah
+	 */
+	return sfdp_h->minor >= SFDP_JESD216F_MINOR;
+}
+
+static bool winbond_jv_match(const struct spi_nor *nor)
+{
+	return !nor->sfdp || !is_w25qxxrv(nor);
+}
+
+static bool winbond_rv_match(const struct spi_nor *nor)
+{
+	return nor->sfdp && is_w25qxxrv(nor);
+}
+
 static const struct flash_info winbond_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xef, 0x30, 0x10),
@@ -552,9 +597,14 @@ static const struct spi_nor_fixup winbond_fixups[] = {
 	{ .fixups = &winbond_nor_fixups },
 	{ .id = SNOR_ID(0xef, 0x40, 0x18), .fixups = &w25q128_fixups },
 	{ .id = SNOR_ID(0xef, 0x40, 0x19), .fixups = &w25q256_fixups },
-	{ .id = SNOR_ID(0xef, 0x40, 0x21), .fixups = &winbond_nor_multi_die_fixups },
-	{ .id = SNOR_ID(0xef, 0x70, 0x21), .fixups = &winbond_nor_multi_die_fixups },
-	{ .id = SNOR_ID(0xef, 0x70, 0x22), .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x40), .match = winbond_rv_match,
+	  .fixups = &winbond_nor_partname_fixups },
+	{ .id = SNOR_ID(0xef, 0x40, 0x21), .match = winbond_jv_match,
+	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x70, 0x21), .match = winbond_jv_match,
+	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x70, 0x22), .match = winbond_jv_match,
+	  .fixups = &winbond_nor_multi_die_fixups },
 };
 
 const struct spi_nor_manufacturer spi_nor_winbond = {

-- 
2.54.0

