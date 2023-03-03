Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91B0C678D4
	for <linux-doc@archiver.kernel.org>; Fri,  3 Mar 2023 13:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbjCCNja (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Mar 2023 08:39:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjCCNiv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Mar 2023 08:38:51 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743535B5D9
        for <linux-doc@vger.kernel.org>; Fri,  3 Mar 2023 05:38:14 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id m8-20020a17090a4d8800b002377bced051so6207447pjh.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Mar 2023 05:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMb23HWhySGYdHuXuceG1Hdu0cCgMlhnof5Rv5oG2UE=;
        b=YaLquxhCPRvn9XYOirByRSWmifW1Bn1w1P/4+23IN1f/6lO49egVrOidPasa7r+JPF
         WDNTXFtu6MYTmoqMyF7YnSg7ucqRtv3EKeD+Ugsew+MmlsK/sVg7aPZEfcC7fLlBZCH9
         5k9eNzA9Ou6s9mb3gODhGum/QIUctlbY3rJtJz2yfiJCN6aVLuoU+SrNdOuWZ57pJx/2
         OJ3JIi1t9OhDZg8c4RghkZVsvZ3MfSGFEFKnU7m1zh7fjPkHn5OZ736VSBWTSyb3qYL5
         443k5gbPfEP521j4jODRVWWcX2m68/1WuaK3r2I2hWcdxtB0Sb6rYRhztyht9vmkA2sA
         xz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMb23HWhySGYdHuXuceG1Hdu0cCgMlhnof5Rv5oG2UE=;
        b=Wjg4uwXlrga3OPoJ2qEwkBf9OqFISkhywlaKEMNpRfA8xE09hyvuJGVpk4ZuRaI6w0
         SzQ4TYpEFkLc0geQUDkCR6PhujownJhQs7iRkXBGq+0WgZ7Nn8OJ6AjCfUzIC+GymlEn
         J6DLXhHZRx1ZVI8Qrcj8BHux+Bxo0XFen/++NXkxBi9igVD8m0xtPpa/pr+UnLfgHRD0
         nV4mufM6nO7IRVBDBC2wQBmCbMwB7WrY/uRgxGFug1vNw3NnW3S9OnGexmN0EXyXOJAB
         nZ1qcfdstStYmr9U0bPARM/OsrYKXGams/PX86IZwZ4zY4tA5+xOJ4dpOljqQN9T2Cgl
         uqyA==
X-Gm-Message-State: AO0yUKVj3WroG5VR8pvZj8UJihzM+4v6xlcdRny8DQsbNhZN5P9vD9LP
        lMscQa9JNTP6f23pGFIMiDdVow==
X-Google-Smtp-Source: AK7set+tm8aOgYZk9xBaZnStYA78ITXnao6Ey/Ao6F5/PsR7mqEz365HsV945p8qDb1vjZKOvue9gw==
X-Received: by 2002:a17:902:ec8d:b0:19a:a9dd:ed3f with SMTP id x13-20020a170902ec8d00b0019aa9dded3fmr2238776plg.49.1677850692265;
        Fri, 03 Mar 2023 05:38:12 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:38:12 -0800 (PST)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Anup Patel <apatel@ventanamicro.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        'Conor Dooley ' <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V3 16/20] clocksource/timer-riscv: Add ACPI support
Date:   Fri,  3 Mar 2023 19:06:43 +0530
Message-Id: <20230303133647.845095-17-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Initialize the timer driver based on RHCT table on ACPI based
platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index cecc4662293b..da3071b387eb 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) "riscv-timer: " fmt
 
+#include <linux/acpi.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -207,3 +208,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 }
 
 TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
+
+#ifdef CONFIG_ACPI
+static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
+{
+	return riscv_timer_init_common();
+}
+
+TIMER_ACPI_DECLARE(aclint_mtimer, ACPI_SIG_RHCT, riscv_timer_acpi_init);
+
+#endif
-- 
2.34.1

