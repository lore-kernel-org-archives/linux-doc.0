Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBB923099D
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 02:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736821237; cv=none; b=PFFH8Y9KJ45RKDzKAKwVAxngtSouxoM2GNyPd4sUaATnAKLVGjtLQoYTYKSBQGbzyVd3+URq2iFdHPMpEQCX/fnoXFsILgzEq1GZcfhyZGpd2o2UF7PJ4iSGhX3HglNnSlxpMSMXHZntjK9DqKRHUbZnHcduY1Oms01+H+YiYhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736821237; c=relaxed/simple;
	bh=AVlJ+B8SHpG7AnPXkY0Y1XkZO+Nve3y56lMhy2AxybY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jOzLQDK4VtXgBJjTjLuoDGv9wncU0dPZ5Ysqmk8PJGaEMbgK1HFJho3sFMCSYtwtVCYoNnMaQtt+9g4U5m2L+14h7t4Wm+RCerMMMl/TtQzUOKTBI/J0xeISZLy/uHJ7g+y3leeSPTCnZ/+A/OAR8Rp1XTVbxm9jgjxZoFidRWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DaoCebGQ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DaoCebGQ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2167141dfa1so87330955ad.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 18:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736821235; x=1737426035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AU+kJdFGquiw6jMN24/Ei4xUPExeegdDiALtzowhFsI=;
        b=DaoCebGQ7ZEnQ71DmWKZhY055SwTHI/uJzyqswfHNZUcLShT21z26abbnwJUNdH4jR
         fo/aCo67S5ltcbprttslNayINfnyS2fZw+pKFuA7U5qYDl6oS6JT5h0L426HbLubxkgM
         WtYc7OXYLM84L7zg/MprgsOG7hYmDqklEs299h8DFG/MTM99G1bu9MSQm9o3eizVoG7j
         TxKYmWS5TAkUFxQY68Co/P3GsRrEBg1o8qcGGOKRl7oNH6Kg7CUeYCc6ZASBN8cr119p
         w4ZAoF7eHUcaB4xw4vVkvu31r+eZcD6Cn+4mwE4fpyodcwr2+WJSggfKPM6GviC81dOA
         V+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736821235; x=1737426035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AU+kJdFGquiw6jMN24/Ei4xUPExeegdDiALtzowhFsI=;
        b=afUmXrKOnbn4r38I/YzbjIAGXN0LH9AyL8xQr6fO9EmB5j28hUl37uUPeAOeZ7ECvC
         jDahMLSqvqNTNCh4CwWAGDmZI3v1x6WYaT3tYvmofoi2WZC1H+B7WAT9mn1H7a4Jl+l/
         jsGnVjTRmIbeSSA2zxhYu+SowXOSTyYRxnxZCWmoMWfn4FNOjC8ZKXd6dclROdoly4FV
         KbGjLAqx/zaye4yETTg6lUlOZ7sN+mil+Sd7nChlAlevjJXgu+iz2h7AMWOPo2ujOZn5
         WxowDLpY/HqOy10XWKhB6S/zSQl8mlNpeUAi5lEjkZOo3lyC9dxrOOU7zmM8la8q0L+M
         iPwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6g/YCj229W+XLBKmUQYZQnLzXNAfpuVCgGOAA7x3ncvJ9JjibDSw7z3x2IQJWUwdV9fO2hAYDYRg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8x0isiUer0Jlj1lP9Bir379bamavjhUGf0alZvvqjB2dYyFID
	eGKsbXmRyWEb9AjbrSo9hcblfB03RPF50B576nil1jXxJwsI9Lq/bYtMB6qydjs=
X-Gm-Gg: ASbGnctWJkl4J8AIOtHjsS+mNLZRDl0rLaO0pbY6XWQIybJkVpWXocJLeqOOMpGvD6b
	EEAfc+F8XAQ7PoRftaupBSs3811SWO6YA1Tjudxs/+Gp0z7OJnuePpOM8FWaeqV9dHL84sZWnUE
	ftCROvSfqED0yETQIIfQdXxEaDC80D7h0V6H/7ZHJPmzFYcMnuqB72pm55UvSNUQ01M45QL8UnD
	OSXv1VGWAlB+lFBbbpJi//igHG1t1tMpxJ/p+hn+Uv8qanxsv5m8SihMgmfZswLSU/aH4rExAES
	TZFo4qvxKkPVMGw=
X-Google-Smtp-Source: AGHT+IETuOAy38hbNYEg3JS95akJoO/X69j3f9vqhvGvre0TcMAbZshy9c/3Vf/4QESbup51MnYasA==
X-Received: by 2002:a17:902:f691:b0:216:4fad:35d0 with SMTP id d9443c01a7336-21a8d6484c9mr258669205ad.9.1736821235444;
        Mon, 13 Jan 2025 18:20:35 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f217b38sm58948065ad.145.2025.01.13.18.20.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 18:20:35 -0800 (PST)
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
Subject: [PATCH v4 3/3] RISC-V: selftests: Add TEST_ZICBOM into CBO tests
Date: Tue, 14 Jan 2025 10:19:36 +0800
Message-Id: <20250114021936.17234-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250114021936.17234-1-cuiyunhui@bytedance.com>
References: <20250114021936.17234-1-cuiyunhui@bytedance.com>
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

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
 1 file changed, 55 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
index a40541bb7c7d..dec510291ab8 100644
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
+	TEST_NO_ZICBOINVAL,
 };
 
 static struct test_info {
@@ -169,7 +203,9 @@ static struct test_info {
 } tests[] = {
 	[TEST_ZICBOZ]		= { .nr_tests = 3, test_zicboz },
 	[TEST_NO_ZICBOZ]	= { .nr_tests = 1, test_no_zicboz },
-	[TEST_NO_ZICBOM]	= { .nr_tests = 3, test_no_zicbom },
+	[TEST_ZICBOM]		= { .nr_tests = 3, test_zicbom },
+	[TEST_NO_ZICBOM]	= { .nr_tests = 2, test_no_zicbom },
+	[TEST_NO_ZICBOINVAL]	= { .nr_tests = 1, test_no_cbo_inval },
 };
 
 int main(int argc, char **argv)
@@ -189,6 +225,7 @@ int main(int argc, char **argv)
 		assert(rc == 0);
 		tests[TEST_NO_ZICBOZ].enabled = true;
 		tests[TEST_NO_ZICBOM].enabled = true;
+		tests[TEST_NO_ZICBOINVAL].enabled = true;
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

