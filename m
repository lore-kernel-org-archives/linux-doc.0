Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBEB8249F
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757459; cv=none; b=nRlr2/rRhfoSLRy9aNUJ3Aeg2AL4Ge9/VuqcEcuKQYlX+CSfl/FwoxN9xmLn5Qr7mGqhU+ctgw3k3pDeDqnmSJOJwuGcvyieIA5/J+XLOLu8hyJQ/8TM2uS3tS8LWpsKcRVKaCRNUWY2CWcWi+dcoGvqpP1r4Flsqs9z2rPXCH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757459; c=relaxed/simple;
	bh=G+K9MvSpAIpwDwMmunI0YSdJnqQJGTJZcC3ONEVxX60=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=fFCOZh4WEvoI8/6zMu1styVmNJvF6Zyzxz0IGLRxmDf7++lmUVQV7kWerCycXeIs7GbPwVSpvQdHeLyCmIzTGMcNFjccj63tVNbh32+jDE7+ohwD2cghZbyk1WD+uet8kdWJU6dlsDza4iPCil8li9YyBf1BgWWnVFYpbh1o1Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=cHOO9q23; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="cHOO9q23"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2165448243fso82248095ad.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 00:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736757456; x=1737362256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=cHOO9q23GP2O7KP6uZaMhyM/GU2r/yvcPeB3+CvTGbQFRR9H0zYS+AGKm///ggF7pV
         trFSg7/URSm/Sb3gDsJQGprxO3BkFEbTeExnuuW4XDgnp6SEtM75xFo7rrTf0plvVLD0
         HT0mSJ+BCtdPELci9mNId69V7jAhlvyZWitAHivBy4jo5E9D8sXVK1jpbUQxKcyitIFG
         BELszUcV1Dl0lzPS9MLgZvYBkBIBpMqACkikICkbWAq05YI1SJUZm2PSEdRo9OWZWKPv
         y95h9JmgAacTW2St0q/jh9rgKKsTsfwYalNyWQ5126lkf77LJ338t8Q8dcmjZruc61tl
         MurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736757456; x=1737362256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=L0WhWphQl9o9ZcTIxsVqx+uKXLGnphx45pt/JskuaS1Baz+oLVvoh/Iiu2dmyfd6Cl
         V2iA8h41vbfF/S3CNlhTXpKWSproCXhbCbyJAuj/bmM/8udIFaxsaGimKmVL264tHCjv
         M974VxR3qOBwf5YVxPYkCLPCLO3vKSrKnT4Ywxd/fHiIcCX5SaMibkzSdQUfA4uBpvtV
         qdrMO/dasJvgcdG9lswQTLjO0jcmxEW4mB5UBEUqp+S4JRIgfVf8uHP16pDgv8dZqh3t
         JtmJ8rqtU+1H1E6gZ5Tuivqc/nqPfMMRXmVmeyiQjffQT1au/hynQ+Eq+X7m6P5n6MKm
         Dg8A==
X-Forwarded-Encrypted: i=1; AJvYcCUboSZ2PzQb4N3FxQCc/z7RGMWV62EwYAmizhiKrn4qFrN8Bm9U00Tf8OxEzv0anr3lC/8Oz0GbA78=@vger.kernel.org
X-Gm-Message-State: AOJu0YxakRY056kkdINj9IXnYEp7vU/Uhs4oPnFjdkwdCGvv+SitSJcQ
	qMPNrDTW5WunRL8DJjN7S0WAiiPe92oYTEUrIw4/mQKVpzg1vSDrGWqrXyWLyQ4=
X-Gm-Gg: ASbGncvV1EElWYvoWfpqQt7JNEL3lfGtOeOGviSR7txou0uXQGEvMVC1PsuESHtLs6H
	eFSV38RD7vWgXMOgDbN8BIYc6wPvyE/VB9FwIgZ3FEQBqy0sVzvIwC82P1g2KE3qrLqPH3bWEC0
	xNVa/8QPTbWrvS5vQzRahzc5/rlhy5zgySqw/OlzxxorNDMBeBeZdKaqYc2Ormf+7q53nR7s2G4
	WCZqCrq68+SvsMYGcpHU1P7pAMzWq3OzUYRtvfBnmbxcbdqhkmOjSTKTZ3VLvw4WixeIJSUYxlF
	0yVccm/M4ITiCN4=
X-Google-Smtp-Source: AGHT+IE2vpLLAbTwFgumER+hiNZPVCtR/vb8/ZvSUV9VI3AIzL53lbAShlejX+qABV5VNq93sKjw+w==
X-Received: by 2002:a05:6a21:33aa:b0:1e1:afa9:d397 with SMTP id adf61e73a8af0-1e88d18ea9dmr30431962637.15.1736757456055;
        Mon, 13 Jan 2025 00:37:36 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a317a07ceedsm6427433a12.6.2025.01.13.00.37.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 00:37:35 -0800 (PST)
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
Subject: [PATCH v3 1/3] RISC-V: Enable cbo.clean/flush in usermode
Date: Mon, 13 Jan 2025 16:36:33 +0800
Message-Id: <20250113083635.73826-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling cbo.clean and cbo.flush in user mode makes it more
convenient to manage the cache state and achieve better performance.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/cpufeature.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c0916ed318c2..60d180b98f52 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -30,6 +30,7 @@
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
 static bool any_cpu_has_zicboz;
+static bool any_cpu_has_zicbom;
 
 unsigned long elf_hwcap __read_mostly;
 
@@ -87,6 +88,8 @@ static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *data,
 		pr_err("Zicbom disabled as cbom-block-size present, but is not a power-of-2\n");
 		return -EINVAL;
 	}
+
+	any_cpu_has_zicbom = true;
 	return 0;
 }
 
@@ -944,6 +947,11 @@ void __init riscv_user_isa_enable(void)
 		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
+
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOM))
+		current->thread.envcfg |= ENVCFG_CBCFE;
+	else if (any_cpu_has_zicbom)
+		pr_warn("Zicbom disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-- 
2.39.2

