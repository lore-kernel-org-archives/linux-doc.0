Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151E02FD1D6;
	Thu,  8 Jan 2026 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891551; cv=none; b=ls8SQ3jFkSsvrFon4+aYqjOCes+4OihxqVZt79cQS8dfzZ4uyaZXP47F1hjvHc+iCWRqVko5gwHccIIgzrlT4o6BJtjBjhQ/axTX+9Xl0qNa3q26eNFcd6DSk9omGe50+DNo5QmTUHhneHAw66MKgNP21wjGsx5GAZs36RqwetU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891551; c=relaxed/simple;
	bh=c3d5y3lsmdfy3rUDJHD9qOABwrEUyamDkOtvHRWb5Dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dP21YFHZeNSEkT1HqSbomx9+RQrBSCXoQBobpllSETEwdYYEsWaeB5trOpjqJFg7cMFbZ8TOLUt2zKpWdu4ZJjnKTQ6g72isH3CE4jv4Aa4qCpfxePKBi4apQ80OMI/9oHSBofPSU8Q+tNz9ht5B0drjR8vqP5ArBX48MAEGFw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GJHV90KA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GJHV90KA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 119831A2716;
	Thu,  8 Jan 2026 16:59:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DAED66072B;
	Thu,  8 Jan 2026 16:59:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A989103C8897;
	Thu,  8 Jan 2026 17:59:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891546; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=huIAGKBLlYy5bqenkOHYpgkreeVYU/erjhzN9EO+unQ=;
	b=GJHV90KAn5BplDmegOH6ZQ7at+qPro0BfkjbGBhomazuYXWs00i/7419WmJ6gHDGgev4jJ
	cwCQ+8yptInUmtnaam4ab4ycLj6YXhaXgRV9li1quGGh6RlvmINpvA3u6MGN/T+jSPOOyC
	iyT9Xy+RP7R1ewzKQ+T6JjzJP2mlqrtqIqTB6GnxIctNnVeO8iFe1x1m1W0SSyl58BWX+a
	r6R9vKrUzplyum+6lGGkXV8aH29v3Ix12Qr6cV5Ryu7bLY9juyxhaJyVrXjBXDfJKGYlh1
	0wp1tQMu0fEpT0gbS6zqkdY3fsHVsN3mLW8/40iw4tLDdIBkW0tKDipCudOaDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:43 +0100
Subject: [PATCH v2 10/27] mtd: spi-nor: swp: Create a helper that writes
 SR, CR and checks
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-10-c462ef806130@bootlin.com>
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

There are many helpers already to either read and/or write SR and/or CR,
as well as sometimes check the returned values. In order to be able to
switch from a 1 byte status register to a 2 bytes status register while
keeping the same level of verification, let's introduce a new helper
that writes them both (atomically) and then reads them back (separated)
to compare the values.

In case 2 bytes registers are not supported, we still have the usual
fallback available in the helper being exported to the rest of the core.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.h |  1 +
 2 files changed, 66 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8d91052cc21e..97da30d9f6c1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -976,6 +976,54 @@ int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
 	return 0;
 }
 
+/**
+ * spi_nor_write_16bit_sr_cr_and_check() - Write the Status Register 1 and the
+ * Configuration Register in one shot. Ensure that the bytes written in both
+ * registers match the received value.
+ * @nor:	pointer to a 'struct spi_nor'.
+ * @regs:	two-byte array with values to be written to the status and
+ *		configuration registers.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_write_16bit_sr_cr_and_check(struct spi_nor *nor, const u8 *regs)
+{
+	u8 written_regs[2];
+	int ret;
+
+	written_regs[0] = regs[0];
+	written_regs[1] = regs[1];
+	nor->bouncebuf[0] = regs[0];
+	nor->bouncebuf[1] = regs[1];
+
+	ret = spi_nor_write_sr(nor, nor->bouncebuf, 2);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
+	if (ret)
+		return ret;
+
+	if (written_regs[0] != nor->bouncebuf[0]) {
+		dev_dbg(nor->dev, "SR: Read back test failed\n");
+		return -EIO;
+	}
+
+	if (nor->flags & SNOR_F_NO_READ_CR)
+		return 0;
+
+	ret = spi_nor_read_cr(nor, &nor->bouncebuf[1]);
+	if (ret)
+		return ret;
+
+	if (written_regs[1] != nor->bouncebuf[1]) {
+		dev_dbg(nor->dev, "CR: read back test failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 /**
  * spi_nor_write_sr_and_check() - Write the Status Register 1 and ensure that
  * the byte written match the received value without affecting other bits in the
@@ -993,6 +1041,23 @@ int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
 	return spi_nor_write_sr1_and_check(nor, sr1);
 }
 
+/**
+ * spi_nor_write_sr_cr_and_check() - Write the Status Register 1 and ensure that
+ * the byte written match the received value. Same for the Control Register if
+ * available.
+ * @nor:	pointer to a 'struct spi_nor'.
+ * @regs:	byte array to be written to the registers.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_write_sr_cr_and_check(struct spi_nor *nor, const u8 *regs)
+{
+	if (nor->flags & SNOR_F_HAS_16BIT_SR)
+		return spi_nor_write_16bit_sr_cr_and_check(nor, regs);
+
+	return spi_nor_write_sr1_and_check(nor, regs[0]);
+}
+
 /**
  * spi_nor_write_sr2() - Write the Status Register 2 using the
  * SPINOR_OP_WRSR2 (3eh) command.
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 16b382d4f04f..3dc9ba3bc6da 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -632,6 +632,7 @@ int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
 int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
 int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
 int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr);
+int spi_nor_write_sr_cr_and_check(struct spi_nor *nor, const u8 *regs);
 
 ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
 			  u8 *buf);

-- 
2.51.1

