Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4623C678D4
	for <linux-doc@archiver.kernel.org>; Fri,  3 Mar 2023 13:38:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbjCCNig (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Mar 2023 08:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbjCCNiH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Mar 2023 08:38:07 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5ED5A6C5
        for <linux-doc@vger.kernel.org>; Fri,  3 Mar 2023 05:37:40 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id y2so2520167pjg.3
        for <linux-doc@vger.kernel.org>; Fri, 03 Mar 2023 05:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pi8xH0IxXrFGj4CxsC9boyEOiTx1Qa4CmKA7c/Mr88=;
        b=ospJEN1H+o62BETHuMHU/j9Q2xjVV+b+WkaZuGnP3T/+3pPt9ngIgnJeGsoBFW/TO0
         6hwXGOXmHiK6F4logs+p2Up85lMfjy7zUU7DDihJAoUad7IQ8acc6QgTZ/12/ZcvcMAx
         f2SRlvk4EDhFMhYjuxKm8I5zvoZOZVqOYZbmqZPXznA6rWLgNPg6XvSxRXLjp0yK4014
         4sgcyZrl7Os6aroKX6L/49uK+6PgZ6tA98MFBqPc9KNHk9nagm3iUiBc0pepZ+qfWSIl
         AMFj2DMCJZ82vffzVKpYynki1Q6XU9ob/ThV79YCGGgi8PFMsbu/YYP0ahJM7K1X6wjJ
         jDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pi8xH0IxXrFGj4CxsC9boyEOiTx1Qa4CmKA7c/Mr88=;
        b=TmVpfDeAwthL3PuszdakxqN1E45Q1hSMd4L9F9af7IvYrHrbi7MAbJ7R91O+7bJgld
         K0LClbkZv/rbAFdbWLLLnzNgFc+sgWTuSCNVe/FLPyXkumlogBRtjdfdTIyH7c/ExfXx
         eCImf3QEgbFeV39sOqfO4ftu6eVdN+Jf9abSRIkwwGjW3l/acX/e8Bg0vrZ0g0A+VFgF
         UhNtI/BuSakXYYiKDsjRK1cg2QhMdFIvcbTmvYtO2Z3w1vtnaiH8geQfNMUUVvvozZrJ
         cbF88bCKXBsKXlaxPqbURXc/EeCe6l90TnJCEb6+WNq4CVfHX5WZu82yq6jLtI8id2BF
         FvmA==
X-Gm-Message-State: AO0yUKUTVuNuqf3EldS7SeUK4nN5ESkAuHYpCGXUlo5GUjHhxDtg2rmu
        9//Vq7VSQnzrDYxSjjlZUqPhNQ==
X-Google-Smtp-Source: AK7set/n1ssQQjUjID0NxGei92GK70/GndvtpN5XR0Ch5wvj7TQe8/xVBnKzQ9qiTHpWUDkc1vrL3A==
X-Received: by 2002:a17:902:a9c6:b0:19e:7c33:3722 with SMTP id b6-20020a170902a9c600b0019e7c333722mr1673766plr.40.1677850658806;
        Fri, 03 Mar 2023 05:37:38 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:38 -0800 (PST)
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
Subject: [PATCH V3 09/20] RISC-V: smpboot: Create wrapper smp_setup()
Date:   Fri,  3 Mar 2023 19:06:36 +0530
Message-Id: <20230303133647.845095-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

smp_setup() currently assumes DT-based platforms. To enable ACPI,
first make this a wrapper function and move existing code to
a separate DT-specific function.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/smpboot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 00b53913d4c6..26214ddefaa4 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -70,7 +70,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
-void __init setup_smp(void)
+static void __init of_parse_and_init_cpus(void)
 {
 	struct device_node *dn;
 	unsigned long hart;
@@ -116,6 +116,11 @@ void __init setup_smp(void)
 	}
 }
 
+void __init setup_smp(void)
+{
+	of_parse_and_init_cpus();
+}
+
 static int start_secondary_cpu(int cpu, struct task_struct *tidle)
 {
 	if (cpu_ops[cpu]->cpu_start)
-- 
2.34.1

