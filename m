Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6362A36829E
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 10:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770634528; cv=none; b=jp3Vo4fG+e7rKFXehRxmKgMqPrr30KZxDFPrAy1qYC/H7d1IM6OkQr5ZLbbYG41nWKOa1pa5SrC26V47CjT5bxQR+0NMw8BcSYe/1gdQ7NAnnkXOYRt/ZfVB1liqHe6hPrJ8tuuloq41i3uKOygWhQRz+By53S+Pcw81atyxzrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770634528; c=relaxed/simple;
	bh=GmLCfuBl/mGFWIwfPFQJy58eiixhL58bCecShUPwAL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9QxU9ZESUYD0hq6PstTJy7ZFiT5HEtljxlzoPSwS9rjYcYZqXkkJySh92QKejnFh94BQ+amQN09nCghaHxyPtyTwj3hDR6P7oHE65+0zXYIDLSmaOH+UawXyg/xN79gKzVxg+PL0qRQJbBc4ljPQxm+qTi2Fsx548ZO+eUlwzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GN1zfreV; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GN1zfreV"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-81f5381d168so4721458b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 02:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770634528; x=1771239328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqX1kx8OkcJ5Mo0woVEbmeLs+1j0cFsuz4Uvjc4HH9s=;
        b=GN1zfreV4roo5M/APCmNA8O/cuWR5Xz/b/y7hCsNEXV7fLPSxEy9VtE90AqaQFwX9y
         yDq/TJSFpZXYMZKvZsXZXVNiwndejtGYiX3QBPL4/uK3uxGc/yHY+lD/GLt5uYCaBriD
         OokANzsHmy4u0s6+rAtZ3MFRNJtmM3dpZBrhvcTIsojkDtq9ekA+obbgl20vL9Z4FWIU
         zgwKKiow5fyMzxvaGeV1u0qsS+JBsqcbTWjIQJTrXo402H8k9H9jmaDah6OkDITWObFT
         7FXmX/sh3l4Tl5TLGe1QLsfpy5sMGcjf5lWiel8POSocJ3qONdKxoOPaA1+4Zkm/FsN6
         sqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770634528; x=1771239328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VqX1kx8OkcJ5Mo0woVEbmeLs+1j0cFsuz4Uvjc4HH9s=;
        b=IUXPlPGLm+E7LLU+FGAALnKjh7DyhPn2NxNxVjosQ9Yxc9UP9qrm2/7xnpWq7+SlpL
         /Tkf61UnF9KdgiBOt/sGnbhxSJzTZPl2I8zWSxC1ZXeBQyxZeUM4QEo5dxYtr7btOznJ
         nHR7H7/lntdHcAYALbSnHQ3TRUV3NqWaQ8rXV5yNl+vVVsjI6DynGqAr8iE4gO64Zaq/
         XcNNKfzIihLRoe6ebAlMeRFqZhnWRXLwJCeGLu46Tb5QCYPaBejFjLbNutIgneUjmipR
         D7FgEiTK1Vii38nnwigdAVTKLurruPOdiHDjBmHQ+cy7RideSBOmISCxtZJcY2ht6pXD
         KZuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaBwhZaWLPmJVoc5kleAPyM1QlncMbYrcptAhgjPSnJH/KlwvIDa1EOgLzMxHVwEFtPLQa2KUcHf8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7VvKPrN++jZ62vn+o7vIaf4oulazeNvbAqI6sI29AxCUgr2A0
	X/rtDAZzuTKAq4LqqAHfa+FNM2O/CTMfkkZ+aK99yObDJTpRlVM6vLgj
X-Gm-Gg: AZuq6aLIXOX/C91UxU6tC17XUeWN8ZbLJ38hOqYz3q7z2oNoXUS+UDKBnk7t75gKtQH
	ag6J/DYINaf+hfFvbsWZKrbLnBpYNqiL6hYG2iJqXv8/weDuBgvdibPwLGnsJjbB1SSPhS8XFr8
	2uC1uQB7AUnS4LC2cw4xli8kkj0uCHZcnXKL/jv774eTEBWXEZo7T3kPbPcFXvGpjtJVz23kf1r
	1onpKkl5XLLi+fgK5kgNTyZultIHWGrBnwfg2e534jcgVqgzWwN8n395VI3etY6EHghkVXroPWA
	WcroLQ4prh0GL9V8rnIbsvCRz7aUaX3LFQadz5GyTyaOgA7E47CFKwkO364l+o6VOuOtYePtqt3
	B68X/nL6Nn0mqDAIfwz0mJxUhp3YriUZ/QerZCqrSKJz8hrAWsb8ePnmfiD44fSoM7hB7iClovP
	ZVq/SvV87+MtZ12LAaWItWEh/JrozZjZXWQ/Xe8YHbE9OZDKb7HfAscBapG3s=
X-Received: by 2002:a05:6a00:b4f:b0:81f:de62:4b64 with SMTP id d2e1a72fcca58-824417a44bcmr10320971b3a.68.1770634527692;
        Mon, 09 Feb 2026 02:55:27 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b31c2sm10635974b3a.50.2026.02.09.02.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:55:27 -0800 (PST)
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
Subject: [PATCH V4 3/3] powerpc: Enable Rust for ppc64le
Date: Mon,  9 Feb 2026 16:24:56 +0530
Message-ID: <20260209105456.1551677-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209105456.1551677-1-mkchauras@gmail.com>
References: <20260209105456.1551677-1-mkchauras@gmail.com>
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
2.53.0

