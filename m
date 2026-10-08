Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2367218EBA
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 05:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437892; cv=none; b=f8zQFumMDh5ApqrcKKeFXKbpfMrnliAQd7IOZspQyh2m/SpY3vXhWuJZN1X5ChfJNZRsuPlh+cNMLlefx6y1S/AMKCrCIK8uxBpKfi0Vae63n6PZUuloEl2Kw6Su61IHgiaYvn3dK8+Qn0+r353tcujLcv3NT03NZLMnTPkoww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437892; c=relaxed/simple;
	bh=x/su43TmMUkJUZgcKoaIOqCX48ZiVCOwVIkzl9S0tHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A4gwZ40bGr/2jeKcYY1/feUSYDAMmrPKCWCESSORUf75kaKJ6SOuNzuGZhy3RDSyHjdo/5G6U/7Nq7NBJmcML5p96x+HAmMEgGAUok2ut/eMlZoKn0QPqNZ8M7IUdpQnbvQ2QRkux0MSrTmBOQWQVae0lCy1CzJf7LrYzJM/K54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k86O6mrY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k86O6mrY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49e73611928so1862815e9.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2026 22:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437886; x=1792042686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIRMTkLx0GIudIk/+pSUKhYjEeCdyW0COsPRuKtAivU=;
        b=k86O6mrYJxPbqs80UKEmXbnLLtqJAAeppIwRigL3YPON7xRXHXyHvR6Qu/vDM/E9hs
         GBgNXTVZTEAC7USpfBu4nbioh3N/HEKNm6Wj+OQvBFLFqDrKwQFmL9oeYJhbbztDRUUg
         O5ilFk+MkXW0rPEzDld5UfjkKE4DumHlKFRzdfdSFVJzcxzE+0FHJV4slyhpIo9Vzsdf
         q1Ck5tllaGKkUV60cRgcjGGpeJOGyzbBh1kx3UGtk9OLKTW7UkY/1ZXP+zxNJXmXB704
         7WUbWTCmFNhB/Vol9o/hLDKPlls3hyDLtWFx1kWvOjFj2fTIc+QuHe4WK5F1cst9xG6T
         dPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437886; x=1792042686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIRMTkLx0GIudIk/+pSUKhYjEeCdyW0COsPRuKtAivU=;
        b=aKybzas4oA9vei21rnlNSj8EO/RP2ODeNrIVUvn4naFpWu3fxKwhAIalS6Rr6YrsIk
         3cjHocObpu1OSmhTlNEp1vn15EgBPH1TY8be6BiE8W3/IpNQX+KoMiOmAquLWnce0yh5
         Qokf1LnNE+CTjEmBujHyW3V1219O8+KB7GnKIhcNgnXS6NuJSEx64yF0Q/4XtHo2rokO
         Ahk+VFcMPw+bNmSNPiNg3McV5KYfCXe+nkhWDIPAHsWovAvrG9REQqyfrBijdpbrXQb1
         xvc3VsMeQaHNkPj8rMXQ/wc4orP/sUJ9StY3PkQl9mULLTiPdJv2aVLDlgNMmTnK5TPR
         aEnQ==
X-Forwarded-Encrypted: i=1; AKwUvByt+scuCOTqgkr7Rr/4QincWzfyBrYersILFpCbvrw67ZbBsk3sMkQw6ttraU2fx985bQEfw1zBR8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++k6yHKkF61TRzqqkWvbs9+CozQj980ikyHd49rqbX+vSZ84YwHm
	DNy1nqjzOkKCvFH/5Evo3/YpMZCAvXKo27slKkPPelJKnM+TG8cHzGaS
X-Gm-Gg: AYBFou3ct159eAHD/mY2NAQwh94xmrU4FtvRnquBPyT98ahg1Xfpt6hNS11PgIo5o9I
	G+upIJh2sRCB8ybw3oUfoDsbKy5HySS6vwIZwf7prigUtbuCdSvxb58B2be7OQF8DeH/S/PDls8
	9V766ik/D//Lu83jjy7zyk3IM9MieNNHXAkOeSA/BwPc2n1cj2zz3+a9xPS5jVxF/+WCcmmGFVO
	07ywxmHiDTIpbPwXs2neqEP4VM92urJUYfZQBQaUujTYyfRRmS5sHWZebcscb9ujFvyPtvm3JcS
	t+I6vuxLzdd6wdI2K6fuyJPG/iy4RFJiWv2X5XWpk9FNWyFe7zPT5WLmUK0EvW07nzmEjZCIOjD
	Q75F1YcyZmLBQQ/at52PbIhdC/qTJ2+HvMXTqMiQIkrwW0jmhcZKG8pOh9OqnNoXVtx+GLA/A+H
	FRbFoZthG1ACf6CM3hL2wevbjC3Kg/ESFI+wG0abKIdKp3fcercHI0UnFN3gGcZQf/5OEuj9o8T
	V4mGjVu2tGNR1T7E5tGu/JNajv/34Q5+rrXIZ28FUBC6tbA0i4zTSekcChfDpL7iM45a0/sGROk
	RetVhVGooN1zHPN6VSjgh/+Y6NkRQOF5isXR35Y0AqMnWuT4GKWa6ZfNcIweGSUfSZBJZO72o6Y
	6ydHdkBQ=
X-Received: by 2002:a05:600c:4691:b0:4a1:6282:1cf3 with SMTP id 5b1f17b1804b1-4a1851b3756mr26848495e9.9.1791437884887;
        Wed, 07 Oct 2026 22:38:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.38.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:04 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] ARM: rust: Enable Rust support for ARMv4T
Date: Thu,  8 Oct 2026 07:37:45 +0200
Message-Id: <20261008053746.49631-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The armv5te target emits clz and blx, which ARMv4T lacks. Kernels that
contain an ARMv4T CPU are excluded from Rust for that reason.

Nothing else in the Rust code depends on ARMv5. Use rustc's
armv4t-unknown-linux-gnueabi target for these kernels. Like the C code,
the Rust code of a combined ARMv4T and ARMv5 kernel is then built for
ARMv4T.

ARMv4 (StrongARM, FA526) stays excluded. It has no bx and rustc has no
target for it.

Tested in QEMU sx1 (OMAP310, ARM925T) with omap1_defconfig. The Rust
samples, all Rust KUnit suites and the doctests pass with the current
and with the minimum tool versions.

at91_dt_defconfig combines ARMv4T and ARMv5 and is built for ARMv4T.
That kernel passes the same tests on a Microchip SAM9X75 Curiosity
board (ARM926EJ-S).

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/rust/arch-support.rst | 8 ++++----
 arch/arm/Kconfig                    | 2 +-
 arch/arm/Makefile                   | 1 +
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index d6d1bef44c8f..3f39cf55b6f4 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -12,15 +12,15 @@ which uses ``libclang``.
 Below is a general summary of architectures that currently work. Level of
 support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 
-=============  ================  ==============================================
+=============  ================  ======================================================
 Architecture   Level of support  Constraints
-=============  ================  ==============================================
-``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
+=============  ================  ======================================================
+``arm``        Maintained        ARMv4T, ARMv5TE, ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``s390``       Maintained        ``CONFIG_EXPOLINE`` must be disabled.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
-=============  ================  ==============================================
+=============  ================  ======================================================
 
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9275a85f95e9..cf782fc04872 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -176,7 +176,7 @@ config ARM
 config ARM_RUST_TARGET
 	def_bool y
 	depends on (CPU_32v6K && !CPU_V6) || \
-		   (CPU_32v5 && !CPU_32v4T && !CPU_32v4)
+		   ((CPU_32v5 || CPU_32v4T) && !CPU_32v4)
 
 config ARM_HAS_GROUP_RELOCS
 	def_bool !COMPILE_TEST
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 168779e9e93d..a72843890241 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -77,6 +77,7 @@ arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 # the +v6 of the generic target, so older CPUs need their own target.
 rust-target-y				:=arm-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v4T)	:=armv4t-unknown-linux-gnueabi
 
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
-- 
2.39.5 (Apple Git-154)

