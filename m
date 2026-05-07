Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07487426690;
	Thu,  7 May 2026 16:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172429; cv=none; b=TUkLejFn9NfWTed7NQEYH3k38Z3Cc8jR5o5IQNFKN9yCoDmPBgeriri8kEMC7qZ5Qj7PLx8srsyPDWBiSE3IOBVzwfouegtGKeggPHagD+VsE8W8DqMVNjzC6dReZtaXoZJ9QM52cKVBU73aBIMhDK52jUKOs18RuMF90avuGr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172429; c=relaxed/simple;
	bh=9MefzCIV+tnB/FnzOtLFwFa7sENOrT3OAIQ9rTsmCUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZPPKwJ91sXPP2sFurk3ZZEwYzgLnHZAI46sLrlQgM28mWp8/TH8Yx/In/PLyy5vfb7luObX4lKV4zuCUMZnDiEZvzG8FSf7bGIyaPEubppVSTDDf8Tix+5XpaM2WU3vQgeNgd1fJOqrPwmS660veeNewxYuoFi2WU2tAvbqlUjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZvwtV/gA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZvwtV/gA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BD7344E42C37;
	Thu,  7 May 2026 16:47:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8BDAE605CF;
	Thu,  7 May 2026 16:47:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58951108194A8;
	Thu,  7 May 2026 18:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172425; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UWpfRE4WtdnRITw0PIgGXyjweTZSRtj+l56eZxMc4k0=;
	b=ZvwtV/gAyKOO9LkZR9GeLul4tw0EAqwgNH94yUnPwc1J+E9xChzLZIT0DkWGP6jvU6GUVB
	0RbfBlXcCRoqFSCK2RPahEqcZAURRm7BEu5wCxA+onY9/AVDUwb8ZICZXGepCg3vZyTYfz
	XDGtbeL1Kzu5JJGz0r0lK0Z7O1qqa6pTb82JHgUny4sYKYxhZwzsRLvzb4Lz6SIGMVaxTS
	TnunTO1genAcfHbJvN9f+4NfJzU5n6dxe6iFhS1At0JdIkvxVI8vctAoDSXPbEPVZvXSgm
	3Fhro9sFLUr5GlJvN1YnJ8T1pgvNse+dngO1wY+Gks+NcAlPQ0+BQKAWsBDUSQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:46:47 +0200
Subject: [PATCH v5 06/28] mtd: spi-nor: debugfs: Align variable access with
 the rest of the file
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-6-93453e1a9597@bootlin.com>
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
2.53.0

