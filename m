Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0D9C54EED
	for <linux-doc@archiver.kernel.org>; Mon, 30 Jan 2023 18:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237958AbjA3SZP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Jan 2023 13:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238214AbjA3SYw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Jan 2023 13:24:52 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B3746700
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:23:51 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id k13so12603427plg.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cCnuU35jZVdGCs4yph98OuVncVWSdeJqbA2ZAZB9Sg=;
        b=NVtPhRYVJSJbR/Cn4eg5T9W8xFMyMV7bk4qOp93b6jBCozBeskRQIZ+EA9Z1qfBD9j
         E1Sd1jPsX8pG7hOnlx6mIsqgKxStk6YpAQcNjkgsOFtvhEZSA8JE9p8vBxv6rbLiQkV1
         Whf1k/35Fovb7D3gyWhiSxoyXLHY0vPKsJI+5P8rjVD6Dg7KTUu/cGAtD74EGAWRsWzV
         rlnZitm/zmG3r4ZBslpFcNOnpb3QnyJeq/86JXJhcLrbn9ElxHwIWy0mJDeRMLn20Toy
         Hs80lxP5/A0rw3/QNj9Xqoegzn7mciAe5fzStukCmQpvpk7Ruh0qJh+GbNRkJPovzpHF
         05Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cCnuU35jZVdGCs4yph98OuVncVWSdeJqbA2ZAZB9Sg=;
        b=AT/gti7vew+I770olYrb4V2LfQO7E97OqHt4/MKQYggAilllb4UcapzsbPBKD/n1fG
         CZyHF0tvy5TBfNZJuBWelrN4MhOuyuOk+VZQKRWrePFZLxsJhOgaxJIH9bcrV0UPsfbu
         A+aPNB1xkbAb3R/yu8AWl6YP/knHT0Jlp5egjfConmI/8H3wfK1isowExdc9DufHD5Ie
         80jDY93oNmzW0rtiw16jfuB7nkMo9aDAbghapHGoyHbafpRu67tbMstsuJLe9o+pcYyr
         +5DLLb00u0/FLU20+3wHH2BhQjfgBR4mdt+L2/5Fxjv2pAMZ7sOCVH8WjkK0CNtR5I8z
         xPTg==
X-Gm-Message-State: AO0yUKX9IefOaqdpdICB0HGXEBBZAXp66K/Vgi/N+2Zq3+bVYrYzV0FB
        PH5biInyKglnqieNylofl186qQ==
X-Google-Smtp-Source: AK7set/sHqOwf+i227vA8zak7mnLlMCBogBTamE5mkGyExKgvQi0skSSDX6wAhSKthnfxNl70LtsQw==
X-Received: by 2002:a05:6a20:4282:b0:be:a189:1475 with SMTP id o2-20020a056a20428200b000bea1891475mr3044724pzj.47.1675103026826;
        Mon, 30 Jan 2023 10:23:46 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:46 -0800 (PST)
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
Subject: [PATCH 16/24] RISC-V: ACPI: clocksource/timer-riscv: Add ACPI support
Date:   Mon, 30 Jan 2023 23:52:17 +0530
Message-Id: <20230130182225.2471414-17-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

timer-riscv driver needs to get the timebase-frequency from
RISC-V Hart Capabilities Table (RHCT) on ACPI platforms. Add
support to read the information from RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 4016c065a01c..8079666753a6 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) "riscv-timer: " fmt
 
+#include <linux/acpi.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -198,3 +199,11 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 }
 
 TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
+
+#ifdef CONFIG_ACPI
+static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
+{
+	return riscv_timer_init_common();
+}
+TIMER_ACPI_DECLARE(aclint_mtimer, ACPI_SIG_RHCT, riscv_timer_acpi_init);
+#endif
-- 
2.38.0

