Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802693164B0
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770720036; cv=none; b=HD6rKkHwsRkOJwQ5c1iZ+09btcycaJFWrib/01a8z97yzK1bGIZSMTGXKAz8iOoaB8JsJj9dC08ORFQo/FbPY2LRSQsnS9Yi6dYPGHplXYMAyjPFPv1qBa27kiwyMR4hEmZ08X5WgWx8rNqNXNNeKxvfqrXO+bU7L5wmFI/qRR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770720036; c=relaxed/simple;
	bh=TeX6FpDhYE6FSzmi7IBpjgfnly62UeaRLnW4YBkuyHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttQ1YHMsIh/SPj1fPUxfzcaAza2OTSg+YwPMqUCqmD3WFOqqKv7Wx/LHKHyW2Jf7ka/0W6iLNeiyMSIc3oJyJrYPsInG0yaIz7mKUt1JBPpiKGrri3f6igDlQDU767EH5UGiySE+uNzYgBYc3Sc+55bcLIXw9UTSbXE9z9LQhuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOf7vsan; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOf7vsan"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-66a2278a37dso2037066eaf.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 02:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770720034; x=1771324834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIJz3kYN33qG3Fl2V6Bqi8+KcSudbe9ldFTSf7iXp3g=;
        b=NOf7vsanOJllfT8OOZ59csWq54yqRx9eCzvq/xVfK0Uea8o2UHbmwBbMBZ+skLn8fq
         t9ZHCbZaMI+NWvu6okVRbNIKvFGJc4JNEsMLCgy6+yjLqMdqkRHgLBTBPWDJRWm8F7eb
         yRTvqhT1aFoAJ+tPW9WxLvrPk+DnR10VMSR/tHqoA0uwGZzIZH+C7/RWhrTo2NubrlnQ
         3KHzASZu5vjpem7onKFXKGn3Hd0aCWgDZY5U6rKJRxwORuhh87cefbMEXLwTc6B0Uwa4
         00LroIlzvGtotC/kh3SQeTNjzH1MqRjQiFfVpJFeXIg8ZYdd13MWAluq8m+U69nQkl0o
         pIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770720034; x=1771324834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fIJz3kYN33qG3Fl2V6Bqi8+KcSudbe9ldFTSf7iXp3g=;
        b=KXBhgshOesGmr+NfJkEakh4rG+A1t/y1wjsHxPBuEyyfPl8TiygpfgzKl+syn8wPj7
         PvlSSkw/2p9R/R4Rhg2ZP69e8KfgnAWduLS27LnP152+48bSXhKBERVEPBkC+gK2Gcpz
         c8faOI5nKPur/f0P0GUVzykPeicCbVHfjc7R7BKrGZlSjnrh1ilH+PTGZUPgUUQGcbW1
         utrcV34v/Rl6gMjFV6NCclO7XrqycVojAsh1s6AfYnEwbUGGOBG+M8s/0ZnzBSsMH1Oa
         JkwUmepLrsokepsWmW8j33IsMQAJcfTlfCXyLV8KWRcRsVaXAHxAZHiYahNQSDUrmQj7
         evPg==
X-Forwarded-Encrypted: i=1; AJvYcCXxEeQdciFzKQkH+5hcEgJE9erzi7uUwAcP56GFUM76bECGb81soc/IWTwC3R1D5O4bIbbqAgr91Ec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJX6ZsKyVOQHMDZ/2q2i0OCC5cz2AGJecJmVBKmnOTk3K9sVHT
	BWfz6nckP/YQZTLimAH492cvDvZRURk2MJnVtLuDvE3bOj9N4M6s3SdmCgfiRg==
X-Gm-Gg: AZuq6aKc9ZKOXV6Jiiwp45qVpVJhntyy0BdXU24Or0OoHz6DGR4KxpT0zukJ7TrEjyq
	a8DxYEr1/S6DzTYgBgx75lNzg/jNhOpVZO1Es57XoimdrF3Xpofj+mIoqpvQrXtw73PAdnUQvKj
	7kmH17h8iEzgtzPIQl8e6J/Jrj5sONudwXVVJjMOzWfUVswMxyb7M4zIC3EG07KDrP7Wnle4viC
	s3NtszYE9KRh0o3b6OIWCO9bt0a8t3K0l1FtR/MbrHxuupkTS7kYN0VsVbwp54AxyQhKTQJeIA5
	anS6S3cs5Wejjh3IMq9QI9MIaxrIXmwFxHOJ+6ISWYLW8GObjcmASK/1+b6esyW73wZucFxV6/H
	VosqM5M8JFjpX8zNxARVH25la7VCJQgqjhtgLIp4mf4WAJfYdUf9A5jxBNACs5dNRCpmZ8FWsZF
	UZ+g2zZywji/XQ7iXunBg8cb+vzV48ZVWB+Byb/eV/wgWqJG8DKIl0aY2pSou4v+fSgZ46pD8=
X-Received: by 2002:a17:903:b4e:b0:2a0:fe9f:1884 with SMTP id d9443c01a7336-2a95194aaeamr120907585ad.55.1770714055465;
        Tue, 10 Feb 2026 01:00:55 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c7a342sm129536605ad.26.2026.02.10.01.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:00:55 -0800 (PST)
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
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH V6 3/3] powerpc: Enable Rust for ppc64le
Date: Tue, 10 Feb 2026 14:30:22 +0530
Message-ID: <20260210090023.2587534-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210090023.2587534-1-mkchauras@gmail.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
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
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/powerpc/Kconfig                | 1 +
 arch/powerpc/Makefile               | 7 ++++++-
 rust/Makefile                       | 6 ++++++
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 70b9e192a7a0..70bcd726ad0e 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
-``powerpc``    Maintained        32-bit Big Endian only.
+``powerpc``    Maintained        64-bit Little Endian. 32-bit Big Endian.
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
index 9fd82c75dcbd..9385db478c59 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,7 +61,12 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
-KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
+ifdef CONFIG_PPC64
+KBUILD_RUSTFLAGS	+= --target=powerpc64le-unknown-linux-gnu
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

