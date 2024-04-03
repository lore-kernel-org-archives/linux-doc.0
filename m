Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9AA15820F
	for <linux-doc@vger.kernel.org>; Wed,  3 Apr 2024 23:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712187714; cv=none; b=SO7trUqxupgctddEP3NsJIV6dcUXnKU0AdB2FyY0U2tYdyRsXe4YLS9vqy0Aqd7VknNdyiXFO2mdNk/pOkgK+rvIOO4JrDCu5dTVfFMstgiH0vVkFtFCHB3SEYn/800ZGB9u4tAjE1D1wvZA/qD8wEFCiQgAt3SAHgSojnE0O9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712187714; c=relaxed/simple;
	bh=ZshD/5wywYZOoD7/u3SYmOTR2SIaMjHKlWumK97il8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cvTdTVU3QO0AfoqaKRkbggq3CvByVUqIf3Uyxf0DovpG+1zUCG3x04u1xHV6Dsqxlo0BCWhRDW40PTuNKCFUL5nY/PxMohySaTFljYVTwy9zL5ki++7/mNvvb4j7nhG89paHPe8vVl/HnsQYFwTwejN3f9AlD0KpxyHa0kSZzzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=WSPS38vq; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WSPS38vq"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso349808a12.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Apr 2024 16:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187711; x=1712792511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABpeeFCkULjAH2+wvqdO28185Mvpk++2Yk/j/QF7GJ0=;
        b=WSPS38vqE0RSmCl5/mHAvxiYjuUqgkGN16SPOi53Pz9owOm/JcFZbEz2PZvKqeI95x
         6XnfV7ymNpxe20jOM58dR5YcNBEMy+tPWOyB6tTt+UkxAlesgvrNw3fEa6KjACYnntZf
         dNC8QEjvD7luxmLJ7Dtf8pZt3/acLsD2iuwUm/3+SW3gz3IY8BF3z6TuISWsn0fTvq63
         Eh3IfdEKTFZ87hO9mpy/jdtnbBlyDldcnMK2F6mTh5LYDPztWFahuho+HqvbfOCGyqQu
         eYW7RP+KOMKHbq9WjsxHwTJ9Xjz63VM8JrVJZGdL5pagF5qxXl3wIRBW47ylxN9kPbVZ
         g6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187711; x=1712792511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABpeeFCkULjAH2+wvqdO28185Mvpk++2Yk/j/QF7GJ0=;
        b=tUmmeC/smkgPMjv4raVfMjUVzZlw68MhmVTMfo5IGZzxCmJArhJ4g0ufvXK+i+kfWB
         xKo0unWyA5QXfd39UIDtEXcOILtHJSZoHVYb+QD8/3dyDp/qN+6BMOb7rXRYv+CaqVm5
         1IkHSOipZbP5GC/jbto55+6HJSiF2sBP+f0+LpP24Z5+Q5YeMHoqvrFt5EeJco/lb455
         ajboPe+f/hZ+mpaJUjOlymP/dhTyZQOxatzEL7/bh3oww8bK58N0/K0VTrgkNnJTrHvg
         W1srDNyyHPT0EE2eU0PJh2TDOY7t73HzSr9fLubvGMheeOZdqfm8hg0QqiLnt+yfE0VC
         ec/w==
X-Gm-Message-State: AOJu0Ywl2XDcmYEgf3xK1f4GYl+Bucoig9nmf+r+YlcQmd4xWRR5Ki4w
	At9Mv3Ys976G9q92zT9jjTAK6r8z21Sxgs/4bIZjAIzO1ELFTik4oGisdi7+TKc=
X-Google-Smtp-Source: AGHT+IEuPdJ9+VZyZuaG1MlOsTEyLTpxiJH28qDOFi58HVozeCfEc+yN58hPfTIqNV3cM5o/KXJ7iw==
X-Received: by 2002:a05:6a21:339e:b0:1a6:f8cf:1e23 with SMTP id yy30-20020a056a21339e00b001a6f8cf1e23mr1102834pzb.41.1712187711360;
        Wed, 03 Apr 2024 16:41:51 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:50 -0700 (PDT)
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
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
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
Subject: [PATCH v3 08/29] mm: Define VM_SHADOW_STACK for RISC-V
Date: Wed,  3 Apr 2024 16:34:56 -0700
Message-ID: <20240403234054.2020347-9-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VM_SHADOW_STACK is defined by x86 as vm flag to mark a shadow stack vma.

x86 uses VM_HIGH_ARCH_5 bit but that limits shadow stack vma to 64bit only.
arm64 follows same path (see links)

To keep things simple, RISC-V follows the same.
This patch adds `ss` for shadow stack in process maps.

Links:
https://lore.kernel.org/lkml/20231009-arm64-gcs-v6-12-78e55deaa4dd@kernel.org/#r

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 fs/proc/task_mmu.c |  3 +++
 include/linux/mm.h | 11 ++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 3f78ebbb795f..d9d63eb74f0d 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -702,6 +702,9 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 #ifdef CONFIG_X86_USER_SHADOW_STACK
 		[ilog2(VM_SHADOW_STACK)] = "ss",
+#endif
+#ifdef CONFIG_RISCV_USER_CFI
+		[ilog2(VM_SHADOW_STACK)] = "ss",
 #endif
 	};
 	size_t i;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index f5a97dec5169..64109f6c70f5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,7 +352,16 @@ extern unsigned int kobjsize(const void *objp);
  * for more details on the guard size.
  */
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
-#else
+#endif
+
+#ifdef CONFIG_RISCV_USER_CFI
+/*
+ * RISC-V is going along with using VM_HIGH_ARCH_5 bit position for shadow stack
+ */
+#define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
+#ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif
 
-- 
2.43.2

