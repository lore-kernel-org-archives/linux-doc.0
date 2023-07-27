Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568BEC001DC
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jul 2023 14:27:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbjG0O1U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jul 2023 10:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233104AbjG0O1T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 10:27:19 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC242D40
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 07:27:17 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31763b2c5a4so1097006f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 07:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690468036; x=1691072836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91jtKpAX8BKXnlM2DqECzDjrTgIUONnRJGEpBfq59o4=;
        b=USVtlzZpNwlYrsQ/yWuVvPJRGGc68ABNqkAYawYirkXn7ZDuug3OTHFZiUyezO7zda
         zGcr8wBTIGK2jIwXcydY8wz70yiXl/2gtFoFFqUROTaVNxkcaF1qwUTPGaWD14w2PTvO
         BIrYBbC3g+PleFK3ZHxJLfZE8n3mzvSPjUlpZH2pJJVLlQi7uMxJnDxJVgTExpOhiLwQ
         rN3BDxQ5jQZ1Y5LNxPkC6gTGFIkfNsL5zGj8utGStZ1gc6WWAqb/23rigAebUbt5YvbA
         ERiLCKS0iev3LQVaq9aa+s9Wx3HIeZ42CARfGbLjAl9BUCw3E0mlK6NA1DSEBd+uhTbm
         nZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468036; x=1691072836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91jtKpAX8BKXnlM2DqECzDjrTgIUONnRJGEpBfq59o4=;
        b=dLQSCUv6ig9Ho+dnpPwsJD2FfMW9eM+pQymfJ1hTJR9k4yvPUskqRSNkhCBtAxK681
         uOdw8nPJ9rcpC7A9zOT2ycb5dGjZUN8nLzneoBxyjJRqxEyTXfOZzP453hLLQdHLpz2n
         Fz8emgB8s9lv+lX/cZhZ5Dy7k7F/P4FzkKo1sGe9M+MzsM7FTJia3DIc5vVHMOr/Vs4A
         s2SI/ovjpKtfRaMBIRoapDGQFNYQmbrW7dL6Vp0M4VUn5RWf6OKk7Oa5fvIWkC2dHphw
         0Rc6BBAL+pyOnvm6m3g2x/feD3t7S/6l9yFgYg5CHIGTri5Bo3rfF4J4RVtUiBEMOMrI
         r/0A==
X-Gm-Message-State: ABy/qLbyiFzyXmbNbhw/xwobdxXJkrFW/L1MTFcCSdEz1+INh6esZYC4
        70P3TJgwGBQjZqGDvm6c2P/0Mg==
X-Google-Smtp-Source: APBJJlGi6sdh3z78UtOfwf67hU0/mwQxZ1a4Ih0Kmo4uc5K941Szn210hkA/E32YMDfeTSdDnLxI8w==
X-Received: by 2002:a5d:428a:0:b0:317:5cfb:714e with SMTP id k10-20020a5d428a000000b003175cfb714emr2129750wrq.55.1690468035860;
        Thu, 27 Jul 2023 07:27:15 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id y18-20020a5d6212000000b003143c6e09ccsm2266885wru.16.2023.07.27.07.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:27:15 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atishp@atishpatra.org>,
        Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Andrew Jones <ajones@ventanamicro.com>,
        =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 08/10] Documentation: admin-guide: Add riscv sysctl_perf_user_access
Date:   Thu, 27 Jul 2023 16:14:26 +0200
Message-Id: <20230727141428.962286-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727141428.962286-1-alexghiti@rivosinc.com>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

riscv now uses this sysctl so document its usage for this architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 27 ++++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 3800fab1619b..8019103aac10 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -941,16 +941,35 @@ enabled, otherwise writing to this file will return ``-EBUSY``.
 The default value is 8.
 
 
-perf_user_access (arm64 only)
-=================================
+perf_user_access (arm64 and riscv only)
+=======================================
+
+Controls user space access for reading perf event counters.
 
-Controls user space access for reading perf event counters. When set to 1,
-user space can read performance monitor counter registers directly.
+arm64
+=====
 
 The default value is 0 (access disabled).
 
+When set to 1, user space can read performance monitor counter registers
+directly.
+
 See Documentation/arch/arm64/perf.rst for more information.
 
+riscv
+=====
+
+When set to 0, user space access is disabled.
+
+The default value is 1, user space can read performance monitor counter
+registers through perf, any direct access without perf intervention will trigger
+an illegal instruction.
+
+When set to 2, which enables legacy mode (user space has direct access to cycle
+and insret CSRs only). Note that this legacy value is deprecated and will be
+removed once all user space applications are fixed.
+
+Note that the time CSR is always directly accessible to all modes.
 
 pid_max
 =======
-- 
2.39.2

