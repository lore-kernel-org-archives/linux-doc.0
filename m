Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1CA32ED37
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 07:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770707433; cv=none; b=nAHe+mo2SdUdi2hQy5+JJ5iwjj3HuXQSDDf+Z5pY5Oy9Pd/H3En8CDJQQHT8dl+MCTxlBJbE3xgiCbYBn9uwxz0IJhY16Bt+AweirdBmuVw0K8VBFXv2wNFxSu6DUotZTTap4l2sUbbvP+SFa63xdNKJ3CzvxrcfHwWYRpE4Yyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770707433; c=relaxed/simple;
	bh=4vMSjpDvokaDPJWcGhnJnR0EhkBdHN+zzZ41Z2GkwAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pf3Sl6G+sVS2iTFljVTawS0knOTItofM02t2aRG7JUZAD2GiHuNCpPatH3L/CbWgN17ZUWc4XZkTGFkEvRZIvrDEuRnBHAr1QnmTigr9SK0gq+3WgbwgwJUiI71uqL0mojA/4DoHbEdiaTGQMmq7EgicDoDYrM0TBUbiThUOKkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMKSk2K6; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMKSk2K6"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-81df6a302b1so4135422b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 23:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770707431; x=1771312231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ELct8JbGFslmyeZtvX1PbcqdzEj+R+mb18t5qqOGr8=;
        b=HMKSk2K6nA+XHPSW3KN2LzBIcwUNSeY0VyH+KXIw9ZI97fE8MSrLLkXjj48VdZEyGI
         9oK9d1hwnjXPj7NAbvWBl4otV0tsMLKeY5oIj4IhwaiQJ1YyW3+ZkU+TzejPeyAYj5jR
         xnw0Zt1w/gpETgaLRk6dADSSrAm+LNhjEOr4BlZD0W3v/1mK6bcElqNMhGvfjUvSHbv/
         0WwFXe05dcBzYNuNTYafaRubfGJZKno+2zGxX6rp6t8PSsY6jUYXOCUCOLsLNryC9rk+
         PVB7hw+c54SQdpyFV9gsHFq1fn3HcomI8cCsUhWcZIDNVqLMYohXyZUdt1IPu7dma0ED
         eqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770707431; x=1771312231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ELct8JbGFslmyeZtvX1PbcqdzEj+R+mb18t5qqOGr8=;
        b=WSlZd1so/CLQL1Wt+ZLnPemSvFamXr7dG5w74r4c1em3khdIDV8ua05t40m33NCmbQ
         YDVJPX5X6cioVcxOWtB+cTXzmLy/llzKQdMCTpa5k3q4Wupmnfn5sndu4n5P2MAT7+mc
         C7O48THB658WP4/GObsSndZZzJVvQ6mHEzb8a/jpK7pwhnHnh3tWEfwaFOYqdaC6Xw7M
         e6sJ8H0JUbB3lOdYxd85ndIArFP9AxvL14aRiuDcKJvDSlO6LB+AVe3KDlqL5MHtg1Lz
         f82E+ndBUZODGjzcnACqEt2txjvT9Wyl0SQdLppbQJW3z0ZWtJ76PPYMFJKoeEDut79o
         j3PA==
X-Forwarded-Encrypted: i=1; AJvYcCWVuYzG4xIGgmjKsMj4+M7haMZDBI9ZDyIqLesIFAtCJBHNobOXYsxUHh4Q3p2phn4X/lHtxU+KSnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+F332P6fs2OA9IQ/eJdR2roDBMmbgRjdjaqPw4q2syQa+tRvF
	1r2leRSCLt2X3ROs4B1+yq2w+Lpb7e7yJODJKJhkFB5sJA/oEB/s8ueivX9Uzw==
X-Gm-Gg: AZuq6aK8FzJ5d1g6LzHD0MahYaoo0Fm9toQgZX7sypZENFAHUOGOBhDsTNoU/gFzcX1
	cYQvdPN7pGmbc5nb7Mnfge0Y/gj5Na3lvYbMGBjRdEpJ7dUzcsT23dsYfDxf2x918vHtoiBAiUM
	/AiZew7eYKN01KAGh4fS6DyifbIZtZEMzLdPYzDjFZN7emqR5vk2RjG1yu3sUjaTCFly5RriM3e
	/b+FMVLCKHN6WLJrUsWT/K4Fc7TSs/NU5VYVzlxXpoPXhzEpdf789GJiEciqy7FAWAphxBQ55lf
	W8MlBMSUDWuEa3VzSUSSE3AimF+w7o9PMycsIEJn5nu23A7bbEsQVL9W/lhaKdnsv/DnWyVE0Ru
	HjVimKo6Gvz901203uMzdBIovbuwVxWJbokZW2Z6MX22LKqesb/xb0gqME2hA9kTbFgebSA07FI
	tC7zFb5PA1/q9d6neAC9NKAmdqnaqMsgKkoKPbBJid/ox+829dtFN37wA5DLjgnwoDiCKuQh8=
X-Received: by 2002:a05:6a20:734f:b0:37e:7e93:99cf with SMTP id adf61e73a8af0-393ad310a05mr12386368637.37.1770701906995;
        Mon, 09 Feb 2026 21:38:26 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8245b62d773sm7529056b3a.36.2026.02.09.21.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:38:26 -0800 (PST)
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
Subject: [PATCH V5 3/3] powerpc: Enable Rust for ppc64le
Date: Tue, 10 Feb 2026 11:07:56 +0530
Message-ID: <20260210053756.2088302-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210053756.2088302-1-mkchauras@gmail.com>
References: <20260210053756.2088302-1-mkchauras@gmail.com>
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
 rust/Makefile                       | 6 ++++++
 4 files changed, 16 insertions(+), 2 deletions(-)

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
index ae22f2c5f0b3..0aef472c6cf5 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -392,7 +392,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+
+ifdef CONFIG_PPC64
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
+else
 BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
+endif
+
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.53.0

