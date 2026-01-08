Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD06329E4E
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891569; cv=none; b=QCThyOViANh+kzcZAbqKLcoaRR0ONlHA2mMaXn7j4vN99ao+dIxh67mhsaXy2bjwrfzLWpxSDwzG52TF9j1aStuykWN36nWkaQEYw5W9nPFfG708+F5wb2lERB1pOUXr5Bes8c9SXVu4hh6GlLVuwN1S/YwdSz2/vJzNbqpED8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891569; c=relaxed/simple;
	bh=Ld59UxSEo/UsBCpweXeilf08DZY2sXsNZ/uX7VY4k7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BT3qITpwQL96HZFr+2cFZs/iMHBNJ+VQTBCxDjCYINe6f2CLMHiVKHlIEMYQkgmzmU2Ko0rsvwEzZs2ocOanmy/4sYEVA0vjDLxpaVoz9lRIbFdC9qP4Nk2CPVmZYlGHFGIarHsNrnbMBtYn3wKb313vjwJShOcMzdCMfjFSGw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D4K5Kg9n; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D4K5Kg9n"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F3AB1C1F6C4;
	Thu,  8 Jan 2026 16:59:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35D556072B;
	Thu,  8 Jan 2026 16:59:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4CABC103C88BF;
	Thu,  8 Jan 2026 17:59:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b9DhezCPS05cjlNZjYeTSMYdKUnSbfB8ozmwS4/HxAA=;
	b=D4K5Kg9nFcRvoQHcWCj5Rc7igbtF3cY+SNhf0CWjgRNGOMCcSjOmhb8i7qZhO4BU7HK1vi
	ZZ2r1PCXMGP46Jw+KzLbh2nFKIgE7OxI7meJqqPMnCknR+U6eY6e412YFYqrgKB1R/74++
	z42tXU5otz4CUwQzKf2eXgR7bY2PSsgzocyQTs2AlUYZ+7TPpdid+9NiULzU+IIyBDl48n
	6XTV397aQukNaPm5/1KaCXIuP29KXx22nFXXiYuaq9qa4rezayZ5K+E032TyXc9sleRGek
	MQTawVXYgqDfzSRPdxLkKbtn0JM0gG30fIelXahzcEb7UwvB7xe6EZPspHn/1Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:51 +0100
Subject: [PATCH v2 18/27] mtd: spi-nor: debugfs: Add a locked sectors map
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-18-c462ef806130@bootlin.com>
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
 drivers/mtd/spi-nor/debugfs.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 821fbc9587dc..c290bfe20f73 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -185,6 +185,40 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
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
@@ -270,6 +304,7 @@ void spi_nor_debugfs_register(struct spi_nor *nor)
 	debugfs_create_file("params", 0444, d, nor, &spi_nor_params_fops);
 	debugfs_create_file("capabilities", 0444, d, nor,
 			    &spi_nor_capabilities_fops);
+	debugfs_create_file("locked-sectors-map", 0444, d, nor, &spi_nor_locked_sectors_map_fops);
 }
 
 void spi_nor_debugfs_shutdown(void)

-- 
2.51.1

