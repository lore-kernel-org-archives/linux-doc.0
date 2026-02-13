Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D95350A30
	for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 11:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770983480; cv=none; b=La7gLcjSpKlOItslNx91bpIZcmu82sxvMZNjS8D/F0ztq5QFNWOWV6Dg+5qY7YHq3vFFEtargyyf9WpxPGcTSQfehXnBt093ozKFmOkmdfLFf5r1xkXNrRsiqEdrUyd/1ZLZH26G/DzpoRv65Km+SBlz7YG+KoInOd1hTgj2TIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770983480; c=relaxed/simple;
	bh=o1U/AW+9c8uIQ2cLYfOvQNLg0AKgTqaqFLJ6LfTtD/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pxmHjv3QLWjW6LUO7p90y1eCF03uK8eZ+pw4381KYRubNVKBFEp1L48zs3Bp0s6ojUZY4z21vQQuUM6mM1Od/9772LKCMy74G3uh7Y1Ibqfn9Niha6NWl0MEfrtHwxfOvRC6i/aaHx3utvU+tMOPksCCHFa3rYBMNZW5+4ZzXr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jdxfzcHR; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jdxfzcHR"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65a3c6f587cso1102986a12.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 03:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770983477; x=1771588277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sfEh3PBJWD07hYds4N9dI7mviBas2gIyECRd0DbjpM=;
        b=jdxfzcHRaKy94VfAvan/IR6g7yaGngyYGgBH/YYjGn6frkXC1hA3HbrEMOKdqFWvT7
         zEIF47xKuPI7LXNm01JC/eRy8OXlflQZmCUpOEcO32E3IetLzzlhORt3+2GlVkzgMzBM
         sPqBOQmidy0oIVxRNns9UXfveg3V35HcSZeZiohHe2A3L5YLi2odaSIjdWB+9kbV/5WK
         eIo1Z7DrOi/PTIYvIKbZiWWG651f7aR2p0MxKt2XkE5TR8T9llHMl7k5wUjiXynjD7zI
         LKcXsAdp98LpSyghjrpDSRGJJRlz0520efritxH3WQ6GjDUzbW9GqUeMK62kznQfN6/E
         JaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770983477; x=1771588277;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1sfEh3PBJWD07hYds4N9dI7mviBas2gIyECRd0DbjpM=;
        b=A1xfyH5kw5QNhtqec6LytyCofqHLi6pjFdmQwDjvPbj6TiRBzi2Du5OPSOgtHWmsd7
         QJuG1XpSu9UcZBSUMv2T8iZmj0wkGEsKQMzKNmdoOwO7TBmgcF++B8p8KouUc+QDZPAK
         CNS05kduiXery/40to53lZkjSWC/4ILHnmftkyBydM/9Kaq0n87IpD5eBuqyH5sMQRhe
         hNF2NlcsJ7goK/uq5sh2a/FbUu8uyt20sze2JVC1m3X3Y2zqSPTyQjecT0PXKwfsA3YL
         6Y4OmQiXD8BZBeBAeqQNHsB6WbFjSZQvkhcGdtYtnoAjvLBQ3TL5WTo7b1cmrgDhTpkR
         wiig==
X-Forwarded-Encrypted: i=1; AJvYcCVfrUFWL6C7BMph5xBB9colOu5jDHXuc/ZEgr0HICQD7RGPF3/c6FmGmeOC5xnRmcNajNvAqUiPlT8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVuB+g/RZUYULBqFtZ2rH6jx0imoOAGh5EZFHPXg0LQkJuu9ic
	NH4biX1y3PQW5cfEtsre/yc+RWLLpPMm9hQkRV1efk0BezB0AB4rTb2fw1JX9Oi8Lg==
X-Gm-Gg: AZuq6aKarwrTYvG9BqqyCxT23/woWhDngX25KtyEaikbC4wjfxEScytlprcv/g4aivn
	kSVI6qtaqCq7MTHqdcHvRS2JfzqKpmjt+lXziqxMx+wU4ppE5xzgrNBV4o17lFlQCvUPIcuxNc1
	KGoypi5KmObZSZz0EpO7QY77PdNKpod3GB0z0uQvDpXerzSRjPpOsJ8dpIAXwOOVcHhn8Ft9RKL
	l+30+3gjycssb+aVx9nim+HoOoTIT3hx8QAXFQFXnJ5c/3vs5bKEB/MCgODP3NehUo2oic9ZzvR
	vEkV1HUKre8fjPdkxPakgZRx9i0FREKF7LgRYtsAPHLjx9p6iRDX7TkzcmNHLxfPe2XkAySDxgI
	OVt0+P7dv5Fg4xuVNSfrY1cG/WGn57FUEUQJ/q1LDqfkJ7zzNvDdMctfOGJomsJOk5SOZESFNby
	5VF7hB3OMrHmvDP4XS43osCYJ9Pjb0ooDMozKoddfui2OXpiWsmotoysFUlVxX
X-Received: by 2002:a05:6402:5252:b0:65a:39ad:d655 with SMTP id 4fb4d7f45d1cf-65bb116de4amr646620a12.20.1770983477058;
        Fri, 13 Feb 2026 03:51:17 -0800 (PST)
Received: from google.com (105.165.204.35.bc.googleusercontent.com. [35.204.165.105])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f0d09sm585900a12.25.2026.02.13.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 03:51:15 -0800 (PST)
Date: Fri, 13 Feb 2026 12:51:07 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com, 
	maz@kernel.org, corbet@lwn.net
Cc: yee.lee@mediatek.com, ascull@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] arm64: Optionally disable EL0 MTE via command-line
Message-ID: <plslbeuzfag5dfizunxmhyw5axxbuz7r3jdlhjluzdwrm4rtzk@bm5xmxzmy6v3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Although it is currently possible to fully disable MTE on MTE-capable
CPUs (with arm64.nomte or id_aa64pfr1.mte=0) and to only use MTE in
userspace (with kasan=off), there is no way to limit the use of MTE to
the kernel because CPU capabilities are traditionally exposed directly
to userspace.

To address this, introduce a new cmdline argument (inspired by the
existing arm64.nomte) to only expose the MTE capability of the CPU to
the kernel. Combined with KASAN, this results in only the kernel using
the feature, while HWCAP2_MTE and the corresponding MSR ID_AA64PFR1_EL1
field are hidden from userspace.

Implement it as a software-only feature override, similar to nokaslr.

Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/include/asm/cpufeature.h             | 1 +
 arch/arm64/kernel/cpufeature.c                  | 8 ++++++++
 arch/arm64/kernel/pi/idreg-override.c           | 2 ++
 4 files changed, 14 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0869294363b3..4d138c1826f0 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -564,6 +564,9 @@ Kernel parameters
 	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
 			support
 
+	arm64.nomte_el0	[ARM64] Unconditionally disable Memory Tagging Extension
+			support for userspace
+
 	arm64.nopauth	[ARM64] Unconditionally disable Pointer Authentication
 			support
 
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 4de51f8d92cb..0944ff5084a2 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -18,6 +18,7 @@
 #define ARM64_SW_FEATURE_OVERRIDE_NOKASLR	0
 #define ARM64_SW_FEATURE_OVERRIDE_HVHE		4
 #define ARM64_SW_FEATURE_OVERRIDE_RODATA_OFF	8
+#define ARM64_SW_FEATURE_OVERRIDE_NOMTE_EL0	12
 
 #ifndef __ASSEMBLER__
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6044d463d3fb..81ea00050e56 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2412,6 +2412,14 @@ static void user_feature_fixup(void)
 		if (regp)
 			regp->user_mask &= ~ID_AA64PFR1_EL1_SSBS_MASK;
 	}
+
+	if (arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_NOMTE_EL0)) {
+		struct arm64_ftr_reg *regp;
+
+		regp = get_arm64_ftr_reg(SYS_ID_AA64PFR1_EL1);
+		if (regp)
+			regp->user_mask &= ~ID_AA64PFR1_EL1_MTE_MASK;
+	}
 }
 
 static void elf_hwcap_fixup(void)
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index bc57b290e5e7..758141bf9e37 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -211,6 +211,7 @@ static const struct ftr_set_desc sw_features __prel64_initconst = {
 		FIELD("nokaslr", ARM64_SW_FEATURE_OVERRIDE_NOKASLR, NULL),
 		FIELD("hvhe", ARM64_SW_FEATURE_OVERRIDE_HVHE, hvhe_filter),
 		FIELD("rodataoff", ARM64_SW_FEATURE_OVERRIDE_RODATA_OFF, NULL),
+		FIELD("nomte_el0", ARM64_SW_FEATURE_OVERRIDE_NOMTE_EL0, NULL),
 		{}
 	},
 };
@@ -244,6 +245,7 @@ static const struct {
 	  "id_aa64isar2.gpa3=0 id_aa64isar2.apa3=0"	   },
 	{ "arm64.nomops",		"id_aa64isar2.mops=0" },
 	{ "arm64.nomte",		"id_aa64pfr1.mte=0" },
+	{ "arm64.nomte_el0",		"arm64_sw.nomte_el0=1" },
 	{ "nokaslr",			"arm64_sw.nokaslr=1" },
 	{ "rodata=off",			"arm64_sw.rodataoff=1" },
 	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
-- 
2.53.0.273.g2a3d683680-goog


-- 
Pierre
