Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9437B2F6904;
	Thu,  8 Jan 2026 16:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891540; cv=none; b=Z7AuY67w7/FvNCyLMLkR2H1aMLFfp0/AMCh00/5Tlrv4VxlnD37r7Mfcw9mmDi7bB1/1dBIg/K89vC5tJFWmURBK/7jbiF3UJjV9iX7n+U4kMP8PhMVVGx79nwf49C+LH5n7u6PcmN4qkTQsyX4JMxGR5W4r2ipYHQ8gYMb3AOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891540; c=relaxed/simple;
	bh=0srJ1s65smP4KOpLWZGyK+ITZa7dJa5sLpiyMQk/z9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQGG1An8p/BCvxHzeM5QGsbrsJoKwJ4UEGfH+9D8rYWrkLwu5EI/m5xaSM7vZ4GZRrXuHfxPcQ//uH1bYtMXVeTi8ACtZEFMUPbdMd1SKOwWSrDzHyH/PW6tKtiplwpYlUj8PO91WXjyikE8qHE8NGhaZogx2p0TfwyoewB7nWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=q7H/PymZ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="q7H/PymZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0C7481A2717;
	Thu,  8 Jan 2026 16:58:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D5FEA6072B;
	Thu,  8 Jan 2026 16:58:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EDC0103C885C;
	Thu,  8 Jan 2026 17:58:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891533; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rre/i4KjHYI+91ZaQYrTCZUTDkibP+vKxwiQw3sQxfU=;
	b=q7H/PymZqr9DX0coX0Laz9UCpddok1wUdbm8d2kk0H+8Wntj0sGsUJO3eXDuavtQfcI8pt
	z/B6Q5r+/w/2Km9D6mtYJWlxHm606DY482Etq01POMuYc/EitvyrKNuLoZuB1SprqeZRJk
	Hgm14sue1qle17G8kRkw5iKsieHy5K/VhMRZWtadRl27JRF31qk9nMg948T/TWtQ8q/Qfd
	i5uRQxuOHk7DRV+s7bVMBnloXyKaAyBTHoWCu0c4Jg04WzLnTBBlgjWYMLJSTiM6FGl/AX
	LYrxP6DVMvmMih+afPiVGNyrdjGHDZ6ffOp0Wuk0/rkfzJhovJeNd27fSNk/zQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:38 +0100
Subject: [PATCH v2 05/27] mtd: spi-nor: debugfs: Align variable access with
 the rest of the file
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-5-c462ef806130@bootlin.com>
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

The "params" variable is used everywhere else, align this particular
line of the file to use "params" directly rather than the "nor" pointer.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index d700e0b27182..69830ad43990 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -139,7 +139,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 
 	if (!(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
 		string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		seq_printf(s, " %02x (%s)\n", nor->params->die_erase_opcode, buf);
+		seq_printf(s, " %02x (%s)\n", params->die_erase_opcode, buf);
 	}
 
 	seq_puts(s, "\nsector map\n");

-- 
2.51.1

