Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BF53054F9
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 18:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770314702; cv=none; b=khVjYsepE7jeGB7OWFJL2+KJvBzXEqLTy1h3YGd4kS/47ubARkirbdb6qxnDverKQ5zHNVeclksqZE2yt1kfP4DqFhj7eRFdqevm1+x6Rjohw7oqptpd6ZufQcoAknK+ugxMlGQuaWELLSrcxmgYjcb+k09XZ1QeLHrngGudfcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770314702; c=relaxed/simple;
	bh=EzpOrLbanzoU/XKFGITxt6Om/X66hVN2Cw+4bKLo8ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4MUy2N0R7hcf/GDbUt1YFBs40cwCUo1pf+bb6zbOuiTiS2L/nrsFrxmv/s05XwwKEgtU46M3dBKjAvu7DieMIWaqU2HSLQc8VgcfRxUPrqK/NAMRUmOUwlVR1GfAkdCAlQFkpJ/2WSv5QTyj7U1LCYcEum2HRUWpp2pFp4czN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxxhDSRT; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxxhDSRT"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81f4e136481so721924b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 10:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770314702; x=1770919502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JEXFfn5owLVtRFRZ2oa7tX5z5wOjOt9hQA1ZlR21y4=;
        b=DxxhDSRTRbdjwDuyVTwNWxzodVoiLshVLsR42nvRKnuv5R8jzr1NioCCHQaixFRru7
         Hsi3GbAPBpvbF0XopxTatAA71mBFzScDXNV+Ge+nG50jpI7P2KodXJUMo6AO/QZAYbDd
         Q0D9AEjrCy4TFhaTxvqyFaSa85hIEfh3ai0YnwwTxSf8wloIF2TBvKpnH85YOlDO7nKx
         TV6JriVPVK8t+tK5am/bDQYeSFaW+8/nK/WMLx8ciftnbKOsX0lDguqW65IHz5NMmTbh
         UkNAkzfwYf+sXCOw5BCjPLlA7cRSwt+8Fy5joHmmjqEuIxz47GyuFzcznQBQKNPc3HCW
         LrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770314702; x=1770919502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5JEXFfn5owLVtRFRZ2oa7tX5z5wOjOt9hQA1ZlR21y4=;
        b=MFGaKIXWhPhU+UL8EFQgmf23Y/LnwUCoGdkI3QlT5iHvNit2G1PwLQNLHWXtT4T4RB
         1wU357OvyBGNB3JOCLSq/rn6Os4v8Ifsy97eBcxNwds6sQGi07tL8Q3u1IjbZSJ+nndp
         e6jdpliGL7Bko9ct/H30AgfUqf3cFQ0/fF+V4CYJCvSLIyQOh4X+HUEvODmwPNMOCagv
         XXHqXWBDoJRjRkRrLBBN9w4gU65NtALCP+t/DdFyXVPWKzTMjT9Q7THhJ12z1tgBICdL
         cdtJlRe5EtY9GgCgVeYTmmcYMXWCLZmypzNZTHHIrSIuel53JG32Ax4xXZlUikD70oQ5
         R1kg==
X-Forwarded-Encrypted: i=1; AJvYcCUWP8w5Vr89mABhqEN2tsdVyeQH8Hiw8iefdx5toZHAL6KQZO+kqVO8R4Bg1KosqeIx1YCyxACkay0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjqLBkjjZW2mBPxeN6c0lCy418WXGbmhR52nQQ8wjABMtGStcz
	OZXyDbd4S46RdzCGZQwRpT8eFzNZIzoAs9C4RZ8RaE8fnjgtZ62tPqU1
X-Gm-Gg: AZuq6aKuugFL/X9ofYSE4hAC7JBoXPj3rLqDC+Kt4TrO8UlJr3r0vsntk3z/zUtg4fX
	AkCMEX+BjFlzRYoxCdN0anexb2aUXkL+kNESt5HISQ7rh3jpenDZCazbSadHpORo6X8D2cmqmZN
	lJ52fSJN827Fi5jqo+lxyNl3dBziz2U/KGBzDH8XuncmesyXxBDONQkCfIsdI2qYppX+AIKPJ6o
	wd19m4Z3dLQJUSdAMDO94l8ZdDGZ2FwnKGfg5Yp6rL0kOPXD3Sm9CDTGjiPfC06pzOUpQewJIN6
	8J8eNLtR/J2jsxBwOZBL1rgoT9MdQXhwjw7li70811KhBaUOoEUD+aFCPyZN9bmBV6Nk0qy4E0E
	tx4D8pkNR2DLChvs+czBYFrhOY/FDufJMwxfRg27br5RrALbQh6nEIPsERwZj+oNyGYwSS9RiiJ
	uha5RrLYQPGkvq83hQjxKQrp1a2P9baLSFMJlDtmg7Tr2TAotpeEn5ZNO4fuBBZAxTpx4bNgpQ
X-Received: by 2002:a05:6a21:a89:b0:392:e5eb:f0f with SMTP id adf61e73a8af0-393ad3b6c44mr176743637.68.1770314701789;
        Thu, 05 Feb 2026 10:05:01 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.167.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5436c5sm99812a12.15.2026.02.05.10.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 10:05:01 -0800 (PST)
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
Subject: [PATCH V3 2/3] rust: Add PowerPC support
Date: Thu,  5 Feb 2026 23:34:28 +0530
Message-ID: <20260205180429.3280657-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205180429.3280657-1-mkchauras@gmail.com>
References: <20260205180429.3280657-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Link Mauve <linkmauve@linkmauve.fr>

For now only Big Endian 32-bit PowerPC is supported, as that is the only
hardware I have.  This has been tested on the Nintendo Wii so far, but I
plan on also using it on the GameCube, Wii U and Apple G4.

These changes aren’t the only ones required to get the kernel to compile
and link on PowerPC, libcore will also have to be changed to not use
integer division to format u64, u128 and core::time::Duration, otherwise
__udivdi3() and __umoddi3() will have to be added.  I have tested this
change by replacing the three implementations with unimplemented!() and
it linked just fine.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 Documentation/rust/arch-support.rst | 1 +
 arch/powerpc/Kconfig                | 1 +
 arch/powerpc/Makefile               | 2 ++
 rust/Makefile                       | 4 +++-
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 6e6a515d0899..e26a94808e97 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,6 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
+``powerpc``    Experimental      32-bit Big Endian only.
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9537a61ebae0..17db23b82e91 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -283,6 +283,7 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_RUST			if PPC32
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a58b1029592c..9fd82c75dcbd 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,6 +61,8 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
+KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
+
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
 KBUILD_LDFLAGS	+= -EL
diff --git a/rust/Makefile b/rust/Makefile
index 4dcc2eff51cb..ae22f2c5f0b3 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -384,13 +384,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	-fdiagnostics-show-context -fdiagnostics-show-context=% \
-	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
+	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
+	-ffixed-r2 -mmultiple -mno-readonly-in-sdata
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.52.0

