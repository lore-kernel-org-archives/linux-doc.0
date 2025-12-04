Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851FA30F93B
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834926; cv=none; b=VRbqobRkec6IZJVT0YsgoQMwsjl/jDsdF+j+kof6SqD8GnyX9J7HXIJYLoKjQBIYyyTyPeYcwCtTiwAjAIMSveXITdEqSWMnMPQ6rpmNgbS+m/1biRebyiO4IpfRxgzykmOFSD7nEqgM3OErmX/SDt0avST5e1q0ePDDKAmungc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834926; c=relaxed/simple;
	bh=djzz99/Nqr+mam54feyNiv1NIFjqDBU6RJYwqgkk4Jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pb+GkhG5Z3vJKK+xw8D8vHwVnrs0C0TR7/fvnU3Okgib2SQdgNwkTTCoX0TyPEF4oaiOUfGBWIZNx8ypfBav/rF4l50npxUWGAX5sbWtiKF9W6C5tJyDf94Jj/JwpKv/APg9VWh+/6fjTvvlbJGtmzbgyArvOPNsTCXv6do1qv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMmZMkhV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMmZMkhV"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-594330147efso523320e87.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834920; x=1765439720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9GtPr5taZTAzyn89OMPpDe+uAgwZM83gWeHrAtje3E=;
        b=gMmZMkhV3vs3n0FzsHdafB2Msqyg9ZJ0fYcxNrh6CCd1JJO0wmLYPlkeHxCrOESGxj
         gpYHcTzstePF3OyQBeLzh4J8xUrUtRPRBHtgbH3q+h0joO1xUGRu8lUbJ2M22LmvojSL
         Ma9n2w0UdDeDTbZSbSQkxtsJINRMCa3EVdLaEVLdKQJw0ioTg0iWrTJn/Z7QfTRBqXn0
         8v3aZXApN6JlkNOJ7djlKftiv45U44scS6biKtYhhb6XGb78XeUyiRBvaDPbOEFdx6oh
         RzixmN6xb/NLTtm4EG8XXxjY32pzmbDJixcaHmRQ3Ta6lvJ0vQmmESwlTlIB2hwRGH6f
         Y0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834920; x=1765439720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9GtPr5taZTAzyn89OMPpDe+uAgwZM83gWeHrAtje3E=;
        b=qg/SmKEB1gnXF1vniG2Hxz5P6TkC6EZOLjOjefib6yAdYAxbASeR73awKECFuFqqAr
         vqlyPuY+o1i9MyWhQIptJzUSHlEtmR1q8FTb4iNpIvYY7d5BbMOgCC+8lT5W9GmG47PR
         ABqpjnyxdVXs9H06wRF1kevGP2cUZTwz2njJfmBEDOM+vhLkAl/9xyhBSaVSxI7jkNBU
         IgAGi9Vikm0SQtm9moKUsicRUk2lsoc0oimkqSaekTu98jxCDBVAbxggug2Za+QLmaB0
         vYusdtRwUDIlMRfA5z9iM/0Zdqi/dluWLQHIDpHRk+y+Rd6BNnhV1VE0t9VIZKY/5G4N
         aNeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJwixk2AHCQAGIjhOy6dxxEAHVfO82XBHGnec+nHAmjVgMW9qpinw3dhiUZNdePTQpdD3kzSvKfVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEx5ZiVMvj8TMkWMZM9LNXxmpMBW9GOGRtMRXKpwgumJyAIoV9
	OZ/0DOa1psJ58CSWYceD2aX+K4GfYF2xLvOso6W2wFJEkLkx7ZA/3HLj
X-Gm-Gg: ASbGnctFqR20VVim7kWmuslZATMcNBnaxf0sSCMFr03WwryGX837GLbg1yEjWyjzvng
	lrOJhcdqtJD9tlmIFZZO3G4a0eX7u5xSzQXPt0Xdd4eI4Y9RuaKAkN+YN2MuyMS70zumyPE/Src
	sVNRHuu/S9IIb+R7NzN37l3sZP3uI/wfmPtq0ixrnLI6cPL82AUEZOBL820ygS2MARaqlxGYBkG
	rN0ref7jBNgx3YjSINoTSjdLPGmCE8otVHz1nb4SspL5Pi9oCTdm4QIky2fTi8+03uJzQB3aClo
	JoBhU0qFElFIV1uMUu9FtdJLOWL8gbb9L9TYNrg2eoVWVnjp0W5QWWitPJWGUC+bPhP8c3Bq73G
	cQwUVq9GdoAIG1OklZTcDPYN2fw73yJTae/1LC7br/DOO77nBWg1Lbz7ye3zeoxU1oSe/3Q==
X-Google-Smtp-Source: AGHT+IEldMEBa+Y+2+8e9BBmMa+iraf8wmEl/ZT2sdU4A9p2jyG2tZG76w7egCqyyaaevWjMOuPaow==
X-Received: by 2002:a05:6512:3c9c:b0:595:9d6b:1175 with SMTP id 2adb3069b0e04-597d3f27914mr1982243e87.14.1764834919940;
        Wed, 03 Dec 2025 23:55:19 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:19 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:51 +0100
Subject: [PATCH v5 1/4] rust: export BINDGEN_TARGET from a separate
 Makefile
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-gcc-rust-v5-v5-1-2d4f20d86c24@gmail.com>
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
In-Reply-To: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>, 
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asuna Yang <SpriteOvO@gmail.com>, Asuna Yang <spriteovo@gmail.com>
X-Mailer: b4 0.14.3

From: Asuna Yang <spriteovo@gmail.com>

A subsequent commit will add a new function `bindgen-option` to
`scripts/Kconfig.include`. The bindgen backend requires the `--target`
option for cross compiling, but variable `BINDGEN_TARGET` in
`rust/Makefile` cannot be exported to `scripts/Kconfig.include`.

Therefore, move this variable to a separate new `Makefile.rust` file and
include it from `scripts/Makefile` to make the exported variable
available for use in Kconfig. Place the include in the `need-compiler`
branch to avoid including it in irrelevant make targets.

Since the new file name is `Makefile.rust`, it matches an existing
MAINTAINERS rule `scripts/*rust*`, so no modification to the MAINTAINERS
file is needed.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 Makefile              | 3 ++-
 rust/Makefile         | 8 --------
 scripts/Makefile.rust | 9 +++++++++
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index e61f1300fea0..bdbf2025e68c 100644
--- a/Makefile
+++ b/Makefile
@@ -718,9 +718,10 @@ ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
 endif
 
+ifdef need-compiler
+include $(srctree)/scripts/Makefile.rust
 # Include this also for config targets because some architectures need
 # cc-cross-prefix to determine CROSS_COMPILE.
-ifdef need-compiler
 include $(srctree)/scripts/Makefile.compiler
 endif
 
diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704..2603b34f9833 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -385,14 +385,6 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
 
-# Derived from `scripts/Makefile.clang`.
-BINDGEN_TARGET_x86	:= x86_64-linux-gnu
-BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
-BINDGEN_TARGET_arm	:= arm-linux-gnueabi
-BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
-BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
-BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
-
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
 # some configurations, with new GCC versions, etc.
diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
new file mode 100644
index 000000000000..5c12b4b8c8b6
--- /dev/null
+++ b/scripts/Makefile.rust
@@ -0,0 +1,9 @@
+# Derived from `scripts/Makefile.clang`.
+BINDGEN_TARGET_x86	:= x86_64-linux-gnu
+BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
+BINDGEN_TARGET_arm	:= arm-linux-gnueabi
+BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
+BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
+
+export BINDGEN_TARGET

-- 
2.51.1

