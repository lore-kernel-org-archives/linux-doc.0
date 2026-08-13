Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6AE4734F8
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634405; cv=none; b=piAx+IGzRgOGMSrWbmCkz0WkWRzPwg3mqx9+oxIsMvVHM5pbCaOt7w/cK/a9MACHqhq6RdZdk3vxWIQ/av7fDgjlJ5b+Xm01HDcKMuCh0y9qqgsNNqfwEYWFCPI1yQ9erzOMHyR5Usnw9eRSW2iChIkig2I0jyR/O4agyXwydms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634405; c=relaxed/simple;
	bh=NI2yzTMpnK3XIBj+9ePuwr5tndTcwQtUhtoENoyxkFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RARg5lNDC3mpThpWONoOsvCen5uyf3z51qRcqbFTIDwbbYYMduZ/g78D/tEgSVjvCguULP6/3I/wngNMgrebRS94Oiu7zmrNtA8ECHMD1VcrVaRYKSARn8akrFlYUzEvyq8LKKaxfAxPxDzOrKhZmo4UknJwXPYuO6Dl78RtkBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ffVndZj+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ffVndZj+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C1AB81A1605;
	Thu, 13 Aug 2026 15:19:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95BB0602B8;
	Thu, 13 Aug 2026 15:19:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A6E311C4E070;
	Thu, 13 Aug 2026 17:19:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786634394; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kuJO180+ZdLosOCxprt4BAEakCmT8F4JphnBce+EMCw=;
	b=ffVndZj+rMFzOUk/4qRvjKaafqYBqb8qdlA5fYR9XGl440pkgpq2dYpLLgShs/e1CCetUd
	sl/6PznTnj5F0Jo+HE9jq0quRO5Fx4rrxjvkhZJTKj1BocSfWBftJf1afMkY3/n/vkZ8Hi
	UJVduZQwor9odp2Ujt/Cj2BoVEj36GwaXoUWNPhQXZ76cDxhJNCi1ok1HJtDdATcdum4hc
	3d6Pzcgd6MgsIQuayV3OX0zWGVvHg4Uut0gaf5wY9TH85qCV+zY2/betg4qzBPQ5DzpSIv
	g3nLAno+YpyIv229euTA8ahKZuRtA1NGoer0onAXIka6etLFtYSRfdkT7h7q+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 17:19:06 +0200
Subject: [PATCH v3 06/23] mtd: spi-nor: Create an indirection on the part
 name
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-6-b637cf120d5c@bootlin.com>
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

We currently print through sysfs and debugfs the name of the part if the
.name field, which is legacy, has been filled in the ID table (otherwise
"(null)" is printed). These IDs had an interest until manufacturers
started re-using more and more extensively the so called unique JEDEC
IDs. At this stage, a name that was tailored for a chip sold in 2016 may
no longer be relevant for a chip sold in 2026. Still showing this name
through the various filesystems may confuse people, removing these names
cannot be done since they are now part of the user ABI (because of
sysfs).

In order to allow overwriting the .name field (which is part of a
read-only structure), let's create a spi-nor pointer which will by
default point to that .name, but which can be cleared in fixup hooks to
make sure the name is hidden on newer parts.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c    | 1 +
 drivers/mtd/spi-nor/debugfs.c | 3 +--
 drivers/mtd/spi-nor/sysfs.c   | 4 ++--
 include/linux/mtd/spi-nor.h   | 1 +
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3a611283a9e6..cf6eccb4c423 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3492,6 +3492,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		return PTR_ERR(info);
 
 	nor->info = info;
+	nor->partname = info->name;
 
 	mutex_init(&nor->lock);
 
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 512825c3fc85..275671222588 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -82,13 +82,12 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *erase_map = &params->erase_map;
 	struct spi_nor_erase_region *region = erase_map->regions;
-	const struct flash_info *info = nor->info;
 	char buf[16], *str;
 	loff_t lock_start;
 	u64 lock_length;
 	unsigned int i;
 
-	seq_printf(s, "name\t\t%s\n", info->name);
+	seq_printf(s, "name\t\t%s\n", nor->partname);
 	seq_printf(s, "id\t\t%*ph\n", SPI_NOR_MAX_ID_LEN, nor->id);
 	string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
 	seq_printf(s, "size\t\t%s\n", buf);
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
index 643513ee891b..a2dabe4c6422 100644
--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -25,7 +25,7 @@ static ssize_t partname_show(struct device *dev,
 	struct spi_mem *spimem = spi_get_drvdata(spi);
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
-	return sysfs_emit(buf, "%s\n", nor->info->name);
+	return sysfs_emit(buf, "%s\n", nor->partname);
 }
 static DEVICE_ATTR_RO(partname);
 
@@ -78,7 +78,7 @@ static umode_t spi_nor_sysfs_is_visible(struct kobject *kobj,
 
 	if (attr == &dev_attr_manufacturer.attr && !nor->manufacturer)
 		return 0;
-	if (attr == &dev_attr_partname.attr && !nor->info->name)
+	if (attr == &dev_attr_partname.attr && !nor->partname)
 		return 0;
 	if (attr == &dev_attr_jedec_id.attr && !nor->info->id && !nor->id)
 		return 0;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 3a55d76ea77d..b1e573367604 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -395,6 +395,7 @@ struct spi_nor {
 	u8			*id;
 	const struct flash_info	*info;
 	const struct spi_nor_manufacturer *manufacturer;
+	const char		*partname;
 	u8			addr_nbytes;
 	u8			erase_opcode;
 	u8			read_opcode;

-- 
2.54.0

