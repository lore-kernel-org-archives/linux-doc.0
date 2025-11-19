Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F77332ED5D
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567162; cv=none; b=Q2ey3Me2Ej8i/Xcr2g5A1remhWVrPmO2QwExLRkR2AZyFf8nEIq3H4vZ1z8jtn3NG+VhRvyzsyNdSbokJULHo0scz8BHdmk06exYnXmhcxq6AEi5rxDENEGh6oEBfnLiyDLfjFk/zCaaYSisYHSK8GzsrRqHhxTpqHKHHfU21B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567162; c=relaxed/simple;
	bh=oMOJLuZhCOnY0w0cY4R3cwCR+B/zhszgawQsUmZz21o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twpgQexlCjm891ghWfBSOv8LEFTMKRyX+FQQZ0DLmSqvkpX9l5QxLacjVVfXbOBiwL7FWCMnBMxrfu01/WgFiPfwxPq1KtkjOjjsukWvje5JGQsaKrWjamTjMb0+1hagyH5jQcDUFjnsLcOB8ML83JDaK03cRzaO1feG1w3W9U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nbcbpaj9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nbcbpaj9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso4466365f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567155; x=1764171955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEWvhI86IGkr275YCXI4U9akHZM2f251P0zZm4c5HV0=;
        b=nbcbpaj9MDGTBG2ZCwZwK3LgPpIz0tMB0ap1DqlvjBXvufiLgu5rtDDVtwkPLgNqfI
         o4NYkoWEt3FLcXmu6dL9PZGRVuqNh3UNpSsGeY8BCZo63wuPKa5E8f4eGYYhnQyQJZam
         08AaKGKIGbZeT5a1zhT1ZcZwHo/C4fK+VV8OHvXI8MH3lFWpdLrebSZ2Z58hKizgokp0
         Ai5/abu78NWX1TtrOUL2CREoPN1OgJfR/Sa8iKztlpiTwBs531ZQYTlKrnjuH8q8i7WE
         +47cckejnY2EfW+rEn1EnfXX32XQjCAWv6+sRahgUTSZsPxPqNllZ5eE+T9BA6gFU6Pr
         zfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567155; x=1764171955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CEWvhI86IGkr275YCXI4U9akHZM2f251P0zZm4c5HV0=;
        b=FVRQsNA7SF8mnlIwjNjoEE30EFNRi0mKFGLIEZX+yi6A99A/SSxo3b0rZsQ6UlJI0G
         Kqj8E2lB8IPX10OTpkM+4TsHMj8HjqR1TeQNaec9z5mWFcEN0v21JmFWRRJsvhaMR5NV
         RBIXyCT04DG9AUBb5w2g5p04Rs2Ni4xuY8nX/RfhfbCiUiFmoxJEGI2SoSssMLGMdM5Y
         mjCeh7Lrbzb7AW9V6Oz/VQCJOCV4z+bGv2jtezR6gOBzoDbHaH2Weh4EIfYU8dchpRHf
         iBzpm3YVHlNV+NofuGduh6Xm2rUEXHyLMVAEB0gSQ4rVaHPqhEkgIu6DZJA3hmZaAZTg
         bByg==
X-Forwarded-Encrypted: i=1; AJvYcCWL+R3pLtclPp1lrPflGPlODI3aswKPdqikmqR6EVWqU+bcbUVN7ZZWQuYgQACXyEcZYdbs0fMXfCE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0pwUKOp2i9HG8d8PIG28yyf03lL/n9NB8ieMkqLQcxbFli3Wn
	/J8Umb5P1fC60BuASuQF3bUF8z3yYrO1N+VgFcMb0KOcjCman8D7T6hmhKNEKqQAm/0=
X-Gm-Gg: ASbGnctszQnis0k7Vev5J797iGpskoumyoUHN2TSOzj7McnYuBbabXOread34HTZ3SA
	00R+HrjNyhPxdSCgbLR+eU2807CGMAK9vHsoAgotig2qgpp3jL7Q0L5ORkhcUNepdxi3nTxD2OL
	3knIzP1sMq+yG614Cl44KBGqafO7pYkaesmU7lYHDTcUqwOHRqm8motv8SCcx8DV6ZA31yXXoVF
	TVp64XftTRw2HKDsx9f5+XLqMz3deHEknCPvGTwLN1cVJ9I3aRFAgzrxupCBPipaoCFwSqRqz2q
	ILdbbsEuq6+p8ySZLrTcSPzARsEpVXzcSafmvQOEd3F20Rb9ftq9Kr/hTJjyq6MbAeDXi+pzssL
	zBZTcBMfG5QyXObVclNZUNM6Rni69yZWXrxKUUyTa/ytOz3sCThR2ZRhM5wLT7y4uW+lfS1FfS/
	g9qNrsCaPFLWBhuYTRxGr+U9wPirNDVg9h4V6Fq7mG
X-Google-Smtp-Source: AGHT+IGkk7cUbQZnXjGag8yPABXUYogSDTvlv9CsdaEjFL1fCOMxhsVRR8P5cnyld7ERa3Ar7rkUkQ==
X-Received: by 2002:a05:6000:22c1:b0:42b:3ab7:b8a4 with SMTP id ffacd0b85a97d-42b5938b4b1mr19940877f8f.33.1763567155275;
        Wed, 19 Nov 2025 07:45:55 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:54 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 22/26] remoteproc: qcom: Extract minidump definitions into a header
Date: Wed, 19 Nov 2025 17:44:23 +0200
Message-ID: <20251119154427.1033475-23-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract the minidump definitions into a header such that the
definitions can be reused by other drivers.
No other change, purely moving the definitions.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/remoteproc/qcom_common.c  | 56 +------------------------
 include/linux/soc/qcom/minidump.h | 68 +++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+), 55 deletions(-)
 create mode 100644 include/linux/soc/qcom/minidump.h

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 8c8688f99f0a..4f1c8d005c97 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -18,6 +18,7 @@
 #include <linux/rpmsg/qcom_smd.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/minidump.h>
 #include <linux/soc/qcom/smem.h>
 
 #include "remoteproc_internal.h"
@@ -28,61 +29,6 @@
 #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
 #define to_pdm_subdev(d) container_of(d, struct qcom_rproc_pdm, subdev)
 
-#define MAX_NUM_OF_SS           10
-#define MAX_REGION_NAME_LENGTH  16
-#define SBL_MINIDUMP_SMEM_ID	602
-#define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
-#define MINIDUMP_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
-#define MINIDUMP_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
-
-/**
- * struct minidump_region - Minidump region
- * @name		: Name of the region to be dumped
- * @seq_num:		: Use to differentiate regions with same name.
- * @valid		: This entry to be dumped (if set to 1)
- * @address		: Physical address of region to be dumped
- * @size		: Size of the region
- */
-struct minidump_region {
-	char	name[MAX_REGION_NAME_LENGTH];
-	__le32	seq_num;
-	__le32	valid;
-	__le64	address;
-	__le64	size;
-};
-
-/**
- * struct minidump_subsystem - Subsystem's SMEM Table of content
- * @status : Subsystem toc init status
- * @enabled : if set to 1, this region would be copied during coredump
- * @encryption_status: Encryption status for this subsystem
- * @encryption_required : Decides to encrypt the subsystem regions or not
- * @region_count : Number of regions added in this subsystem toc
- * @regions_baseptr : regions base pointer of the subsystem
- */
-struct minidump_subsystem {
-	__le32	status;
-	__le32	enabled;
-	__le32	encryption_status;
-	__le32	encryption_required;
-	__le32	region_count;
-	__le64	regions_baseptr;
-};
-
-/**
- * struct minidump_global_toc - Global Table of Content
- * @status : Global Minidump init status
- * @md_revision : Minidump revision
- * @enabled : Minidump enable status
- * @subsystems : Array of subsystems toc
- */
-struct minidump_global_toc {
-	__le32				status;
-	__le32				md_revision;
-	__le32				enabled;
-	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
-};
-
 struct qcom_ssr_subsystem {
 	const char *name;
 	struct srcu_notifier_head notifier_list;
diff --git a/include/linux/soc/qcom/minidump.h b/include/linux/soc/qcom/minidump.h
new file mode 100644
index 000000000000..25247a6216e2
--- /dev/null
+++ b/include/linux/soc/qcom/minidump.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Qualcomm Minidump definitions
+ *
+ * Copyright (C) 2016 Linaro Ltd
+ * Copyright (C) 2015 Sony Mobile Communications Inc
+ * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __QCOM_MINIDUMP_H__
+#define __QCOM_MINIDUMP_H__
+
+#define MAX_NUM_OF_SS           10
+#define MAX_REGION_NAME_LENGTH  16
+#define SBL_MINIDUMP_SMEM_ID	602
+#define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
+#define MINIDUMP_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
+#define MINIDUMP_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
+
+/**
+ * struct minidump_region - Minidump region
+ * @name		: Name of the region to be dumped
+ * @seq_num:		: Use to differentiate regions with same name.
+ * @valid		: This entry to be dumped (if set to 1)
+ * @address		: Physical address of region to be dumped
+ * @size		: Size of the region
+ */
+struct minidump_region {
+	char	name[MAX_REGION_NAME_LENGTH];
+	__le32	seq_num;
+	__le32	valid;
+	__le64	address;
+	__le64	size;
+};
+
+/**
+ * struct minidump_subsystem - Subsystem's SMEM Table of content
+ * @status : Subsystem toc init status
+ * @enabled : if set to 1, this region would be copied during coredump
+ * @encryption_status: Encryption status for this subsystem
+ * @encryption_required : Decides to encrypt the subsystem regions or not
+ * @region_count : Number of regions added in this subsystem toc
+ * @regions_baseptr : regions base pointer of the subsystem
+ */
+struct minidump_subsystem {
+	__le32	status;
+	__le32	enabled;
+	__le32	encryption_status;
+	__le32	encryption_required;
+	__le32	region_count;
+	__le64	regions_baseptr;
+};
+
+/**
+ * struct minidump_global_toc - Global Table of Content
+ * @status : Global Minidump init status
+ * @md_revision : Minidump revision
+ * @enabled : Minidump enable status
+ * @subsystems : Array of subsystems toc
+ */
+struct minidump_global_toc {
+	__le32				status;
+	__le32				md_revision;
+	__le32				enabled;
+	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
+};
+
+#endif
-- 
2.43.0

