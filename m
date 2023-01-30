Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84012C54EED
	for <linux-doc@archiver.kernel.org>; Mon, 30 Jan 2023 18:25:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236705AbjA3SZL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Jan 2023 13:25:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238095AbjA3SYA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Jan 2023 13:24:00 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFBC445F40
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:23:29 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id b24-20020a17090a551800b0022beefa7a23so16360659pji.5
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2V4bEO8aGCUnvICkvYFTtflr32JlbC6lkp0g+wowtbM=;
        b=lk2FS4bi5tXkC1KwlB7IR9frYJNCQB46zRuLBebN5lBJ8cN3scRheCqCzNq02LquDZ
         T7s0yo1+o/et+QSWknYJCYgYVrAhIpx0Q9RFeIJULyKKzgmtGBS8BkeM/vl6wKvrBMjp
         mUvQzp6EXvFNRLO9+5Kiu1elg30zaPMBmDpWZO2NqlSDLjfGA8M/9cZI0DQaxiOgClDj
         0kOWsS7nvZZg3rIfS/7ZgCLiyEXy42cw6D20wqCpo9xvkn4YN9s2Y8p41QXLbbX33pYG
         yt0yEkzirf4so3ujS3owGMIcP4HQ2+eRccoCcxPRQaOr8cvUU/UP8Tzs1QvpGKrSAhji
         ekYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2V4bEO8aGCUnvICkvYFTtflr32JlbC6lkp0g+wowtbM=;
        b=lfGmcZatHMa47K2GIR5C1IZHkHbFzYS/unRaNReJyV4BAnJSQVq1hRa3N4JS3eNVtU
         AyU+aJmLPwCgsc1b7Ozm83gL9yOjlIkF+YsD5CdjH7xw+AZyOf9gIOs/Q7JAiP/gVYXQ
         7qkbQeD/eULPJDKYra7gAnCi1DMTNjXro5VjqMRHagNo+Lh391Ldh4xoF6h0OIcjzo9+
         nQJUaNmrJf3C4Hpm9C9aNVtjhrvcwvGqoO4n1IoSi3sKRles2zFW1dDg9DYkLQXmj00n
         QcKz0fFnZKAybnqthCofIe8Ek5JNIdMo6owzUx9Bzl09e5/EzSMkcMffqViwYh8YM+b1
         ZYTg==
X-Gm-Message-State: AO0yUKUHz+eBY1ERKkQgfMM9l3bZD7b3sFkuOxFpWHT7Pj+4afqdow5K
        qFo2h154wIxw3F+xBvld5L6jIw==
X-Google-Smtp-Source: AK7set/tX5Xt8agYBu/KLyJy+OnSgmLrgEYtXB6QpcbJp9X24yqEp94vp4kVKhN3pU5/ZWvnJCibGA==
X-Received: by 2002:a05:6a20:8e19:b0:bc:db54:27d7 with SMTP id y25-20020a056a208e1900b000bcdb5427d7mr5597928pzj.59.1675103009111;
        Mon, 30 Jan 2023 10:23:29 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:28 -0800 (PST)
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
Subject: [PATCH 12/24] RISC-V: ACPI: smpboot: Create wrapper smp_setup()
Date:   Mon, 30 Jan 2023 23:52:13 +0530
Message-Id: <20230130182225.2471414-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

smp_setup() currently assumes DT based platforms. To enable ACPI,
first make this as a wrapper function and move existing code to
a separate DT specific function.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
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
2.38.0

