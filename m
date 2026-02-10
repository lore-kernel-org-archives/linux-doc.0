Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5076E33D50A
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 09:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714050; cv=none; b=CkC4D+vkj0riwtpSBG9TgIlbaVsD0vYvy0vrKnvNzUmVptAEmMMlve3o6EaAkpOiTUiEEGAgeb0Q/KLznSDHyogK/2m11MYmGuz0JGT5OZhoUgsB9Ycys5tB+3a7YUAEY0FC0gDnmmFQbnG7D5XBWVwHmdTwX/cLnWbIEwXznIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714050; c=relaxed/simple;
	bh=omBRkQaShskC9IciTdYbrBKzRVSNwpeAiX7J4UHmgpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WHDMHJWb5knhB1OLeSeHEDm3jjK6mnvet9nYJdzzNAFcN0bG8PMWs0ftFW6wXS+Ir701zQOa7dnFZfwJ9fzTy2zqYoGLxCvwh8l5K3qeFqBfFVpNaFvl3tjfjN69jQtuAmIUgUqe83SRqcLwvKdDvRDn0frQ5eeHLBpibgNx9zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmUUVjZp; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmUUVjZp"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a7b47a5460so31049205ad.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 01:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770714049; x=1771318849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeR+VJLK+vbEiDYRs1UKox7LMnlGVq/UQvIDhBD1Vlc=;
        b=FmUUVjZpNFmneolCddJrwzx/14sabBkiUDjvdt0o0RY/VAD5ZdCZOEFbeQAwxNsA3E
         UGKL93C59yGa4m1cy8qEUE7OWxXuhHaM7lsG40AJN4SXOYrbKEiOzmcF91bvskAX8uA7
         9e5+VNOVbU/zalFHj/9MAFt2PcD9XAh3GXPoJYgVcS5P7QZTl1FxgprVc8ev5vCH9prQ
         9jCG0Qu2IpuEzpSKYgFzmFSxjA0izyXUhNh1M1M+Q6+KfKzGR0XvECyIpXf7h2MPNgeI
         QOccX6Fzd12qeF9b6M1FLMFRyyUxS0vz6BTNeAY/F5hSMhA0hv5C5lcjfAa7ulfhEKsA
         M8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714049; x=1771318849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XeR+VJLK+vbEiDYRs1UKox7LMnlGVq/UQvIDhBD1Vlc=;
        b=q65EGMNjaCCeY5Nh0mhdRVK1i3uviLk3jXlaBYezQ66vfvcU3BtTmNmaDiLgt6lt2Q
         xPZG8y4zLLWosmEYdlujXP9MiZ+MEFXiyt8hBQ1SvlRgDyQqc12+V3VcX6py4Q8qqXTo
         RU1bbwDcv64wQ7dM3fPBBWaC1AeTGknkQEBZLOxTMZ4kOLzZRTUvvL24FrZvMy4t+uYS
         MMpGBlSnIfqKqrOTNtSmguKHrAN0YmekxUCe7KS4+MQO0cGi85/MzLgSBgwB4LEiZJbw
         ZE0ueUzbi0M44atmsC4X7LFe2zZT2BWqYK+eJ3uDXyrd4n8R/wQrMbfvrSS5lU9yv2C4
         f78g==
X-Forwarded-Encrypted: i=1; AJvYcCW0bbiUc6MNZc71vYYgiVjfdiF4029v50DTKPvHnlqiXu7kw3XhLo8s3VRu/zRNJCxqcpxqt5Eufhc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp+0wLfXnEmQWGPezytYnlLyRV5csxwbHzLh7DSTaeXInkkDsb
	bWjll0lmsVTmscVbwfYT9KrYxLNDLBdqjJ3aLH7XYW3M31XrgJdug1q0
X-Gm-Gg: AZuq6aJX6e/tK4+C2AJqpGsXYepx1J4S+cGkGKUXSf403PGMooGUIp0k3y0pXDXEevK
	ijTpRrWKD2TTWrak/AcS0vVxfl/KscKtHsh8IqPbVdtcP8QCQ5LwfM8MJc/LoUK1iu2H91vJ9D1
	m731a2AyVgq426I8e9kqrWuGt7afQk+8H6j4lYOAJ8OVeD9j5etPpp8RFkflCuVRJdKvhKMeVOx
	WuxDiPcPMfiwD47i2byjEi5mENMMXzxq2cfya1FFeSrlvUIGF+K/BLlxAAOC+NddOZmp0/JmDPz
	N48QPfl4QZLsUuYqCioUwCQJ4MxXPh4xMFUYgT60TnyppqH+ux21snMhpHiGEYXkj5K0DH3ueMF
	VrSB8/h8AzKTbXKWQipcF6qkIsaavRZ42EGvFajy5ykbeiZdBr5wCzOc0DLyBb96+IC3YHqsi95
	h0JHMtRtU6QFoFa1BhV9uimNzMouLqEVCTQARhReAggXoym4dgESknV1rH6OBse0naQxtWD9Y=
X-Received: by 2002:a17:903:246:b0:2aa:f5b4:9a2e with SMTP id d9443c01a7336-2ab0fc899c1mr17797535ad.11.1770714048254;
        Tue, 10 Feb 2026 01:00:48 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c7a342sm129536605ad.26.2026.02.10.01.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:00:47 -0800 (PST)
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
Subject: [PATCH V6 2/3] rust: Add PowerPC support
Date: Tue, 10 Feb 2026 14:30:21 +0530
Message-ID: <20260210090023.2587534-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210090023.2587534-1-mkchauras@gmail.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
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
index 6e6a515d0899..70b9e192a7a0 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,6 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
+``powerpc``    Maintained        32-bit Big Endian only.
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

