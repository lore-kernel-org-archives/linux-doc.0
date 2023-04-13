Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88D2C77B61
	for <linux-doc@archiver.kernel.org>; Thu, 13 Apr 2023 16:18:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjDMQSe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Apr 2023 12:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjDMQSd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 12:18:33 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0562819A3
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 09:18:33 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id e7so4684214wrc.12
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 09:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681402711; x=1683994711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zC284Mx5M3d9WrVkxHAYpIwsSHj0B1udyIbm0+qXIw=;
        b=jnYAXcdc2F/ZUYjwGbFde5j1fnjVc7M0pT4u8eeWu2p7a9wNVttC/D6yh195iVKys4
         mxVhroni/klSct1CM/u8HtxLFdwyp8gxBeK52u97EoUsZcYEPG2gbhqDiF3zDqXCerCB
         NiYRItU+QsjrhYXfzgriIL7Bq8c+QDOLPiydToeJ3LjmuvIfa/zHFQnEagnw96dZk03u
         pd3KVMh0PwwJ+kCSQtIFpnMRaviqT8YGPxin0RGwxSiSveSxjexCjxUGU1uXkFwYZmqb
         xTjttfIuMCcu+Ru3hr7RR5/IDoy+4Vxv8/vqM7xpir2d0R6HwPiK+R5voQ85on0tT3/z
         t3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681402711; x=1683994711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zC284Mx5M3d9WrVkxHAYpIwsSHj0B1udyIbm0+qXIw=;
        b=UsD2kSbxAGz0yb9e6FTS/6pOtlcCdDZ3QPLtHE7NPHNZI/azbvCjbuSbOXCEQGxyCW
         OAcx3x4CJYHbf0c4J5ziytD433bkJEVsHXSAdaJFAdYpdLeWL476AiNdYCMQGyKenbHV
         AABGYG7/ePZgb2YMqpEox6CRzmE2xzer0w3AZQcMI5uD92Y4H0lkfQu91zuq/1xF5fwy
         259jjbp0pvfPUcfAxBGhef0F1+S+0lJqGGdoeEKWYm0bUQAdiD8J7Bwjct6P3aOMt2FJ
         ToRc/92Nzk5tQ2jp2RexUkFN0EEmaDvd0UcMmuILF0mi2Rh6P9DHFXl2X/H21STLttsF
         Sorw==
X-Gm-Message-State: AAQBX9dO1egSNRtxzAfPsG5M11qaD5u+0IWF+TwsurADAov7VxES6x6G
        TG+s4Ty+A93mejnENKsFa0cdvw==
X-Google-Smtp-Source: AKy350Z58ybJnlDv5ztRusjd7HwtKvOy6HCP/IazeXuo09NcPyvJkiRUBITxW1O8s8n9bpTCu5u2/Q==
X-Received: by 2002:adf:e352:0:b0:2ef:b1bd:786 with SMTP id n18-20020adfe352000000b002efb1bd0786mr1600755wrj.13.1681402711478;
        Thu, 13 Apr 2023 09:18:31 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d4911000000b002e55cc69169sm1598882wrq.38.2023.04.13.09.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 09:18:31 -0700 (PDT)
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
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 1/4] perf: Fix wrong comment about default event_idx
Date:   Thu, 13 Apr 2023 18:17:22 +0200
Message-Id: <20230413161725.195417-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230413161725.195417-1-alexghiti@rivosinc.com>
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

event_idx default implementation returns 0, not idx + 1.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 include/linux/perf_event.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index d5628a7b5eaa..56fe43b20966 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -442,7 +442,8 @@ struct pmu {
 
 	/*
 	 * Will return the value for perf_event_mmap_page::index for this event,
-	 * if no implementation is provided it will default to: event->hw.idx + 1.
+	 * if no implementation is provided it will default to 0 (see
+	 * perf_event_idx_default).
 	 */
 	int (*event_idx)		(struct perf_event *event); /*optional */
 
-- 
2.37.2

