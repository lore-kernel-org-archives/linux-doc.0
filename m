Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA9D30E0D9
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834924; cv=none; b=glRz5obBavIzNyFxj08WiNeCHM9XKKSgWgH4iL+y6JDzaHQlilb/Bjf2N6GgitHaVPrvQR9CDeG4V33qPFUX/2JZ3rhqEfishHdqQ8y+kArlU3aWLTX53qcA5oY9NWWcGWKUSciXeCXbLQ4dCyht3V6PFOdemgb0xcPGm5Cbo9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834924; c=relaxed/simple;
	bh=3qpxref+fIz2xXinhbe3sx3733zbNSv6/Z2ffSx178M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k5d2qtYYO6i2L0LoRRcGZcrzFdGKptNySdkGMRCj0yQbnV1ndc2v3Tnsn52ZcQIHTVgxXZdOUkG3QLNQFqClnyUdsblpNUt4EEbXIZMjGIKmDIPuNd4slg/axjS+1YynpWQd7T1lptBHkMIkAfb6rcc/2PuEX4qf5zhZkskM+Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIElW2u5; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIElW2u5"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37cd7f9de7cso4748811fa.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 23:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834920; x=1765439720; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9GoQPHU9Mpip9gR91Y3C4UfAkxVzcGqXTOlsYo71eKE=;
        b=EIElW2u5jB6al2G7Hz4H+ICcnjJydJC5JEg8pDOmsOWs1WAHX+3gKmCLNjnbIXH5J1
         axb1jYI3oe7p0xaP7oU5IyB8yywm4dqcT+9lfJZGNJWPVDWh7hsZjEEMYKYzgrmxGfOW
         lJ8ZYfvYI2UlsYAn8/f+oqydj1qRGjmCk49x6uL9uIQfpbXU/VO/dQWU+myioW1H4iIY
         F4n7WtBZRrBefDZmEZoNvqA41zy1yUe7SQeb/ojksSIR/+OBaNByKJrydX1lcoVTMK5C
         mUVAUEU8lK5qGqgDtR+0arsJYcsi5IQBb2tLAXKOtPtpUn7571fZx4tRL7DcnANmwn+g
         dLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834920; x=1765439720;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GoQPHU9Mpip9gR91Y3C4UfAkxVzcGqXTOlsYo71eKE=;
        b=aNIY2YWdqm/BW+yXk3RKyHD7IP6dYP8u1kGLr7RgNrSJKOiKOP0e+z9tuiHgKWXgMV
         bogcICO9MOkzSNLV/vjrVTMNG2B2cM/aObYwYshQMP1Z1Rw6Do0sxeZaRsW026SHl2Qg
         Zf1xi/+LY+kdXXu+5nJXuaYrBC2cF63FUE85d2uzEEf4dbbvf9fSqgbJEKj9q3/uI235
         1OhIHkE4Ulz98thbrpbYBLBGh6W/088nUkqBx1I46nm4/et5ueb96HZ2B3gCkns+JMes
         XAVQKE3u2lJPggqQmTt/1BIT8I18tk1f9M5VNYta/npCYrBgPAEb/fINQLu1VYg8pDio
         dlqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcSrt8vZ2crWsutT8vbAe7jQ8hiiLWhcqe2iLxtdkzSDyHFbzKnCKvMOwU9rUozhCLJdQi0FjluKI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+LXmflmNiI0OGAOrWr2Sl2AvPSJbLMX0LC0Jm41F9RxRLFDE4
	WH9r+Y2yKuCh4H+nPXsZmuFX8P35SKxku4Pu8e4QpvfXRX+ziRa1f7k0
X-Gm-Gg: ASbGncuhe5EWTejWmwiXQt1sHaCA91QQXxHHqAg3m9XqsfOcnjXQaamj9IRppoENGto
	54aGj4EaKGam+ByiU91/xwwyq2tVdZblcSfzu11iejgnnjQwYhzxZxKr9PtXpiYApcRrOmgF178
	6T7iRRqD21wTxsMJvgemxeyIC2TTLEIuHTAlxYKGE1/uQEY3Ls7JCMrmy7V/lxxphqjUi7moXLP
	W/OfoCyxLqVcjF3B3/XsEmtAKlOc0wcdJz0IRQZ825lpBKRjZrQolgQ9/2vJmjJSkEZHNFt5oLf
	EMHcA09ApXYwmLC9C6tX1C/eT9INaEHLZdJrJmcWDqTDEFHoDEIhg9mkhxfOeEi8sdU+TGWvl0U
	8gqru+b+FcljRVXbEKznNfOKH7PAGsaPFVZOyA2FYLXcrbQLjpo+sa3dvqutHbZWR+Hb+vA==
X-Google-Smtp-Source: AGHT+IHbKKwv3Cd14fMbRlzVZpxoDoNXbiyghddISZDjVQeIjBR6wf7cZ5tNAwGCF94LJdZf6RcGDg==
X-Received: by 2002:a05:6512:3f14:b0:594:27fb:e7f5 with SMTP id 2adb3069b0e04-597d3feb5f1mr1891895e87.42.1764834919370;
        Wed, 03 Dec 2025 23:55:19 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:18 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Subject: [PATCH v5 0/4] EDITME: RISC-V: re-enable gcc + rust builds
Date: Thu, 04 Dec 2025 08:54:50 +0100
Message-Id: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEo+MWkC/x3MTQqAIBBA4avIrBvwJzddJVqIjjYbCy0JwrsnL
 b/Fey9UKkwVFvFCocaVjzxgJwF+dzkRchgGLbVVWs6YvMdy1wubReeip0BGkTMwirNQ5Oe/rVv
 vH4A+U+BdAAAA
X-Change-ID: 20251204-gcc-rust-v5-aafcede31ea3
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

Previous v4 patch:
https://lore.kernel.org/rust-for-linux/20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com/T/#t

Compared to v4, this v5:
- Placed `include Makefile.rust` under `ifdef need-compiler` branch. From my local testing, this did not cause any issues.
- The Kconfig function now only tests backend flags and has been renamed to `bindgen-option`, without depending on environment variable. Added a comment explaining the meaning of "backend".
- Improved the wording of commit messages and provided further details.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
Asuna Yang (4):
      rust: export BINDGEN_TARGET from a separate Makefile
      rust: generate a fatal error if BINDGEN_TARGET is undefined
      rust: add a Kconfig function to test for support of bindgen options
      RISC-V: handle extension configs for bindgen, re-enable gcc + rust builds

 Documentation/rust/arch-support.rst |  2 +-
 Makefile                            |  3 ++-
 arch/riscv/Kconfig                  | 35 ++++++++++++++++++++++++++++++++++-
 rust/Makefile                       | 11 ++---------
 scripts/Kconfig.include             |  5 +++++
 scripts/Makefile.rust               | 14 ++++++++++++++
 6 files changed, 58 insertions(+), 12 deletions(-)
---
base-commit: 559e608c46553c107dbba19dae0854af7b219400
change-id: 20251204-gcc-rust-v5-aafcede31ea3

Best regards,
-- 
Asuna Yang <SpriteOvO@gmail.com>

