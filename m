Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6432624E4C3
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 08:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766390766; cv=none; b=LeA3dRIWTTDPJmIXcotVdCUNHhgIqCWe9BLRpwMmv+12hWLzjx1jVm0M3yO+dN9sUsU/KdPjcHDheUhjrspFCfhBolT2rmg1NX4mlErD6iq26R1ddATAnWlLkmgQpM+RwDQ4AaPv0y4dSqN6wN7vVvKkj44CTl9iXn9krl0HApk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766390766; c=relaxed/simple;
	bh=e4lomm4dQoXyplwfCFD6ts8MxpYp7skOEaioYQvgTIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qyMdVQ2mYBN6a4FGBXvkd3Yf7IR7BMMH2CFhHS3e7P+PsVZuEOR7hxw5ASMsD3z2oRHWxcL9EINlREMyfsihcm/2vWmODgGkEX5D/Ct6Y8VG6W4StPQPxXCn+5NRHw8Em3PoE9EDdPXswteYjkZ3FHEFEMivTWyR40R6bv2wkx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4GQxMzI; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4GQxMzI"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34c3259da34so3687582a91.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 00:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766390764; x=1766995564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4vwaOegezfUGFtkdmQG91NRUULYH7tFQw4sLTEMvhqk=;
        b=E4GQxMzIClXrR/Nwlv1owqPz76yfGPoHGnGWvEgwtYbM1+n7y+O0PzXpKtJEg0lzq+
         n8x4eoYtHj6qfo1vSf7zAEbYajzjdt1MHjWy/Q8EYjodEIdQkvQ8qXVYpOlcMXlFGbA1
         sE33LN1y8weI/p3WshDkOY9N/WXGogwwGOrghrMRVqsqSfV+ZAxnmGP8Q0uu6lUFVExB
         g89mXAHKkfu83f0Nqc0d4LTl7k85azlDKVqNJaf4dg28rbtZr4WLPdT8Ca68xnM6SmD2
         zBQ8IcPJ8i4znD++CEFrHKmAODLVzPlDXNuhP3s/FzjycAjoiaYbGfooeABkZamgOyhy
         v2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766390764; x=1766995564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vwaOegezfUGFtkdmQG91NRUULYH7tFQw4sLTEMvhqk=;
        b=Lt+wBR/Fxiii7HVZtkWN+j2RBlNMwVBK/Sovoqd0XkPFfnutuNFQVzSRYdEO1adbLW
         xMPjddIl/CHh8NKg6z/Jaet22viqNmpHJPhT5A/8QzmmRwlcKuQTI8ZmJhGrHjUBazFQ
         bOvA+C1EjIAR1YoqCm4f62c2FLwh72GbYXK1JY8eOA1JRGhDlDOr62eHQahE9BLNv9SI
         G9Qp1jVUk4Er9sETy3p0yZkxVupW5BvjQordpCSSqclQ+6gbpARdsir9MQll1FCZnIRh
         I6wbeS8sIpIo+EQdV7VnQDU8y4JcHLL32bukn3kSJKGA86NTumOydDKHNY5Rdf1bi4MC
         nbwg==
X-Gm-Message-State: AOJu0YxE84JUTV5FiykX1ZRo3098fORSOEFIw82C7zXKweo+jjuSxeNN
	8U+TwpMG8VUFZjgtAZFy33P/jnhQvRM33NSpWNKbr8tN0Tkwi/0POyFe
X-Gm-Gg: AY/fxX5AFmqLG3A/tcPtdu6Md4APL1PeHnS52nVxsnl/gHX1UuoJ/CMOC2S3RHlbZHR
	J3+/tCDW4JG9PXWMOyqinpbHpIwQy1gFuJUtUUTSKqw1KKz4IiZpp1C8mkgomZB1Ci1++d6ETdO
	A4jwvQxqmKP9AkjRyc2cHoAsmwBPmt+GrLARJl9MosXYJmF7TTFvpnVpE5e8PHFFbho7ibnrjSo
	SyDnlcR0AqGxZho5bgEfxRjnwDEotc6PFbyc3q9UGvh9FTKctDZzCwssmWgo6JG4ieQfESK+TWU
	6954mukKocm7yblsp9Q36Ptd2S+FN0VlklyBJxYCTI5f2yzOBhFvpQFQWMm8dbIc8tBjkUfBSn9
	uqnf8PNCVO2/sZ8Y1xmjA1GamO37MJ3NJKdbfR8cqtU0Eh4EYSG+4X237MZGPBXtvJ4ztC00qeg
	pbAmv3TqkEuU3n22Ov5s1iZF6t0Yyzjkue9KPvG8AJ5KklOXKwAnADHnpeLVRHKsKwf2Lv9USpb
	zpE8vdMazmiRAnuYgRVKO0Lv8YByehV
X-Google-Smtp-Source: AGHT+IEGRyFS0Tv7fIK6EPDf770ukZVJpvB608i8Q1wJrgT+Euv9n5wfIRSBU3nihnzBkM+dzx27bw==
X-Received: by 2002:a17:90b:4f41:b0:340:bde5:c9e3 with SMTP id 98e67ed59e1d1-34e921b73b5mr8612011a91.23.1766390764509;
        Mon, 22 Dec 2025 00:06:04 -0800 (PST)
Received: from ubuntu-2504-ThinkPad-X9-14-Gen-1.lenovo.com (zz20234032476F6CA7C5.userreverse.dion.ne.jp. [111.108.167.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7729b04dsm5622557a91.6.2025.12.22.00.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:06:03 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	vsankar@lenovo.com
Cc: linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Richie Roy Jayme <rjayme.jp@gmail.com>
Subject: [PATCH v3 1/2] HID: intel-ish-hid: loader: Add PRODUCT_FAMILY-based firmware  matching
Date: Mon, 22 Dec 2025 17:05:11 +0900
Message-ID: <20251222080512.956519-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for firmware filenames that include the CRC32 checksum of the
DMI product_family field. Several OEMs ship ISH firmware variants shared
across a product family while product_name or product_sku may differ. This
intermediate matching granularity reduces duplication and improves firmware
selection for vendor-customized platforms.

The newly supported filename forms are checked before existing patterns:

  ish_${gen}_${vendor}_${family}_${name}_${sku}.bin
  ish_${gen}_${vendor}_${family}_${sku}.bin
  ish_${gen}_${vendor}_${family}_${name}.bin
  ish_${gen}_${vendor}_${family}.bin

The legacy product_name/product_sku rules remain unchanged and continue
to provide fallback matching.

ISH_FW_FILENAME_LEN_MAX is changed to 72 to accommodate the product_family.

Tested with X9 series and X1 series.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Tested-by: Richie Roy Jayme <rjayme.jp@gmail.com>
Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
Changes in v3
- Removed the duplicate defenition of ISH_FW_FILE_VENDOR_FAMILY_FMT
---
Changes in v2
- Indent corrected
- More comments added
---
 drivers/hid/intel-ish-hid/ishtp/loader.c | 58 +++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c b/drivers/hid/intel-ish-hid/ishtp/loader.c
index f34086b29cf0..ffa2042bb316 100644
--- a/drivers/hid/intel-ish-hid/ishtp/loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
@@ -195,13 +195,19 @@ static int prepare_dma_bufs(struct ishtp_device *dev,
 	return 0;
 }
 
+/* Patterns with PRODUCT_FAMILY */
+#define ISH_FW_FILE_VENDOR_FAMILY_NAME_SKU_FMT "intel/ish/ish_%s_%08x_%08x_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_FAMILY_SKU_FMT "intel/ish/ish_%s_%08x_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_FAMILY_NAME_FMT "intel/ish/ish_%s_%08x_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_FAMILY_FMT "intel/ish/ish_%s_%08x_%08x.bin"
+
 #define ISH_FW_FILE_VENDOR_NAME_SKU_FMT "intel/ish/ish_%s_%08x_%08x_%08x.bin"
 #define ISH_FW_FILE_VENDOR_SKU_FMT "intel/ish/ish_%s_%08x_%08x.bin"
 #define ISH_FW_FILE_VENDOR_NAME_FMT "intel/ish/ish_%s_%08x_%08x.bin"
 #define ISH_FW_FILE_VENDOR_FMT "intel/ish/ish_%s_%08x.bin"
 #define ISH_FW_FILE_DEFAULT_FMT "intel/ish/ish_%s.bin"
 
-#define ISH_FW_FILENAME_LEN_MAX 56
+#define ISH_FW_FILENAME_LEN_MAX 72
 
 #define ISH_CRC_INIT (~0u)
 #define ISH_CRC_XOROUT (~0u)
@@ -228,6 +234,12 @@ static int _request_ish_firmware(const struct firmware **firmware_p,
  * for the given device in the following order, prioritizing custom firmware
  * with more precise matching patterns:
  *
+ *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_FAMILY_CRC32)
+ *   _$(PRODUCT_NAME_CRC32)_${PRODUCT_SKU_CRC32}.bin
+ *
+ *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_FAMILY_CRC32)_${PRODUCT_SKU_CRC32}.bin
+ *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_FAMILY_CRC32)_$(PRODUCT_NAME_CRC32).bin
+ *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_FAMILY_CRC32).bin
  *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_NAME_CRC32)_${PRODUCT_SKU_CRC32}.bin
  *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_CRC32}.bin
  *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_NAME_CRC32).bin
@@ -256,8 +268,9 @@ static int request_ish_firmware(const struct firmware **firmware_p,
 				struct device *dev)
 {
 	const char *gen, *sys_vendor, *product_name, *product_sku;
+	const char *product_family;
 	struct ishtp_device *ishtp = dev_get_drvdata(dev);
-	u32 vendor_crc, name_crc, sku_crc;
+	u32 vendor_crc, name_crc, sku_crc, family_crc;
 	char filename[ISH_FW_FILENAME_LEN_MAX];
 	int ret;
 
@@ -265,14 +278,55 @@ static int request_ish_firmware(const struct firmware **firmware_p,
 	sys_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
 	product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
 	product_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
+	product_family = dmi_get_system_info(DMI_PRODUCT_FAMILY);
 
 	if (sys_vendor)
 		vendor_crc = crc32(ISH_CRC_INIT, sys_vendor, strlen(sys_vendor)) ^ ISH_CRC_XOROUT;
+	if (product_family)
+		family_crc = crc32(ISH_CRC_INIT, product_family,
+				   strlen(product_family)) ^ ISH_CRC_XOROUT;
 	if (product_name)
 		name_crc = crc32(ISH_CRC_INIT, product_name, strlen(product_name)) ^ ISH_CRC_XOROUT;
 	if (product_sku)
 		sku_crc = crc32(ISH_CRC_INIT, product_sku, strlen(product_sku)) ^ ISH_CRC_XOROUT;
 
+	/* PRODUCT_FAMILY-extended matching */
+	if (sys_vendor && product_family && product_name && product_sku) {
+		snprintf(filename, sizeof(filename),
+			 ISH_FW_FILE_VENDOR_FAMILY_NAME_SKU_FMT,
+			 gen, vendor_crc, family_crc, name_crc, sku_crc);
+		ret = _request_ish_firmware(firmware_p, filename, dev);
+		if (!ret)
+			return 0;
+	}
+
+	if (sys_vendor && product_family && product_sku) {
+		snprintf(filename, sizeof(filename),
+			 ISH_FW_FILE_VENDOR_FAMILY_SKU_FMT,
+			 gen, vendor_crc, family_crc, sku_crc);
+		ret = _request_ish_firmware(firmware_p, filename, dev);
+		if (!ret)
+			return 0;
+	}
+
+	if (sys_vendor && product_family && product_name) {
+		snprintf(filename, sizeof(filename),
+			 ISH_FW_FILE_VENDOR_FAMILY_NAME_FMT,
+			 gen, vendor_crc, family_crc, name_crc);
+		ret = _request_ish_firmware(firmware_p, filename, dev);
+		if (!ret)
+			return 0;
+	}
+
+	if (sys_vendor && product_family) {
+		snprintf(filename, sizeof(filename),
+			 ISH_FW_FILE_VENDOR_FAMILY_FMT,
+			 gen, vendor_crc, family_crc);
+		ret = _request_ish_firmware(firmware_p, filename, dev);
+		if (!ret)
+			return 0;
+}
+
 	if (sys_vendor && product_name && product_sku) {
 		snprintf(filename, sizeof(filename), ISH_FW_FILE_VENDOR_NAME_SKU_FMT, gen,
 			 vendor_crc, name_crc, sku_crc);
-- 
2.51.0

