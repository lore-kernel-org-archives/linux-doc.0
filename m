Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88822C001DC
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jul 2023 14:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjG0OaZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jul 2023 10:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233025AbjG0OaY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 10:30:24 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF712D56
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 07:30:22 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so15684015e9.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 07:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690468221; x=1691073021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUMayOneQ9ikYzzZBl/jcEnYT2gsm9hVqQEHFi1LQzE=;
        b=j2+29OnuTalZpnUEEI7QghInin+VyTSgd3U/3esMN0czsLEJt+ZuFpJ6Bib2ay3vAo
         534lwlygEEh6CiPhlG5t57U9tfZcRtsdMErIcrzQbkcQNe9XfC/5Az3c7pEmwas+++Ay
         Ayoo+z561d8R12szH3sy/0m935SuCVVAl+bvyiQO4sxYJnRHU2BXGlZ5UIoTF7Hu2N5z
         xNsqBZn4ZvCRlUc6Q5mfe7LzXpr++aSf8VpcTNiLu641sXTu1vu3EaWXk2+i7KfSm8f+
         uY4DXBO1KTcNDRfFNOUGEC4sFMo/U6p05YmISwy6Vk7IDK4aogg8I04Fbfi2dVFTm3Be
         /tYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468221; x=1691073021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUMayOneQ9ikYzzZBl/jcEnYT2gsm9hVqQEHFi1LQzE=;
        b=Bi47Dx4qD3NU9fXjCzqGiIqrxnHjWHNmYCUoNhFtzy1oRDfzf3SyUR4fVtT5GMHAE+
         sdFD5XaVHst6oDqZAbcFanyO05j1V3DrmzaodcoS3d6Gv5yEo90gHd5qOjT47aup0faX
         UxSXJkbWyJJdI+/9b543+d5080qo88fBbXnc6EIonv5lWLtCaIAHAX9YsmbOyeBLuR8b
         6Z0baYpT096Vk+GSaoVskhDLX2h/X5wAmlBRhXGOSXHWltNLpxUQSJs3wESbHWfLpJ1m
         pJ3jfGM8XssMKtX9kL5jzGIvNvdrvqyuag61b07w3HjBXIQGiwIfWbltZwJsKJJ3XolS
         jmnQ==
X-Gm-Message-State: ABy/qLbfnhwDIKcAzq4ptRAtYzpLgWGwudoRfu1G3vIh9xsiXQNYrpFf
        JWMomYx0p1zsyCvJd8hSlbV+dg==
X-Google-Smtp-Source: APBJJlFlAaMbRzdmArSgZ+AV8w3c/5LHqShEcivfEyw65QdH0Aqu7aOQV+4CCgwg82+wdZ4YMYCOsA==
X-Received: by 2002:a1c:790c:0:b0:3fc:180:6463 with SMTP id l12-20020a1c790c000000b003fc01806463mr1879971wme.7.1690468220870;
        Thu, 27 Jul 2023 07:30:20 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id s23-20020a7bc397000000b003fba6a0c881sm4726178wmj.43.2023.07.27.07.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:30:20 -0700 (PDT)
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
Subject: [PATCH v4 10/10] perf: tests: Adapt mmap-basic.c for riscv
Date:   Thu, 27 Jul 2023 16:14:28 +0200
Message-Id: <20230727141428.962286-11-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727141428.962286-1-alexghiti@rivosinc.com>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

riscv now supports mmaping hardware counters to userspace so adapt the test
to run on this architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/tests/mmap-basic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index e68ca6229756..f5075ca774f8 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -284,7 +284,7 @@ static struct test_case tests__basic_mmap[] = {
 			 "permissions"),
 	TEST_CASE_REASON("User space counter reading of instructions",
 			 mmap_user_read_instr,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
 			 "permissions"
 #else
 			 "unsupported"
@@ -292,7 +292,7 @@ static struct test_case tests__basic_mmap[] = {
 		),
 	TEST_CASE_REASON("User space counter reading of cycles",
 			 mmap_user_read_cycles,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
 			 "permissions"
 #else
 			 "unsupported"
-- 
2.39.2

