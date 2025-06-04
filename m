Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192FD1DE8B3
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 17:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057450; cv=none; b=fcMV99fAPCJEb3c0pM+JbccG31fAY43bgdZyB0bXZ7RbTNzr2Jb7+CTCo67SAbdjaRWL93oTxyXx2L5VkgM/XPsfmIi2/HRXrCM42c0JKdOgJEfRiNDJBDsyziNbD8X6gOHHK1yTEjt1xJcj68ohPUjXCkNO1b0i+LGUXZd12NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057450; c=relaxed/simple;
	bh=YhfdOBzKEEebS8YngpHiUP828c0FLw+RSd9OBhsOuOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k/jb09V48iiuTuHvLtpb3aFkgrFUp1jCM1Yis649BKEnWeUCHIBu/m/3VhD6c1EoEgKnsvYY0ecHEB7HN4yzzvO8ZXdqPsLoT7eclFzCNoYHXHOU0VIJp8P8JDC1rzu1gW1Jfe0p3aB0LOVw7zhM+WAnmfUS7E3sjt5cXOve2UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1t6DWDGX; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1t6DWDGX"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so79326a91.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Jun 2025 10:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057448; x=1749662248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zd01FxT3OlMOzWqIaODnmoUPnuHtuVmONb+HNJjd/YM=;
        b=1t6DWDGXL85bnyW6DwbcUA4nnIMzJ3z5/DMR1vtpsHCG+IV9kF4eduBG1tA9SvxLHS
         fpd08CRFsamOhZcZs0RiKju06O+dMwx9KpHEsK2KUmk1LQVud8Yxjf0cGSOGThunFbdf
         GxYLa0LNr9zkWKq/7TMoGjtfnFkH8xuxQEMPivrmzlw8LOwVXqviJAdAwxLh+R1eDHdA
         /uEwmNhcX0L6VB5bVc7Mq+K/LunZhYixShUCdvfxDPw2Fo++xPc36JC94nlOMiEDFOfu
         g9SY9mxf7vnQa32GBKkVKCTWh0UTMXgzEhMh73RrIjlK5awJCG+4efkE/jcMRX5lMo3s
         Ds/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057448; x=1749662248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zd01FxT3OlMOzWqIaODnmoUPnuHtuVmONb+HNJjd/YM=;
        b=wZPpjo/PfeMfyS6SO/qvME2BH9aV7FDT/hFTBrO/7/YaxK+V9apfYP7LOuAiFn0aim
         AAK+YfXHMGqWs9X91mLp+iD3U3CzAreqXE56nGDb9aO7ZEZh/vKuXKInaEaFuDKeL6iq
         iWlwE2tSPI0kcWGe/0t2PhdmfG3VyD4KP0beGLd381vlXE4kQ3Y4ucCmpDvJLRiORb1g
         KO0e20fYSMKOqxCs3Xl6ZG3gpjQPJPBkKvpZyaSrzcC6QdEAcU3W/a+bdOc5Cx7syN7s
         wdibYh6/Meh+/j4fsIniM1jVjY+kxo6fXwOpvQFS1jxrIvctf3EqwRhETnykmjwB17Pj
         6z6A==
X-Forwarded-Encrypted: i=1; AJvYcCWxoTvAgY63OupY5g/RZDNpwljFWFeo9k2/AyU4oIWBSzUqaNixY3iomlbvQNEj6JX6PbUulDCrQ3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1fbYx8cO59emyWQ9IUsnfbHLo/e5aVP0WOcwkySqzra6qMqKH
	3rPOk3j6iZvYLH3s5D7qncL9434WaaInyTtG+ufeHw4vb9pQa2xpLfqTz//sluyz/JM=
X-Gm-Gg: ASbGncsqYh+UWz+v0anK8cOmQj3RtvAoizfTOQrbtYUii2PTNIWpqSzUq6v8YMVFC/b
	Jfe0OPliPlwF2W08jG28tWuMBkpUfBnSQ9lvKc9vUttEwcmOycxPoKHJtjzdweu28BvQWhvMiFs
	JzKCLN4zo9yCRgxy46xTbksmNeiIdrPIvHndaZOr6ctTS+LCsr6nyHU8SDYpq99XrnoNrIXk5It
	si3Bt6y0ivyWMCp/mhm6sc84kfB8Szt2IKvDwX8cI866MACrmVOZ81yGdElciGheNqw9lxRLM2y
	d7h386QxaOYbaQFeUo16FilerRgFjqegpo7QZqAQhq5MU5KRRGffRNBCQOyBEQ==
X-Google-Smtp-Source: AGHT+IFWkJ78wFMwg3GliR7Galn0PbhhfnyCNBUVVp6rLtdMWNFL3ewFiC9H95Yfi/uZOn7VC4Cxkg==
X-Received: by 2002:a17:90b:3c4d:b0:312:f88d:25f9 with SMTP id 98e67ed59e1d1-31310fc4f72mr4513419a91.7.1749057447912;
        Wed, 04 Jun 2025 10:17:27 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:17:27 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:48 -0700
Subject: [PATCH v17 24/27] riscv: create a config for shadow stack and
 landing pad instr support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-v5_user_cfi_series-v17-24-4565c2cf869f@rivosinc.com>
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
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

This patch creates a config for shadow stack support and landing pad instr
support. Shadow stack support and landing instr support can be enabled by
selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires
up path to enumerate CPU support and if cpu support exists, kernel will
support cpu assisted user mode cfi.

If CONFIG_RISCV_USER_CFI is selected, select `ARCH_USES_HIGH_VMA_FLAGS`,
`ARCH_HAS_USER_SHADOW_STACK` and DYNAMIC_SIGFRAME for riscv.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b79309..147ae201823e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -256,6 +256,27 @@ config ARCH_HAS_BROKEN_DWARF5
 	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
 	depends on LD_IS_LLD && LLD_VERSION < 180000
 
+config RISCV_USER_CFI
+	def_bool n
+	bool "riscv userspace control flow integrity"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+	depends on RISCV_ALTERNATIVE
+	select RISCV_SBI
+	select ARCH_HAS_USER_SHADOW_STACK
+	select ARCH_USES_HIGH_VMA_FLAGS
+	select DYNAMIC_SIGFRAME
+	help
+	  Provides CPU assisted control flow integrity to userspace tasks.
+	  Control flow integrity is provided by implementing shadow stack for
+	  backward edge and indirect branch tracking for forward edge in program.
+	  Shadow stack protection is a hardware feature that detects function
+	  return address corruption. This helps mitigate ROP attacks.
+	  Indirect branch tracking enforces that all indirect branches must land
+	  on a landing pad instruction else CPU will fault. This mitigates against
+	  JOP / COP attacks. Applications must be enabled to use it, and old user-
+	  space does not get protection "for free".
+	  default y
+
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8

-- 
2.43.0

