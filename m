Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A625FEB64DC
	for <linux-doc@archiver.kernel.org>; Mon,  3 Jul 2023 12:55:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbjGCMzF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Jul 2023 08:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbjGCMzE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 08:55:04 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457ABE5A
        for <linux-doc@vger.kernel.org>; Mon,  3 Jul 2023 05:55:00 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbca8935bfso28644045e9.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Jul 2023 05:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688388899; x=1690980899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uE3ed+qOC+4qK7E+eZU16MY7i1Q8gwASW1BIqAmC4Q=;
        b=KXfBA4dwyaWINqWobrlqgGljAokB7lB0w4uxKHe+MjjhJ6MU6drG+dBCfGaLaKLMUT
         Wuytx+JAlaoQoMvARJFQzofU8Q5GBknJKHveI809sfOuLtsVEKpdVJE2YzY/h8fMbDeF
         X6Tl/vA21Rd6JLXgTd6vaeIrbZDpg680h+Bw5+mbbRRTw2bNWu7Fp6cNVTvL38Eus2oW
         SyDqueEo4VrEMYAsl2wC+zdSntnd0NLsRddgn8kGRGloRI+BAT89n4APNVJhd19yL7ow
         EbPJTQGKjjx4izcl8A4E/hsI7NjpQnr0KXB5ztqN1MWItg44Tr5R4FDFGEBBDCY7re2w
         jWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688388899; x=1690980899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uE3ed+qOC+4qK7E+eZU16MY7i1Q8gwASW1BIqAmC4Q=;
        b=VdCZrHthqjhE5J8i2ti8uzd4H4dxseCtsRAAJsrDAW8pCj5opiIJI0CLXTbMbiKZr7
         1gLPpFD0DKyTl7euV0iZjKA0Ww3R7+9pIV6m4Bj/8/pje51DWgrO3TjphsxuwuP2KX0Y
         Ri2Cv6VORoQ/jHdxvrIr8cFDgccU0MVlSgNS/LHQsfS9Utf8QZyRKvhsRLIv86/FWaCM
         vTL1oHmay0b95Vu/hzewoXVqWdCLhz1paAMAUZrWkDyDtGugJC/IBWvMxsvWHirmnIAp
         ZUoYkWvUQc8W+IJp1EbKvUoqTWC6mO2TsQGifVuxqhJztjg7UfCE0P5LkXndtGPPKTYX
         Eyug==
X-Gm-Message-State: AC+VfDzm29hhsQCAm2axoFH8iSRaG5Clz/qvZC0Y6FBrao/37UF3gZiV
        u8XqGt5coHZWgn1BRmdEyjUQ0A==
X-Google-Smtp-Source: ACHHUZ5VUOGaM9JlKwN3HlVqTZGme530byxX95CP51zvYyoKEqerS7qsgoXHhQmTbUYoVAnfzKsSQg==
X-Received: by 2002:a1c:6a0c:0:b0:3fb:bc4a:46ad with SMTP id f12-20020a1c6a0c000000b003fbbc4a46admr7766337wmc.9.1688388898687;
        Mon, 03 Jul 2023 05:54:58 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id y5-20020a05600c364500b003fbc9d178a8sm8488190wmq.4.2023.07.03.05.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:54:58 -0700 (PDT)
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
Subject: [PATCH v4 08/10] Documentation: admin-guide: Add riscv sysctl_perf_user_access
Date:   Mon,  3 Jul 2023 14:46:45 +0200
Message-Id: <20230703124647.215952-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703124647.215952-1-alexghiti@rivosinc.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

riscv now uses this sysctl so document its usage for this architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 27 ++++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index d85d90f5d000..19b627883313 100644
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
 See Documentation/arm64/perf.rst for more information.
 
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

