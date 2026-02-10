Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE322868B5
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 05:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770701902; cv=none; b=S26JYsPPrn7pP7of/lua/usDTnGyPRM1DPD17poZIMuZk8/NbRMd+m7vpZO9eOraCYlzVXvj0YLONT6vAHZ6QCWoRPf7YK9APCDz/yQpeS1xakm6OB67XzT547u6WifgGj1Zbzc4kFYCEh5S17NRogKMeHrvQ6UE7kV0Rf+4r7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770701902; c=relaxed/simple;
	bh=xG+iKu12LZBylrATKh/futyKH7FfBK8l0BhELtv+O7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m8iooQS4sp4foig7B4n/DAI/jARh1N2bGhbVEcek78Zie1XvlfHzajNfxtU2svJ7vUNYDtqikLlE5g375eQJM7D5mM4lQIAjG4TKA9Wuhe3BeHluTmIAgc17W8+4xcc5Wds12B4P++NIlG1XvUtl8GMh9m9AjiwYrRKBZKMSXic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaKqUwu4; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaKqUwu4"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-823075fed75so3068864b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 21:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770701901; x=1771306701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cqa51jQ51mIYrhUu71vdVarPvI31OG/fcLZs5WN5E9s=;
        b=KaKqUwu4f6JJUpT06wW+dtpwtIDJ8eTjhLPpbl6TVIIvkcgolVxKS9f973CRIQO7KA
         u9cIaVZ4eZUa2OzQUku71OffzIQ7HuToeI5mCUGbWUxH+3r6B+4diw8UvnofI6h2d/dG
         V9Ikenr1J63OGlDwi2T/nFzQbL5Gksz2UNDfwhzAD4dFTbbuEsoUnjvsGp4PsAqNEU5W
         j1jvKmqDEujicKwM2Uik52IZqpFtDr/o6AJU1eG9e1afXSqJM6tqhASin3PjL2AMw6La
         O0p8gWp3VHnFKKcKD0Xug0ZIkicmk9zCnrP5K6ep64Mp5f+EnbljWTKtdtN6JU9zYAw0
         XQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770701901; x=1771306701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cqa51jQ51mIYrhUu71vdVarPvI31OG/fcLZs5WN5E9s=;
        b=iAB9m170DAsoXEdoSp/ThlWiiIehsCp6Hge31waJXgNiV4lECXYA61ZOKEG1Hz5lsV
         TUs1j3+C/LlIN2HvZ8d75ZBUHiPrbReWybEpc6rzDN8RaRy0zEJb9F06cmwxQGb+M8J+
         Dq975pdcFN1uzHbZYixNtlD0G8Xo5k3VCR1mGvfllnr21L4Gb8y9L0A1/qJbTD9M4Zv4
         hScumXPCzjEnh1hFEYU0efMQS317aUKfkwt5EeTxthe97+sdBJ+AiwXvJnJibvpJFXJJ
         lsN/8ZMJK+NDqv0jHINq3WPW53v2tL7YB+R8bunCEbVK2M2WYkO3j/iUxtxhZCvprP9g
         a27Q==
X-Forwarded-Encrypted: i=1; AJvYcCUj8GQ2KQ59qfVcAAdgTABiRea+Udt0MQN2/7lrQkRF3jUWtgSXWXqQsyPztIj9+tkcCejwd8dVPNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2rGiWvmolyb7nQFUv+K6xuxew7Sr5xOK8m6b0wrhTTElBZo4M
	soBAKFkZTVcy49UCTFcrgh2XhNOkBgsn8mMF5Z3xXQ+ByKsSvth1sQQZ
X-Gm-Gg: AZuq6aLQQ1/yShLY1Ap8MSusqs7aqOyv2Fo7/mj3abLiX2TmulHaE8rfLpi7SB5V2Dz
	jFIo6B9EFr81XK4AxQoTFDdbEPc/9q5K7AruRzGSvqwUQTAzqklpJwz2EXxGb8hdgJ4pRt4KJJT
	l3T23BfQgcoJnoDOC17zIYp2ZwZ+SWgvitbM2rOIo8vurRE+bPSY9D20FoeF0tLzu4CDJbsjRDw
	TD3nMEn20cG4suECnCip6oxobwoeiHYmk2Ndmil5W1Irt/Xjl0wVbbxsx9US9CnB/sXJgkcS9e5
	c05GV7HZOrZ2SOC5MHqd3tprcKsJAegj1/z9w3rsWQSmrS3JKgLWeNdjVNm7C4OIlH5mnl6chry
	cS1VvDFRXuvItbc0Us1blqOK+sNv6rMWHhCTZBNy1gIqXT2SI2FgH6i73XRjLrbFk6sIHvzsMNt
	vFZhprp3XA3T2k9M3AyJeX19Mj/R1lw8YboEn7gAt5UuoDszfgnC8/paY9JUld/d9hytctzYRyZ
	GJfgyr+VQ==
X-Received: by 2002:a05:6a00:22c8:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-824877d3c6fmr1007679b3a.23.1770701900828;
        Mon, 09 Feb 2026 21:38:20 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8245b62d773sm7529056b3a.36.2026.02.09.21.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:38:20 -0800 (PST)
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
Subject: [PATCH V5 2/3] rust: Add PowerPC support
Date: Tue, 10 Feb 2026 11:07:55 +0530
Message-ID: <20260210053756.2088302-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210053756.2088302-1-mkchauras@gmail.com>
References: <20260210053756.2088302-1-mkchauras@gmail.com>
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
2.53.0

