Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71779165EE5
	for <linux-doc@vger.kernel.org>; Mon,  5 Aug 2024 17:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722879504; cv=none; b=DJC33B9tJHzXhdroSqHu9WhSBHzgKNKRARB4pqmzSbMWSIkoPVNsu7jxzU+1IGuBUhgQaQ742nMELWrlOZeh1EKiliR1Ueu+eSZc9OFcs+F7R9gRWyvBxUXHt0S6xZDMv3c01OvS85D1186zyzuNHeBC7fvtVryO0kKyzihuio4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722879504; c=relaxed/simple;
	bh=gzNYS6EG/C+/J22vSWSVkK/INf8H7WnGIxBg1zVunOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RAsp8C+VYwhuVYK7PDChilrWy6sNYstjghHTbeFywAUQW+5LxymiYbTrCEysDI9rBlfVGphYIRm8Fo3MJFs4rnKN8Sy3+eUEqJ6h4Ss8vQv6CZEcdX09x+R90kBORIe7WuOrUk8STpqXgio3sE1VGCSnKsAC/pkvmeCdReGYd88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VaBMSlaM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VaBMSlaM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fc491f9b55so85407205ad.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Aug 2024 10:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722879502; x=1723484302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yIqXJOcsWTmDQT18ltvBkvSKfPE+CI0ACIv+CWuAfhQ=;
        b=VaBMSlaMR0hX6hVSyqusF1FI1H7DHUBlj8ECknqViRb9PSx55hIg4rlEMbB0/9/5YD
         l74bRlrADBGdX2kWRysOX8URZ9ks+Vlw5PoJP0VoiDmyVQmNIrvUl3e14TEhF3YTkYnr
         P/CKFYTnjZkWyiXGqkaX1wYej4di0Y/WeuTW7ly2Bpu2qKIY4q94agWyxj7fmXMCScul
         jumnDHt2WJljzBY1hupEh+FXH9XZA2jq5yTVP0A4LAv6qKEJ+dSzoIufTkaWttKAJVeF
         N0/q/drELwTdEIoqCR5TeeSkhyy8jvL9jkRuRhOVwfDcTuGvJVVapOWG/0sAkvkWJUMG
         JuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722879502; x=1723484302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yIqXJOcsWTmDQT18ltvBkvSKfPE+CI0ACIv+CWuAfhQ=;
        b=tgG3rFmQEV/0aT17WWVsH6+U7LrKq05NTVpZJGhzL5FZquq2mu+mAFk2Ojbm1utNHC
         3bm4aL5I2qn8ReRIWZbO8xIF33g7D0vEnSBi9G2ZfiqLpyMujZeQ5LFF6UwN4lh56rvF
         xp6r5GcgaQxCSvDBcRXTgxoW/W/LabOcEV/yFUcMQCSDoiiqCExx1Tu5MgIoGIxl0lco
         dOMz57YHAEPhbTEWJodFDyYpqvbyV8SX5LwKWV5H3y5OkKaN8iF06hzM+qdIQJushD0v
         cuFLcBCC8T+0dZhcuxN7tN1eiHtse1PP7Pwm4uwtkDyzjL5TGVsOe88ulSisCfoBbmui
         jfYg==
X-Forwarded-Encrypted: i=1; AJvYcCUdPAGCh8k9kquDL9FjeIrM/8x8/W0g17gPd4JtzeIlEl5EV5yY+fS1CrqxWuFjpJBnb4E1Dh7QbeEVt+a3VoRmuFWWAJ+vix0s
X-Gm-Message-State: AOJu0Yzr/lIoyUB1lnNVWikJkUc/3GEqG7H50j4d7CK/iITkICl8pOrI
	NX9LR2TS0EyFS/xjGJNfCwo8JRCnm5EvmaOc2+ebvM6d1mGNuQh7xd7yK30cGI8=
X-Google-Smtp-Source: AGHT+IGA4ao6KXpD/OA6uBRaBG7aAABpIJEYunLTtbMZ72A9gi5Guwmmt27eLbpuv2kqVPSBJEaCbw==
X-Received: by 2002:a17:902:dac4:b0:1fb:90e1:c8c5 with SMTP id d9443c01a7336-1ff572c487fmr112872505ad.33.1722879501771;
        Mon, 05 Aug 2024 10:38:21 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5929407asm71128435ad.242.2024.08.05.10.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:38:21 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/1] RISC-V: Add parameter to unaligned access speed
Date: Mon,  5 Aug 2024 13:38:15 -0400
Message-ID: <20240805173816.3722002-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a kernel parameter to the unaligned access speed. This allows
skiping of the speed tests for unaligned accesses, which often is very
slow.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 1548eb10ae4f..02f7a92a5fa0 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -400,13 +400,94 @@ static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unuse
 }
 #endif
 
+static DEFINE_PER_CPU(long, unaligned_scalar_speed_param) = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+
+static int __init set_unaligned_scalar_speed_param(char *str)
+{
+	cpumask_var_t mask;
+	int ret, cpu;
+	long speed = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+
+	if (!strncmp(str, "fast,", 5)) {
+		str += 5;
+		speed = RISCV_HWPROBE_MISALIGNED_FAST;
+	}
+
+	if (!strncmp(str, "slow,", 5)) {
+		str += 5;
+		speed = RISCV_HWPROBE_MISALIGNED_SLOW;
+	}
+	if (speed == RISCV_HWPROBE_MISALIGNED_UNKNOWN) {
+		pr_warn("Invalid unaligned access speed parameter\n");
+		return 1;
+	}
+
+	if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
+		return -ENOMEM;
+
+	ret = cpulist_parse(str, mask);
+
+	for_each_cpu(cpu, mask)
+		if (per_cpu(unaligned_scalar_speed_param, cpu) == RISCV_HWPROBE_MISALIGNED_UNKNOWN)
+			per_cpu(unaligned_scalar_speed_param, cpu) = speed;
+
+	free_cpumask_var(mask);
+	return ret == 0;
+}
+__setup("unaligned_scalar_speed=", set_unaligned_scalar_speed_param);
+
+static DEFINE_PER_CPU(long, unaligned_vector_speed_param) = RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN;
+
+static int __init set_unaligned_vector_speed_param(char *str)
+{
+	cpumask_var_t mask;
+	int ret, cpu;
+	long speed = RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN;
+
+	if (!strncmp(str, "fast,", 5)) {
+		str += 5;
+		speed = RISCV_HWPROBE_VECTOR_MISALIGNED_FAST;
+	}
+
+	if (!strncmp(str, "slow,", 5)) {
+		str += 5;
+		speed = RISCV_HWPROBE_VECTOR_MISALIGNED_SLOW;
+	}
+	if (speed == RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN) {
+		pr_warn("Invalid unaligned access speed parameter\n");
+		return 1;
+	}
+
+	if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
+		return -ENOMEM;
+
+	ret = cpulist_parse(str, mask);
+
+	for_each_cpu(cpu, mask)
+		if (per_cpu(unaligned_vector_speed_param, cpu) == RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN)
+			per_cpu(unaligned_vector_speed_param, cpu) = speed;
+
+	free_cpumask_var(mask);
+	return ret == 0;
+}
+__setup("unaligned_vector_speed=", set_unaligned_vector_speed_param);
+
 static int check_unaligned_access_all_cpus(void)
 {
+	int cpu;
 	bool all_cpus_emulated, all_cpus_vec_unsupported;
 
 	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
 	all_cpus_vec_unsupported = check_vector_unaligned_access_emulated_all_cpus();
 
+	for_each_online_cpu(cpu) {
+		if (per_cpu(misaligned_access_speed, cpu) == RISCV_HWPROBE_MISALIGNED_UNKNOWN)
+			per_cpu(misaligned_access_speed, cpu) = per_cpu(unaligned_scalar_speed_param, cpu);
+
+		if (per_cpu(vector_misaligned_access, cpu) == RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN)
+			per_cpu(vector_misaligned_access, cpu) = per_cpu(unaligned_vector_speed_param, cpu);
+	}
+
 	pr_info("\e[31m%s vector unaligned access\e[0m\n",
 		all_cpus_vec_unsupported ? "All CPUs do not support" : "At least one cpu supports");
 	if (!all_cpus_vec_unsupported &&
-- 
2.45.2

