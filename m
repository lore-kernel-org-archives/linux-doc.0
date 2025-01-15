Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7AD22DC30
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 02:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736908885; cv=none; b=ZTI6WsohAzWIp/sw8Oe+RL0O0aL/t9FrgykKR5vY/jq4ZxGqbQgyPs3k6eyfTpMOp23thbaYk851fwFOKM9zO41GTDXHiFXH34eVZY9AlzluXXncJRuYJZ3c/HJ4RpBcPyN75Q5W/oxJnsSeGHZUMYs4tj7jpMCOkhxEdAJ1pJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736908885; c=relaxed/simple;
	bh=NqOUrka99DSUi18FOpq9XilJAxI+Dx6U6EraUGvZnFk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sFuWD+jxZNLwtQpLHnb4aea6yKj/rVa+0oWww0B7/aKq4l7uG2oN9OYKCn22Cz52WwjK0DOJxoTI8zpqvmok68hYW3RlFnQsHyaKZT4UVNJRCocmlwocqMerrbMCf5C0/nezZsIIsIJnTPeZDqwAdcjLHKbPZiwq4zbqzIn+eGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=h0Li9A87; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="h0Li9A87"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2161eb95317so110875515ad.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 18:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736908884; x=1737513684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6H6/Xpe5szI3425MURKDC2kUnYsqHlXT/4n1BN4R7E=;
        b=h0Li9A87gm27wtzSrZ0Ee3L3MmApoSpc+MCThRd7Kpif5KBOO9Xbbf0sMhV890Jlys
         P3IE5Pf4mAyvk4Wjrqqdwv0d4aJZFdv6F0S91rwc92LcpJe8rYJ95W8U28T1YrvVTfzI
         su6nwxTlgm/se7fZSUaPEy1SGNzaL49cLKrp5Olnj9NQkO/fDOEw4PicE78qAnhoIm3s
         p7GOX2qwkY9F9Pi5X2g8Xpp3MtHixkFa4UVJnTfBp/9Sbp/ovi9OPdiM+kToN6RUnTjJ
         g3Xyr03yMz8x4eZzmc+zLD1/LMKULpDRVlvQL9k1d3a6nFcU0yw7S0KU124SUNrw5E5c
         74zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736908884; x=1737513684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6H6/Xpe5szI3425MURKDC2kUnYsqHlXT/4n1BN4R7E=;
        b=tZYLTjLo3I8MgVOLSkBBpGC+ruEGSA5M8d9gfGNrc3W7vIksXCmzlnAuO2N9P2FFn8
         Zif5SaB44jJbk8y+3BmOxdweD7e0Nh0aFFtGyjNeACOXhhwXWO921X4W5tspT0/Dhplg
         JUuZQimNMqpiJNUlshTnxU6257pKppcb+BsYaAUzFPEkdVo+c429Zs8ZOEoct8aFwrw6
         Glj0/vCC2boMY2WIL3+zpw/C5Fx4DdtNC3ZDTNhVF42Uf4vIeXSFqUV1vffkbml07oE2
         BrNkC9bo4lgm01coRYYrkxbhzqHrIfIywTdSqbRmWImxliEjNeRgu7yH6mavSaPaw1pK
         /6Mw==
X-Forwarded-Encrypted: i=1; AJvYcCX9OMcO12G09GSlqEGOX3bv5MSuCdEF9xuP+1OzrhYwVWJ+cxMMX4Kj9Hjc3ACb35RdFDYo1XcysMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT4+78SoyUbYWHMUCfMCjc30CmRX/3PEy3l+zSDj+9hi2sAy0X
	U95usHUdWH5nHCCHEukMCKw7r5KFjaH6dVsR3wPECPTXDWTy92frmCBu5ovC3HU=
X-Gm-Gg: ASbGncubMor/CIQHkgV2xC2x+LlSb7/PpIxT4qyH8e6GMOamPvqJeua6PruN8n9pJ4X
	vgw8k48Fae6jU/fObAdUDXvHzmQEezzbIPiC6RbM0RSJCYQFuGL5veIxg5p5tEJrGcJmqrT2Zbk
	w0ASD/UFKmYL9X+0/8m7GZjL5LwEy/lHX/CSJx+orpkJ9u70gIlQpzrVVS9nYeM4ZAudTU7H40r
	SRynA0R3eykBroSqVzKRKh37G5COVXcPwWARDUDcAIS/jNKKogzzuxvMLSCJs+y813cHWr861nS
	Oy4znRIahvb8VE8=
X-Google-Smtp-Source: AGHT+IEvCBxOGHR3ybaItyvONDS8hALHgTqmx4phzF1QLDXR5oLeIKvQn/ktwaSu8a6RAzuXtynCUQ==
X-Received: by 2002:a05:6a00:35c6:b0:725:4109:5b5f with SMTP id d2e1a72fcca58-72d21f3233cmr46085088b3a.8.1736908883633;
        Tue, 14 Jan 2025 18:41:23 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40680e67sm8321841b3a.139.2025.01.14.18.41.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jan 2025 18:41:23 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v5 3/3] RISC-V: selftests: Add TEST_ZICBOM into CBO tests
Date: Wed, 15 Jan 2025 10:40:24 +0800
Message-Id: <20250115024024.84365-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250115024024.84365-1-cuiyunhui@bytedance.com>
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test for Zicbom and its block size into CBO tests, when
Zicbom is present, test that cbo.clean/flush may be issued and works.
As the software can't verify the clean/flush functions, we just judged
that cbo.clean/flush isn't executed illegally.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
 1 file changed, 55 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
index a40541bb7c7d..5e96ef785d0d 100644
--- a/tools/testing/selftests/riscv/hwprobe/cbo.c
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -50,6 +50,14 @@ static void cbo_clean(char *base) { cbo_insn(base, 1); }
 static void cbo_flush(char *base) { cbo_insn(base, 2); }
 static void cbo_zero(char *base)  { cbo_insn(base, 4); }
 
+static void test_no_cbo_inval(void *arg)
+{
+	ksft_print_msg("Testing cbo.inval instruction remain privileged\n");
+	illegal_insn = false;
+	cbo_inval(&mem[0]);
+	ksft_test_result(illegal_insn, "No cbo.inval\n");
+}
+
 static void test_no_zicbom(void *arg)
 {
 	ksft_print_msg("Testing Zicbom instructions remain privileged\n");
@@ -61,10 +69,6 @@ static void test_no_zicbom(void *arg)
 	illegal_insn = false;
 	cbo_flush(&mem[0]);
 	ksft_test_result(illegal_insn, "No cbo.flush\n");
-
-	illegal_insn = false;
-	cbo_inval(&mem[0]);
-	ksft_test_result(illegal_insn, "No cbo.inval\n");
 }
 
 static void test_no_zicboz(void *arg)
@@ -81,6 +85,30 @@ static bool is_power_of_2(__u64 n)
 	return n != 0 && (n & (n - 1)) == 0;
 }
 
+static void test_zicbom(void *arg)
+{
+	struct riscv_hwprobe pair = {
+		.key = RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE,
+	};
+	cpu_set_t *cpus = (cpu_set_t *)arg;
+	__u64 block_size;
+	long rc;
+
+	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)cpus, 0);
+	block_size = pair.value;
+	ksft_test_result(rc == 0 && pair.key == RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE &&
+			 is_power_of_2(block_size), "Zicbom block size\n");
+	ksft_print_msg("Zicbom block size: %llu\n", block_size);
+
+	illegal_insn = false;
+	cbo_clean(&mem[block_size]);
+	ksft_test_result(!illegal_insn, "cbo.clean\n");
+
+	illegal_insn = false;
+	cbo_flush(&mem[block_size]);
+	ksft_test_result(!illegal_insn, "cbo.flush\n");
+}
+
 static void test_zicboz(void *arg)
 {
 	struct riscv_hwprobe pair = {
@@ -129,7 +157,7 @@ static void test_zicboz(void *arg)
 	ksft_test_result_pass("cbo.zero check\n");
 }
 
-static void check_no_zicboz_cpus(cpu_set_t *cpus)
+static void check_no_zicbo_cpus(cpu_set_t *cpus, __u64 cbo)
 {
 	struct riscv_hwprobe pair = {
 		.key = RISCV_HWPROBE_KEY_IMA_EXT_0,
@@ -137,6 +165,7 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
 	cpu_set_t one_cpu;
 	int i = 0, c = 0;
 	long rc;
+	char *cbostr;
 
 	while (i++ < CPU_COUNT(cpus)) {
 		while (!CPU_ISSET(c, cpus))
@@ -148,10 +177,13 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
 		rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&one_cpu, 0);
 		assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
 
-		if (pair.value & RISCV_HWPROBE_EXT_ZICBOZ)
-			ksft_exit_fail_msg("Zicboz is only present on a subset of harts.\n"
-					   "Use taskset to select a set of harts where Zicboz\n"
-					   "presence (present or not) is consistent for each hart\n");
+		cbostr = cbo == RISCV_HWPROBE_EXT_ZICBOZ ? "Zicboz" : "Zicbom";
+
+		if (pair.value & cbo)
+			ksft_exit_fail_msg("%s is only present on a subset of harts.\n"
+					   "Use taskset to select a set of harts where %s\n"
+					   "presence (present or not) is consistent for each hart\n",
+					   cbostr, cbostr);
 		++c;
 	}
 }
@@ -159,7 +191,9 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
 enum {
 	TEST_ZICBOZ,
 	TEST_NO_ZICBOZ,
+	TEST_ZICBOM,
 	TEST_NO_ZICBOM,
+	TEST_NO_CBO_INVAL,
 };
 
 static struct test_info {
@@ -169,7 +203,9 @@ static struct test_info {
 } tests[] = {
 	[TEST_ZICBOZ]		= { .nr_tests = 3, test_zicboz },
 	[TEST_NO_ZICBOZ]	= { .nr_tests = 1, test_no_zicboz },
-	[TEST_NO_ZICBOM]	= { .nr_tests = 3, test_no_zicbom },
+	[TEST_ZICBOM]		= { .nr_tests = 3, test_zicbom },
+	[TEST_NO_ZICBOM]	= { .nr_tests = 2, test_no_zicbom },
+	[TEST_NO_CBO_INVAL]	= { .nr_tests = 1, test_no_cbo_inval },
 };
 
 int main(int argc, char **argv)
@@ -189,6 +225,7 @@ int main(int argc, char **argv)
 		assert(rc == 0);
 		tests[TEST_NO_ZICBOZ].enabled = true;
 		tests[TEST_NO_ZICBOM].enabled = true;
+		tests[TEST_NO_CBO_INVAL].enabled = true;
 	}
 
 	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus);
@@ -206,7 +243,14 @@ int main(int argc, char **argv)
 		tests[TEST_ZICBOZ].enabled = true;
 		tests[TEST_NO_ZICBOZ].enabled = false;
 	} else {
-		check_no_zicboz_cpus(&cpus);
+		check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOZ);
+	}
+
+	if (pair.value & RISCV_HWPROBE_EXT_ZICBOM) {
+		tests[TEST_ZICBOM].enabled = true;
+		tests[TEST_NO_ZICBOM].enabled = false;
+	} else {
+		check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOM);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); ++i)
-- 
2.39.2

