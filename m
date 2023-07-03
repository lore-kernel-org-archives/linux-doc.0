Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F374EB64DC
	for <linux-doc@archiver.kernel.org>; Mon,  3 Jul 2023 12:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjGCMxD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Jul 2023 08:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbjGCMw7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 08:52:59 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0282C7
        for <linux-doc@vger.kernel.org>; Mon,  3 Jul 2023 05:52:57 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso65844085e9.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Jul 2023 05:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688388776; x=1690980776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvJvx6RMtbDuAT1323RkBbGas4rmn6vZDZsiVVfiSsE=;
        b=PA+jkEZCdU8bP2asSDqM7jl8NBccZT3rOEByYZxW/9b3uvGCB0ZWF4YffiSuyw0990
         vxeUWOiKn5NZ2SVNEz6EHwjQqlFga+PervFhkiLs/yYBlzOqy6ohMdkmYuOmUOHWHVvL
         HB7e2yX6KT/y7WWc9ruJqcV7/nvPeWmNNlhHMIkMszBp5a7xVRL0Ge3ALhlhKRHBAXlt
         ysEOkjQaWciE5gpg3F1VYBVLsMACoeQmBxPbQLjRJOcozzgDv9fmHEy22M+9eX4YIfI+
         +7qc3lRX+dQNpdt+ihDhL/UV/JvIGHFO3rAJbfJdR3p2KWrmvV7OC883mPT7uROnN5nY
         IGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688388776; x=1690980776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvJvx6RMtbDuAT1323RkBbGas4rmn6vZDZsiVVfiSsE=;
        b=KN9Vx8P5I0JdiB9eSHLK50u3s7ZGkPSqSjbupYyp0Hpl3fBWMc+ogdvEdZlqx2w3pI
         mfA3tbhHuFwoiVKhW/UzKB/8FX9wehpTkTIfRHDra7bndZzYeQyKh3bsHUexbjTmJuZG
         i+nnPsW8wAjFicQz4/ZQB52TJQoYWEVjEF9tz6sBjOLRg/v7qiBJAcL6Cycs+LaNBUKx
         fDJGqMhVbmvkc6ELj3dj1BKrlTaCxOtCzOWYv5acU8lxpDlajFjEh5deupA1CosHerXq
         JK+vM7h8I3KFoBUKq+4pcAOHkETfzulWIEBUsfHMpAeX3btELw0KceBv/yT9agcOC742
         BrFA==
X-Gm-Message-State: AC+VfDyj2aTsroUkJnp4P93XJq4byUc1KlRwN7Ou2dONosd/hxZL77TE
        ftkJA9/Totigf/x1D7C5pIc/tQ==
X-Google-Smtp-Source: ACHHUZ5HA8KDH2QJSQViiIkBg1NELVnzyjafnotWcuYa2YPHjr5O+aKLbytRZh1EJVbsoaERYly4pA==
X-Received: by 2002:a7b:c445:0:b0:3fb:adc0:c37d with SMTP id l5-20020a7bc445000000b003fbadc0c37dmr13187228wmi.38.1688388776479;
        Mon, 03 Jul 2023 05:52:56 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id y17-20020a1c4b11000000b003f90a604885sm26981297wma.34.2023.07.03.05.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:52:56 -0700 (PDT)
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
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 06/10] drivers: perf: Implement perf event mmap support in the legacy backend
Date:   Mon,  3 Jul 2023 14:46:43 +0200
Message-Id: <20230703124647.215952-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703124647.215952-1-alexghiti@rivosinc.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Implement the needed callbacks in the legacy driver so that we can
directly access the counters through perf in userspace.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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

