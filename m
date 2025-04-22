Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FE4293B57
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339049; cv=none; b=YmT3WxiV2psdUeBC0DpihYHjGYHL5U6IGhXwlGF49Oq4mOYgRW9UmxjsVzXiLQdzcgUXBUyMUa320TwugU6Uhru/3MuaeSWTxxmF4vHONKWpKs5fKWJSgQZ9mF9gWqFXosUTG/x6i+Wjd+OfTj12y8i2+28uRCzUWhwAOgrKs9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339049; c=relaxed/simple;
	bh=3c04UkOrUox/J2FZTkrec1ceD/ayEJGwE5Hr0AcuBg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6gUBN30RI8U+bd0NvJ+iNTYZ3tzyWhl1pRlp+HFgKPdd3+D8ZoFaHUALZ7Ib4q8/UwGRn2UeWs95gES44G/xFoNsa1eYrak/pIlE/BHeXkhRMvfBI9ziGn5cwnyDyoJBPMaEM14x8ISEo08S92O4C3JDwONHVi7Fy5lpXg9UvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=b5tYUKJZ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="b5tYUKJZ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7399838db7fso43560b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745339046; x=1745943846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCsItzx1CW8cAI7eK80VGXHXyDDk8PWaNf7CXRhWciY=;
        b=b5tYUKJZW+Q+l8NimwxxdYqUK1a+y7fImJBjdhs1yiiVfMkZ/QhQ5kfBj+pUABfNGV
         9wQ4hRDc9b2MBOGcTkqeE+rAwQSD9DeWtWg/YFrbDJ7fBz/X/PqOlS2R9WMajqGmp1gd
         7SScYOVJndZv55id4twCSVqOJl093XQVDrXRqz8znaejBBZCE6sXhCEHulIoS5zJO/Uv
         83uO79OFdsVc6nzQ7pu+YcNBswNWY+MsIWfOvuiJgaeftlT9YpjEASLDahOjBqTYPhO+
         F5j1BlBsqpnyMOw2FNyG84amjSs8YVQBzPy5zFzkPVLUQiF/Hbhj+8wstHjskNhdllUV
         P0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339046; x=1745943846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCsItzx1CW8cAI7eK80VGXHXyDDk8PWaNf7CXRhWciY=;
        b=ql/uTg0k2rIvkNUjEJM0NAH8v1kpdf5ysp3KB3BmbSdS04Hrf3rVlTggmoUUGkd0tf
         a0Bg/7Gl3iIz/GJxTAjYZlEPtBBBD1aX2lbWz3r17BwcNXIttOJ1pCK0r2yENf6Q/qW2
         qrlbkJcMxybUdSO5Y1ds2upZXJKJqoS57b1esMY24SAPLl/gmvAVM9dvJCpDNNXqm0mY
         9VImsE5WFXP116XzR93WgSqjM8+9ErcZLeuUE+yY0vkPlsbsS0WT7ahqavFFbXiU68d0
         odNQaPqJNQblbC3vK7fRRpsUgD+Gf/z6mwgKDREBaq6fVxZw1EoK8Nk+ANQVIJkIHtIr
         w6bg==
X-Gm-Message-State: AOJu0YwlUHGiPan3FiksJbjFMn6NaEo5pNBhU3Yw0KKmt6fTzLHXz7UY
	yIfbJ8Y4bAfh/wrQjIuFYfWYi4wR5cceyBPgYg8XFmBDa8ZchqoYEMD1PFPXSqiIM9W9Ul0K6Av
	INpU=
X-Gm-Gg: ASbGnctjDlGBDcDgpCjL7MINgu87vNVbsag636ytl44cV6OO3MktLydjAZ91ik1VUdC
	duTkSz/ce0RbkqcMwDPSsP0cCqmJjAgBEsu0uUIx1OHdg83OgbCfrVJcQnZDysM2rKDtgzGHftU
	WvKDf187WkxTn9nBa8zQ4WzcWd2MopvvCCwSy5MUbNilUHcQUshT7Mt4eS+Jm7ZfALOrz9i/WxV
	Q8XQAporMu9z+kW9+skHV8cYkYGp3HEJSLoklpypToWSvXj2LivbZqQ/J23JpJCT7ui28m9THg3
	mX6VZzX914RzuL0XPaGwx3HkCbD1ifUw6gK5Ar9bEXgBvoTFIS4+
X-Google-Smtp-Source: AGHT+IGpp8Vb3J0UHalvNL44o+7PVRW8uyjzoX0zSKYSZndRHv6HkVGApSau1aMm3e/cFnTOOl9eew==
X-Received: by 2002:a05:6a00:6c92:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-73dbe638b2bmr27078656b3a.12.1745339046287;
        Tue, 22 Apr 2025 09:24:06 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e13e1sm8850825b3a.46.2025.04.22.09.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:24:05 -0700 (PDT)
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
Subject: [PATCH v2 2/5] riscv: misaligned: enable IRQs while handling misaligned accesses
Date: Tue, 22 Apr 2025 18:23:09 +0200
Message-ID: <20250422162324.956065-3-cleger@rivosinc.com>
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

We can safely reenable IRQs if coming from userspace. This allows to
access user memory that could potentially trigger a page fault.

Fixes: b686ecdeacf6 ("riscv: misaligned: Restrict user access to kernel memory")
Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index b1d991c78a23..9c83848797a7 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -220,19 +220,23 @@ static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type
 {
 	irqentry_state_t state;
 
-	if (user_mode(regs))
+	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
-	else
+		local_irq_enable();
+	} else {
 		state = irqentry_nmi_enter(regs);
+	}
 
 	if (misaligned_handler[type].handler(regs))
 		do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
 			      misaligned_handler[type].type_str);
 
-	if (user_mode(regs))
+	if (user_mode(regs)) {
+		local_irq_disable();
 		irqentry_exit_to_user_mode(regs);
-	else
+	} else {
 		irqentry_nmi_exit(regs, state);
+	}
 }
 
 asmlinkage __visible __trap_section void do_trap_load_misaligned(struct pt_regs *regs)
-- 
2.49.0

