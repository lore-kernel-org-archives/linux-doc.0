Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2CDC61DA4
	for <linux-doc@archiver.kernel.org>; Thu, 16 Feb 2023 18:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbjBPSXX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Feb 2023 13:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbjBPSWh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 13:22:37 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F079D50378
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:22:12 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id z14-20020a17090abd8e00b00233bb9d6bdcso2958280pjr.4
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vv/SJn971dfjdTrZfssRImVac3G99NBb7ONmt1Vsq2I=;
        b=myJLNPbRJLi/wYDYC+up98t51CDSvleQNl+jgG0GytS3WhARAlv6QffJ1MZuDRuhyU
         8nx+Iqk3/0KdzmA3KZj7nwInkmfGs4j8tDN+L8Vu+X478ausemy9Wu5+S7F96/g0/aP4
         6SJcqu0eqxByONPkPg6XnsFYBAkhdoWdSfHoNJetFsAg24XKyXXc6ALuunxuhMjGApeS
         3RJQ1bIyZZJRcBM/v640JXSPpA8mjzq5s2a72ChX7W0uTYD2fOAIchRGYp/4yOEjIl5D
         tDnC5SXkZ9P0rYtWqNgSCJ5fpvmDvMwd9aOziTUVR0hXElPSBVuov+zz6/eecwNO7wHJ
         xDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vv/SJn971dfjdTrZfssRImVac3G99NBb7ONmt1Vsq2I=;
        b=tiyeV6QVYqJlnnZfrqx+eEhKAjJkMtuprDE6LERFCpckA5wzrlcXCvnzr+EVgyIUks
         0Skwh6kMFJv17IodSn7LqMuLntMhnrEwEE4mG/LmqdvJ3xo9UpucCNNEwbrtPEKWxzfA
         4W4EuueLXTp6rJDlG9t9Jv6xqIjVkZFJsy7JQ0QtwT/AozJkiynxyr+CTLiot0s3ooMH
         3yBjA3xAJV3j0eIfGknY1qsaIYmNgCyz7XF1uZ8QoUWE40zZuMeZKll3vpNaMXJ/J/ng
         9INiwYFykYZfG9PobKU4SlRul1ZIFOd+T5g7uGGQO9PKhGA7cZM216NdOcPMRKuCgQt/
         Fvrw==
X-Gm-Message-State: AO0yUKXg7fDo7tkZJmkxkKpVdpR2KcVEH7KmYfLuLNxfrBhjBQgt79Ih
        VoiMpsQ8qTaVCr/RdTFhWCGoNA==
X-Google-Smtp-Source: AK7set+NBRmM54Hgp3O9CpS/Jfakh9iB+b7vBRwhQtSjUmCXjPcQd5RBQeVnlUJ0IOn5iswQgx12sA==
X-Received: by 2002:a05:6a21:338c:b0:bc:b1ec:89f3 with SMTP id yy12-20020a056a21338c00b000bcb1ec89f3mr7638758pzb.50.1676571729309;
        Thu, 16 Feb 2023 10:22:09 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:22:08 -0800 (PST)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V2 16/21] clocksource/timer-riscv: Add ACPI support
Date:   Thu, 16 Feb 2023 23:50:38 +0530
Message-Id: <20230216182043.1946553-17-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Initialize the timer driver based on RHCT table on ACPI based
platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/clocksource/timer-riscv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 2ae8e300d303..5fb0eac52bdd 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) "riscv-timer: " fmt
 
+#include <linux/acpi.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -201,3 +202,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
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

