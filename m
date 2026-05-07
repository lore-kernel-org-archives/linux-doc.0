Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9394D4657E7;
	Thu,  7 May 2026 16:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172453; cv=none; b=MVAKB6mMBKtaKdUVhB70X1OS+bV5aUTix1XvpLyJdsugwGpMqJv8odvRlqr9QZdhFvb9LoB4NV5MaivaLJS48qJQZP074De8sa3OFN9kQORBuzRgIgeHJoV0+JULwDVinP0/VEvH4sSBTGWZHIgp7nNF4c0KyzXVRyEwZYloeuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172453; c=relaxed/simple;
	bh=e2cq/undjZq/vC72DJtcYS3u50cGNet/laObIOtB7LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6kMVCSuBJnQoW5kvvMpyuPLKCEyEMb2GBoKnRGi0UZZdzZFPH13zWwYoqlFh0DMfCMueUmD70dI8reucm0G1s2QPK+CrOA3BMkYtwzNyQSswqxks9wXNjLi6TEJ4wiM6O+v3dc53G/ysfdvCkX4TlT+k5jJCNzl+Wg2JxWChl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Pc9jQclB; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Pc9jQclB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 32C6B1A355C;
	Thu,  7 May 2026 16:47:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0804E605CF;
	Thu,  7 May 2026 16:47:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A91E9108194E2;
	Thu,  7 May 2026 18:47:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172449; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iwGbTupe2Sv2/8khMKd3KFO4mUilPJw1cS8ysgUxELs=;
	b=Pc9jQclBEMOBF8wSMbUXqJ55l5XJxfEockbAPu9x8qZTshD1DUeIZtJzNjzr/lxyJEQ2dg
	R0otcm5rS4+K0GGS6HKBmnOWgM52V07kzidzySRu5FuzHYecVXZPZ3hu5iQQhkRhTf1ULx
	A3lnBXzEuQp4qU2KswjeBUXmYyS1kZ+00vUjkGuhV71qUltsEIAFp2pivENlHq49fHsi0u
	acrN75MUOrzVhp62hwMZZRUInFdVeMx9H8DO1J9/oZn7aQQt0PvuzHffsl34BwSztuVokF
	qXBIBecSIwVyjQEPdjxoD2LSEziyTnpikMja/EA3YbP5fvHSDn3pXVd5XG3aiA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:47:00 +0200
Subject: [PATCH v5 19/28] mtd: spi-nor: debugfs: Add a locked sectors map
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-19-93453e1a9597@bootlin.com>
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

In order to get a very clear view of the sectors being locked, besides
the `params` output giving the ranges, we may want to see a proper map
of the sectors and for each of them, their status. Depending on the use
case, this map may be easier to parse by humans and gives a more acurate
feeling of the situation. At least myself, for the few locking-related
developments I recently went through, I found it very useful to get a
clearer mental model of what was locked/unlocked.

Here is an example of output:

$ cat /sys/kernel/debug/spi-nor/spi0.0/locked-sectors-map
Locked sectors map (x: locked, .: unlocked, unit: 64kiB)
 0x00000000 (#    0): ................ ................ ................ ................
 0x00400000 (#   64): ................ ................ ................ ................
 0x00800000 (#  128): ................ ................ ................ ................
 0x00c00000 (#  192): ................ ................ ................ ................
 0x01000000 (#  256): ................ ................ ................ ................
 0x01400000 (#  320): ................ ................ ................ ................
 0x01800000 (#  384): ................ ................ ................ ................
 0x01c00000 (#  448): ................ ................ ................ ................
 0x02000000 (#  512): ................ ................ ................ ................
 0x02400000 (#  576): ................ ................ ................ ................
 0x02800000 (#  640): ................ ................ ................ ................
 0x02c00000 (#  704): ................ ................ ................ ................
 0x03000000 (#  768): ................ ................ ................ ................
 0x03400000 (#  832): ................ ................ ................ ................
 0x03800000 (#  896): ................ ................ ................ ................
 0x03c00000 (#  960): ................ ................ ................ ..............xx

The output is wrapped at 64 sectors, spaces every 16 sectors are
improving the readability, every line starts by the first sector
offset (hex) and number (decimal).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 36ec35d6b2dc..a07e879bfa25 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -190,6 +190,40 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(spi_nor_params);
 
+static int spi_nor_locked_sectors_map_show(struct seq_file *s, void *data)
+{
+	struct spi_nor *nor = s->private;
+	struct spi_nor_flash_parameter *params = nor->params;
+	unsigned int min_prot_len = spi_nor_get_min_prot_length_sr(nor);
+	unsigned int offset = 0, sector = 0;
+	bool locked;
+	int i;
+
+	seq_printf(s, "Locked sectors map (x: locked, .: unlocked, unit: %dkiB)\n",
+		   min_prot_len / 1024);
+	while (offset < params->size) {
+		seq_printf(s, " 0x%08x (#%5d): ", offset, sector);
+		for (i = 0; i < 64 && offset < params->size; i++) {
+			locked = spi_nor_is_locked_sr(nor, offset, min_prot_len,
+						      nor->dfs_sr_cache);
+			if (locked)
+				seq_puts(s, "x");
+			else
+				seq_puts(s, ".");
+
+			if (((i + 1) % 16) == 0)
+				seq_puts(s, " ");
+
+			offset += min_prot_len;
+			sector++;
+		}
+		seq_puts(s, "\n");
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(spi_nor_locked_sectors_map);
+
 static void spi_nor_print_read_cmd(struct seq_file *s, u32 cap,
 				   struct spi_nor_read_command *cmd)
 {
@@ -275,6 +309,8 @@ void spi_nor_debugfs_register(struct spi_nor *nor)
 	debugfs_create_file("params", 0444, d, nor, &spi_nor_params_fops);
 	debugfs_create_file("capabilities", 0444, d, nor,
 			    &spi_nor_capabilities_fops);
+	if (spi_nor_has_default_locking_ops(nor))
+		debugfs_create_file("locked-sectors-map", 0444, d, nor, &spi_nor_locked_sectors_map_fops);
 }
 
 void spi_nor_debugfs_shutdown(void)

-- 
2.53.0

