Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45453211A14
	for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740149849; cv=none; b=HVd4xBWuZEidQJxdCsQaJVy/IT48/MALwNzVe2CKZ3i5IbM3kqi5BvCnPvbScPlhypoj4ZWncvZWMfoNp/dwk/zaXXf8lsbuna6etzBrM5sPAAnklHy4ttJcSpug8FQETXGthSn8kjLHmD7q3zfyPiYVrt997ZEbvPxJPsz17Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740149849; c=relaxed/simple;
	bh=37qdTKtD627l5e6Qxc7x2IExKolZyjtaGfIkopSnfWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UyQokJSfCnfztSqzO/QqGVTtclPZOxLzkdoeADLPhJwMLdfEgfzJbXZ0dDdQqb1g9geZOhZBLW0j2mqHN80NOxeRX8sc8mHB9yZDNRMcYzkvV2HqgINfu2Z1sjhVUACPdeXdITTfgZkkgVOztj+B0t9pNl47fyM4lcMcNouX0ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Su3emQaM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Su3emQaM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43989226283so15432975e9.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 06:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740149845; x=1740754645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5+0DAJFyGg9dqAHMt/74M2g7aCiRWRLOEFqoe5G5I8=;
        b=Su3emQaM6/e+yrUGQ2HLrfnmUQ2eX1nRZlwtA0uVF9oXMSn9DD+RkO8iM4IUPYm3wR
         2Jgu7IQegeG3LdXwKMBrw2BsX8oqWG8f6BUQMhkHvK/hnFjCcNHuRMO9JuaceYHmX7oU
         YN7ib1wuxSxLQCdHg6zknxXy3cuxtbSEaaGcbjnteb2MACMoxLOIO2Oq8I1prVrAvueY
         a7mEGlHc0STb584B39bPVf9P510KjUn5V4e7mq9H4VajEztAoXDfp9kyCrb6jWP81ePX
         rike1u8Rt4BU6wig0t7ZnHZ6Xaq4op5OiVFEp43EI+PbepUlJbOynZJPFZ17VM89ADKr
         FLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149845; x=1740754645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5+0DAJFyGg9dqAHMt/74M2g7aCiRWRLOEFqoe5G5I8=;
        b=VCho6c+lc1TPMPOr6lESbDt0PDckAw68k3KPeIXOTrEoffxCFNbbugCI0YPg8r6iAH
         SQMMn/XQFyzzuK3F+dL5YFNdq/bLRPzjL9zACf2sHFXIMeU27VgDh7LvwIOudZfo2QtE
         9NAqhsSRfj1g0AuV92Zmn2ALMSr623KiWn4eir6CnMg1JefvYj2yWdSqA9BTyw3iYKBs
         yFM0raHC6XVdd74ojJ374aTisIsXB+5pULxAkSPEv9OiWlMJruo9ZbNi8TEbP8D68T+Y
         x5qCPcTq8aLAep7oGXPyOwM1Kfi3DX8J9R0/no8pHedRCxJjuPNA1PnUCvVWZG48tCXn
         y3kg==
X-Forwarded-Encrypted: i=1; AJvYcCXNy8iHfbLwLoHBKf9vuoVB8WGQKVOg0EBUu+kpINBM8Tqwmf2qRnzXcUxnZcyDCi4cHQxsOo3J+Yo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu1n+OxP0kBhV605LcKk6uzsu+BnrKz9gkf06pAtFPbzagE49R
	AnLcZV9jZ+xPZkKm/f74A8n/j26JhkzWEuJmkFh1i68YFMG9+wWqOGGoVHkFj/w=
X-Gm-Gg: ASbGncuDYWrDannHRCb8JnKpbd9z/0x6L7AAvoAWLfV6281j7WEMYXm7ohtBEhk7p94
	cck9Dwm2zg3RAU/1NOBDZAJlE/lQjECYMkRGJ7nPjoi9NnxxvjBFniem8aIumDsQj1xTazleH3Y
	E2xHS7QE3bixqFtVG62b/0JPUbd8lYyzvffkor0HYr5eGFZROFr2xaRclkMWMdysD6R5Q+9rlRQ
	9N2dmTWG8aAY4yTPjMrYVSPtBuFBt1DG473Y20iWk7hzqRA97EGzmvaGQIMEBEgSF1DVjis9u6Q
	tPdVCnrpwj9h4g==
X-Google-Smtp-Source: AGHT+IETt9kJd9Q7ffWHdL/UIZ/UKzjspmPFiByxf6WkactZKn3mvY2VzKa7KOpSc146Ehnho9+HBw==
X-Received: by 2002:a05:600c:5253:b0:439:a093:fffe with SMTP id 5b1f17b1804b1-439ae1e9601mr32867375e9.7.1740149845532;
        Fri, 21 Feb 2025 06:57:25 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce428sm20391205e9.5.2025.02.21.06.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:57:25 -0800 (PST)
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
Subject: [PATCH v2 4/8] riscv: Change check_unaligned_access_speed_all_cpus to void
Date: Fri, 21 Feb 2025 15:57:23 +0100
Message-ID: <20250221145718.115076-14-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221145718.115076-10-ajones@ventanamicro.com>
References: <20250221145718.115076-10-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The return value of check_unaligned_access_speed_all_cpus() is always
zero, so make the function void so we don't need to concern ourselves
with it. The change also allows us to tidy up
check_unaligned_access_all_cpus() a bit.

Reviewed-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 02b485dc4bc4..780f1c5f512a 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -218,7 +218,7 @@ static int riscv_offline_cpu(unsigned int cpu)
 }
 
 /* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static int __init check_unaligned_access_speed_all_cpus(void)
+static void __init check_unaligned_access_speed_all_cpus(void)
 {
 	unsigned int cpu;
 	unsigned int cpu_count = num_possible_cpus();
@@ -226,7 +226,7 @@ static int __init check_unaligned_access_speed_all_cpus(void)
 
 	if (!bufs) {
 		pr_warn("Allocation failure, not measuring misaligned performance\n");
-		return 0;
+		return;
 	}
 
 	/*
@@ -261,12 +261,10 @@ static int __init check_unaligned_access_speed_all_cpus(void)
 	}
 
 	kfree(bufs);
-	return 0;
 }
 #else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
-static int __init check_unaligned_access_speed_all_cpus(void)
+static void __init check_unaligned_access_speed_all_cpus(void)
 {
-	return 0;
 }
 #endif
 
@@ -403,10 +401,10 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 
 static int __init check_unaligned_access_all_cpus(void)
 {
-	bool all_cpus_emulated;
 	int cpu;
 
-	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
+	if (!check_unaligned_access_emulated_all_cpus())
+		check_unaligned_access_speed_all_cpus();
 
 	if (!has_vector()) {
 		for_each_online_cpu(cpu)
@@ -417,9 +415,6 @@ static int __init check_unaligned_access_all_cpus(void)
 			    NULL, "vec_check_unaligned_access_speed_all_cpus");
 	}
 
-	if (!all_cpus_emulated)
-		return check_unaligned_access_speed_all_cpus();
-
 	return 0;
 }
 
-- 
2.48.1

