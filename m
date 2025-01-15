Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA97216E08
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 02:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736908864; cv=none; b=GsEjBy/vjyP3O0giQGuh9pI5JxfsjZPb6/z3vThiB7RbdrXQYGbTWAEd2b2Mi4UifPcTeAgni6cy2RNhkP7H4FUDIq24F7jhWnsLyeFRUZaeq+MgUIYPWl8zCEXjtazpzsffh5iRCzbJ70mGFStqugRYioAGvx7T/PHArz1VSqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736908864; c=relaxed/simple;
	bh=G+K9MvSpAIpwDwMmunI0YSdJnqQJGTJZcC3ONEVxX60=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AjMgDzCilf3jEURCofFYKPKFWhSTaOAB4DmIQgcYAmNWoU2JVL4E+JzbBojY61uPZGoBhKhDns3zSVl6AzEmbEgQHWoDHiXrEz8LnXlv8hU+19c5xX8p9dvdoHgkDSCSfJa2CJuQw2g35u2LEaB6kzd96lIA8sdfpBsaQ99ouS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=N9vqMPRe; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="N9vqMPRe"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-219f8263ae0so102430935ad.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 18:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736908862; x=1737513662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=N9vqMPRelNsEAHkyRKo7lK/eY6HPffqDkwqLLl9XD08GJblRfKsJKzA+709019O5Zg
         fCTzTkG5qCJKrdSP1NZTC5783REeByOZADHoMnRAfy1MgewDNe6AUPmyvmb3O5+i0PAL
         FSIdFfIGCxXploC4DPx7LPCtiX/lom8JiOdfJOIRYrsnWGlwUYssHiZmof8hCgf9PUcs
         ga7PSF/fnvpO2Z6Ubz/UmZcZWbyN7mUc+t53sd4HWPhJaE5M3tI7uB97SXouLLrTY5l2
         6rIE2Pt/NY+jDZpAW8U422tpJRhCo8sIQzbqeRhDrkBEJOu2i8G/Q+WFwVjci6oC1cfe
         IQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736908862; x=1737513662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=pu1zUP54P4OUnkXbyLM6ueVMAwJimtwguVleX7I4Xt+/vgTTMH6tfMd2gsqi9rPGgJ
         s48zZwrCYvwRTbsc9sV95R1pPXrY1PvM2QOIz2hEzhCFPN4BjMguxTkzlfPNfVr5zITF
         Ue2p5dX3FiNzD8mpnCYHzkkvLgGshynG5HNRpIZDQwatu4KEB9LalstwLjqoBLjuRSui
         I2D3+7jS5gf1Zqsm+O2KKuVJdW/3VvVrbgsNSdSMesP55dljXQft/fDnV/we/ra9/+/H
         HCoFUBpXjCjeb/eBVU5YvjFx7CP8PzLAsJHb2CO8bHLAHTbzrw0M8OtZB9WvDGiSOXnS
         ejCA==
X-Forwarded-Encrypted: i=1; AJvYcCWCw9QtO7OttWdzXZTdaWio7J7nmNCkldwEQ/JnfbZg5l937ZWWSam3s5htyHRf8ZyJ0rY3mzr+p/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX8TvZvR63zXH7Ln9zR9fzAXGOz55dpKbUWX57ln5n+qGClnls
	USO3aAsaD9Lu6xkT4wA+BoFF84+KleCn7ZyLV2OOYvl1rYb/7j45nMb2GLRWo/o=
X-Gm-Gg: ASbGncu0ft9erwExfFxdCYXSasMWit3x6aT/RWVgLmT+Ww+2s8qZxT5kLZY3Wb4Ttfl
	d1kR8n1xwLvLFLckABWRoJfUYbDoGfSTSTAOJQoFMg2J3M+tlMkVLTyUYyvAk6eA48YNkVoKlPz
	Lrgv+l1qT8FrcIgRbdqnunrMkF92NjMqbA8lbYANd2mAKY0aaoOcdHaJw5V9ubgAslTkm58jegQ
	T/uY2kU79xs7fJCaI3Dy/LBQ9gZXsYCwDGbpx3LnE6f2KydsB/2ZXWIpCAhk0YJ5pDemoH34Iec
	UilouDgpSB9W65k=
X-Google-Smtp-Source: AGHT+IHRs+ZLjJaMOCMFOSev5yey8o2EV/Ai+cdpqR0LkTXM3ZpNmIhiXmJyiWzASfW23X6Ls0/4fg==
X-Received: by 2002:a05:6a00:4502:b0:724:f86e:e3d9 with SMTP id d2e1a72fcca58-72d21f64f72mr39087001b3a.14.1736908862297;
        Tue, 14 Jan 2025 18:41:02 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40680e67sm8321841b3a.139.2025.01.14.18.40.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jan 2025 18:41:01 -0800 (PST)
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
Subject: [PATCH v5 1/3] RISC-V: Enable cbo.clean/flush in usermode
Date: Wed, 15 Jan 2025 10:40:22 +0800
Message-Id: <20250115024024.84365-2-cuiyunhui@bytedance.com>
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

