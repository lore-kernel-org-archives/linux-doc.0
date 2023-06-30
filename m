Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B75AEB64DD
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jun 2023 08:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbjF3Il6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Jun 2023 04:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232760AbjF3Il3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 04:41:29 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A03B421F
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 01:40:53 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-313f18f5295so1903519f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688114452; x=1690706452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmbgD3BkRBunB0DFWSt+ANLkIPsXQvCtttyk0nyN3eI=;
        b=xBb3tY6aRK51y+KAOkApMFJQ7mXklF1vW4Q8accpKYblAmqI6K0z8vW9G1W4XT5TYM
         2EX8fpWxNmwCgc4GVXIr4CkGfhBo6gRUxnYbz/El7AY1G1BhjLCjkz9wFpGlSKXBr2c9
         H2vpjBsJSbQ6fUaSiEk9c89ACweAwT6/EWkY5Y211Uonx3JBQfEpsNp9Qs6/QjFT+O16
         HgozLlmjm6OUqQb3+6nH22wKCGnLJPQqJQwUv2GA8/gLgXIJ0BiW8GFXJZJN+SPnDd2t
         Dyg+/kaHM1UTgmhc5hAcCkQxw2jZJ7l1RXzLPZy6VYlE4MDeVUNkPNoDRstWIAZBHvCa
         uDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114452; x=1690706452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmbgD3BkRBunB0DFWSt+ANLkIPsXQvCtttyk0nyN3eI=;
        b=PNxn5DqWcKwdLJfhlH/Q7cBQQ2XH9YRHIEwe6QKhgQxpcWXyHSOxB8rGWYNmGXT1gM
         vQWaPMlI/TZkiHKe7tJJFWqwpJE3WRlZtJFizc2WtQQlEe9lNhs8TBDoOKs4GomFKv1D
         1cNn/dF/MPV6Eg1JN7nBL9Q5HZQ3DYgkfeehYWlb3UKT+ORI3Pcy1BrZJBQ5fLT7tdRU
         kgkF5+uO+sbQCa02ogOLy1CHbbr15dgxhTvLpFcGXe3f8xjr+KdAxTir9zO2TK8SQVA0
         PMClzW97ZFcBBDXqoUCUGeNzesMymZfxVC+NB0j3Sd5j5VQi3ZQ/c4oadNkOAICCv/Ou
         GcxQ==
X-Gm-Message-State: ABy/qLZDJS1rc3/jD6TnvfPSJmEAERjNtMiYZ/j/IGfXx7+2xGPrYdLb
        YDyyiTyCU78Of1uls2RRERk7KA==
X-Google-Smtp-Source: APBJJlGdPg2iyQ/a+BDt1aLZTv0Yk22uI/nygPWAvXy7YUewA8v5fcDT/TyEnCnUoiJVNGcrcvKwnQ==
X-Received: by 2002:a5d:4ac2:0:b0:313:e161:d013 with SMTP id y2-20020a5d4ac2000000b00313e161d013mr1634786wrs.15.1688114452123;
        Fri, 30 Jun 2023 01:40:52 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id x2-20020a5d54c2000000b003142439c7bcsm740391wrv.80.2023.06.30.01.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:40:51 -0700 (PDT)
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
Subject: [PATCH v3 09/10] tools: lib: perf: Implement riscv mmap support
Date:   Fri, 30 Jun 2023 10:30:12 +0200
Message-Id: <20230630083013.102334-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630083013.102334-1-alexghiti@rivosinc.com>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

riscv now supports mmaping hardware counters so add what's needed to
take advantage of that in libperf.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/lib/perf/mmap.c | 65 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tools/lib/perf/mmap.c b/tools/lib/perf/mmap.c
index 0d1634cedf44..378a163f0554 100644
--- a/tools/lib/perf/mmap.c
+++ b/tools/lib/perf/mmap.c
@@ -392,6 +392,71 @@ static u64 read_perf_counter(unsigned int counter)
 
 static u64 read_timestamp(void) { return read_sysreg(cntvct_el0); }
 
+#elif __riscv_xlen == 64
+
+/* TODO: implement rv32 support */
+
+#define CSR_CYCLE	0xc00
+#define CSR_TIME	0xc01
+
+#define csr_read(csr)						\
+({								\
+	register unsigned long __v;				\
+		__asm__ __volatile__ ("csrr %0, " #csr		\
+		 : "=r" (__v) :					\
+		 : "memory");					\
+		 __v;						\
+})
+
+static unsigned long csr_read_num(int csr_num)
+{
+#define switchcase_csr_read(__csr_num, __val)           {\
+	case __csr_num:                                 \
+		__val = csr_read(__csr_num);            \
+		break; }
+#define switchcase_csr_read_2(__csr_num, __val)         {\
+	switchcase_csr_read(__csr_num + 0, __val)        \
+	switchcase_csr_read(__csr_num + 1, __val)}
+#define switchcase_csr_read_4(__csr_num, __val)         {\
+	switchcase_csr_read_2(__csr_num + 0, __val)      \
+	switchcase_csr_read_2(__csr_num + 2, __val)}
+#define switchcase_csr_read_8(__csr_num, __val)         {\
+	switchcase_csr_read_4(__csr_num + 0, __val)      \
+	switchcase_csr_read_4(__csr_num + 4, __val)}
+#define switchcase_csr_read_16(__csr_num, __val)        {\
+	switchcase_csr_read_8(__csr_num + 0, __val)      \
+	switchcase_csr_read_8(__csr_num + 8, __val)}
+#define switchcase_csr_read_32(__csr_num, __val)        {\
+	switchcase_csr_read_16(__csr_num + 0, __val)     \
+	switchcase_csr_read_16(__csr_num + 16, __val)}
+
+	unsigned long ret = 0;
+
+	switch (csr_num) {
+	switchcase_csr_read_32(CSR_CYCLE, ret)
+	default:
+		break;
+	}
+
+	return ret;
+#undef switchcase_csr_read_32
+#undef switchcase_csr_read_16
+#undef switchcase_csr_read_8
+#undef switchcase_csr_read_4
+#undef switchcase_csr_read_2
+#undef switchcase_csr_read
+}
+
+static u64 read_perf_counter(unsigned int counter)
+{
+	return csr_read_num(CSR_CYCLE + counter);
+}
+
+static u64 read_timestamp(void)
+{
+	return csr_read_num(CSR_TIME);
+}
+
 #else
 static u64 read_perf_counter(unsigned int counter __maybe_unused) { return 0; }
 static u64 read_timestamp(void) { return 0; }
-- 
2.39.2

