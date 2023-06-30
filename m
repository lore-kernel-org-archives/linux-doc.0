Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6A9EB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jun 2023 08:35:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbjF3IfI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Jun 2023 04:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjF3Ieq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 04:34:46 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3012C1FCD
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 01:34:45 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3112f5ab0b1so1763485f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 01:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688114083; x=1690706083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N3S2PdFA0VnOMrqOiiJN/oJrFso6OovUf1itxoBYAA=;
        b=J5Sn0TMa0823JltcKEUSImQM6e0Z43AXFTNAAN1zqIBSWgR1tJ1Eg/He+/E288Nuc6
         AiyPl3/mzz7/zpY0QSkNwH2x57OXfJxna4a2FF8tBbBwJE+W1DnoEz0LKGRiK4PgcPCU
         po/VfBnBmAiZTj1BZuiuDn8AgiOei/Wz/lcP8Xk2igyM/S8bCC98ZSXOv592eNKw+nIG
         NmwcFrPAEBYmkK1d/ZvVdkOrhalki00+AidE81IPGrA95cXp/6BmiEEQgAA9qlU7fNQM
         etWeXu/FmWC+q12PA+iyqB0oMo5nmGNbzuc1QFNCOu3aUh+9hzI4u0M/PfvWaI+aG/HP
         wz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114083; x=1690706083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0N3S2PdFA0VnOMrqOiiJN/oJrFso6OovUf1itxoBYAA=;
        b=IENf9cwb2nxBbrHIztFXG90ZJPDQfFlr4fAoM67Aue4MELvOfwiLDo15L1EgGIION3
         Tbd33SffMucfdNf2/gJgZGpzqYEm/kTCjbv6LMmfqkrZdgLjjnUM+pEkiA6dEdiqoJIE
         4X2oPJaFhGQmvWgkjfKThDKmoptm+RGlezvwi/L05JFiAahGDac8OCu0QNMcJVh/Xhkb
         Aj3TOLpE6HpTNP5LZd6VRW5APJJz4tNzEI/SAMuBBIc3Ol0zCytyBRFrG00AVMuoYi4S
         BmrszZ+X/acPiBqN5Rux9a7OfPxI5NqKECtXSN1pPNTaqucpGa3eMVm6RyY72W/StHll
         bruw==
X-Gm-Message-State: ABy/qLbxY2BiZMa6MDTWTsSWwhlovXFZVe/tcVbSmxbw9MDhua7mDvnE
        NNl39lEg6RHnQVD4ffjTJmgfUw==
X-Google-Smtp-Source: APBJJlEgKPYrVDEFl+Qq2I9oLtumgWiJSroN7sH+vO/yUwUUT/VtoZcK+tKhR7P0/qWi0SE0EQP+OA==
X-Received: by 2002:a5d:518c:0:b0:314:fe8:94d8 with SMTP id k12-20020a5d518c000000b003140fe894d8mr1704004wrv.31.1688114083209;
        Fri, 30 Jun 2023 01:34:43 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a11-20020a056000050b00b003110dc7f408sm17885607wrf.41.2023.06.30.01.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:34:42 -0700 (PDT)
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
Subject: [PATCH v3 03/10] riscv: Make legacy counter enum match the HW numbering
Date:   Fri, 30 Jun 2023 10:30:06 +0200
Message-Id: <20230630083013.102334-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630083013.102334-1-alexghiti@rivosinc.com>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

RISCV_PMU_LEGACY_INSTRET used to be set to 1 whereas the offset of this
hardware counter from CSR_CYCLE is actually 2: make this offset match the
real hw offset so that we can directly expose those values to userspace.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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

