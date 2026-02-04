Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C9D363C5D
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 22:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770245607; cv=none; b=U8oPaXTU/aqBmR92bH89bBlDc3yEAS3fQ6M7p9orEfNlG3ZfQ9vy4zqn1QYt/Qb1FUSlvTwj5gDkzxdRpYeuT9bGOJS8qQh1OqdG6DjnpQWwrk6faRPihs6SNTwEhlt2BYkpbcQHCFsPqGOo11XZPZT6cQMmVMaeAlq/fyuW9WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770245607; c=relaxed/simple;
	bh=cSSlRBRjRJ8Ns29jUJ5Jam61iOLlFitVs77vnT74bKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZEaEneN/Om9ukBa8HRYOW+2GC9IVhyLHeiH5CNw1qwvExtSYdkOtgXXV0J0E9/kuv4ZctvY2rrp6qYxSs8zqW0bM/XBNP5OYznbOMu89ThrQCHAoDRJFMp7VYV0BCYz5XesVRDDiUE9O6T/6qDOagEXdgo9l094gfXtPuhXc2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U23CP7OY; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U23CP7OY"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d1890f7cefso302246a34.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 14:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770245606; x=1770850406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXYYAkQIYtgJH8avjMGESEihpdp9UD0EHXLRnPGjhdU=;
        b=U23CP7OYZkJw0ycpAMb5wNjVcIdyrkxRoyLQkRLWXDL/3Y58d8/9TihH1wHqjIs6jd
         jChz/r+MB871Cd8qXukgIX64MM8szhngvEm7gwFHSnjwXJ8AsNYPDVsWVSLAe4k2M7GW
         VvmsNTteDC0UJIvmcffvBsNjxrq8YS+J1kcGl16OGWdJqFAU7sdWCq/jthVCDPoq5xTW
         nv+kJRTug4ulLvllPFp5RMIQS5vfj1cyaF2SBWTwkryyxGPU6H+2MDRK/zNikJPjA+iu
         y5UVOuQOK3DzaNWxQuZ/Gt+yX356X2G/rRpjhsTlMtx2r0aqxB2rxBIn9WM6I+Gx8iiv
         UwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770245606; x=1770850406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HXYYAkQIYtgJH8avjMGESEihpdp9UD0EHXLRnPGjhdU=;
        b=oXzdgTpPnmQ6vHqRus+b7A3BMuPPyjGi8S1UQvHVislNGRbC9oma0uwLERAuZynqb/
         hfSB9x5BcNXTZ73f0SEQ0C3ynIVIuFuLC45Ya83hFb6IDNullSTE0qCErqc3inH54Ih6
         5TqgAnA1VKL4lwaP2nc2FC0jaTiwQQi6bnw22BJvOlg1QMWAd6EszNiIEBLenPOXxzPV
         t1l15WRcDIi+sHeL7KE4N61KBUW0+goEDKShiHN53GemwIcfgjKlJB37tqjldyXFw8/B
         EVRR6ERUtubgeaPU+bGQt26k1n4n9+QQh2IeNrfRkBjF7OqIlrnaE1Hv2d7gH3ob3Z9V
         onUA==
X-Forwarded-Encrypted: i=1; AJvYcCXSmTAndVaohdTI0gtYc1BtrT2HFpN/NyKSB0avcsIoEJgoj0QaTSR42zzLUDoh/LIdoshJ3VHc3bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCwRxfUQtEqDVu7fuVbMcCEjsHMvKZkC24bBbr7Vpkpoq9Wh+J
	I7YKDPovzwIY/Ms0x3X3uzaYuVOALXUsqOre3r4vZHxnAtMiX36s9l03
X-Gm-Gg: AZuq6aIMoFzanyLpvsJwFGJ3Xjn+0mGmatvdSKOweU5D58QvSP1x+P4Eno8UH4No0xO
	DWTcliNzEQbUx5r69WLWvMFYjnOnvg0oFG5WUweo5VPkv9l4Af65zy320+3hDusahqF227knaxO
	R9HApzllWoPFOaK98p4WyvOR1xFveMg5vlTENohbMEmEZNNIKZLj+6cB7rs9CHy9r38DC5k1ibt
	1rFhBZbhuWsWmawtyHLXo8v+CE+IXsBUAEjL6N9pSLS408mbQzk0Gazz6A9qg2MGC3LUYkMOe03
	uQUD18W48KI9WjObql6L/W5IrYdf+TxWwRpHPj0fMRqrLsERuVhPxliDruYPVDFSCLJf56smWq5
	OWIEOzCq69Hs49MXDQZBx4M9n/fFV91AIQsa3uMcorOilI6Hb/iXXRyaCoBYn3ZUz23GVh95hZf
	Q9jthewIAwmDG0cn2Ds3rmFHY4AlCcnWztklJQsb29ieIMNs5f6jTgh23fMlO6i95v
X-Received: by 2002:a17:90b:2f47:b0:340:c060:4d44 with SMTP id 98e67ed59e1d1-354870f8750mr3428377a91.14.1770238953409;
        Wed, 04 Feb 2026 13:02:33 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1bd466sm3277977b3a.20.2026.02.04.13.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 13:02:33 -0800 (PST)
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
Subject: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
Date: Thu,  5 Feb 2026 02:31:25 +0530
Message-ID: <20260204210125.613350-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204210125.613350-1-mkchauras@gmail.com>
References: <20260204210125.613350-1-mkchauras@gmail.com>
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

Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/powerpc/Kconfig                | 2 +-
 arch/powerpc/Makefile               | 9 ++++++++-
 rust/Makefile                       | 9 ++++++++-
 4 files changed, 18 insertions(+), 4 deletions(-)

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
index 17db23b82e91..c5dd03713af2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -283,7 +283,7 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
-	select HAVE_RUST			if PPC32
+	select HAVE_RUST			if PPC32 || (PPC64 && CPU_LITTLE_ENDIAN)
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
index ae22f2c5f0b3..c3961fd0d9a4 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -392,10 +392,17 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
-BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
+ifdef CONFIG_PPC64
+ifdef CONFIG_CPU_LITTLE_ENDIAN
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
+endif
+else
+BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
+endif
+
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
 # some configurations, with new GCC versions, etc.
-- 
2.52.0

