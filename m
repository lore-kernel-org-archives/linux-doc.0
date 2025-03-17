Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4871F4706
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 17:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231302; cv=none; b=tCrnOXwwZCW1PNrAkt/lfNbtXce4DF9GwHx+7HyGlYusPTihhqFB5kGceZbgtqgPF3X2YqcLFZF1E8cbOGHygKbUfBZKeicOZCd5222YMS4HXm7zeuAKPX536hdB/ExhbhtQEEtHq7hAUJ6Ggj4GFH4vUkpIgU2O0t3ood24qnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231302; c=relaxed/simple;
	bh=o8LicozigsBJPUxfw0UjH/+haPfd2EDEodthfJ8bhLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Szll+JNIuqLaFFFjaHd5qazUeFzri8bIrW6xWhd4/3+b4qhUjszE4MnvyN5pl4ahll2azRqrTmSZJmlyBH5UbwGMgF1R2RljXPn6uYzRW08NNSTDfJ9c1WN9JnvptF2o3NFinxKwul7MEwkHj9gChCLypcUA57JktKPCDxa81Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=B6RaHu7w; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="B6RaHu7w"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso17326025e9.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 10:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231299; x=1742836099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=B6RaHu7w/vTAvs3i8oBRPcmJ8fCdI1+ASycCRjRmU/aXVuSytN2BuFIBoIc/VNDS5a
         NM94toxBLBIm/xJCFrkkhoiXwUpvIWUSb2+QdDFKNuxKKtVxkTcAGDRu8jO8QoM3x1Tj
         UgBIsidJk3qPU5H4UexAOs+t6ejR2FHSdgnPPqiZAHZ9zyFGESmhdYPzQVKSx4zDjoGn
         vxbI1J96zO5+8wdjI5Qpr6x3DnEQQoh2/vy3LjWzuvxVSJn6EVEXhJzwdTtD9C6XzQ3Y
         958QFE5CsO7gK5IobDmz9kvdgiUHGgDP2kOqv8+gMczVqY6NDEra89bHpU0q5sfomCoV
         XrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231299; x=1742836099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=ZMo0PQ+ifu8pE9uFGD2RxWGYwmhigQKajw0UZNfAZn5Jnuo6jHdHFlAQDlnNQIVT1Z
         SkO0FmWHPZtFpjv7Qh8uLLHlswns2AV5Utbjw7i8GVVGDsCf3MTuM8xR31jwf2v7nqau
         TPAiH1tXDvITMPQEcqan1DBC5bZ0JVKk3rVig6OG1srnS2LCg2eI8LAquOIShdQyTJYG
         LYL4b4letQTJYG2CXiXfK8AvU6aPkPP+PMeBPkx22lCvBqGo3Nd2tAyFDqP/Wrmqv7wS
         aseAPwkKwIOfElGJu8a5OHBxbUXV1HhFMImSwfI0St2IEnuZbdB9Uq1D0+dWYFaSs+B1
         cElQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcWB3tJPoBB0MqR5ey/+J8f2jmaS37/vzWij7M/dGUB9VHLhooG/O77JekSKTg4NSdq8KEYK8i28w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAojmDizI4NuB9Z0eNumP55qa05y2rUYZUI9vM0/xB+SBt0GhT
	j53G4ymj2qKyjYM4QHM2iFfaF3WNIdsbMcO5U/HVbmQ3SSlF/v/jtxovXcYRzGY=
X-Gm-Gg: ASbGncueNZ1+6hmN15tSLvYTpT88Yu7lhVFZLJx/ZnFTMMAqLAZi6DqlzJFzPLlF3l/
	3LOkVoM9r8oPHly34abcI9j+HC5pNRZFfogZsFPO6VTt3sKHwR6WkrOW5RTRsvvEFzgwcc2UuZN
	lHwAsHajXFmGb9Dxw8Guu+4drOq8oGQhVPskcriw0NujHTei/5lgXZZESsvpHPcN8PIttvfHjQF
	61sRQnWUCnl67mlbry+VSu7D8v+stEmCKV4v0ewuCp2nU2kccwMbmqdDw0srEp07tus7oEEMjUD
	BZY6jSrOmaoyVE9W+nQ4UZ4CZrT4hGrX8PDxRRpmYAJPXw==
X-Google-Smtp-Source: AGHT+IF/jPZgtuKO9F2UOB0NNJAFXUmhCJVLus67Lul9R3bvXGZReu7Tw2V0Z3eVtQhps9kA5NlJfg==
X-Received: by 2002:a05:600c:4451:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-43d1ec8a44cmr134590325e9.17.1742231299101;
        Mon, 17 Mar 2025 10:08:19 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:18 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 11/18] riscv: misaligned: enable IRQs while handling misaligned accesses
Date: Mon, 17 Mar 2025 18:06:17 +0100
Message-ID: <20250317170625.1142870-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
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

