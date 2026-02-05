Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F91279324
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 19:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770321251; cv=none; b=RpBA6AJUm5S7NTDDnqLbQRsCfFAtgQsdy92P/7Jh2qsQdrLqv9BWuM3u25r1u7YsP/Rm5kbM2aq6umeLAAa34AAWIlOcaRzaeJ7rTJpkOi5M3+wy4exvbQb6PFtgW9H0BQMERVGkai9/0yf4f04I2lecVj6NAzaRoOrFirysIj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770321251; c=relaxed/simple;
	bh=pZ1U1Cu6MPwvJitbLSTqOvwj/6OfA38gALmI+6KPpx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8K2de2wZDJ2ZK1/jqTTc9x80TJecy0JVj+mLRDiOV2XBX/tRne5/5mpFjjtJLyg3dc4qzuSSpGpTB7APQa5LUNCGM1xwbwCUknURlN76LO61zKKPBoqdqoLqfmEWd3V36qc6oo3GShgVBCC6NW41Y3Nbky1I0Bgpm1qb4WyQL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCiHXpLO; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCiHXpLO"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-894774491deso16359966d6.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 11:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770321250; x=1770926050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rvyue3lXA3fGB8HdBoKvnw8CYi0+bdICYfINuIQp+GA=;
        b=mCiHXpLOCXCepS2eHA2+bALW29ronpRplEeTnahYPsa1bH96AZjD0SwYZ+cxbLJfAm
         MEmKV2fsSC/dkBgoaxAKJR6IRy5hVq0pHfhcy5fJDBCPd9FntX57IsdXsG7U+8j+Kf75
         Pp32B0yToeWY6OQG5Rfnc7z7ekFLsqX2porb1JLMEe/ubRd9Z7ewWaDiFEVz47lb3x8W
         KY4JzIefjXSF4LoGvus2igcFSnugp3BuSE+AP0nav2wH+H4/acbs+LpX5AYeg1Dh99hB
         ZNCIrHqFfFe0mm0HeJAHinY78yWo08BquNXbja49pJpQLgSFDfxVd3Ou9JBsOUPgtTB/
         8Llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770321250; x=1770926050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rvyue3lXA3fGB8HdBoKvnw8CYi0+bdICYfINuIQp+GA=;
        b=HLNg+OAThkQbY06MTCJ9S9sxCK6gmlP9DgPIHC4m6A+OfNZ4+0gB2iZmX7ihWwFOtt
         p4U/okfOsIgVUcmbxU8O0BJlTucLTYE2N2vMA/rTZCxANCRWn2Vg2O1/PC9drfiyw1pR
         WdwzbzqmAH+gy/SORMH3bCnQtE8fRBuoL53Z0mEH2UkNyBQOxU0Kg4F0E40kfc2GXvrp
         ON785TFf4GwPXVTefRtZf6v1MwfiS7IFwiR+UFLdhWN3/hLIGy/aqmfpE1zhjBJqABx1
         e2DSeUwpx21QJeeQMrywNFFXfSMoBZ+uN2D9ECl4hvkD5lsMcdqezx72VKNczqc5ieNA
         ngyg==
X-Forwarded-Encrypted: i=1; AJvYcCXg75tcyr0KNUA7RwfRbpr8faEfKr/KBPhKqIwyG+SjObihw0KBrjVsyhCqZ1Sm9845x4z4rz7wxXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuiE+c86+n02LOzzNoT5IT/inrINcKx7271WkY7LhbjPbTjd6e
	tknUYv3eMkpncMxYsbY8fWXSOKmyygV7ExiWpPdxDYWADzlNUwe9ci1h
X-Gm-Gg: AZuq6aLvRIN9FY2Ig3oBWYQOeRpfsNuH60H9v/2dOMmYWUSSnLF9WStWJSU87JKJerE
	HbPAQuALtLspKTx0tj26QW5lGh8ALyqB/q52wNT022ESaDPrMyU2tqnzvKAICzPFBzlDbqZh4DV
	2lFB9Jg98QfYv/TpcvT70Qx40bsOoa6CB3/fuld9//n4xuXPEnI4kITgyB1TDV5AumrwhHr6Tk3
	AMSm8r+8Ib3xSAc7gapZYsHkIAvzfXRywxm5k6C5w3HuWL3UwKCKxcMaVs1OukIrsIrUdl1c+PU
	FP/VBgfCy2xwMdUpGcsJyFw8jdVNrDxwunJpSgVSiLOKPetE3dOzH9IObnZ0zZf1M/6nDJvpLHH
	724dDXjjI+dVnCl5sBocxn47Qgs3YZoyBdq+X+J8OSBoflO6gNSobd9yW+WlqKnX4rhbktQ0B9y
	Wi0HavWAVJ2SPgnhbU8k7SK0HeFd9MIQ2bHfpjbgVFvRotq2vVKD479MmdZK+GJQ==
X-Received: by 2002:a05:6a20:d12f:b0:38d:f0f3:b96d with SMTP id adf61e73a8af0-393acf88673mr215443637.2.1770314709806;
        Thu, 05 Feb 2026 10:05:09 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.167.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5436c5sm99812a12.15.2026.02.05.10.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 10:05:09 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: linkmauve@linkmauve.fr,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	corbet@lwn.net,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V3 3/3] powerpc: Enable Rust for ppc64le
Date: Thu,  5 Feb 2026 23:34:29 +0530
Message-ID: <20260205180429.3280657-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205180429.3280657-1-mkchauras@gmail.com>
References: <20260205180429.3280657-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling rust support for ppc64le only.

Tested on powernv9:

$ uname -rm
6.19.0-rc8+ ppc64le

$ sudo modprobe rust_minimal
[  632.890850] rust_minimal: Rust minimal sample (init)
[  632.890881] rust_minimal: Am I built-in? false
[  632.890898] rust_minimal: test_parameter: 1

$ sudo rmmod rust_minimal
[  648.272832] rust_minimal: My numbers are [72, 108, 200]
[  648.272873] rust_minimal: Rust minimal sample (exit)

$ sudo modprobe rust_print
[  843.410391] rust_print: Rust printing macros sample (init)
[  843.410424] rust_print: Emergency message (level 0) without args
[  843.410451] rust_print: Alert message (level 1) without args
[  843.410477] rust_print: Critical message (level 2) without args
[  843.410503] rust_print: Error message (level 3) without args
[  843.410530] rust_print: Warning message (level 4) without args
[  843.410557] rust_print: Notice message (level 5) without args
[  843.410594] rust_print: Info message (level 6) without args
[  843.410617] rust_print: A line that is continued without args
[  843.410646] rust_print: Emergency message (level 0) with args
[  843.410675] rust_print: Alert message (level 1) with args
[  843.410691] rust_print: Critical message (level 2) with args
[  843.410727] rust_print: Error message (level 3) with args
[  843.410761] rust_print: Warning message (level 4) with args
[  843.410796] rust_print: Notice message (level 5) with args
[  843.410821] rust_print: Info message (level 6) with args
[  843.410854] rust_print: A line that is continued with args
[  843.410892] rust_print: 1
[  843.410895] rust_print: "hello, world"
[  843.410924] rust_print: [samples/rust/rust_print_main.rs:35:5] c = "hello, world"
[  843.410977] rust_print: Arc<dyn Display> says 42
[  843.410979] rust_print: Arc<dyn Display> says hello, world

$ sudo rmmod rust_print
[  843.411003] rust_print: "hello, world"
[  888.499935] rust_print: Rust printing macros sample (exit)

Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
Tested-by: Link Mauve <linkmauve@linkmauve.fr>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/powerpc/Kconfig                | 1 +
 arch/powerpc/Makefile               | 9 ++++++++-
 rust/Makefile                       | 8 ++++++++
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index e26a94808e97..627471ac9238 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
-``powerpc``    Experimental      32-bit Big Endian only.
+``powerpc``    Experimental      64-bit Little Endian. 32-bit Big Endian.
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 17db23b82e91..954af27e10c5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -284,6 +284,7 @@ config PPC
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
 	select HAVE_RUST			if PPC32
+	select HAVE_RUST			if PPC64 && CPU_LITTLE_ENDIAN
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 9fd82c75dcbd..f93816ddc036 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,7 +61,14 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
-KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
+ifdef CONFIG_PPC64
+ifdef CONFIG_CPU_LITTLE_ENDIAN
+KBUILD_RUSTFLAGS	+= --target=powerpc64le-unknown-linux-gnu
+endif
+KBUILD_RUSTFLAGS	+= -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
+else
+KBUILD_RUSTFLAGS	+= --target=powerpc-unknown-linux-gnu
+endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
diff --git a/rust/Makefile b/rust/Makefile
index ae22f2c5f0b3..14febe9c7643 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -392,7 +392,15 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+
+ifdef CONFIG_PPC64
+ifdef CONFIG_CPU_LITTLE_ENDIAN
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
+endif
+else
 BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
+endif
+
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.52.0

