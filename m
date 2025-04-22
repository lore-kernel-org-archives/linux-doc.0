Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01217293B6D
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 16:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339058; cv=none; b=StA2Di/II5WKnNyjJ52rBGXBcbBH/VVso//phFdnjINQ/8EqO4fSC2BO6oewhmhnVlgZ3JqbmPNw7h8G7g8bMDXBXxqXfEewdxkOplQuE5UuZJrnosqnkGGTeO8iNnYpv/GgH4w3gxwR7KGMNFXzogQKWImdOBobqPbx69nm0Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339058; c=relaxed/simple;
	bh=1SwPGQZnvxHgzAriM+OX/+KD6D61uAEZmkyHnr7YLVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IJD9yid8L+7245h0NU3EEHXcB+q9es6XNMXmtenI5V2a2Rh2voyf4Xw2DfXMPHnGSJX2xJTnmI9ucoPOHoU1113ol2pVneallNA/RdDnAAZe7NYPMmK+u0nFFB0hGFetE/YXAzecWdTwTd/CxyEzcdeO76RLFSRKCUXpZ0eG6Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Z91MF5N5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Z91MF5N5"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736b350a22cso4373063b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745339055; x=1745943855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1WNhT7IxU5Eh/j55bJL3pNAqccf1l3Drk5qswQXMsw=;
        b=Z91MF5N5qnwNn4PTnURdJ3rXSMcQaoFNkSGb4AukfRhgTHVpyh6Lk2W1Dz2tDIbFzp
         OX+Y2gLGGpwLt2hcNOfik/zhb8Yr/SApgujMrwbpNgPJmuP4qunEu1dmi38CKxrFu1sg
         jOeYXdQMEs9SYUHVVcwyViF/Dhrvycr/e8AqaEYWSFhzl/oNXtdv/bjREqtrY7d7oPAb
         qHBuyv4+Hvkj6n0ct/Ecy5NWPOvdqTmEqyfYe6GETUvqmVuvoXWpLXEkQ0v355YSWvD2
         kOwOVyONvnf784zweqWMmk4uxrxhuFqEfhPvnWcJK3/oKuVO+rhtUP6URdZM6k+SyGvE
         utdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339055; x=1745943855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1WNhT7IxU5Eh/j55bJL3pNAqccf1l3Drk5qswQXMsw=;
        b=L0qozQyQrBkKWYhPEAzeqJPTdRn2jQxPQxkZN5N7tT0M2JBnd1bKKSAu4Y72txF5Xu
         spBklEAD55vQMYLxP26qe4GWDQW+LB07f+jPwzoP5pYv5c3fL+JWxx+AdosHwOaVK+p+
         kjHXBnXp8vFPSUcaKbKTnVoEdTZLmecydiPwfSFRyHXGdJAUoAohdU4HQwDhdpCUY1yM
         wCuhjz093nsN3bqR5rqg0ID1iOGw6AizphY9S1x/YbKYvwEgf0FE0a0O7EK2C2euY4YS
         ZF9RCtNV3X6sdhI23pJ6cDfbmdCbrk+kRq4vbtrgwcIpWUEWfkuX+A8QHz8ohe42uIlj
         uJSw==
X-Gm-Message-State: AOJu0Yxv7K7HQ4cl9BpW1T9vDz7GBEJmsjTHfe/qDyKs7dCTLl9Lg5EU
	4tOu+aOKIsPLNWWqwVdpEnj4mRvZjhX+MGAenFf4Tq0l46q6uwo5J0rh6/fwySFpcdSn+H3RwbZ
	DQsk=
X-Gm-Gg: ASbGncuSVwMucfaYKdmeYLdMP8MXPIzYjjvJGwpVFjwb0dYYjVZqZWraKij5oJqhUZo
	Tr5sBcYen+F/NyXPLK5myJNeCw5HC4P/rw+AUFP0CkV4rJC7uFEjq0BWkCExYQ7gpQS1I+dqGSY
	ZYm/2g7fLAhfDp5bKHnuA0BJF06pqSM5WT8NZxFrepDBPBN9ic20ms26GoYrHC353pM0kjYYudO
	x6bPeZuF6uxFglXOseoOFjfUIBiMWTLlN2otKkzYJe5XkKtPZN6f0i+3B4StGA7bgDBE0eb4EVm
	K+/xfudbhGEK/wznHVFx2qjOjv/vNBkLqQIDpGydJAuJdn3BnysC
X-Google-Smtp-Source: AGHT+IH4yOfP0IqJKdZ6mYEYPFLQ595Vgf0k+QWsP9/Syy4+PU0hfb7Rc2GCNPIAlZUfc78JP644pQ==
X-Received: by 2002:a05:6a00:3911:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-73dc145740amr23785110b3a.3.1745339054816;
        Tue, 22 Apr 2025 09:24:14 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e13e1sm8850825b3a.46.2025.04.22.09.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:24:14 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 3/5] riscv: misaligned: use get_user() instead of __get_user()
Date: Tue, 22 Apr 2025 18:23:10 +0200
Message-ID: <20250422162324.956065-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422162324.956065-1-cleger@rivosinc.com>
References: <20250422162324.956065-1-cleger@rivosinc.com>
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/traps_misaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 4354c87c0376..97c674d7d34f 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -268,7 +268,7 @@ static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
 	int __ret;					\
 							\
 	if (user_mode(regs)) {				\
-		__ret = __get_user(insn, (type __user *) insn_addr); \
+		__ret = get_user(insn, (type __user *) insn_addr); \
 	} else {					\
 		insn = *(type *)insn_addr;		\
 		__ret = 0;				\
-- 
2.49.0

