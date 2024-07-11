Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3EA1A00E3
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 21:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720735192; cv=none; b=tz3WAlG8XvV5EJwsr88zguMjiiTAsXCxo/t6Ql1epWL2d6yYY63hk37QpaVbeBh/wIPwkrd2NXOcHYgZT5OieZ7m94ZvnbR0V9WbUsGPgTZQDUMZ8IHwqp4Dbc5JKk2Kz6g0vTxQQk7AOO+9IrYPVfqApNDHDrvj4S03xEUIiCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720735192; c=relaxed/simple;
	bh=rtEudnmqaObKSErfYuXzgGVkpGS2fa1Q0F9KuEQpFmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ogZd7jvoKw7aC11CdDIgVggL7AD+pk2Tuoodwf68D/oJy/egixnxMthjDr6DO7FQ18MlAfJ+aV4QLBPEDhqflNccw6Z9deJZmM7a34NCjNtpm7Ltd3zbQvYn434PKT2htfMUaCmlYLtlIofoxq1AsinFmUAgX61I3q7plPBd5mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=pfC1G3PT; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="pfC1G3PT"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70b13791a5eso1252377b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 14:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720735190; x=1721339990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD4Jrv7yyOhSAoUDP5JzBFrS+BuW1YkOZl4khKRzO0g=;
        b=pfC1G3PTVPR40W3g/qj43E8gOioo4wkzgIckQWdj+gSRFO6F5Aa/7uu3gkjCtmX2cx
         8KFCk1d7rw7F2S3s3unToVan2iEImlRcCQmmfq7GLW75pDVUA+4jMZguzBhnKSvAFIlp
         l/LFViq7rvTlOmNPjZoby508iMdsDXZirygxM6zHbrFZxjQUGOCosoQctH9nVmbGJwb4
         9ykAy9BI0gzqz+AQSugkniwTknV5IBBTOpubwn7dDLJSsqmwWPYzNeM2ZUhu9UAytPMC
         lr78pYfmnD8idsS7BT/3GiLOsWhQg2qf9k/RDrk8r0bvGFa+2DDI3X9jVbg8kiy+qoh3
         oKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720735190; x=1721339990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RD4Jrv7yyOhSAoUDP5JzBFrS+BuW1YkOZl4khKRzO0g=;
        b=l4o7xH6p8Mqz7Yo/FTTnJfRak3F1IkvFDi4sbvcR4FrevI8djB7hq2SyATPH/5eHZY
         thobRKHdOltv8x09j8LgHiGU4j53ni16XgDN6ftOKr6dkbZOENUjJSlZqh37rPr+cZWX
         6aV7zqxXUxTSuOK9N8Qoq3E6nfFLZitpakABeAT2hKg/5pKjsxV4Z5v2wBfrLMNsN/Cq
         oecJXVH6Eryp4oOIq7bxtg+NEkLDfgaSBGucZ8dIpH6UBry/fiiDLZAYeUL7vmz/ZMoY
         0BxTAzrpR63Ldly+0W45u24Er5XFXvHpIWjktc3pa2rBFJqqCzuZOnYZE/+z9Iw1t/tT
         goiw==
X-Forwarded-Encrypted: i=1; AJvYcCVFloI/lLhsYteFGkRjR8am0akTjBLebHqdJDUkkaD0FAaCkXylXUwT8QIjiiMl/Ce3LCX5/R+Q5PZB124qBjGn9Fo+t+r8XSiA
X-Gm-Message-State: AOJu0YwnKkSuv7VhLdSYIzyDAl/pcmlhK+Na6Gw3eqoqlTP4Zx2SPeAF
	OTdGrEYyHRRUAnyVkFcFUce4/iQDZXujQ30Z9I75j1gEwbz13pD92WaS+egCOrU=
X-Google-Smtp-Source: AGHT+IEHJqQluS13+YyzOtMS02Y+FGJBmzi/e2FwA3rgiR2aMvwi6CxYTAKSgFPQfTDX7y0MAGVisA==
X-Received: by 2002:a05:6a00:4650:b0:706:4889:960d with SMTP id d2e1a72fcca58-70b43568937mr11530984b3a.16.1720735190283;
        Thu, 11 Jul 2024 14:59:50 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43898b10sm6169431b3a.7.2024.07.11.14.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 14:59:50 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 3/7] RISC-V: Check scalar unaligned access on all CPUs
Date: Thu, 11 Jul 2024 17:58:42 -0400
Message-ID: <20240711215846.834365-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711215846.834365-1-jesse@rivosinc.com>
References: <20240711215846.834365-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Originally, the check_unaligned_access_emulated_all_cpus function
only checked the boot hart. This fixes the function to check all
harts.

Fixes: 71c54b3d169d ("riscv: report misaligned accesses emulation to hwprobe")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Cc: stable@vger.kernel.org
---
V1 -> V2:
 - New patch
V2 -> V3:
 - Split patch
V3 -> V4:
 - Re-add check for a system where a heterogeneous
    CPU is hotplugged into a previously homogenous
    system.
---
 arch/riscv/kernel/traps_misaligned.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index b62d5a2f4541..1a1bb41472ea 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -526,11 +526,11 @@ int handle_misaligned_store(struct pt_regs *regs)
 	return 0;
 }
 
-static bool check_unaligned_access_emulated(int cpu)
+static void check_unaligned_access_emulated(struct work_struct *unused)
 {
+	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
 	unsigned long tmp_var, tmp_val;
-	bool misaligned_emu_detected;
 
 	*mas_ptr = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
 
@@ -538,19 +538,16 @@ static bool check_unaligned_access_emulated(int cpu)
 		"       "REG_L" %[tmp], 1(%[ptr])\n"
 		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
 
-	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_EMULATED);
 	/*
 	 * If unaligned_ctl is already set, this means that we detected that all
 	 * CPUS uses emulated misaligned access at boot time. If that changed
 	 * when hotplugging the new cpu, this is something we don't handle.
 	 */
-	if (unlikely(unaligned_ctl && !misaligned_emu_detected)) {
+	if (unlikely(unaligned_ctl && (*mas_ptr != RISCV_HWPROBE_MISALIGNED_EMULATED))) {
 		pr_crit("CPU misaligned accesses non homogeneous (expected all emulated)\n");
 		while (true)
 			cpu_relax();
 	}
-
-	return misaligned_emu_detected;
 }
 
 bool check_unaligned_access_emulated_all_cpus(void)
@@ -562,8 +559,11 @@ bool check_unaligned_access_emulated_all_cpus(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
+	schedule_on_each_cpu(check_unaligned_access_emulated);
+
 	for_each_online_cpu(cpu)
-		if (!check_unaligned_access_emulated(cpu))
+		if (per_cpu(misaligned_access_speed, cpu)
+		    != RISCV_HWPROBE_MISALIGNED_EMULATED)
 			return false;
 
 	unaligned_ctl = true;
-- 
2.45.2

