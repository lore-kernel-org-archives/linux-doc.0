Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585349;
	b=WtOT1FGgGo2QuECjoQUttE7FpQkOFVTbO2R59DranHqAcNX2kTFcHsnIqt4RdBRgS+v3
	 CCsZqsrWORbN8xmJd+a9ZHXi3BbpWcFnvJMnswAeM39jf5vu2XXI08qlAeo9ZF1G4zSpF
	 vzgNuno6Y+cxQamCfUhwX5CnMsVfiKG3qnP/WI/kKiUB8TEr0ii2ms7C/5ry2o3Y6TULA
	 EfOXzbd4dQ7xYEXsvZ8Pt0qmZUJcfltHsx2i8TZzxsyh89xQ6dmJZkhb8Il3Bw7MsKymC
	 wloumZW8c2hiI/cXc3wNJktzybBnZDgKFUgQHIwF4uf1zplorK/Vcp4O4sWULsZsrWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LxvTir9QXhDFYqOHYJz6yAUDC5oR63nA97+1lOlMaoA=;
	b=rTgfcCj5+pkPwePkLuVIR7SB78+KDDQ1i1eDIErcA8j3+xkDlPfgNqSb++sv8ku3QhRo
	 FH5J03Rm36jout1dZV7DTI5ynC4q6mYkx34BUhMcJkrHHJXTj1nktkoOTbm5qI8GMVsnh
	 rgbMKZhRngrWiL9WDrCoXYenVC96uKiizZ8mdysihpu8YTkNW9R2dB+B7LylohfYqePBP
	 hHv+e+bwYIhpRrPTae2UYu+G3uQDUyNqHcgX+q9CJH/nRHLQeSQnRjgoo4n5ZTAYSYNpX
	 jFJ5wZeXEUgNToxXfl6pBVBPVNZLim15aVBhJ4szhX4QkjHazGzvVtRlgsWQ7scVx4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=vT8AQ6tu;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C97A606A8A0
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 15:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C97A606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=vT8AQ6tu
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d58c50743so204424066b.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 07:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1794585348; x=1795190148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxvTir9QXhDFYqOHYJz6yAUDC5oR63nA97+1lOlMaoA=;
        b=vT8AQ6turuUclN9viL9XgRv4pRh0MkNi3p2IPGmsTRoi/BZP28m/D22w3utokk5SKJ
         Yx/nJVgpy9PveHMoG2/dPsEa9cp/O3L/NejPVRFkBWA5opRnIUtDvRFs/fQBTC1NzyM4
         HeERlJD++vtmnLEi7UF7dx6clJhHXHRkXvvQDDpFWytru1ZLwHFJNLmWu5+OXXn1OjRq
         iLM8unJrkE6x+wv7BQ6UxSfasGqJfhpdm4/NptGDACNvrh2FGj+xXJNuFtLct4UcyyPC
         4FNKstMIaPF3eyduEMFV99OuloyniadLSfpUYb8Nv8tfL05Yy0mGEnADYnRjF4ClEUFO
         pbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585348; x=1795190148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxvTir9QXhDFYqOHYJz6yAUDC5oR63nA97+1lOlMaoA=;
        b=mIXra0d1oEB7Oxvf3UZwJp/lmeB7bY08cczvRjYatbhOdqCSEk0trPJvcHSFFfPw3f
         zxG4/Ilb4fpQO58ZgMKbaDvjRnIv/JzXfmkYP+U4K0Qku89pV2NIOXylSw1sViXe4gLj
         mXQ6moepKHvXUc4DwcSDvEypZSm4Ap17qST5JwDzBM+RjbTwkQMdEhCvwvZ0KiksY1q6
         mb5okPBvn/0cUYu24F+vg6OcO85BJhzC553o8Om+07cP40DmaBM3ZVxVeEG3XfeOeKRs
         2LOIfvnF1bxEJMCDt7C1fyc/ZTQNddxdUaV/hhbabvrgmYiUeXwd6H2JXjpZnc1YGl9c
         C6pQ==
X-Forwarded-Encrypted: i=1; AL+hErHJzoPgn6DJICGqCX8OPpQ2om4FX1q1WrcRxbc5Ewln5XMYdh0AwnkIukxruZX+wRcqxQu4A+N7gio=@vger.kernel.org
X-Gm-Message-State: APuU4Z8czjmvLAuwyng5/FlJP1MWztAOH2ex3+VbU2gkxTWKdGcPo6Xt
	/0zG80bXCS+8ZrBttv0UnUUf81izEEflxztXJt29uGII7J+UIB0qQ6wWUIA/5+WGuLc=
X-Gm-Gg: AYBFou1I8kUuNjEIYdPXR26eH6tZCQbLUWf4DUJ9N0xJt0tj+1q6nrDl1ruAT/hJMQT
	MkoKnaIyTyF/2QqbhX7pnd86gVumGfKUiPSblMZEhylgpvRT5+tO0iTtsKVpAXIT6wvTrjheTo2
	IS7PCkMyhiB3tgJpuVNbJsQlsvV5hhAcmcIQHi2tCx3t7pqXDqpA8HUcDhGOAVJHF+ICYc8+gkD
	C7C128NoVy2tbwum9DoIhjhn2oYNsb5NVDGf9tX83jCuGa0fh86u/mqdyTIjF56LjbG25BemcxM
	wJv3wr0Fl+c/bDYgOkWTvx0iQeBo6ua64cquuieq6tRUlzLT/B11co5p1owmqoKr71UCQ7Mx9Cm
	i41UtMDD1VdVG1h1gbyVgi1fpDw7soLxa5rHsK0dbj+CIQBPWpdQFMsMeB5fpNh/ke65lRDxETe
	K+4Ou1kt6dzV0t7mHKqJmIlOKNKX92WfajUJfQw4gEn/Hcn5M9f68vjB1IOCr4svRIH9CNbr171
	zfKCeoNv8UpnBn+mD5jDs+d8M5RmA02raZ4bKpSpAdaVZmLEGGSEK3t5Dmr9k/OOe5Sgw80I5l7
	GyTYxUKXVy4g3B66UBqARR8dvEro1iwCL4H7MtB8rHb/ykF8FAa1hBbQ2UMC
X-Received: by 2002:a17:906:c151:b0:c42:102f:15d3 with SMTP id a640c23a62f3a-c5096541a80mr254985966b.34.1794585347782;
        Fri, 13 Nov 2026 07:55:47 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7e5cfsm115330066b.76.2026.11.13.07.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:55:46 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	jgg@ziepe.ca,
	david.quigley@intel.com,
	lukas@wunner.de,
	ksinyuk@kernel.org,
	rodrigo.vivi@intel.com,
	cedric.xing@intel.com,
	sameo@meta.com,
	drdeeglaze@gmail.com,
	James.Bottomley@HansenPartnership.com,
	aik@amd.com,
	jpiotrowski@nvidia.com,
	qinkun@google.com,
	pgonda@google.com,
	jic23@kernel.org,
	alistair.francis@wdc.com,
	ankita@nvidia.com,
	suzuki.poulose@arm.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	peter.fang@intel.com,
	jarkko@kernel.org,
	zohar@linux.ibm.com,
	yeoreum.yun@arm.com,
	aneesh.kumar@kernel.org,
	dave.jiang@intel.com,
	nik.borisov@suse.com,
	sergii.dmytruk@3mdeb.com
Subject: [PATCH RFC v2 06/15] ctlv: Prepare blob descriptor validation
Date: Fri, 13 Nov 2026 16:55:05 +0100
Message-ID: <20261113155515.2510194-7-jiri@resnulli.us>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113155515.2510194-1-jiri@resnulli.us>
References: <20261113155515.2510194-1-jiri@resnulli.us>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Add parsing and VA checks for blob descriptors shared by schema
validation and runtime acquisition.

Keep CONFIG_CTLV unwired until dispatch completes the module.

Assisted-by: Cursor: GPT-5.6 Sol
Assisted-by: Cursor: Claude Opus 5.5
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
RFC->RFCv2:
- returned EOVERFLOW for a blob range that wraps
- said TLV, type, record and field instead of attr
- said record instead of nest, the root being one
- numbered every enum member
- took the UAPI headers from include/uapi/ctlv/
- moved to lib/ctlv/
---
 lib/ctlv/Makefile    |   2 +-
 lib/ctlv/blob_desc.c | 101 +++++++++++++++++++++++++++++++++++++++++++
 lib/ctlv/blob_desc.h |  29 +++++++++++++
 3 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 lib/ctlv/blob_desc.c
 create mode 100644 lib/ctlv/blob_desc.h

diff --git a/lib/ctlv/Makefile b/lib/ctlv/Makefile
index 4f0fe41bc9e1..5edc0b4b973f 100644
--- a/lib/ctlv/Makefile
+++ b/lib/ctlv/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_CTLV) += ctlv.o
 
-ctlv-y += message.o
+ctlv-y += blob_desc.o message.o
diff --git a/lib/ctlv/blob_desc.c b/lib/ctlv/blob_desc.c
new file mode 100644
index 000000000000..7c68ef5702fd
--- /dev/null
+++ b/lib/ctlv/blob_desc.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES
+ *
+ * Blob descriptor parsing and validation.
+ */
+#include <linux/align.h>
+#include <linux/bits.h>
+#include <linux/errno.h>
+#include <linux/overflow.h>
+#include <linux/types.h>
+
+#include <uapi/ctlv/ctlv.h>
+#include <uapi/ctlv/ctlv_gen.h>
+
+#include "blob_desc.h"
+#include "message.h"
+
+static int ctlv_blob_member(u64 type)
+{
+	switch (type) {
+	case CTLV_T_BLOB_TYPE:
+		return CTLV_BLOB_MEMBER_TYPE;
+	case CTLV_T_BLOB_ADDRESS:
+		return CTLV_BLOB_MEMBER_ADDRESS;
+	case CTLV_T_BLOB_FD:
+		return CTLV_BLOB_MEMBER_FD;
+	case CTLV_T_BLOB_OFFSET:
+		return CTLV_BLOB_MEMBER_OFFSET;
+	case CTLV_T_BLOB_LENGTH:
+		return CTLV_BLOB_MEMBER_LENGTH;
+	default:
+		return -1;
+	}
+}
+
+u32 ctlv_blob_desc_read(const struct ctlv_hdr *blob, struct ctlv_blob_desc *desc,
+			const struct ctlv_hdr **bad)
+{
+	const struct ctlv_hdr *child = NULL;
+	enum ctlv_message_step step;
+
+	*desc = (struct ctlv_blob_desc){};
+	while ((step = ctlv_message_next(blob, &child)) == CTLV_MESSAGE_STEP_TLV) {
+		int member = ctlv_blob_member(child->type);
+
+		*bad = child;
+		if (child->flags & ~CTLV_HDR_F_RECORD)
+			return CTLV_VALIDATION_REASON_UNKNOWN_FLAG;
+		if (child->flags & CTLV_HDR_F_RECORD)
+			return CTLV_VALIDATION_REASON_MALFORMED_MESSAGE;
+		if (member < 0)
+			return CTLV_VALIDATION_REASON_UNKNOWN_TYPE;
+		if (ctlv_message_hdr_payload_len(child) != sizeof(u64))
+			return CTLV_VALIDATION_REASON_BAD_LENGTH;
+		if (desc->present & BIT(member))
+			return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+		desc->present |= BIT(member);
+		desc->member[member] = *(const u64 *)ctlv_message_hdr_payload(child);
+	}
+	*bad = NULL;
+	if (step == CTLV_MESSAGE_STEP_BAD)
+		return CTLV_VALIDATION_REASON_MALFORMED_MESSAGE;
+	return 0;
+}
+
+static bool ctlv_blob_variant_ok(const struct ctlv_blob_desc *desc)
+{
+	u32 required = BIT(CTLV_BLOB_MEMBER_TYPE) | BIT(CTLV_BLOB_MEMBER_LENGTH);
+
+	switch (desc->member[CTLV_BLOB_MEMBER_TYPE]) {
+	case CTLV_BLOB_TYPE_VA:
+		required |= BIT(CTLV_BLOB_MEMBER_ADDRESS);
+		break;
+	default:
+		return false;
+	}
+	return desc->present == required;
+}
+
+/* Every failure is a bad descriptor; only a range that wraps is -EOVERFLOW. */
+int ctlv_blob_desc_check(const struct ctlv_blob_desc *desc, const struct ctlv_node_schema *node)
+{
+	u64 start, length, end;
+
+	if (!ctlv_blob_variant_ok(desc) ||
+	    !(node->blob.backings & BIT(desc->member[CTLV_BLOB_MEMBER_TYPE])))
+		return -EINVAL;
+
+	length = desc->member[CTLV_BLOB_MEMBER_LENGTH];
+	if (!length || length > node->blob.max_len)
+		return -EINVAL;
+	start = desc->member[desc->present & BIT(CTLV_BLOB_MEMBER_ADDRESS) ?
+				     CTLV_BLOB_MEMBER_ADDRESS :
+				     CTLV_BLOB_MEMBER_OFFSET];
+	if (!IS_ALIGNED(start, node->blob.alignment))
+		return -EINVAL;
+	if (check_add_overflow(start, length, &end))
+		return -EOVERFLOW;
+	return 0;
+}
diff --git a/lib/ctlv/blob_desc.h b/lib/ctlv/blob_desc.h
new file mode 100644
index 000000000000..e88693cbee4b
--- /dev/null
+++ b/lib/ctlv/blob_desc.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _CTLV_BLOB_DESC_H
+#define _CTLV_BLOB_DESC_H
+
+#include <linux/ctlv_family.h>
+#include <linux/types.h>
+
+#include <uapi/ctlv/ctlv.h>
+
+/* The members of a descriptor, in the order the root family declares them. */
+enum {
+	CTLV_BLOB_MEMBER_TYPE = 0,
+	CTLV_BLOB_MEMBER_ADDRESS = 1,
+	CTLV_BLOB_MEMBER_FD = 2,
+	CTLV_BLOB_MEMBER_OFFSET = 3,
+	CTLV_BLOB_MEMBER_LENGTH = 4,
+	CTLV_BLOB_MEMBERS = 5,
+};
+
+struct ctlv_blob_desc {
+	u64 member[CTLV_BLOB_MEMBERS];
+	u32 present;
+};
+
+u32 ctlv_blob_desc_read(const struct ctlv_hdr *blob, struct ctlv_blob_desc *desc,
+			const struct ctlv_hdr **bad);
+int ctlv_blob_desc_check(const struct ctlv_blob_desc *desc, const struct ctlv_node_schema *node);
+
+#endif /* _CTLV_BLOB_DESC_H */
-- 
2.56.0

