Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1DEC00528
	for <linux-doc@archiver.kernel.org>; Wed,  2 Aug 2023 08:07:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbjHBIHJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Aug 2023 04:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjHBIHI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Aug 2023 04:07:08 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BBB519A
        for <linux-doc@vger.kernel.org>; Wed,  2 Aug 2023 01:07:07 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe110de3b6so3800445e9.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Aug 2023 01:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690963626; x=1691568426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NmnsqQcLcAcVyns3syLHoHVHQj0n5HXKDOsH4jqkjI=;
        b=EqQKZOT61wkw+20RF7X+vngIlAAxYuK9F0GA2VouTd7oFXT5ntfwtYpZ65vElTzBEI
         wH5WqXLM2utEn/AVCcSCea1hsOXZ8i3aXn/w842xXxrNUKm32EQa5fLaIVpl0cNMIHBA
         +c2LELxLXrtMirm1rF9berVJ2KtHsRaITSeS1M+KdFJXVYpYmPPuTeo7FTB3bGGLyEz2
         i0dJ001MWYG3LvzqQo33rZeJbqO6lwB9NkntoRVG3eabn/XookqijpJlrXimCR/5xZOn
         nVj+mtm78nD/FUE0hkiICkuXb0btj6HPYkJZmMIVvrmByMgFSyjvHWpuR/Ph7oszmYH9
         NC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963626; x=1691568426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NmnsqQcLcAcVyns3syLHoHVHQj0n5HXKDOsH4jqkjI=;
        b=JiKERj4kRCurcuPeVbSrC6d0HXg+eaTliq1BhA262tiRmQYr2xeP0veb3/nk5V9zYa
         hlqwnJl8Q9Gk+Vf9qUKlTYzpc8CdbGjK+juZKV3r8Dfw9Hy3rhaxgaKUyMKUPeHjPvMG
         tdWulc41/XEDzEWTH1tp3USZlD33j3lUJvwlj5IjmHFnAXf06/+qXRQkeA2qOU0ofajS
         u6uYJEGjet30PUgNlCwbOPeip/Zw2U5dlz4bzBEUczA3Ai69F1TLskRkut5qbbc/+UiP
         2ZS4ToppoUELH1wthh7FGnQEPMuAN2/KL5JEUJbz/v03sheeyqZsgJgJqzJhy+XcK07t
         4P4Q==
X-Gm-Message-State: ABy/qLYbln3arVrwoWVerE7l5/UGzXAFpEeYZrSLc+2jq+R6S+GR/dk1
        rvfkp+jM29oMRwxIgHiNwwJPew==
X-Google-Smtp-Source: APBJJlGDzgNazOAZ9jBH2AiWYRrB1BJQBMr756Ojt9mmeUaI5QW0YfrzDigug65Vaw8o9yJrXEXpNg==
X-Received: by 2002:a05:600c:4d0d:b0:3fe:2120:eb7c with SMTP id u13-20020a05600c4d0d00b003fe2120eb7cmr4595794wmp.0.1690963625700;
        Wed, 02 Aug 2023 01:07:05 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id r6-20020adfce86000000b003179b3fd837sm11037093wrn.33.2023.08.02.01.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:07:05 -0700 (PDT)
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
Subject: [PATCH v6 03/10] riscv: Make legacy counter enum match the HW numbering
Date:   Wed,  2 Aug 2023 10:03:21 +0200
Message-Id: <20230802080328.1213905-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802080328.1213905-1-alexghiti@rivosinc.com>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

RISCV_PMU_LEGACY_INSTRET used to be set to 1 whereas the offset of this
hardware counter from CSR_CYCLE is actually 2: make this offset match the
real hw offset so that we can directly expose those values to userspace.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index ca9e20bfc7ac..6a000abc28bb 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 
 #define RISCV_PMU_LEGACY_CYCLE		0
-#define RISCV_PMU_LEGACY_INSTRET	1
+#define RISCV_PMU_LEGACY_INSTRET	2
 
 static bool pmu_init_done;
 
-- 
2.39.2

