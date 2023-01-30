Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE4DC54EED
	for <linux-doc@archiver.kernel.org>; Mon, 30 Jan 2023 18:23:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237955AbjA3SXh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Jan 2023 13:23:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237710AbjA3SX0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Jan 2023 13:23:26 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B5076B1
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:22:55 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso11932722pjb.4
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Gxugdzqzv74vjLFN2TZ8EvRMhrnTxWt9U64bf/S3Oc=;
        b=HoT+WfLCPPdnBPUY4u//wG/nqz54nnbVNEyB/zyFuh1wqwl7dUUdORc82V0pXzgGqI
         P+YM1ucudSo6RbZP1NN8kR1hUTZHRzmX3X900Mruv8tZUv4pInMpR+m5wxoBS9EOCAan
         KAz+PN2XnNL5mEey1FiMMcqZnFzJ5utcOjeTPA6tGPvAI354RrTSw64eae8l9V3M7mNe
         UOTtpDsckz5dXpGxWPyskJY1LeUUYZ7v7meb1XdF/dwjbC/P4hZJlV9J05dYQB5Y43Y3
         OwizeHCRBrpe676Q1ZZ55JKz5XeEHId+0SX3YBESwKsZLHWSYkYSSOQpQXIKVCIwWoxa
         EH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Gxugdzqzv74vjLFN2TZ8EvRMhrnTxWt9U64bf/S3Oc=;
        b=vWNrR+6jVK1y4eYJJnEqYhpWMKcLwAoWPdw1ZjXrOkclB0XZnHqAyjQEmlvJT+RvNp
         QBjGSk0G1BGQ4xOmod3Tww8G/l8QtUVyclKYYc8j8L42nMlGSLHD4SfCekZrNcUQaOVQ
         ILonXweDqviET+sZVQ4VqT9vqnekQNzMznM0dfZpTkt9kbL+hzF7eRlB7hb8CHtGqTev
         yOt1YJuVK9FOph9+pZ2xfJQPEWh+OZRtav2JUbZJE4YiU4imDGkQK5aY7rTHfa1LK5sQ
         F9EgOInO06o6XMeTSsJFoT38IudbZRY5egARyIo2txAxjFSDd2S9Xst5jB+akdQ5cTb3
         38EQ==
X-Gm-Message-State: AO0yUKW5+LWq+a38EewFwM2zTnAhwuZxFBX7wZ9FtFLIwn5mppVmaS5G
        P+fLHU+Rmhw+S8POSE64lvcyv1L4H0Cejtlc
X-Google-Smtp-Source: AK7set/oaqjYHxZkFri7nAIEqSWUP50dWr7zEqKA6GyAWIBxDhDJBbMSoEj9UgNo8WKJ+5WDx5WxUw==
X-Received: by 2002:a17:90b:33c2:b0:22c:1bd6:77de with SMTP id lk2-20020a17090b33c200b0022c1bd677demr18654479pjb.3.1675102972682;
        Mon, 30 Jan 2023 10:22:52 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:22:52 -0800 (PST)
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
Subject: [PATCH 04/24] RISC-V: ACPI: Add empty headers to enable ACPI core
Date:   Mon, 30 Jan 2023 23:52:05 +0530
Message-Id: <20230130182225.2471414-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Few header files are required unconditionally by ACPI core.
So add empty header files for now and update it when needed.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/acenv.h | 17 +++++++++++++++++
 arch/riscv/include/asm/cpu.h   |  9 +++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/riscv/include/asm/acenv.h
 create mode 100644 arch/riscv/include/asm/cpu.h

diff --git a/arch/riscv/include/asm/acenv.h b/arch/riscv/include/asm/acenv.h
new file mode 100644
index 000000000000..bbc38ecdf753
--- /dev/null
+++ b/arch/riscv/include/asm/acenv.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * RISC-V specific ACPICA environments and implementation
+ *
+ * Copyright (C) 2014, Linaro Ltd.
+ *   Author: Hanjun Guo <hanjun.guo@linaro.org>
+ *   Author: Graeme Gregory <graeme.gregory@linaro.org>
+ * Copyright (C) 2023, Ventana Micro Systems Inc.
+ *   Author: Sunil V L <sunilvl@ventanamicro.com>
+ */
+
+#ifndef _ASM_ACENV_H
+#define _ASM_ACENV_H
+
+/* It is required unconditionally by ACPI core, update it when needed. */
+
+#endif /* _ASM_ACENV_H */
diff --git a/arch/riscv/include/asm/cpu.h b/arch/riscv/include/asm/cpu.h
new file mode 100644
index 000000000000..51ec1a89a7a9
--- /dev/null
+++ b/arch/riscv/include/asm/cpu.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2014 ARM Ltd.
+ * Copyright (C) 2023 Ventana Micro Systems Inc.
+ */
+#ifndef __ASM_CPU_H
+#define __ASM_CPU_H
+
+#endif /* __ASM_CPU_H */
-- 
2.38.0

