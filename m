Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4DD346790;
	Fri, 14 Nov 2025 17:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142813; cv=none; b=fCifz7r+hWIN4aNS+e1UDqf+e2uf8aNcL18lwIZLsKva/u7YtGP+E3ZZAjZXOgxPIPib3S9du39f8Vm9GLMsL/+JNtQW8YY17W26PRadcgIcpCWT7DMYOnQmyiieGBveRDYXyOOtT5MzPxiZGpN9DV08Eo9enNHIl+R1ln87w8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142813; c=relaxed/simple;
	bh=x+SZ+SJF4eQBLHXFBTpm3DQa37Hn/2FU5/qJRIyEalE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKrD9Ak2f86F5W6iLuWEXARcn40tkrzeNszHtmas8gO3XfdgpUyasK7OMT0UQaUL94zeHSvoXQUA2jgP3JTb8boOoiHABByraUIh8yQU1I3NqtyU0OmZcnLWfZqD/ovceo46vQ0OvYRTIieuzH0vSf42JO4i4oO8mdDd3m4SSsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Nz//iQpT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Nz//iQpT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 22ABD1A1A84;
	Fri, 14 Nov 2025 17:53:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF8C16060E;
	Fri, 14 Nov 2025 17:53:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60B5B10371990;
	Fri, 14 Nov 2025 18:53:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zf6LUiYn/3u+vAWeXjeBqil6Me6m7QnaOwnhP98Y64A=;
	b=Nz//iQpTUagqt+7K8jY/dv2ImU9f5CC+4WRRpiyHwwQCxud4CoBcXBajJGtnEShOSwRwJA
	nHjEF6xhRE0laiJkb/aH8X1LJOj2YwQLUTXNkphn8yoOHVtwgBZeTLkcERBGHzu+IX0ZHg
	XpsvyAYqQw5BduFy7O5wXBOF5NSOOEBDkQ4F28vv5IWkbVDorPAQfajBR3sn4dkv266/xb
	26GnxI96ogCR3xiLBG3muBgyhqLkB6BvKzzurCamaDMaLP3sOj1RGEhao89FIdkxoHvITH
	qOhQ6YBofZ0UfNI9/BmJUlliSXyeuCqtquuhmPKTfCo0gn/r5D5OiO8Y5r8gOw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:06 +0100
Subject: [PATCH 05/19] mtd: spi-nor: debugfs: Enhance output
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-5-487bc7129931@bootlin.com>
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

Align the number of dashes to the bigger column width (the title in this
case) to make the output more pleasant and aligned with what is done
in the "params" file output.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 69830ad4399009185983549647f3be61ad5d1c84..d0191eb9f87956418dfd964fc1f16b21e3345049 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -144,7 +144,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 
 	seq_puts(s, "\nsector map\n");
 	seq_puts(s, " region (in hex)   | erase mask | overlaid\n");
-	seq_puts(s, " ------------------+------------+----------\n");
+	seq_puts(s, " ------------------+------------+---------\n");
 	for (i = 0; i < erase_map->n_regions; i++) {
 		u64 start = region[i].offset;
 		u64 end = start + region[i].size - 1;

-- 
2.51.0

