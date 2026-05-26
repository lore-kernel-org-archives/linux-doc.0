Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FD042EEB0
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807446; cv=none; b=XhOOsjBIOP5Zu457zCZNYa57PNx8PzjwHGH8yeUXMe1kdnTE92Aj4y24AiAtEjeX04HCQog7P4RK5A3t+z3k0yLccFRKkO1SLcDvyLqDgngjsiiQeSEVt24gkya6g7dfN4yvc9+NmC9//K8OEf0C2pm1KFUirOmK0G/oMfe4uz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807446; c=relaxed/simple;
	bh=6fsrPKFTVTLzn61iSIw5w0LFM5QV9qDhtW2UO3Fad+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k5Ar7tG2Q23lraK067I5zHk3Ps4+IIntwygNekB3VN4JccTff/zuKrAJopykI3YTIn+95jijMAo2M1goOBqIfHTIiKXYC8h35X3HFkS7Ub2zKta8Usiye5hFxzxaxJv9vpG414zykH3ElXVizcGjMKWy9D+GYLEWfVp49VEAm8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HqDF2yxy; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HqDF2yxy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 914C1C79ABD;
	Tue, 26 May 2026 14:57:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32E3D6011D;
	Tue, 26 May 2026 14:57:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7DF8108888D1;
	Tue, 26 May 2026 16:57:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DN1Pts174hro/Hiy/GCURGd1BXMV+Wy/A7QaRm79HH0=;
	b=HqDF2yxy6yAwm9C9Q/xk7qV7FEJerqajFGNiFQEfZLRFllliuIUTpS80JF7aWJ3AAl7wwg
	qrM54JT6Iaj1esN+tjOTjR7PAxGBsDG+zZ6f0UlKXYBv3jmZu9oWUesn80+s4Zfv4957VJ
	c898ysxpqV+QL1324COg60Kq7E2oGj01QAvpM2wIOGUR1teARg9z9/Ikv9EigGjqRiHpIb
	4tMzzS2oyMqUdOVxQtJ+NhHGlC6eYUCI7rAIEC+TlLPwH83U6owGt5sQds24PoWp0WGztS
	ggH5OoZCfltd+9wtI12e4yXv9v+MISRQxVw4/CPpCXXrFcyOOmtWM7D5HwlvHw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:43 +0200
Subject: [PATCH v6 19/28] mtd: spi-nor: debugfs: Add a locked sectors map
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-19-4092f1419f8f@bootlin.com>
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
 drivers/mtd/spi-nor/debugfs.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 82df8ad4176c..0eedafb1b19a 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -191,6 +191,41 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(spi_nor_params);
 
+static int spi_nor_locked_sectors_map_show(struct seq_file *s, void *data)
+{
+	struct spi_nor *nor = s->private;
+	struct spi_nor_flash_parameter *params = nor->params;
+	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
+	unsigned int sector = 0;
+	u64 offset = 0;
+	bool locked;
+	int i;
+
+	seq_printf(s, "Locked sectors map (x: locked, .: unlocked, unit: %lldkiB)\n",
+		   min_prot_len / 1024);
+	while (offset < params->size) {
+		seq_printf(s, " 0x%08llx (#%5d): ", offset, sector);
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
@@ -276,6 +311,8 @@ void spi_nor_debugfs_register(struct spi_nor *nor)
 	debugfs_create_file("params", 0444, d, nor, &spi_nor_params_fops);
 	debugfs_create_file("capabilities", 0444, d, nor,
 			    &spi_nor_capabilities_fops);
+	if (spi_nor_has_default_locking_ops(nor))
+		debugfs_create_file("locked-sectors-map", 0444, d, nor, &spi_nor_locked_sectors_map_fops);
 }
 
 void spi_nor_debugfs_shutdown(void)

-- 
2.53.0

