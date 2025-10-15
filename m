Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0105338F28
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 18:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760552068; cv=none; b=gNNjKRr3Z/ZP8z3O45wNXNdwd0mKYhgd7dYlRLME7h6Ejvi7Jw1tj3KL6vGH8t0V4fwmHDC8wzxwpIuZKmqp15r/gwIXUpXk+o7l4UV0qy+ijkpFsHHbLynnSWrStwqX3Z4m7GFFyo5dXMYAQ6Gic+FdaqaQ0VH7n/9neduqdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760552068; c=relaxed/simple;
	bh=wP5UX7zWs0Sv1DUPgXKgMTygpamqW2/FxBkyaeLpPmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ujhh8gcJIEMfJZhiso/01HMiSVxHrCJSZw6dagni6mwWL/szg3OGAbZL2EiirZ/cG/nf014u3fr2zHYJLEtAm6UAhN0Q9lkd+mPe5AbA9gViyevQ6y3EUeINCYEAxRxVLAIDKL6VAESC2JhQCK/rsVBAovhXKx4YXdGsCEmXxqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=N6GdJLk+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="N6GdJLk+"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29091d29fc8so3020145ad.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 11:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552065; x=1761156865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tg1KhEMZfMefo+THEb4ueoLXzfJu3WY6LEuxXprwk8=;
        b=N6GdJLk+J7nbk2G2CeAp3gSTDE30HTW52rRb2yNSnfwuI9IvLXrhRJLgg3r9cC0eVT
         9u4zH4/XVOhXM5VbeebL96pYT9SNfEuM6tJ/h2rh1Wi1zs2jbVpFcZNkDAV0GRW07fBp
         IkYi1gSnziecLzIYw3X6Y4er6mUzAe2hCTCsu3IuQSPmCtQ0bVlWy73Zp197cgK4FMFO
         jcdptpHNcdNvly5vguVLoXcc6DG86TSEdz/XPuZyA5PF322IwbwK7+PdO5Ob5KxexGbt
         8U9N3atmVzGfIFZ5H2592DlpMCMtE2ry2EloD4yWAK2iJRbe0VcAMxALi+xIclzHNv2x
         B7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552065; x=1761156865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tg1KhEMZfMefo+THEb4ueoLXzfJu3WY6LEuxXprwk8=;
        b=v/hHiM33jBa0gBdw/KFB1yCk4VnmLSP7Zcw4M5oUPs/3qbcoI6G0NUCkmZOHUehCH6
         qq8OI5hae0EmK16ZvFrGXnqwrQYYF169qugyLC+SaKSl1pRe2r1np6OtOFDJHg1w67Zg
         F1vy5IF0RInlOxyU1yfHjkmkN4UxRIDFNqUA6h5a4g8+dtrVVpBmvWStFL+6LWpfZcmO
         Ub7qZIuknf0+D38d7lVbCLjmUu2HiGMh6hWOtoGqHalfCW3sg9VDjW8PjYM04yHSEKks
         RSfWipRVfEeaqO5/DTLTkTqnQrhqq5hkeFk6X5S+RVUk9BWBIWJwsrVnFkzyCXtq9KcJ
         LZkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTFt5FAKC58Pr3fpHHFs/5RsPeQoe1Iq8RYfX893fB+3B+cEm/y79gTvxDgEgLW67S1noLksCtSNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJcPYDWKvy7u3fXJWfGof0RhkNqG3vyYQyaapo7hH0tE/g+dgx
	VZaxnHXROC4N4zLgVz8yDVEz1TlbWsv2vCTIXV2Hnn6YHpVyHlqJ21ln3We3HpWif+Y=
X-Gm-Gg: ASbGncuZmFLH4hQTiq7NWTTJkwTCHGI0kGkmCFN6o5xYkL+fyz2eRh7z8KPTXnmEZV3
	VapNZsfT6VlG/GuwRr6sGWhpewOF9tKGgORWut+KKYEsqb+CmLpPsW2CBUxXPmbKd2DpP56UC9r
	COHfrH5Jxz2gCg5qEgKYTo7nHnY0TE6owInBpHyaVQcNt36obKmv0oQRakRW/N341mnkFiiJUoS
	ubZehfSBwITz/0nBUoAmgSyAoPINHokfUH8opTGD7xs5Py7bRbBAN8Fspc/NS8q2fRtWOnEKeZl
	0omuLvQJtXqW7wVp4koXlSgeqPITeRR8AiYzyo+F4b/Jp6zFB5f6BsrfrC/Q+WUBrAU6Cz1ooWN
	3f02HjUsSdshqGpQK2Z5Rhl3vLEcRd9VqNwW80sLY1LZ6YO2UKfo=
X-Google-Smtp-Source: AGHT+IFJldQrTahc3Q8sVNu0r3ng0kmfHptGVJgLteMAPNepRvaTO19nK3n/je32vdUKI1tH6x0IYQ==
X-Received: by 2002:a17:903:2f84:b0:28c:834f:d855 with SMTP id d9443c01a7336-290272667bcmr408470055ad.27.1760552064765;
        Wed, 15 Oct 2025 11:14:24 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:14:24 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:50 -0700
Subject: [PATCH v21 18/28] riscv/kernel: update __show_regs to print shadow
 stack register
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-v5_user_cfi_series-v21-18-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 49f527e3acfd..aacb23978f93 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -93,8 +93,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);

-- 
2.43.0

