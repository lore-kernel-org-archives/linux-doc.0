Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF47F25332B
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 21:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223378; cv=none; b=cvMQkrYx0rlP/Em8JVgqwFhfAOx/IhbxduD69mFkORJ+R1k2I8GHnL5c+BbVO/iLyuKtG8tJOI/5urrxm276Zg8+Rfb27rfAHzKCEjLmkTSPQa2Xs3GXW5xePN2X9kifgpJrCR39Uezcgid6UKcS9f/ca5+ZVq3NGt7au/xkI+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223378; c=relaxed/simple;
	bh=o8LicozigsBJPUxfw0UjH/+haPfd2EDEodthfJ8bhLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jgd260PRAOK4hra+NqY0TcVncIUBGRZBBAFn6ownsnQ6WDZmaWnObDoTxhw89kPSPtSDJFFVr/vquw6eiPsVetO3dXdvJP0zNGRL3OEj3ndwI+FJEp0jevqGsDMzK0SHVz9CjxS9vf4CiD235KbqqWtRaxmx3U8unyil3nignvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ITFlHvtE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ITFlHvtE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dcae0d6dcso2011921f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 13:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223374; x=1739828174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=ITFlHvtE9yI34d5cje450muBPt/uRI0f9R13H4R0RygM0vIL/8Xr2ysMO8unqgYTbL
         ilwAb+1ia1vprAdNB+fNCPkd5qonAVLvZVCX2Br8Fm4V+SoAaOpCsh54e72jSUdPHbes
         01iBiW6k0H/dIX1t0423EJjcZY8OqljAgf5P50pxRi+df2jBcTN5l55YapSlJ/eQfrld
         fpZsQO4LG/uT2O9nulvkbEDsd/2M9frh9SU3Zle1aI5iz4CEWzdSQMHonhxzL8z1n+SK
         pVAJHfF2Sc3cPaED4zc52foMO+cuFm7Jt9yDbI7D0QtcjgwQcWUtftPkuVEJ828wWWuh
         gHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223374; x=1739828174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=TUT06lMEzYXcfypBXtMidVDrFM+uFZtHSaNAIj0KK9N80p4xefugEssA0Pqfo8Odt4
         43dtHeP+gMSF+gpRUNU768weBQ4ohae4ER8Sfob1tGeD4O1bg9guXUxm3hzAXVb9ikDx
         Ho0nvpPYCX5z0JNZg6z7fzgiBF00BV4To53idbRBXYcpQT3AutyxaiAxfxjbkOyw+aDm
         Fxp4BtyJl8pZvDf4rPy7XzGBbSlBXVa8qlOBAwJfUOEE/gxWWxJYlLdSbRHHsY8JaLKl
         Gz3utPA6VUC5YNKamR1Ss5AWEquyIafzMWQzCEl9i78SgsqLNccWWeQVQGTSCDk7rpDi
         /HhA==
X-Forwarded-Encrypted: i=1; AJvYcCWp8WLaBi9iYkZth/tGpzuZutQ5Aeb30l/67I1cBcMYxPFqWAbhc7x59CXA7inz6CRe35PI8D5KAJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUonvvh7EtRoZcNHkxu6MuMSaIBKXdDDCu1SqlS0KagGbt0e2v
	S/tVGYGDdh4xHL0g1saomq5vnD3XQVl6smL85WSCX8IZXz7ZcJgWkVXJx0bRXUg=
X-Gm-Gg: ASbGnctAJihtkyIYOVSyjyMlo0pW0h21F7KvurbKLIXpTFuVi4R64rEDS07P+jyzm9P
	FNUyODpUDrX5WVIX9dNM9w/tRcDlCVWBICi6fU7unVv7onh8v3uIX+FQcxtz3KfixhaYOSLfN5I
	BnpwBV9kruMAxUAJUG/cK1+9HEdAVv88P8UQVDhBiV4wmQgMb44hYd9pzGLnRQ8B8InShsemx0v
	9F1Y0je++4z/sXSEwlNxwpsxi++idMYIuomffAyzIB9W5PekaSuq4yn6hLnphnDk38KLxJ7CeOS
	z02fiMo0A8W+WqpE
X-Google-Smtp-Source: AGHT+IFeyF81bBn0bup3UjkgQ031iOdpi9/jVXiALJpdAtVQDgUVud0mvsDq+oa8j9/bPhnXjupeow==
X-Received: by 2002:a5d:5552:0:b0:38d:c2d7:b5a1 with SMTP id ffacd0b85a97d-38dc8dddd9amr9308427f8f.19.1739223374260;
        Mon, 10 Feb 2025 13:36:14 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:13 -0800 (PST)
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
Subject: [PATCH v2 08/15] riscv: misaligned: enable IRQs while handling misaligned accesses
Date: Mon, 10 Feb 2025 22:35:41 +0100
Message-ID: <20250210213549.1867704-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
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
2.47.2

