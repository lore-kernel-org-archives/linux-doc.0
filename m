Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1647798B
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 16:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172434; cv=none; b=kqLECrw6qjiHts8Wn6hePmylI3UD9gXAcpA8gwuXF/4rCLHKcU0GxbKLuwAFKPqDeAR4S38zo3oIwPClyUwPmhiLmB9yGxMzX+XkErCHtudxgcsafbgsQIP97/3GkLEchV8LGzCo09AXRczqvl9Sp6Yu8vbiFKhbMj1wZ0hbr1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172434; c=relaxed/simple;
	bh=0NhpwtjvcZHlnaL3JDUzc3McoMBysNY2GxrJ+BRuGDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jMBeGL3jRE1vxZ0fgCbVXV5sGMPxCSfgPQfHoLhanabzRn7Kz9V4P+r8giGb3LN4xGa/9BBl6MxIk+faZAxh7h3TVOrdUlnzvevoG2PrKlgltViXRkD8csj1bXRv4LAMaVQnHbMeBVI2Qqgr8mkoU0xCNiUXqAo4TTOVK6aJ9Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BmLRTV0p; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BmLRTV0p"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 98EC91A355C;
	Thu,  7 May 2026 16:47:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D97A605CF;
	Thu,  7 May 2026 16:47:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62741108194ED;
	Thu,  7 May 2026 18:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172430; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6W7hkrB9Ol3hQ/s59VqFJffbxfuvvEc6vOXwL3BRK50=;
	b=BmLRTV0pLipkHmb3bAqNlGRONFDUq3P/AtiGgoZiUmkisF/dKXWbKZQRsolzdUGUMTptS/
	Al7/kqDY/9aJxAoYgZHdsL4Dyd+MokLwaKZYi2cHGr/QZFlmqbSsYupjlbD0hoHz7CkIJZ
	n383qbc9b3U5kPetYChj4wdHiNOHgtmP3xXCrKjMyW1RzGddYYboMVXBeZLMl97y/itBmi
	DmYNrhjA+9w+9/8jaLazRFSLRUF6Pl8EVD+fP9WGROHRWkE6QIo5vkG/RXjKlZHUh6zsXP
	U7b+W9XGXX+scPxNorTWnlx8WUMoGwyHd+1otvbAOZG3Id7j0r1B6jV/0iYAUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:46:50 +0200
Subject: [PATCH v5 09/28] mtd: spi-nor: swp: Clarify a comment
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-9-93453e1a9597@bootlin.com>
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

The comment states that some power of two sizes are not supported. This
is very device dependent (based on the size), so modulate a bit the
sentence to make it more accurate.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index d5f4bf555cfc..f221d6361b57 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -305,7 +305,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
 			val = (val & ~SR_BP3) | SR_BP3_BIT6;
 
-		/* Some power-of-two sizes are not supported */
+		/* Some power-of-two sizes may not be supported */
 		if (val & ~mask)
 			return -EINVAL;
 	}

-- 
2.53.0

