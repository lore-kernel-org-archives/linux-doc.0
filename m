Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E563F2BE7BA
	for <linux-doc@vger.kernel.org>; Mon, 14 Apr 2025 12:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634160; cv=none; b=UlhgQkIDTVA7y6W32xWBikpGgGbDt75lTiS0jLX5xoqRHBzsi9man++945feocY6UAnEDkLylXzec9adaaMqm0KCFoNKoav8bSwzmyS3mLdRRfdayBncSAAXAXNqQ7Uh8nUNcIZtDckgudOwZBWjgq3RL1/R9wzAETIdD46ARc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634160; c=relaxed/simple;
	bh=uE/sTnOURFYBjUxUXNJbjUtsh/EN4ig5lh4+0R1IcfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ek2DTtPsEgaMn/h6/bNbWqfaLTTWPczUMbk/6AMAaCC4twiodeGKSTWJsqfZsgRoQC4d75GLoZM2b43r51KMeb9sCZ9UUbKgRRdm12ihyFUwiWRxyhmCw++6M151UT1ZLhFu2gpwjRXHGNpEtVc9IFI0iPdLHyMRp+IK3Y7NvIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=z4X6OvGU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="z4X6OvGU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so36485805e9.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Apr 2025 05:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744634157; x=1745238957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlJaR0rGQ7lkkTNY4tt/hV6uETrC0h2zoS/Msh9pgDk=;
        b=z4X6OvGUdN1cUflf6/Cn8Gv+xMdMma0fXjBuK+FUWi3F8arvmHSjcPGLay8D41N1cu
         /AIezttiM55vD9QwRFdoUUpOaVQBLWGYA+GrloTCLFQFitO80uoL7DEZHbi0CZRP+tYY
         5SELWDswpYMhUm2g5wHtYc0fLlCE8WX14As0H1iA5S3rI7E+jT5ZVr3oCod2O22OA7AH
         Pk9sIsSPkWVkTt93dkiRjAYarXGbXUQrr0t7z8wAprSazdHcIDLFZofonLiXNHVpWABM
         /e8nTKnwlGF6xwIWDoKoE7aKnov26Nfabf/rNhpUiARtscsPx1pvu3Xhjd3JCuU8y+CJ
         g0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634157; x=1745238957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlJaR0rGQ7lkkTNY4tt/hV6uETrC0h2zoS/Msh9pgDk=;
        b=Fj2OgLJFRh2+LFmXPjCxb0jlQQKoqKd1aD1/VrzNENV0c355PttWWdQc4S4e5575Zq
         tOAx0k4vD4B/K27OYBLoPZcxqCJzThrJxV+F1+StlMcnS1hY6GAriEPPHQHZWjrR6o02
         8WCqBg0fONySwtugiJ9SP+V2NPwkMx0RCXnOKGIrhrvjygmGC5h2ryo3XjW97QsFLoHo
         2rucBp0kqkHMeRiq5OIZi8YUNO+/+Q6FdI4aBSK6/sHOqxIn4hC+lVjTf6f7tw4n94im
         pzJQK+DLUix5oME0qe/VW0z68lsOBGFp4i1NS5KYAR/r2JHTtN49cFcvdmbAZtZ9U+7y
         R/TQ==
X-Gm-Message-State: AOJu0YwM68rGA6/F76iI35z8EALMgXMYSK7sBBADjDv0Zrbgbf45LcLg
	7qM/k++7TlgsbFXYHr3Lf+zKVHjaC7XMHmip88/jvtbzBKAWfiTr/Xd0R47gtUJEaxD9uuOU+c6
	T
X-Gm-Gg: ASbGncuwUo6SqkyD9EXwzNsjF80O5sNJdmWIga9p8BTbjpGcDNf4Px1v9NWv8dPIJqE
	eQwRPomu05OHYZK825MWCAwEM1Ak/sBj8ga4C6S7mlgHc2bQReOUmyWOoe58+c/hGhLfsMSLRQ4
	S2jUSIg89dcZVjc2wBvQ3qbhz6poHVtRg/GFI5vt2Ace3kD5NglhYKZdI2uztVFExileJFV/kq5
	klBP1wfBYts+fT5plHDSkiNXnXa6UoDjhIdZ2eUjREQ/RvWDzz3cOk8lx9kNzi3i7EadIoIxw/e
	ECJaJMC5zTNNj5ypVpr3Mp2v/WAox5yCDmgAmq1QWg==
X-Google-Smtp-Source: AGHT+IHgz33xrXrH2J/Kburuf5TLKxLzowtKebRllfEO38l1vRVBBETy1O1EuzOqnIGPlOtR1iyBng==
X-Received: by 2002:a05:600c:450a:b0:43b:ca8c:fca3 with SMTP id 5b1f17b1804b1-43f396e001dmr101919085e9.11.1744634156654;
        Mon, 14 Apr 2025 05:35:56 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9780a0sm11003166f8f.50.2025.04.14.05.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:35:55 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 3/5] riscv: misaligned: use get_user() instead of __get_user()
Date: Mon, 14 Apr 2025 14:34:43 +0200
Message-ID: <20250414123543.1615478-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414123543.1615478-1-cleger@rivosinc.com>
References: <20250414123543.1615478-1-cleger@rivosinc.com>
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

