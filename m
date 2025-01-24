Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25381D88CA
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 04:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737691279; cv=none; b=ABBod/P4CTzR+YAAUjXdaJyqXhjIN71zXEanv8YY5Tusb0L0M80Ge24p+BqYjpoWtxvOR1OwtWWQ8vJvHvKy9+BI1DWU7II2PJX/PNeCqGa6KrG/UCgCgW4kWzWewrosKsfRSrN3ZNKTgtA29S5Uu6mIUvGrnVTsPQW4hIRgXBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737691279; c=relaxed/simple;
	bh=NqOUrka99DSUi18FOpq9XilJAxI+Dx6U6EraUGvZnFk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MXqiBZDas5Z8PIY/JAz2r0FrlxGoXrCFai+oZKFZMI7q5zivIIchJtzYH5Ku0QzeTECY5qwcCE318TVfl8VUhwIAhqzdbi0gGCnfY9u++OSqMj3DD4U+78l4el/eqmrxbNdtR90dr3Z6MXCoQ5g3ls1oHe8cZgbIuDYZue1DNGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=EQK7ihrT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="EQK7ihrT"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2167141dfa1so30967075ad.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 20:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737691277; x=1738296077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6H6/Xpe5szI3425MURKDC2kUnYsqHlXT/4n1BN4R7E=;
        b=EQK7ihrT5C4S7afBkYW74/9Wx8JJO9xu7HzfTop1TG5gnfowDvRqdNKRU41u6NvQ9g
         MoEpFb5PYYFPVXWLmkwcEUautKqqn3O+1ptt5FSnOdkG+UaCHfTxOvJDyQdga/SJaDCR
         HeYtxGpTJiTVLUD7RJASnM9xIZIyTsjaXmA3tZZ/pfYL/zR/6jtTegWDmeeCTIxNnvte
         0T/M8vCf/TiLELrafXv5hgU2rV2xLWD8FW8fMAF+IeEFdUNSWk0QM7gJLePT/6l9Bx4J
         5cU6em6i1QvwcSlKg9Hj513u1M/fVsyUyvzJcalIsPBPNCB4d0kCTEQaVc1tGgy0gKTw
         1OZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737691277; x=1738296077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6H6/Xpe5szI3425MURKDC2kUnYsqHlXT/4n1BN4R7E=;
        b=CQ9HJQ9k0rOmcASpT4jISZiFE4AAAbvpkTmG8R3kXM9RYk3vMWcUdrzXXYsDHOPeYI
         BaVHiiwoFgZ1ztKACPdp3gNjY/NJAM0rk70pRTZh/K+gk2Ur71wO8o9RIRnNFVYJjezT
         TyAhJuGjBzpae/ziSfAjkOCHhVUejaWC8G7Divx0iu3pJiBkxwH+ZGh98M65mcCmM/C0
         OJgosb8dkOgxQY+7IGApyvg/aVkB/y/4/tsuLR+nBauwM/7OwISNHwsoLTClCOkIiOdJ
         Ives2517yaGjnPb/Rf+eSuVrNfDJXzLdZAD/sU1CqK90bLzFyVi0XFwhFqT1lYapgneK
         oAiA==
X-Forwarded-Encrypted: i=1; AJvYcCV2g7WqbUgHm07EZ2x5X9ff7sMdDIAOGJhmv3O+1zW9Q/DnAgB8U1+zxRBhSVlNf/dJhadjohk8FjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YztMHxKSGYTq5L4qTbP3BdmzThfjXFlAIq1xLeeSnKH/6DewkYV
	TvgwPa+dogHCAKFlD8Lv/ANnmTJm9ha3PK+dulgifEj7Fp5dpBluAmAEDE9/s8I=
X-Gm-Gg: ASbGncscRB7rzgBKzQ8XlF2/nwqj/L/VTZQ7LHEX2XvCRBp6TeL3ENA29H+uCZwmLde
	pq0ZifBGYQkWcU5OBzdyD/pM80vXmPJXq499Cy/oWn8cK+ME+mAvpgpmgG+BqXAdqWfiCIE7gC1
	fK3PZtPLWe5dBrY/K31JXg+XBrZkP2lL9EIQ22gv/xsnpRCJCutt3Tmf8ckK2FKZv5P8UqAePpw
	67uuzZF++0dmxKGARpcJLij0i6dwvcpK6T4B4hSIZ5ba9Ct47/Q99h7IV+dAocgJt3OfdzRgjJK
	CvAO83k3gnyDWwj5bgISKuJGY7UElXowBQ3pBl+/QWMSFSue9w==
X-Google-Smtp-Source: AGHT+IEmNJ9PTxDO/9xUv7qTG6D6YOowwQFpMMoo6I4xfnFmtGI8+HqdGOFtB4iDinl8gA0atu0SWA==
X-Received: by 2002:a17:903:124b:b0:215:98e7:9b1 with SMTP id d9443c01a7336-21d993177a2mr87590995ad.5.1737691277079;
        Thu, 23 Jan 2025 20:01:17 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([2408:8406:78d1:bf49:24c4:f518:9b3b:36de])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141d67sm6758915ad.153.2025.01.23.20.01.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 20:01:16 -0800 (PST)
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
Subject: [PATCH v6 3/3] RISC-V: selftests: Add TEST_ZICBOM into CBO tests
Date: Fri, 24 Jan 2025 11:59:59 +0800
Message-Id: <20250124035959.45499-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250124035959.45499-1-cuiyunhui@bytedance.com>
References: <20250124035959.45499-1-cuiyunhui@bytedance.com>
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

