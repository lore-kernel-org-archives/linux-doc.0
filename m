Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED8342B75C
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807443; cv=none; b=oDTSbtqTQzjhvB4SUGI6U7L1PPMglLq0iSBkcYliXb/vLUMtQLh303pZoaJKjO4UFxZdVGRZErkY+yyxoRLRDG+0M9lRvZhh7yXy4LkIap2Pz/mREInNf8EWQBe1ZABsbSKZrBVMfNk5hfBCalDzssF0Jv1cy8vaw1lIM1kFm9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807443; c=relaxed/simple;
	bh=1Dw3mHO+F3oZmAjdRYy8e0QdVK0BwNmpSAYE2eDPFbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XR6QpiIOl9uI06Dli89WYrmPaSVkdaTdUDCBd4n/kURhr0HxCzhTlH02EWmBu1/mj5/yIu920ApTPjf47HQvjp6isLPeifMoOmfhGAxUHYlcAB95ZFfgzUFvuUiwSjVhAp+i2HGhhHlNf5cavKfk0GHZfpWs+w+SzCdeFEaBapk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b3eAQ38q; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b3eAQ38q"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AA4FB4E42D61;
	Tue, 26 May 2026 14:57:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E2BD6011D;
	Tue, 26 May 2026 14:57:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E525108888CF;
	Tue, 26 May 2026 16:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807439; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4yvYeLMGamebu03hNm0TqEnitIUAXVfVrkbQpYtd1IQ=;
	b=b3eAQ38qfcZ8l0foeMUXZqycMufwWLYyoktUpE8wDoakz9ZitG95NSBTFyjlmpATupas9n
	CHQccAaPqr2GhfaeHn5mdLswFYimQyOLeIkhwrpIm9oj0uSyQ57jg5L1ma8aGoaALjXWgr
	3msVwAdiioGx+2k0iFAT8K2V6OT2Wp+s2dQRvZ0RSmQS/jZEmRXXnhcUPULDJgw4q2bTjr
	bJ7sewYav69aAixlWJhSUmok4qNso3poBbbpJvreeOsPwaHFnagOVmIReyTFvbkJGHJey3
	C4mN31knrbBR2NQyiWF1G12R4ZxXcOnFia32lDfsrwJzikgE8boGccE2BbHwjQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:41 +0200
Subject: [PATCH v6 17/28] mtd: spi-nor: Create a local SR cache
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-17-4092f1419f8f@bootlin.com>
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

In order to be able to generate debugfs output without having to
actually reach the flash, create a SPI NOR local cache of the status
registers. What matters in our case are all the bits related to sector
locking. As such, in order to make it clear that this cache is not
intended to be used anywhere else, we zero the irrelevant bits.

The cache is initialized once during the early init, and then maintained
every time the write protection scheme is updated.

Suggested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c  |  4 +++-
 drivers/mtd/spi-nor/core.h  |  1 +
 drivers/mtd/spi-nor/swp.c   | 35 +++++++++++++++++++++++++++++++++--
 include/linux/mtd/spi-nor.h |  2 ++
 4 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2799c21d0b67..1fc71d6e0fec 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3326,10 +3326,12 @@ static int spi_nor_init(struct spi_nor *nor)
 	 * protection bits are volatile. The latter is indicated by
 	 * SNOR_F_SWP_IS_VOLATILE.
 	 */
+	spi_nor_cache_sr_lock_bits(nor, NULL);
 	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_SWP_DISABLE) ||
 	    (IS_ENABLED(CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE) &&
-	     nor->flags & SNOR_F_SWP_IS_VOLATILE))
+	     nor->flags & SNOR_F_SWP_IS_VOLATILE)) {
 		spi_nor_try_unlock_all(nor);
+	}
 
 	if (nor->addr_nbytes == 4 &&
 	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 0753d0a6f8b8..cd355e94b97e 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -679,6 +679,7 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 
 void spi_nor_init_default_locking_ops(struct spi_nor *nor);
 void spi_nor_try_unlock_all(struct spi_nor *nor);
+void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr);
 void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
 void spi_nor_set_mtd_otp_ops(struct spi_nor *nor);
 
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 2d1b1c8a535a..cd37fec08c0e 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -162,6 +162,25 @@ static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
 	return 0;
 }
 
+/*
+ * Keep a local cache containing all lock-related bits for debugfs use only.
+ * This way, debugfs never needs to access the flash directly.
+ */
+void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
+{
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
+	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
+
+	if (!sr) {
+		if (spi_nor_read_sr(nor, nor->bouncebuf))
+			return;
+
+		sr = nor->bouncebuf;
+	}
+
+	nor->dfs_sr_cache[0] = sr[0] & (bp_mask | tb_mask | SR_SRWD);
+}
+
 /*
  * Lock a region of the flash. Compatible with ST Micro and similar flash.
  * Supports the block protection bits BP{0,1,2}/BP{0,1,2,3} in the status
@@ -271,7 +290,13 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_old < ofs_new || (ofs_new + len_new) < (ofs_old + len_old)))
 		return -EINVAL;
 
-	return spi_nor_write_sr_and_check(nor, status_new[0]);
+	ret = spi_nor_write_sr_and_check(nor, status_new[0]);
+	if (ret)
+		return ret;
+
+	spi_nor_cache_sr_lock_bits(nor, status_new);
+
+	return 0;
 }
 
 /*
@@ -353,7 +378,13 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_new < ofs_old || (ofs_old + len_old) < (ofs_new + len_new)))
 		return -EINVAL;
 
-	return spi_nor_write_sr_and_check(nor, status_new[0]);
+	ret = spi_nor_write_sr_and_check(nor, status_new[0]);
+	if (ret)
+		return ret;
+
+	spi_nor_cache_sr_lock_bits(nor, status_new);
+
+	return 0;
 }
 
 /*
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 90a0cf583512..9ad77f9e76c2 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -371,6 +371,7 @@ struct spi_nor_flash_parameter;
  * @reg_proto:		the SPI protocol for read_reg/write_reg/erase operations
  * @sfdp:		the SFDP data of the flash
  * @debugfs_root:	pointer to the debugfs directory
+ * @dfs_sr_cache:	Status Register cached value for debugfs use only
  * @controller_ops:	SPI NOR controller driver specific operations.
  * @params:		[FLASH-SPECIFIC] SPI NOR flash parameters and settings.
  *                      The structure includes legacy flash parameters and
@@ -409,6 +410,7 @@ struct spi_nor {
 	enum spi_nor_cmd_ext	cmd_ext_type;
 	struct sfdp		*sfdp;
 	struct dentry		*debugfs_root;
+	u8			dfs_sr_cache[2];
 
 	const struct spi_nor_controller_ops *controller_ops;
 

-- 
2.53.0

