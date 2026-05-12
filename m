Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F1F3F7A88
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506657; cv=none; b=FYzWpEFTfH3UwBT/7miGKSKwaa79jPJY9xpfJJCvKXOfvhFwHpsgDx5usRdox/WAqkv9RCjQcd4spPcEAQGAxbyLwhWBm9b7Pq1n7eCLGScI2j0SkYr56V1IvsqjI4x5qUOg/ihqSdG3TxT1zo9vRGmi2K+ywdFGM3KwW1e+3z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506657; c=relaxed/simple;
	bh=2enA/Fr+DaOcG1nw1ufU1X/14nLTiNajnKnEzGSKanE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t4Q+dJKxgLTBbJJTQrPilGseOpbWC9C4Vzz2gk9hGGIXospvkq7qXrL3KddqwREq7aG9RbRxDTejAULYIylWVlNRTOUvCcBDkqLyZRZnbBq42pYg0vOB3io8PPKir1O2Aq57PnySlHf6KPKXM40kQCPW0L04puxx+OQnKKrNCa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=OmGl3omJ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="OmGl3omJ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3660b84347dso2641946a91.1
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506655; x=1779111455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bIv5E7CDUy/32Snb6v5lvrwzzQuIONo/kTKOPolOf4=;
        b=OmGl3omJ6aXNAyl3EC3SoMdrsc9eJqrCTZ90JlPQf1o0rGAGml/+RITZ4/QtuAIpz0
         XodmyuwHzU1ULf8I8Z7mtCsNAqgMvZyUiTG/TnUZ56APoTaOUpHGTmMQnGwrhzndTKrv
         m5qg/J03pJfjZjW617UrjhoK3v5C6iulBvN8GFiN1eWgzO2FvVoi+hfyAcK05/YB6LFE
         j+7GU0dc60JFq3s6/vfh13pGOdhhn/HwteGPLZgMsW1UPHS21n8GKrH8Jpj8ZLzVH+tY
         dfvllhh/ZcHjzK/Yhw3ejMRcxGl0xpfHnT9eZpcoEvprjNEdlcdw2ZyiUhaA1197Yazv
         c4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506655; x=1779111455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9bIv5E7CDUy/32Snb6v5lvrwzzQuIONo/kTKOPolOf4=;
        b=AW2c8Fl09npnP6aVswXxFtpTjMV7Xd66sf+vCpl5+OBgDWVRq13bXaCNzfl2mlfTKk
         1VvofgkePj4TLvY+fIQOgV6+bYUZdHSRKZDzj94zY7+ezj+9+XtrUek04ZwogkN3bHLj
         Ach4ozQQ9QYwqoltpWJjzqxWyPMed6xlTrh5vq81b3MoR8y/ESskMyyBAURtGRmyyhCs
         37na05qTwu5sfV5Tatv7/Ib3jqe3zIzPkjfC1v/vpHr6da1hTU1QLEQDLu1/EB7EJNXu
         UXg7K5xkoQllZgl/fKQ513c7DpAXsokaZv9dFRlPMt1dEG5Vbu2D6S5hbHn2Zto9wYOz
         EBow==
X-Forwarded-Encrypted: i=1; AFNElJ+nz0H0jO+LFrVMoX9dR0Dsqw48Uzaak0qDFkGW8ksRbnw6MeG3uLzgFXy8Jp5XBFjtXsWQtpUnT5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxKZgRHWy1yA4xey1wKvcG3t9NHHENtmede9ARFvdrZca3+b9w
	nKBB3bum7TsJgKgZ5iV3uJbdCn5arI/8HKc0n7AXp/7J5rrbD1Cyn+2H1dgwGvOGlmY=
X-Gm-Gg: Acq92OELFryta+lqJ0gRoDf8FOpP88ghfIFeHuAXHj7ZuIrtEmPbgmCWnff0bpRK0ZH
	Al/XrSSI6gkoF+DQQpeYrnr95+AOisFDShm0VoO1SLc220CxI2Zpcwk+U6M7Okszlz+9gEcZ/bW
	GmZWYuCYTxUu8iZmLvfYj+Z6z1/aZnMNaZztQmmnLQIW+6kvdu1X8I/ynuSchQMUM7wwUqG9EN7
	2WLaK0iGJzl4Y46o1ktk+zXxBA6r5T9mAtaGELr9eCjBXtL6EpIlW3UXd+Ui9Xp5psUME8j1Oki
	CCIxzulrfcNAGJ8Yb/LDFk3w/qh7+OZR0451qxLPU54Osb8JZRdxJEqyE2li6E8FB6KZ1LOGJ3z
	NG2kT8noNzf63aXCae65sSeu6oBrOqgTUtI7np4tb9/Xz4YjtbIx2d2jJ1i2Bo7+QnTEX2blp4g
	df8JIYormhW3dXi06bsuqSmPUUmO/ho44glZs7YbM7cT99xBnLkswJnw==
X-Received: by 2002:a17:90b:2750:b0:364:a173:2d61 with SMTP id 98e67ed59e1d1-365abcf240fmr23278068a91.11.1778506655158;
        Mon, 11 May 2026 06:37:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:37:34 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:55 -0400
Subject: [PATCH v2 10/10] riscv: hwprobe: Introduce rva23u64 base behavior
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-10-21c5a544f1dc@riscstar.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1

Provide a hwprobe base-behavior bit so userspace can check RVA23U64
support in one call.  Without it, a consumer needs five hwprobe
calls and four prctl calls, which is error-prone to require of every
caller.  Most software treats RVA23U64 as a new base anyway, so
expose it directly.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2:
- Detect RVA23U64 by reading from the cached hart_isa[].isa_bases
  bitmap populated by riscv_init_isa_bases() at init time, sharing
  one source of truth with /proc/cpuinfo.
---
 Documentation/arch/riscv/hwprobe.rst               |  8 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 ++-
 arch/riscv/kernel/sys_hwprobe.c                    | 23 +++++++++++++++-------
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index cb31fd3b12017..9b901bf8bab9a 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ The following keys are defined:
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    The RVA23U64 base is based upon the IMA base and therefore IMA extension
+    keys (e.g. :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`:) may be used to probe
+    optional extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 430dc49a82863..d940ba4f6a1e8 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -21,7 +21,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	(1 << 1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index dcc102bf8f183..c43fcad737b73 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -225,6 +225,17 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		if (!test_bit(base, hart_isa[cpu].isa_bases))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -307,14 +318,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_MIMPID:
 		hwprobe_arch_id(pair, cpus);
 		break;
-	/*
-	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
-	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
-		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		pair->value = 0;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c049..f8c797b1d0fd9 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);

-- 
2.43.0

