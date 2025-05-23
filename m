Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE46229B29
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995717; cv=none; b=NmZD1D4of4HpN3DDWSF5ZMIuxw9LvRuZpnXSZSVMOvpEDZRMHaEK8wkPfi9+oTjyq8wqVbZLoQtXea015IF12sIz2LJ4oJoSfY0steyOdnQqHha9Vzn35T/wzuwmYR0zNTRko4y+f5IML8PvYRwhzcmMUfFKlwVmZMSFHx2ze4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995717; c=relaxed/simple;
	bh=MaIrwOKv+YVVxdhE/r+zc5gTHYqZ311Osy8lrbnqATY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nj8xs3Z1XhnOgBCUoku1k3K20OALKn5UqFYqobLPv9kWzOOB6NZbnM60o3CI1mqylVHIoEonNilNW0g4K7GeDMtGIQNEjvjmTiaTFk/Q6Umz/RYIPMa40OXpz284q1N44dvQnJNcBvxwv99csM5/wWu7NwVaDwGqFI64w3ttbc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yMrtqUMl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yMrtqUMl"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74068f95d9fso7843283b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995715; x=1748600515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iF+NUUhZJ5jxYVuPSRzuPMezDiacMrJKv4fNDBdRi4=;
        b=yMrtqUMlz+nxJOf9HsPSzCfSgeQVBPEsX1wp2SxYEMT5QIFZ6VAHO1pj6GnO62LQ0f
         DIHAff2AWzcjxCA2r8kBAOdlhJ9boIswRj/O+BUAkGwZPUGwssQWwZLd/bHfbCc7ytvU
         CrGCLDTUj+iYGk2/GCVfwjrO+W4CdnKsyc3/vTQVHGzUWTWriH5oPJFUn6el4DOruNyD
         I/AB7+e07zmpMO4H/6It1VZz1v7IMIgg/RLV1OeErz7O2mndvqyqjxt/Ujou4nawgB14
         GP6vpgUsaJhcLNi1wnzYfG7v1gUeXOM99XcgrvAJL6zRAKe0ESGRdesOxg6Bs8bnaugL
         MBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995715; x=1748600515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iF+NUUhZJ5jxYVuPSRzuPMezDiacMrJKv4fNDBdRi4=;
        b=Rx9+ccZg6ZlL5Fkc5juqXBJlalDcvYFGcdtFcE8GI98BfjvyrZiLsTnn3uAhw4lkVa
         VCBnuydraQZv83Yw0mqjYyqkyakALhA/2DmHbRrO+j/O87+1wo/NSNA1dg7hLCVpRSft
         78lv5bTG2CLtX8B01vhp9ZNDFpimn5OwCF7EYj8FbGYgO7+73uq0RuPNtVR2Stg17EvT
         21GmaO149C1sRc3mFcihx6vDg6uM+ab+wS84cHGewhmdCX8tJ4jej24BjrrDaJ9n0226
         a9gkG/XsMkDIau2CiDGHN2pBsqmrnpSGai3t83xuzf0U9p6C5HM+4WCoPrDcQo/YchKg
         etxA==
X-Forwarded-Encrypted: i=1; AJvYcCXCKlR+5PL78qnWs/Hb2i0Ny4oHijTwfD8OuR5lAmby05fEpUivKfB6DR6iXlxqoZlGOeNfgcHQF60=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSU1Z6hxftCDvm9eLNkXFeWGP9nMAlwbIT3WMcKFHucjTeozBX
	iz3XSaGaL5zwspi2aByqLg0G8/GJUgpVvWPLSJImvvCVjlgE9JMQ7Vf4gegvcnlpwpM=
X-Gm-Gg: ASbGncsPhqI2IL7G5NIuybpe8HkhDElTLRRtdFjDHtPvX3CVAUCWDxFK+tkMXzrZWUJ
	6mDjZGsaV+15+QmYEDorpTFnIDhd873vRY7rEE2Cbr5LWGDIQhgohbX5YsFDkKvC9uTpd13KyX5
	Q8aoenJBoXUsfixE5dmjO5KElaiEqSBDwWa3SZJzgVtJYtTFKP+6WVQjHQN2cIge0kvAvD5zpVk
	FO69GCYcDoe5qEDqw2Jwrtc48pBDFtzgic15Rc3zLGOJMYr8SnuCik6MFtHw83umQlJVJrRR9sX
	vhC0kjDIpjLFQ+CV5Q+dN7NYm7m/Xd5ZY9srV4QU2Xqx0tto7GvxsIgyB7ImuEc=
X-Google-Smtp-Source: AGHT+IGnAPommgiaP/CHramKAPhXT2HV8FVP99uDHVdDg9TxfQgHz5LyukuEd2GDLOcnoMCuXHDtSQ==
X-Received: by 2002:a05:6a00:858f:b0:73e:1566:5960 with SMTP id d2e1a72fcca58-742acd507c1mr36450146b3a.19.1747995715587;
        Fri, 23 May 2025 03:21:55 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:21:55 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v8 07/14] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
Date: Fri, 23 May 2025 12:19:24 +0200
Message-ID: <20250523101932.1594077-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

schedule_on_each_cpu() was used without any good reason while documented
as very slow. This call was in the boot path, so better use
on_each_cpu() for scalar misaligned checking. Vector misaligned check
still needs to use schedule_on_each_cpu() since it requires irqs to be
enabled but that's less of a problem since this code is ran in a kthread.
Add a comment to explicit that.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 592b1a28e897..34b4a4e9dfca 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -627,6 +627,10 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
+	/*
+	 * While being documented as very slow, schedule_on_each_cpu() is used since
+	 * kernel_vector_begin() expects irqs to be enabled or it will panic()
+	 */
 	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
 
 	for_each_online_cpu(cpu)
@@ -647,7 +651,7 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 
 static bool unaligned_ctl __read_mostly;
 
-static void check_unaligned_access_emulated(struct work_struct *work __always_unused)
+static void check_unaligned_access_emulated(void *arg __always_unused)
 {
 	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
@@ -688,7 +692,7 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
-	schedule_on_each_cpu(check_unaligned_access_emulated);
+	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
 
 	for_each_online_cpu(cpu)
 		if (per_cpu(misaligned_access_speed, cpu)
-- 
2.49.0

