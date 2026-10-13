Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D2A5505C4
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923542; cv=none; b=m6aLeXvhltkhweqNv4CZUyB8tlqvrN0TZ6QarycW7n6fAPvNuFomSuq5TW1A+jRHtHSoreKqJmejdLKFKvm0kJOKRw0flch7JAJeYQcOcIAsGTtJS1XRAowyK9jsb30sGVZRMthF5f3/wGen1AhNbfvJpXJxltXZobj9zXEjAaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923542; c=relaxed/simple;
	bh=f7ap597eqe9kIeMvfJIQIfj+KMtkVG+gOZihvU7+3hs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bg98vbfPcDPIKZMQKbJzzLrsAYiYJ+zBxJ2xknohQ8dwiU7jgLS8Yc6G7SrZB2fa5txZyk1pZMuCbc/8ZsTYqeDIWV18FwmthjEnOtvY6BAvnWdionNj21SA+LNK0YxSXWS4Wc1jIVp5/omsmp4t/HGkYiBfTeUb9jSwdl0XuZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3uh9Xmk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3uh9Xmk"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so3707885e9.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 13:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923537; x=1792528337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WP9XjF/+vFS48q37kPsonW+eIbmBaevH/xXvYsyzl+Y=;
        b=J3uh9XmkboTkSVQEwa0GJBx4qTtgEsxRgiHuWu/vP5lB3aOcMRCyn/kQwblM43fAe3
         XCA2or6PIXAB+tbILkZaKmBW30LWf+m2NpdUHgwC59jlla6rLdQ739gZ9+JoSd/52qEp
         79ZeDW0lzaTGsW/0rWZ3N81WvLwOiMUgCA2/obwQ05jBUM0VxMxAQI+1XeNAAm8ZJUii
         tiFjmd9yDhbphhPrut0BzcNwVfGJccPKGTaNoy3QDtHRXXSe6O/Ft9zTvidx8I8iwLtJ
         Q6YKIp0A98tp9bQgkcScZArClrSvvFRB5/7Hrt4CWB3gUKu3u5pRpW1yf+ghhPsqUAgz
         a6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923537; x=1792528337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WP9XjF/+vFS48q37kPsonW+eIbmBaevH/xXvYsyzl+Y=;
        b=LmSu/h+EeUrQ25geJDu57elFrpFfLRUqKxqh+EHudk2kqsQ9e2czzmxJciIzj4oThP
         lsiRZWUd2l3HtxeLBWVbJ3CWDhNrDPTiWKEMjlKLd7Kgf9+6trrQEVGLwp5a8VJQN607
         89OEWGzYQfMFXUWSv0tzEY1Mz0hEjhkhJ3DUSIN0HBYSlpG0020IW2YSjg4pS9k2neG2
         smWPZH6HA8DpE/TpXYu6eY4bSQUML0sXqz6Y+RSa9OV///QGDgDPyMvqRgGJjuGGCQ4U
         zF0Gf3nXe3qrhGhKYFzmGTBa0sZ7q9ey+kCEn3dYmtFv8DnpQXkjylcVJd9dbt9AdJy2
         ly/w==
X-Forwarded-Encrypted: i=1; AKwUvBxFSnjdVSbXMZyHIFrNSht9fxJle/XjJH+C4uRjRca+2AlSMdjH2zAJJyIFXzE3MQ+AaT2zJwvPx9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhtWvhpcItpmeFKzNClYg8LUYGYd5dOCq/MGGpKukdy8gM+acs
	KRF7iQU39Vdbbme7JRBUv6s2bU53B8DSqUeRRJdlvlacRpgMQLID7q5d
X-Gm-Gg: AYBFou10lfZy/ywSV2KPYsqwM3PA5pAFOjMS8LMFZQ8naoMv5Ped8G5VjZOLYzubSt5
	vW07fv2s8SYJUFAZP1BIUdKCU7d9DCCEE3lqkW23hTr+Fimh4t1zbRdveSS/DLNoV61jozmOhZj
	xjcgIQphMc5QdDLxoNrC1cbJ/Kl7ukgF0kcWUD+uW4J4aVn3xCDdmWyqj4b0vLfmlznVZn6OiCy
	xHC4B//3iY3lAMW+PJfnLYKwUXUCgPAqppIXkyk/Dsx0cN7rumKJLzmrX0q+c7KkVOZf1Xg2qfK
	r2wZV1YSXeMOsHbZovvdWbp5q/Z1RTyWVVOwblUSvI49iVnJ88T5TcciaCkJoUUAGsDfpWRQC0T
	N71jD/b8tlZYThD+ZA+DfkKyUExZQAIjVv5prairDlFdpcYTMRftHlAaTSWqE9BOpO9ocxzFjo2
	RbIcssBQ71Pyo/rDD7sNXUtHE+014pjRAjIWwGRiY+8nyhXiPZIXt4fjfxmyISQvLrIr47OoIwZ
	aF5GJUoMycWUbjVihF68kcTQh13FhlTFD0vvoCOz1DYK0UUDfEhRL3JfilPZT9NojOFMSczkioR
	ya0HVHovk/XN5vRD8LXlHVz7UiCQQLXXSvwcyyYpkYQWKqP2pyooqM3TTq0OTcSopIrzewt5S+V
	NoBtwNA==
X-Received: by 2002:a05:600c:6383:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1a6e04d7cmr72732765e9.33.1791923537100;
        Tue, 13 Oct 2026 13:32:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.32.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:12 -0700 (PDT)
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
	Peter Zijlstra <peterz@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] ARM: rust: Enable Rust support for ARMv4T
Date: Tue, 13 Oct 2026 22:31:39 +0200
Message-Id: <20261013203140.31741-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261013203140.31741-1-kmehltretter@gmail.com>
References: <20261013203140.31741-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The armv5te target emits clz and blx, which ARMv4T lacks. Use rustc's
armv4t-unknown-linux-gnueabi target for CPU_32v4T. A combined ARMv4T and
ARMv5 kernel then uses ARMv4T code for both C and Rust.

Plain ARMv4 remains excluded because rustc has no matching Linux target.
This also depends on the preceding 16-bit xchg() support for pre-ARMv6
CPUs.

Tested the Rust samples, KUnit suites and doctests in QEMU sx1 (ARM925T)
with omap1_defconfig and on a Microchip SAM9X75 Curiosity board with
at91_dt_defconfig.

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

