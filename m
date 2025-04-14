Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4DE265609
	for <linux-doc@vger.kernel.org>; Mon, 14 Apr 2025 12:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634159; cv=none; b=EwFkBQM82F8hUWYgImbJl8UyJdm5c34BbDiY3xGWmfyDifJ/cL0ys0hW4KvHLgBCnVQx93fA2+oNHH2RQ6dhcyT8lAuWV08qOkqBFkatJb/ly1KqtQzKZ4aLKnZpMWmi4N6CCROA33PUtHBJQZQJJIJ9MSCQGqVvFIBfrBOqCnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634159; c=relaxed/simple;
	bh=Sp08vMMklIHnRXWMXpzERONvQrNfVAASIS5bX53L948=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b4U65pFG5/xtkM/JsqtxRSkqVSlxbSS3V3JY9vRr1Ub7c1clTC0hZb8NTklXQTST+UPJo5F74KMj9DP8gcFxo/TbOShGa+3MYb3eKPcgfFKnyRePaSGR1WUagN1Ouopeji/umOmljWLHYOFxfXPl/mp4xg3+0XZiXuzxNH+sJ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=FzZt6HVT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="FzZt6HVT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so36029805e9.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Apr 2025 05:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744634156; x=1745238956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zt8QGDo/J4nI2rhGhXp0zTShJlIWRjHlpTKLd9eSTsQ=;
        b=FzZt6HVTFVHmqOkKFUzAtgCfzHisltnKBQ3oyK+RvCjQ3tT+iRmAMpTESsgti0x+FH
         FKKoI/Ng/MCpQpNrqTqA7Pg9atMN84VW4qfu+jIZ9civ0PAZH6FgFt9PPD1NeqbesIa8
         hRI3L1HAuiMD5n/SKLeWv5dqkG3Hs9FsWTIPQVVKzyKzstoH+3aN0k7CyETqxu4VG/h3
         02JkM1AFVgfjHAW8rX3VtIXICQcSDMCEWq1cz+mAZtWAaJ42Tb0tZjvRDDdR58yPjdYy
         WL3Gc7NWO2HuAlY+Y2PKb4WXKCLPI1lazlMv5okMP+EZMnDZWrlwTKBNVMmls6TP35HZ
         BkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634156; x=1745238956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zt8QGDo/J4nI2rhGhXp0zTShJlIWRjHlpTKLd9eSTsQ=;
        b=u/EPr1b6ZJSAdj2mhdoNaSc19XQR+aqvBzHHevepJENxxtvUreGRy7DvO/+mTY9GiU
         rHQKkMBt5K7cJDp1OBZYwCImL1TyEdWy/xpz8UaruZbM5K97rBbdbsu3JRg1X7IEP0Jz
         3vRtqUSWb1v9nwAirntrZ9dtbQuHgG3JBcihCXXSTtGz9V56K2WGWfTObE1mJAlh5hzV
         WstqVwvsC0ClU3mCNCIAONy766fBZh6zGo4yYpoCdei4MIDIOL9y4HM6zWVdVBT/I4uT
         I9B9NTdZWqWbu/CHxVykpVV1/ZMcFLP/GHi7rCZmmzwgQgJCb/yJEN65sEgbU6fJAwmI
         0pdw==
X-Gm-Message-State: AOJu0YyvC6VCb/fWvhZVswgmsESu6zkSlIa/NQBav6eSgYkG+RKDRUga
	FcqvmbZtqeKaV+KN1oMRxmI84pt1EP4oG86l7slL038VYSY3xqTq4cEeVAN+iEZsa4jv4OEY066
	n
X-Gm-Gg: ASbGnctti4Z4hW4VCYs9IshhZxR1POpmDcEJkCkFiT+gG7sK+H0bqS6t7SijPu7kT97
	xvBVOIz6sQk8S1L4SPuGysslUhGx83Qu9PQgRoLul4ntF6VfGjjSHkJrKQs85Jm4XX/zZYfo87R
	HlAisZhBvQEz1wcqX5WcSNN90ZX/wYsfFUTa5d5YGYQrorHOfTfsC+WvhjSebIDOJ8uFDdjPfhQ
	JblUvgdNeJOzmkRpfeRQsnShG7MJHpziZ1AfpqdHScGEK9xfUryskNLUXr7VahH631qhz8qyBft
	kXZFvSdDPyUF0zRS8OknvQsovO3Vzz3pp27zjyMQSg==
X-Google-Smtp-Source: AGHT+IGzY8okLdys0tOKhwvB5BGgGvxVyHB5y3oW1MGsgoMkAqQECk7mk6Y/4ZzNlCEdPu9BMIDa/w==
X-Received: by 2002:a05:6000:40dd:b0:391:13ef:1b1b with SMTP id ffacd0b85a97d-39eaaea8457mr8319959f8f.30.1744634155589;
        Mon, 14 Apr 2025 05:35:55 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9780a0sm11003166f8f.50.2025.04.14.05.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:35:54 -0700 (PDT)
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
Subject: [PATCH 2/5] riscv: misaligned: enable IRQs while handling misaligned accesses
Date: Mon, 14 Apr 2025 14:34:42 +0200
Message-ID: <20250414123543.1615478-3-cleger@rivosinc.com>
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

We can safely reenable IRQs if they were enabled in the previous
context. This allows to access user memory that could potentially
trigger a page fault.

Fixes: b686ecdeacf6 ("riscv: misaligned: Restrict user access to kernel memory")
Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 55d9f3450398..3eecc2addc41 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -206,6 +206,11 @@ enum misaligned_access_type {
 static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type type)
 {
 	irqentry_state_t state = irqentry_enter(regs);
+	bool enable_irqs = !regs_irqs_disabled(regs);
+
+	/* Enable interrupts if they were enabled in the interrupted context. */
+	if (enable_irqs)
+		local_irq_enable();
 
 	if (type ==  MISALIGNED_LOAD) {
 		if (handle_misaligned_load(regs))
@@ -217,6 +222,9 @@ static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type
 				      "Oops - store (or AMO) address misaligned");
 	}
 
+	if (enable_irqs)
+		local_irq_disable();
+
 	irqentry_exit(regs, state);
 }
 
-- 
2.49.0

