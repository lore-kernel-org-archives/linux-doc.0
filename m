Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDA3C54EED
	for <linux-doc@archiver.kernel.org>; Mon, 30 Jan 2023 18:25:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238151AbjA3SZn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Jan 2023 13:25:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238293AbjA3SZI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Jan 2023 13:25:08 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2508B46720
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:23:57 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id e6so4319461plg.12
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oj1LIEiLCoH05jrvnS3NlcMWxNoKVbL+lD4xO5ixkXk=;
        b=Fif22sd+vUzBxEdZTO7ggfqnbyFrI2PJ8YxpRqjkwlowbQ/NkixyrA983sr/7ZeVmd
         leFJfBj9Lx9vkhEST6x3PRoEM1u4f/SDf5gomtoKWkZpW1oBzl5+xvoK5OnXzzfaHKVI
         BzyrTkNWdmsDKPjNYL26bqS6U5FnoB3dQumvpCbEptNphWmtp8/MHGkOiv8t2pyJRJ8f
         sC0JWzH38GqYdhkv+KzYl67hIKWkV6j9JgKyR1s9jMx7B/NQgHRyQm2kErlHlyXY5jiT
         XKrKUqiWGTQF2nv6LwhdJW/qcn9V9rZdhfVrADahWNvR/mfBgmqrheiz+ZYUrEImnzIQ
         pJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oj1LIEiLCoH05jrvnS3NlcMWxNoKVbL+lD4xO5ixkXk=;
        b=jUpVTWJu2fxmJndRpXizBV1u6lz7cxKBEsB6kaOkY7QqPYcI7V0Oir65kbgRHE5+Ny
         KEhdIMiiEk+eHt6szazbtqb4BDdc9K51g1fhXH51oPklCLSAAi78ycXIpfyTeWdWKEVe
         mjZDTzPgA9+TKvlQkJsDjrW5J1LPN0DbcKIJP51/rr8xOgs6bIIdJVvQSegO8ChtU1pV
         3bi5rSRGHY9LvvM/xgIBRaS9IMXkt5SlqpnGg1BQbVJE3BT2kdvpaKWzBYJjDU9mjzVN
         l9/kF6X29kN1BwX7Ciky3GjyPU73VuSoGceSZfR86ITFMrv3f8a5mFjhIMjVRnVKhCPv
         Yd+w==
X-Gm-Message-State: AO0yUKX1G1CldAMAiQBG1nYYvaf6xBUy9tMwt+4vzbTNZk0Qy1wRJIcp
        jXmtCXz5yqjAFk+rs4jK8THKqg==
X-Google-Smtp-Source: AK7set+puhVa9cJ8iCwi92Dm20DUxJcSdv4a3WaLuK30pYTL5oETRGKnE0e7xLE+vt4N2Zob+KA6/g==
X-Received: by 2002:a17:90b:4a10:b0:22b:f608:2aa6 with SMTP id kk16-20020a17090b4a1000b0022bf6082aa6mr24859836pjb.18.1675103031096;
        Mon, 30 Jan 2023 10:23:51 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:50 -0800 (PST)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Anup Patel <apatel@ventanamicro.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 17/24] ACPI: RISC-V: drivers/acpi: Add RHCT related code
Date:   Mon, 30 Jan 2023 23:52:18 +0530
Message-Id: <20230130182225.2471414-18-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

RHCT is a new table defined for RISC-V to communicate the
features of the CPU to the OS. Create a new architecture folder
in drivers/acpi and add RHCT parsing code.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h |  5 ++
 drivers/acpi/Makefile         |  2 +
 drivers/acpi/riscv/Makefile   |  2 +
 drivers/acpi/riscv/rhct.c     | 93 +++++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)
 create mode 100644 drivers/acpi/riscv/Makefile
 create mode 100644 drivers/acpi/riscv/rhct.c

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 69a880b7257a..4fec9ea3b874 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -71,11 +71,16 @@ static inline u32 get_acpi_id_for_cpu(int cpu)
 {
 	return	acpi_cpu_get_madt_rintc(cpu)->uid;
 }
+int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const char **isa);
 #else
 static inline u32 get_acpi_id_for_cpu(int cpu)
 {
 	return -1;
 }
+int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const char **isa)
+{
+	return -1;
+}
 
 #endif /* CONFIG_ACPI */
 
diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index feb36c0b9446..3fc5a0d54f6e 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -131,3 +131,5 @@ obj-y				+= dptf/
 obj-$(CONFIG_ARM64)		+= arm64/
 
 obj-$(CONFIG_ACPI_VIOT)		+= viot.o
+
+obj-$(CONFIG_RISCV)		+= riscv/
diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
new file mode 100644
index 000000000000..8b3b126e0b94
--- /dev/null
+++ b/drivers/acpi/riscv/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y 	+= rhct.o
diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
new file mode 100644
index 000000000000..7c64be64d9d9
--- /dev/null
+++ b/drivers/acpi/riscv/rhct.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022-2023, Ventana Micro Systems Inc
+ *	Author: Sunil V L <sunilvl@ventanamicro.com>
+ *
+ */
+
+#define pr_fmt(fmt)	"ACPI: RHCT: " fmt
+
+#include <linux/acpi.h>
+
+static void acpi_rhct_warn_missing(void)
+{
+	pr_warn_once("No RHCT table found\n");
+}
+
+static struct acpi_table_header *acpi_get_rhct(void)
+{
+	static struct acpi_table_header *rhct;
+	acpi_status status;
+
+	/*
+	 * RHCT will be used at runtime on every CPU, so we
+	 * don't need to call acpi_put_table() to release the table mapping.
+	 */
+	if (!rhct) {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
+		if (ACPI_FAILURE(status))
+			acpi_rhct_warn_missing();
+	}
+
+	return rhct;
+}
+
+/*
+ * During early boot, the caller should call acpi_get_table() and pass its pointer to
+ * these functions(and free up later). At run time, since this table can be used
+ * multiple times, pass NULL so that the table remains in memory
+ */
+int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int acpi_cpu_id, const char **isa)
+{
+	struct acpi_rhct_node_header *node, *ref_node, *end;
+	struct acpi_table_rhct *rhct;
+	struct acpi_rhct_hart_info *hart_info;
+	struct acpi_rhct_isa_string *isa_node;
+	u32 *hart_info_node_offset;
+	int i, j;
+
+	if (acpi_disabled) {
+		pr_debug("%s: acpi is disabled\n", __func__);
+		return -1;
+	}
+
+	if (!table) {
+		rhct = (struct acpi_table_rhct *)acpi_get_rhct();
+		if (!rhct)
+			return -ENOENT;
+	} else {
+		rhct = (struct acpi_table_rhct *)table;
+	}
+
+	node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
+	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->header.length);
+
+	for (i = 0; i < rhct->node_count; i++) {
+		if (node >= end)
+			break;
+		switch (node->type) {
+		case ACPI_RHCT_NODE_TYPE_HART_INFO:
+			hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node,
+					sizeof(struct acpi_rhct_node_header));
+			hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info,
+					sizeof(struct acpi_rhct_hart_info));
+			if (acpi_cpu_id != hart_info->uid)
+				break;
+			for (j = 0; j < hart_info->num_offsets; j++) {
+				ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
+						rhct, hart_info_node_offset[j]);
+				if (ref_node->type == ACPI_RHCT_NODE_TYPE_ISA_STRING) {
+					isa_node = ACPI_ADD_PTR(struct acpi_rhct_isa_string,
+							ref_node,
+							sizeof(struct acpi_rhct_node_header));
+					*isa = isa_node->isa;
+					return 0;
+				}
+			}
+			break;
+		}
+		node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node, node->length);
+	}
+
+	return -1;
+}
-- 
2.38.0

