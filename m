Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F42C04A94
	for <linux-doc@archiver.kernel.org>; Wed,  2 Aug 2023 08:10:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233393AbjHBIKN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Aug 2023 04:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233734AbjHBIKM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Aug 2023 04:10:12 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3F3E67
        for <linux-doc@vger.kernel.org>; Wed,  2 Aug 2023 01:10:10 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so69603185e9.3
        for <linux-doc@vger.kernel.org>; Wed, 02 Aug 2023 01:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690963809; x=1691568609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7afbVzdz7i3XV0LSy+5KsI/iNIynDErY3gG58bPEFNo=;
        b=qifnnd1mKlQIbmFMQtnxa9WqcewBxOF1/ulkKZ0PlwvTFCAGuQxSgo1kcwBebXtHjM
         rpmSpxRKelVFPrBiLJFe6TQ/HsCgwCo4mpuiYtYIYNnDyIOebL6tMHLAyw9pigfIdHHi
         xWN6KuEvcE6ua4CybzZrL4imUKgHHO9F7J6YzHT1QIOUgi1nqmPKRxp2h0G8Sofwog8U
         gU3grY1tQXjUv6WVst3cwIliB/fUUp/K0iLvsma3syDq4RkO9KvWY5Ve6RUBV0YkrSuf
         7rRQGfdNGtkkGsEX0dcr4Wp00mu9hOiOsCxFOWmXWX6hTlpNnA8n4hoeTtME5dj7noaR
         p8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963809; x=1691568609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7afbVzdz7i3XV0LSy+5KsI/iNIynDErY3gG58bPEFNo=;
        b=LcyoQqwPw0D0MxWwlOFsXdCAqg4r2tUVFj/aUiUj6aXjpMzsYrh12vJaJWE/yC1mQ7
         1ukvhRMEj59oGPvJuSvImOxBycdlT3Co0uSLGP7PgORs9AtAhN88Z434OzspQ/ZnuciJ
         EsIU0JIXD5Y86YeiZvS+hS3JfL+U4loopEOCKFO/5dbkQGhIgOoIntH0Y1K5AkP8AorJ
         0SHbJKGBeTBxwiYE+ZfUUElTeDKRQgnoUBIe5Q50ytig3/GctW+OJM431bqlNH8hQvnO
         FClNTuz7M+O+AKishcpN35nla1o2FKcqn34FZJzArE8+NgyGE3/uvC7mjoMjWEJkpA8K
         QDug==
X-Gm-Message-State: ABy/qLbTCR1GCv1cYQeQZ+Qkw+YAdo3EpJuN6gn6JXVFde2JS0yoA4JZ
        nsyxZSySTfm8cjt9DfX8Fs9/zA==
X-Google-Smtp-Source: APBJJlEKKkdTF9AhlPpANXIgbR1ENnZC75oX6YWqdfd3WINkVA6hfQ7Vkr1i/Nh2jbZi+6ixrXiGYg==
X-Received: by 2002:a7b:c855:0:b0:3fc:616:b0db with SMTP id c21-20020a7bc855000000b003fc0616b0dbmr4218529wml.9.1690963809354;
        Wed, 02 Aug 2023 01:10:09 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d404c000000b0031411b7087dsm18316163wrp.20.2023.08.02.01.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:10:09 -0700 (PDT)
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
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v6 06/10] drivers: perf: Implement perf event mmap support in the legacy backend
Date:   Wed,  2 Aug 2023 10:03:24 +0200
Message-Id: <20230802080328.1213905-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802080328.1213905-1-alexghiti@rivosinc.com>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Implement the needed callbacks in the legacy driver so that we can
directly access the counters through perf in userspace.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_legacy.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 6a000abc28bb..79fdd667922e 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -71,6 +71,29 @@ static void pmu_legacy_ctr_start(struct perf_event *event, u64 ival)
 	local64_set(&hwc->prev_count, initial_val);
 }
 
+static uint8_t pmu_legacy_csr_index(struct perf_event *event)
+{
+	return event->hw.idx;
+}
+
+static void pmu_legacy_event_mapped(struct perf_event *event, struct mm_struct *mm)
+{
+	if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
+	    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS)
+		return;
+
+	event->hw.flags |= PERF_EVENT_FLAG_USER_READ_CNT;
+}
+
+static void pmu_legacy_event_unmapped(struct perf_event *event, struct mm_struct *mm)
+{
+	if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
+	    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS)
+		return;
+
+	event->hw.flags &= ~PERF_EVENT_FLAG_USER_READ_CNT;
+}
+
 /*
  * This is just a simple implementation to allow legacy implementations
  * compatible with new RISC-V PMU driver framework.
@@ -91,6 +114,9 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 	pmu->ctr_get_width = NULL;
 	pmu->ctr_clear_idx = NULL;
 	pmu->ctr_read = pmu_legacy_read_ctr;
+	pmu->event_mapped = pmu_legacy_event_mapped;
+	pmu->event_unmapped = pmu_legacy_event_unmapped;
+	pmu->csr_index = pmu_legacy_csr_index;
 
 	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
 }
-- 
2.39.2

