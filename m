Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A500262FD3
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 17:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142808; cv=none; b=NkY4ZSHog12dDTHD3IZQwhGhs5FRLmHBTV0SEmKnxmWamlkWKpWcZ53KbNvoaARC2EMSbEzzi8RVRpVHx8OOLacWPgZdaZ2DzHXKzgMlTQT5vyrDC0pb0HJ0iCTNQFt3GfRBNEdaIi6ePmkUj+z4Hmhxvpjy1UAC9mJNDLGAC1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142808; c=relaxed/simple;
	bh=/QfiuLKrj86QLLyM4ZCzDkrCeGKXM45JLDmKz9WJ2O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aK8Sei8s+syTQUeG4NhMEjaaAsoNsSnsGOpXhNeOjLTzUqh0DmifNtowtlPTlwEDdYRdVfUMHXniMKAl+LN1V3wXzf/aGkK0uuIYRKUzVyBhJaIavlwaD/AqV0SdnDTxQ/J9C/xtVBR5H/OevTXwSY65v802Mbxk3XC+tywLgTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LboCQ7ct; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LboCQ7ct"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B44F94E416B8;
	Fri, 14 Nov 2025 17:53:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C2EA6060E;
	Fri, 14 Nov 2025 17:53:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 287D210371990;
	Fri, 14 Nov 2025 18:53:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142803; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dIy19QMyJg/t0zE0eK24iAdi5JYPA0ElfHJvGBWV4ak=;
	b=LboCQ7ctkFsiaLjIrbN8cnPs8lGodCwOWMgokhv6iPB+BicGFS+lBVQGTrQdxbVteGwkDV
	QnnK51A3jK2Eu96RECQDh91xJtYIv2m+NP2v0vyiuYUHsiJpK3jTS3l94WzXUwJbDUMVAZ
	36Pkt043nFxaMiEltoEyjTMrToB3PMmXP3q59oKAM99PsNkwKbIzlxBH2+rvdwAX+jHU3G
	RLSZvmZCnfmYPzJGCwiW2OC0UzJbu6y8RGfRZ/DXlhqRvCS+MtQKptU6PCMPAXfAbz7r+e
	Hw5mpf/QypVANP6bzj3LMf92SR9G18pNyHgvih5kbKASI60Nn8rzU5a0DGUyhA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:03 +0100
Subject: [PATCH 02/19] mtd: spi-nor: swp: Improve locking user experience
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-2-487bc7129931@bootlin.com>
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

In the case of a single block being locked, if the user want to fully
unlock the device it has two possibilities:
- either it asks to unlock the entire device, and this works;
- or it asks to unlock just the blocks that are currently locked, which
fails.

It fails because the conditions "can_be_top" and "can_be_bottom" are
true. Indeed, in this case, we unlock everything, to the TB bit does not
matter. However in the current implementation, use_top would be true (as
this is the favourite option) and lock_len, which in practice should be
reduced down to 0, is set to "nor->params->size - (ofs + len)" which is
a positive number. This is wrong.

An easy way is to simply add an extra condition. In the unlock() path,
if we can achieve the results from both sides, it means we unlock
everything and lock_len must simply be 0.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
For me, this result was clearly unexpected, but I am not sure this
qualifies as a fix.
---
 drivers/mtd/spi-nor/swp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 9b07f83aeac76dce2109f90dfa1534c9bd93330d..9bc5a356444665ad8824e9e12d679fd551b3e67d 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -281,7 +281,9 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	use_top = can_be_top;
 
 	/* lock_len: length of region that should remain locked */
-	if (use_top)
+	if (can_be_top && can_be_bottom)
+		lock_len = 0;
+	else if (use_top)
 		lock_len = nor->params->size - (ofs + len);
 	else
 		lock_len = ofs;

-- 
2.51.0

