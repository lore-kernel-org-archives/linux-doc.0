Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980622D4E0
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741619661; cv=none; b=mCPIsCXghgWzRmWFgmf8yBU49T3GWgJDBTmsBwvXDU0MdsISkEpsewIOLpSH5v5ybgiz5sXvA+2zTMVGpw7LM2+Msc9FcYuPQoGniyXErZn5SHJ1leT/MCC7ScYEc/n86evdCg6sCXPJynvHU6a5/UJM8mgCANOKqJpl32zhpKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741619661; c=relaxed/simple;
	bh=bnTO4F0S5ychW6vkQ40467dj4QMVwl+AJTO7Dfj0Lpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qeIOwdNcPgDYGmhko04SbUegVbtzZUGTRc19KMgvlExdUO2y8f9y55eYfvaLk8xd0fe3Sgr9mL/e0bvRGJ39Q+CThbuNgExuzIa6LmdXTeLdJU20RAlp/SHqAfjiM2orKwrlJ4U2dsjIfEUmXP17f2BA4tVeBiydRofUdO5F7Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=StQ4A8O7; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="StQ4A8O7"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2239c066347so74904205ad.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 08:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619659; x=1742224459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ne6qRsQBgMn6Z9TbFB4C5/y3IwlTc1J69dL1IhT4E0=;
        b=StQ4A8O7p0CPx+UAaJH0+xUioxoW+RgH2cW8at9e9HEloGqUVkyAM4Uc3YL2IkIntD
         QL6W7qIs5r9bw4HHkxomN/eFr8J5bckein20oGKhPB98HE/solr3P6lgkmrDjYNmCm4t
         QaR+CJfrfQ2KFOoXsaJ9jiuYol7ya0n+XdyFeBqV5tNmlIEjXIge4Wrz6vKC3zuKoHpz
         c4kbFW4POqOGewfVODs43qg/1pVqvYIReT6fAcHJUfvrS8rB7jF24xQaVA73G7JTcuMo
         lm11HfPvIOt0nuip7hRYlJGh4l7cSSwnvvJcd/c4UPEfNe/wbOkLXR74l+1C+3Hj/QUN
         0hSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619659; x=1742224459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ne6qRsQBgMn6Z9TbFB4C5/y3IwlTc1J69dL1IhT4E0=;
        b=dt82j8L9XuG8Nt1KQwnCDctM5JjlIivZY3yqCtNyKPUN8fpWaiLWCrKavOnpYPxvdL
         LKWvin428eG6euvrHbfoxNBDAIynRw0YDnbrB2W3Nr42evCnhK7DJoc2KOIBnbqcWp3O
         4kyg7HkAIhVpVCdRe9Y+a2t0V/YLn/tEk5Sn8IO6o0GWbpxpO/oW25Au2CKsrF8vQX0E
         SpZcm5nb6Jyp5bhFp8VjUGj9+5nf/26GH+JvRU6TfEr5xI3t+kxxJkwEwoLfPu0GDHWU
         dMN0nX2qZU4TGUktceuoBCEcbZT13kQWvkn2hvLRJHXeIgrC+tkAwxe4phRK5XCqyucZ
         EoQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvtZyf6kmlMwdXAXGvzxelN0SWRgFZDVz5WjaRt7iN7thVw2rSgvbQKZWYTlf95NZgJ4HMtmuXoEc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt6W+KuIZ/8knev8RNzZQPX5r/WvX/N2HGsWe1ZzGm5Fxarq/x
	ilnRhPrwIObYeST9Lazeg+ZJJF77Fv+JC5zKxzXcJ0hOvxqTLFrfnrqQH5UOd9s=
X-Gm-Gg: ASbGncsfeZcUKew5OTw6Q5vMBhmP4USAXblzsCJX9TOv+KmWE2PAp6nn1+7rlno0n+n
	69FgRE2kPXS8etH+WFK6vy+UauoDom0DndI9GT2nESqISra9Q6H21blALtMaK5pIUe+scKMPbBe
	VG5WHIh4wuTQTXQPicKO8UYHCjqekW13tRIOt/1vPL6IV0mxdPdCqVTu4zMekbS16iYBGLhQ7Gg
	cvvIszCGEZw1fJJ1v5mmU/6A5VBxp7qI9DcI7xwbz1XOiLgXHPC7l5OfpjS7sg8lGbGn7YjvLyX
	wD0gMwHl1r7KhaJDTmeX251Sq6361dj7vrv3qBFXFhdzdQ==
X-Google-Smtp-Source: AGHT+IHou97UuMHPx2aRC5ipTZybHeRQW/gREfJF/XOKkR7oov9xPoqimKZKRudGRu1JoJNuk3RSLQ==
X-Received: by 2002:a17:903:2405:b0:220:fe51:1aab with SMTP id d9443c01a7336-22428c05613mr273654235ad.38.1741619659507;
        Mon, 10 Mar 2025 08:14:19 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:14:18 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 11/17] riscv: misaligned: use get_user() instead of __get_user()
Date: Mon, 10 Mar 2025 16:12:18 +0100
Message-ID: <20250310151229.2365992-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we can safely handle user memory accesses while in the
misaligned access handlers, use get_user() instead of __get_user() to
have user memory access checks.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps_misaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index a67a6e709a06..44b9348c80d4 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -269,7 +269,7 @@ static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
 	int __ret;					\
 							\
 	if (user_mode(regs)) {				\
-		__ret = __get_user(insn, (type __user *) insn_addr); \
+		__ret = get_user(insn, (type __user *) insn_addr); \
 	} else {					\
 		insn = *(type *)insn_addr;		\
 		__ret = 0;				\
-- 
2.47.2

