Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E3B30B528
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834926; cv=none; b=JMaEhxXqYFq0r0i+pxFYFQ4lfRwWvWk7XeXF2eL5DXPRc2Hh0UpKB6WVMpP9c5oLj6pdaRgJrf6mnLCPi0SNJEr2ZQ6y5USiO0Iq1EvjSBho6b8pcI0F8ksTwl16Tduf7qbbxJ7QUG4TGtJUOkG+5/Uj71/5Eqq/R4aApnnOluY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834926; c=relaxed/simple;
	bh=iTlPMjznJPbXtJOmJD38qd13ozQfx2VEj/0hkHnAJ+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2zYjno80dto1zaUEr1l69pIER5c30zIqFiat1+l0gHvYLJ0AtK1XcPE5EYjbNK/fEfUio2jSEik1Of/lsUlx09bvs3p3J7pPJRbJk/A2r/iYdfhNdGBKbJVUZbdk7Dm15jfIVIi9t50yAFUoQBQHx4qLMUSTkNzhkf7ZnGfHdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVBfDhLn; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVBfDhLn"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59584301f0cso673042e87.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 23:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834921; x=1765439721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5CWhh0bivbAxLbPHjrdPNLbMwbFtGK6KhcOChIXS0I=;
        b=WVBfDhLnXSfCvsS1SAxp6E/otJpTNFOuveXhI8D1iYshreuNdrS800sKYNJDTC30Vq
         gHAZ3pZV73fhL5jPH9kw8tCcTKUBye+e5Qvud5yZg0RmDPogngx5ojRvjKZdGpeApKyw
         L7FQismbl6mDqUvAgJ8cMg4UbxBZkKKzmLZ4jB+wcxR+RrpVfSG8Bebjvt+b1UBzSrHt
         HbYJGJphm/RpRTx5PrPBcw9pRUmHd9AVwQ7FkkkS3dxlT2Yge9cLDyLPCJt8pNraUeh0
         JsqAH21FDLra4YgzdM4mT8RSQKqdjikS2FcYhO+iN605wlJkPNlWoIMYHvTAF0W6YPTW
         xrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834921; x=1765439721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l5CWhh0bivbAxLbPHjrdPNLbMwbFtGK6KhcOChIXS0I=;
        b=R0Jztv1mHApLI1pv5GGWFNMQcnVWFQrLU4OoKDi6ljEhQiE1AIeHBCv5xy0KsKJ8wb
         RrG+FuqxQv57tdOzGuHUTubZLsE4o20b43bp9MlYunKVn9DJYdr65zS0cCftSfP08k8Y
         WJ5tNiTDkDTAOVSzSGskTu4Aa7i1/2aY0URyRKn8OVG1+suLA1DDpCihuGKAPETJM7PD
         +MpfBz9ntVTcs6noH8IbElas4C+XdOaEKOhJox+a/p5K8ZlkCMP9O3Cwx6+Sk/MuvHvV
         wWWpUP8z7JUSw9jY41xQ43kf5GVST+g8FrrscWo+GjY/qfCNarFsqlkSm57+g6dlZ9uH
         kdsw==
X-Forwarded-Encrypted: i=1; AJvYcCVjRcno/1RVkGLgYZkdLtNDCkRkEOaoDlPwub0wvGbSitVDuTOreHfMsL1e9S9RTpWBsHz+WieajYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyU7bRJfndcTrMhWmso6vmdwRMWODHSfEXAcf2To4GCQsFI9FF
	gIZAIN++2TzaT60g+Ga7V1i4xm0WZTu4xuyCQdzpyR++Fl81s0UzAoMV
X-Gm-Gg: ASbGncsi7QFZrwBIrKwEzIosiz9iCt2inrGGBI2gPhbfmtElHIQnULjH9QY0/Z/EW5E
	pEvnE9lAt+3O3T1dTVgH0EbMuOvvKWdp6PXzZXQtGiAH+5jE5KoQ+oErmKHgAtfymPuc6QWzzQ/
	2wNqqf3K5ZlMuv3BTb7agwAhYFYicMauqLsZQ/wN+7dX+fBNUBE3mndUPUI0MbF5CNK3wF7yfaG
	JkHBhoUdCG9KFfryRAGBbbZ2hiLbPFx1X7Y9n4i2exQ50ARkePv/rL4T03qQh7dfQF4hwZ2V1qe
	Da+6rJOuWQRbDQ+7aZ7vRq1rXSK7NE/A2ZGWlUYy7H5FhyybUtJdLGMSSQ0jYu+wFDbrX1YFDgh
	SxgDU6XqrgV9zAJ39mjl5ahOoyXSXuiWsgNJy9X7Bs3mgjvWCuZMJkhCCP23crxaDfB3B4g==
X-Google-Smtp-Source: AGHT+IHtNtKovriM8w2pLkDHwyMQApqeD8GW60UnConeyFy7gFY99L8zBySpoiS8naABTGPgdJC9Sw==
X-Received: by 2002:a05:6512:159b:b0:592:f521:188a with SMTP id 2adb3069b0e04-597d6709d9emr571551e87.49.1764834921103;
        Wed, 03 Dec 2025 23:55:21 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:20 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:53 +0100
Subject: [PATCH v5 3/4] rust: add a Kconfig function to test for support of
 bindgen options
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
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

Add a new `bindgen-backend-option` Kconfig function to test whether the
bindgen backend supports a given flag.

A subsequent commit will use this function to test for RISC-V extension
flags.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 scripts/Kconfig.include | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index d42042b6c9e2..5d4d29eed0b3 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -78,3 +78,8 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
 # If you are testing for unstable features, consider testing RUSTC_VERSION
 # instead, as features may have different completeness while available.
 rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
+
+# $(bindgen-backend-option,<flag>)
+# Return y if bindgen backend supports <flag>, n otherwise
+# For now, the backend refers only to libclang, so more specifically, this function tests whether the given flag is recognized by the libclang used by bindgen.
+bindgen-backend-option = $(success,trap "rm -f .tmp_$$.h" EXIT; touch .tmp_$$.h; $(BINDGEN) .tmp_$$.h -- --target=$(BINDGEN_TARGET) $(1))

-- 
2.51.1

