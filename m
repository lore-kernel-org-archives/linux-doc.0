Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DB22116E4
	for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740149847; cv=none; b=hOrP8alFK1+CCEsou1LL45m1LWET6Gt4Zfv9wfYz0QRnO2s9P3QKFQRd5X3tejTf2Zm5erOZ8KKmUQO6TlTsic+Jy59eYnxouQt6oky9se96Plz/MZk6aQ4NG96LABn22W7HWX1P4fcavq1Mqpwp2myIaEZhoTHmLIEAHUQHe0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740149847; c=relaxed/simple;
	bh=o9zHYBZOjWU+lYENxdkNUmWAHWMdM0ccAzzowc3/Wqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ev5dQJ7QzfmT9NvIMTKv7IX3NFsqLc3CF4CebaRZBh1XtGI7gQvxtTN/yA8STldGf0UnkuFPjomKAZUEYKcyBSergwjvjlobHH84xUcYMOexyf/rBJN0W4OCChsDqhSZiAzmfSAChTmgw1QkiCHJW7zOpwlokNt+uEalD7uabPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=dEZFdnjO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="dEZFdnjO"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4398738217aso19010065e9.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 06:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740149844; x=1740754644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BL25umXnpXBBzwUoMnOj2fRLliDIrDaDucRmmKK49J0=;
        b=dEZFdnjOpgB62yknVjbYccKccJW7GSRFADDP8PtBHj9BVXeOZ1u0UelbYwgYH+RzPQ
         /VHH+mz8/HedQ5rlf2l24hixzYdCibvSRG73x+/swjhD9NYmHFOnIgMVqmWTOzO0qz0c
         zD/KTBdklsLzDB8lrovOLrPhO6QcH5mqWHx5IJy3OwcMmtIK8UAcRqAl7AkVrx1f42EX
         XBJkrcZimnn1rlYmecCSbHK6FxFtTuXwhZ+d0BqoOx1GMlSvMJYnuffPZwoReYIbHI8d
         /wSOprw1eND6kOc4uynF4QD2pzpjAJtry9hHxTi6sjJqr7icXrwJVWxwj+UMABm/HNi0
         CTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149844; x=1740754644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BL25umXnpXBBzwUoMnOj2fRLliDIrDaDucRmmKK49J0=;
        b=l2GrLncsPMR5rmKHb7WmVblT1Ha/3XxjEaU6PRAKjPaCcWQ+Y8lyYLoKjfCRiwMmvA
         0AiSl/P7TjYZaXU4MrBaPMAv5//AmIU4cRij7C+2cTlUVFixHmtPVJHAU1/z5h2HjFiP
         apqmrdW/4CIaGW5NftED9N5chWyoyu5s4QKLsCdMkpj2mIardl+fvR5sYUXrJZz/cess
         QxFtEroQW7rH9BNViGC5YFj9nVVfoEaNJeAAOqaxy4nBTrClnRSApBcMEMhvgTestmlX
         CzUTF2GwxxjE1ckLeerITmQjBf0H4m2xORIKw4CyWcTJALAhjI06D+WPgXbeo5ym8NG8
         2ucw==
X-Forwarded-Encrypted: i=1; AJvYcCWaAE8hahQRQBVn6WF2nuqBTx8cX3D4Uqk6+NAn3GSBw23Y2v1m2CWiX6sM/TU6F13xxXF1btLWR2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVlw4fR4PBfoFjQTkd7IfdQsnm8kKo48CpV4gRFB/9XNOfyugp
	RTqXxoDV/+ON9GqugtGbV8S8hJkRge7Xc35Np4BVK111zl/NIJX25eKORwRLZWA=
X-Gm-Gg: ASbGncs7JsEIsVouwqr+RIgeFkgF9JpxziXCzWJA0mg54WyEI+m9v2BGH6Cdv6c0OOQ
	/Vkq5xALwJzJn3LG7+ZagaOAqavKHhFYm060zBrWT4rXtbClAjimov0gLI506JvJ/zl0GHHzw36
	DpmaWU7Ud3Bffyimxbs2TIb2svLI1yEfl+gCgayRzwq5Ie8IxI/rPwYU0VEAGRozMwgIRaNE2tx
	c1DqhmtjmX5XdEMIxPRmjYKUi7aYr8JDxESEY7xYl3Qxsex4k9YUPJ1yQQmLwWWn9AOsDmsNMfJ
	dL/goTSZvFGzig==
X-Google-Smtp-Source: AGHT+IEUAirr8QCvcHPxcSxcdTz/htKaV3QDGHz78tljhwlnJaYoBkEeV24i5MRcuIDBul2oYPovkA==
X-Received: by 2002:a05:600c:4e8d:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-439ae189b90mr35989955e9.0.1740149844345;
        Fri, 21 Feb 2025 06:57:24 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce740sm19898235e9.4.2025.02.21.06.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:57:23 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 3/8] riscv: Fix check_unaligned_access_all_cpus
Date: Fri, 21 Feb 2025 15:57:22 +0100
Message-ID: <20250221145718.115076-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221145718.115076-10-ajones@ventanamicro.com>
References: <20250221145718.115076-10-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_vector_unaligned_access_emulated_all_cpus(), like its name
suggests, will return true when all cpus emulate unaligned vector
accesses. If the function returned false it may have been because
vector isn't supported at all (!has_vector()) or because at least
one cpu doesn't emulate unaligned vector accesses. Since false may
be returned for two cases, checking for it isn't sufficient when
attempting to determine if we should proceed with the vector speed
check. Move the !has_vector() functionality to
check_unaligned_access_all_cpus() in order for
check_vector_unaligned_access_emulated_all_cpus() to return false
for a single case.

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c       |  6 ------
 arch/riscv/kernel/unaligned_access_speed.c | 11 +++++++----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index aacbd9d7196e..4354c87c0376 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -609,12 +609,6 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
-	if (!has_vector()) {
-		for_each_online_cpu(cpu)
-			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
-		return false;
-	}
-
 	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
 
 	for_each_online_cpu(cpu)
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 161964cf2abc..02b485dc4bc4 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -403,13 +403,16 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 
 static int __init check_unaligned_access_all_cpus(void)
 {
-	bool all_cpus_emulated, all_cpus_vec_unsupported;
+	bool all_cpus_emulated;
+	int cpu;
 
 	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
-	all_cpus_vec_unsupported = check_vector_unaligned_access_emulated_all_cpus();
 
-	if (!all_cpus_vec_unsupported &&
-	    IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
+	if (!has_vector()) {
+		for_each_online_cpu(cpu)
+			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
+	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
+		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
 		kthread_run(vec_check_unaligned_access_speed_all_cpus,
 			    NULL, "vec_check_unaligned_access_speed_all_cpus");
 	}
-- 
2.48.1

