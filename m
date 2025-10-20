Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B302E6CAD
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 20:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991766; cv=none; b=Xbvfij8kJWHjbDAFOjX41wPVJuxjzaqqtpPHru01kowaA8WZnuf3B33LRoifZCsj4NUxG7642W8xHFDKnKlbwLxvWQEpATlZKBUyZE8jAk4M45dke14SOSear/G03dH/RPYmt5i5AsX8/kKRwhf/SugeWN2MrEgOkL0f1OvCS1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991766; c=relaxed/simple;
	bh=QmOCI5teNpDHuuf8TRkOoWYXJD3VbdMoeFZqR6rWQMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUNSAggWYr6tBqISJclc2SRVwyUz9iy4tGNgo/4Fy3bBqFpsm7laLDKdBLmfQFoUVnrjJ8nU8tnQSgn8dTy0tL7eAW4UXlbXfTUeJW65Thje67ugARZz8W8q4GwxDgAvx2DBayXq/UFXrmGVYS3lNe3z5AYCMMZUm8XTP1V0L1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Hhcqw0RL; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Hhcqw0RL"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7811fa91774so4224866b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991764; x=1761596564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8lTWrnuaZtUDDzLxyuxBqYWe/ZHwy+gfZN7UuG+M9I=;
        b=Hhcqw0RLPoYbiwW1/EUxXxv2FFZCrZhfqR8YggRbda2lFvHvLz+6//J0XsR3+OWIxO
         Jc9h4BmqQMa+gKO3f+d7sJj5xc4Po0CbXXfweZZ3sl+zV6LsRw57KM92Da5Neh0QGTv9
         RbMY+FHVBBwjKLTWQ1lffD2UOccSc4EVyHZOfhOnQ/Wl17Ko/8AkQqGcc6SqM/QnN/EP
         McqEz2cx4CZRhp2XPjGC3OAiZvJ7do0W+OXrxthiqWq9eDkh61jz1XUsjbirWxkuzaQo
         /E+E9zavk5s6Wf56BzkOfLaZOBK/5Fc/Q2If2abc+cPj+WOqzuHl6Mouy6E5sqQOcB7a
         JAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991764; x=1761596564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8lTWrnuaZtUDDzLxyuxBqYWe/ZHwy+gfZN7UuG+M9I=;
        b=RpVhPH9LA7zcEIyqeD4V5Ndci7UcpZg4+5FHlxB1jFQbmw4HN1D7B7OsgmgszDzZYy
         4BzQ08iGpNhZH+iYR/oU+4hgGHBMTz5GuY0roX6hDSUoTHerjMgcaVwj+zGwescr+bvW
         icR1QCqBsw7FyTwvWNiQIXRqN+yEBK4bkYE0VsOvGH2i5fTIVYbmR/5lUzioQbL9CMnb
         OY9Nx/za+lO4+S8WCX4Ds52PbfIO+jhIY7/Eq2CIR0LZhQxeXLL3rTg2P7q/ddhRqNHd
         2BLEoyLwtHn71R66G4kz3jOkLBXSICmZ0/92JwwSJ56ql27icde6pYpWk1etbonQAQb0
         erhw==
X-Forwarded-Encrypted: i=1; AJvYcCUE7y4dUtxK10H5Bfxs9xc1jiUbElDnM3+MhzbmDaYEgA3+pa3fxwKODmx7vIaiDS67Z3/xItjXrzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzERgY872PE4GJbEc8bEmjRMpEQv/jxSXqBpDv3UWDN+0OC8PEp
	vXKPBDaTQvaIDz49AZhPd6bXYVzqsYnPfAza6qstCQJWwtQ1vewkB92fPvfpqfADNIk=
X-Gm-Gg: ASbGncvu7tH5c6WmRAWwPPYOoSgysiBfU2Y4Eiom86UPPsZOpvnytFwynUKjNtT//HF
	0PrZmiFgTHflpGWn7+LN6SCsXU9tnn3eQmoIvdBd4jBGS+lkXll82T4ywGTsjCBPj8R5jdzucHs
	YKX35qnp/VkoIKnor0jRXohTMfBJ1xkGc4hXI9ZhvlKwCi3ihGZmz+y1b0ANC8SsPD2kUXBMrfT
	Gdj11s3exinC/TtbR3OrT/Nvwjf0TOq6HYsGpTI99Dlyw9kZ/2NNI+ERq3OxtexjNJWI4yW7IyM
	pfuqBDQOMSD0eEi72z8wgytJbcPH3u5qWUKkoeEeBghLgDu8Feu9gFSM+R91SbhY9AGcAu76j/p
	pgYB7AmE0S4QkUbRGWXf1NF+bLln3/CwT1bGICjoj6fC7vuy9NU0nZUvniYy1firGnsqXVTF/86
	Cq2mhCIySp98E7nd4on+ns
X-Google-Smtp-Source: AGHT+IFYCNd5k3pGg0Gz/iIE7tYiAa0kkuCVaIcl8Ah/rVJcGwXUTlIvT7nX8rovlHoPNgWT7bMyjQ==
X-Received: by 2002:a05:6a20:1592:b0:32d:a91a:74d8 with SMTP id adf61e73a8af0-334a854654fmr19468716637.27.1760991763968;
        Mon, 20 Oct 2025 13:22:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:22:43 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:32 -0700
Subject: [PATCH v22 03/28] riscv: zicfiss / zicfilp enumeration
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-v5_user_cfi_series-v22-3-66732256ad8f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

This patch adds support for detecting zicfiss and zicfilp. zicfiss and
zicfilp stands for unprivleged integer spec extension for shadow stack
and branch tracking on indirect branches, respectively.

This patch looks for zicfiss and zicfilp in device tree and accordinlgy
lights up bit in cpu feature bitmap. Furthermore this patch adds detection
utility functions to return whether shadow stack or landing pads are
supported by cpu.

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 12 ++++++++++++
 arch/riscv/include/asm/hwcap.h      |  2 ++
 arch/riscv/kernel/cpufeature.c      | 22 ++++++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index fbd0e4306c93..481f483ebf15 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -150,4 +150,16 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+static inline bool cpu_supports_shadow_stack(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS));
+}
+
+static inline bool cpu_supports_indirect_br_lp_instr(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFILP));
+}
+
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a..7c4619a6d70d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,8 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZICFILP		100
+#define RISCV_ISA_EXT_ZICFISS		101
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 67b59699357d..5a1a194e1180 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -274,6 +274,24 @@ static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int riscv_cfiss_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
+		return -EINVAL;
+
+	return 0;
+}
+
 static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZAAMO,
 	RISCV_ISA_EXT_ZALRSC,
@@ -461,6 +479,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
+					  riscv_cfilp_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxenvcfg_exts,
+					  riscv_cfiss_validate),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),

-- 
2.45.0

