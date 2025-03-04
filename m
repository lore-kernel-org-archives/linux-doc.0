Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781E0202995
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089624; cv=none; b=DNgcs4EP9494sRmb3TItcWF3N/bj5iioG4HhgyuZIaQ5Z+bAYd2KHHqIHMJ48h2DY9hs1ZVCe12XtmlKoICP/rkgYlonpHIBKL14UMmZoe6RW5APppKWrjH8jBMl7vbCDfQzizqsv76CRa449X+eSFzdtRDvAIGboDd8ORQExtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089624; c=relaxed/simple;
	bh=37qdTKtD627l5e6Qxc7x2IExKolZyjtaGfIkopSnfWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tp0prmsEvnFcNHhC5nom+peO1D5Wkd8HXG3pHaO7eCBskXtyGCzgJDm26MEYagcIysmP9RK9wtZSilhYVLLLpDVBJf4achuwK4aUROBlgNaa9iW85/OJwwEnu1dzLw5fUY4ziHLVYEQVZMXhcCIj1sP9DyIht4O2b/7PYXzQPpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=UkvTCHiB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="UkvTCHiB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so37858965e9.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 04:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089621; x=1741694421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5+0DAJFyGg9dqAHMt/74M2g7aCiRWRLOEFqoe5G5I8=;
        b=UkvTCHiBTyGl3Nw+fp/pvMuLhXk/il8e9d/VFc9Hj6ltvkSdfYE13AB1/2Xz8UxHmA
         GQy5L3po2ILOqNqLqzzYjqjdJJ+yjb1LWL7yIYsKE9ykH6E4pyAGOlwLPtQXQJh7bPAt
         9RpTIUw1yv4TZaW6lSqpfjEGpERRgV3v0xMwkD5Q9JEZqYp3pCiX2y9wytH3/MWIu8WS
         VZNbc2waz4HSE2hvbZDsgFEFZrcmp3T37N4O/VVzb2lUstp5APYaCDkXMKJj4kP373DZ
         LUcm3i5yYXy2CQn4ihVValkcBv7sohcgzTTD68twpo5x8YTH83pXjEhxGhZv36ATxdUV
         Rp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089621; x=1741694421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5+0DAJFyGg9dqAHMt/74M2g7aCiRWRLOEFqoe5G5I8=;
        b=XJpEn4hQVVzs/UlbZqlNoU7rrHNn76+GebV/cfyAke6MJdSjNJ4+u3gnT6VLvDo9/G
         SUjthwyxnYKmOUqzmPN8BW1HpmUEy6K/Whf5qsrA+FPqVQ1BWOaJfYHQ6np4W7xQgVPx
         mmOPYvi4uLFFb3cJAn4Ft5JnwsbGre26x5T3RPz/WzAYV/RXCciMQTpB1BReBFkQ/3pw
         VuzA7kELbFpK4BtTbdDuCS0TzBS8jvVQcR22tSaOQL3VG0DMUrs9BuVpLuEEbSi0fQwi
         xUCaRCZEaioObx4srn1PYrtKpajbjE7vhDwsRI3/BAXdzaOMsvk0uyYapCvyayTJ/Azo
         Zhbw==
X-Forwarded-Encrypted: i=1; AJvYcCWYwiBuGeR23FJveID3FlvpFTB05E2qyP0mYLNeUO2FqgLn4pLC9G3pv7FmDbwBUnfIo07H642r3zU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCnX9V0Ea6YwM2bbJkgcn7AVU7wkLuNEFOmJEgwBq4bkbERCQL
	4yA1biG+JpiPORDLq/1v6iRVteUSZ+prXo1yNYc+sDVqaR515mKAG+mWp9kHHdqsKsl+26WpEoG
	0
X-Gm-Gg: ASbGnctZykeUjnLNn8ZPBkhs4+L3csMb0DTbF40C+tqSfaJIVkpgYmpDMQUmJBgVqVM
	/5ecYO30/XXmWXHiuYPC0A4Ok2Jzkoz5t1tNywiBnjwgmn7lMC6h2HEPA1WZjqOBG5AIgzdxllZ
	v3fGDdG/WmYyqo9RrBbbZNzwism/NzQhNkFLPcl6dzA+I2Zg34dJHI4j5DnhYJUuc4C8U3Y9oKq
	NQN7OwTxKARhlaJUZJ01S+PCs+95kd662LoclbE/ikcIq69QHnFUV9qru/Ox7r+pwhO93AwYVnQ
	KjkK+Wly7XTNNGsFdjp4o0Oe/cUJTyzQ
X-Google-Smtp-Source: AGHT+IEqMgV5t8PcK9JSG+SOO4LPXPlwofpngejjCplSgEhGn5nYR0XjUC86Q3nC0sypwkMwdVM5mQ==
X-Received: by 2002:a05:600c:4693:b0:439:8523:36cc with SMTP id 5b1f17b1804b1-43ba66e66d7mr161122735e9.11.1741089620734;
        Tue, 04 Mar 2025 04:00:20 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795962sm17966864f8f.13.2025.03.04.04.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:20 -0800 (PST)
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
Subject: [PATCH v3 4/8] riscv: Change check_unaligned_access_speed_all_cpus to void
Date: Tue,  4 Mar 2025 13:00:19 +0100
Message-ID: <20250304120014.143628-14-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
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

