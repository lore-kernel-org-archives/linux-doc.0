Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D01253E27
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 04:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711687608; cv=none; b=Ck6wqVozynPek8aDU6KZwEJolLNBNP0MUfQZCZh1aG+xwRQhUFF5jpFejUs+urwJaio4lrRKAtmSnZ6T2Zpy2ieXAFwQK6LjwnyyS4r8LQvmXKfvz/dZTpqQMcnw9ugZL24qsBVQQTIf9HqvWVEbbGO9/fbUlvdW+MrA3KLC/Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711687608; c=relaxed/simple;
	bh=tp04Tian2VbAgQyGkrhWqNwzdHeK/WyQhUL89J1WvPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T2wHa+VFu55PYDxXMf5MQcr84pXyJLZrD5TvQHn2SevVFzXN1q3T27tLup6Y7kqynLmjl/6z8prOAxj9rPecHADAZD1F5Tv0dyGBjMLJ2rGprIUZQdd5KjwrdrwR7Y8brt2xd2C5qWS+QqTyXREo2oT5jEl6ahkmQ/Zy1086bfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hSHHA9Ke; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hSHHA9Ke"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e6b22af648so2012842b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 21:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687606; x=1712292406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jzaUmiaVJT+7AndpgdFUVtlaA8dH1VTGpl1Yp0ZHRo=;
        b=hSHHA9Ke2WuQz9S+0ugebZaQHaPdXUt9olJ+rrReaptyxKFNAvhkZEjvUyjaCjfSTf
         Pa6C8KDgRKeT9OKuNFagB4AC3OaKbZvn+Y+RKGy81yCBkxCDu1b+ngLgQ4AQm6nC2X5P
         JUApcOcjXOedWZeyg5iGD2MNnzVcDnU5KbrtgH8r5uaGfbom0ARX5Bp0FIcLiVo221kD
         T2wYs9HymvMf9vQMzYzVPQjm/KlvunLoTCemqDpvgIYKQLz5E0IeJxMxkituXNKNRnkl
         0FzbWBftSF1BE/GNtT1P+Q3VLw7JrIJyD8dmmzOF+TsMc5CPERdXIF8FYcCycztqorHP
         cNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687606; x=1712292406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jzaUmiaVJT+7AndpgdFUVtlaA8dH1VTGpl1Yp0ZHRo=;
        b=DEyMIfRWkQhkFK23Ac7Q5rjqKergpdoI3p3Gg51zyhq3o2gkot++MHWz3H9tI66swC
         A5D/OtMTK5fgdSc4RR1L8eptuJqFAXCC0dkuuA5HCdevAFLQw2H0tTIpPiH46iue4Xut
         BkVzbC1z/+S2UVknH5fNC/7UrjHPwTEY6woyh9xn5Bld3rNvtZxuTnT7bfd93RtUcdyi
         FV/g3pDsohTRytNE5+HlkgKecEyeTX2S3TYLN8gvFEg/5/kcINtjrqU38UE8O2rs+unF
         N3w8i5v8oCDejjiLNjfUA/7TG3dkLBgHHvhK8StKCLhXzVm7a0K6TAyrCJQ7XXsMmf17
         0WhA==
X-Forwarded-Encrypted: i=1; AJvYcCXdOxDegrryP3GjX7cMwBx8QrPt0dkZWfU/YP/Zv2pmSQ1Hqhp/5PZDlRjRZv23xAOS+rfetU/gB5J96BulAVTFUUG0+C4YP8m6
X-Gm-Message-State: AOJu0YzzhRUj4tNCHT1RZ73IyY6ieQcAR5ulrbsH4vrQc+j+oZg30KbH
	9/So9pSXhzfZhf7AUj5uWQfEAK0hmTLhXD75Mn5T/0hWz7NI3EWbScutUhbCT6s=
X-Google-Smtp-Source: AGHT+IFw+iNT/fZ7ZDIngivJRJR8RkOVDCFWMSifsiSz96HEhcDTVYzJoolJ7eKeIz36X1Q6OzEzmg==
X-Received: by 2002:a05:6a20:8414:b0:1a5:6c7a:a60b with SMTP id c20-20020a056a20841400b001a56c7aa60bmr1845203pzd.11.1711687606505;
        Thu, 28 Mar 2024 21:46:46 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:46 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 19/27] riscv/kernel: update __show_regs to print shadow stack register
Date: Thu, 28 Mar 2024 21:44:51 -0700
Message-Id: <20240329044459.3990638-20-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 105ceb8880c1..97c812753c9c 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -89,8 +89,8 @@ void __show_regs(struct pt_regs *regs)
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
2.43.2

