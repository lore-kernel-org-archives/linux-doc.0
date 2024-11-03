Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ECC156875
	for <linux-doc@vger.kernel.org>; Sun,  3 Nov 2024 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730645642; cv=none; b=cOy10vP5bp4CQQcKEnl2TLUoRKBZ3zsOVMQHHiCLm4hfTJvGGxy2PMnNy3dIOoH2CYPI7QMezisknB+NBGDHYMAMdsTlsR4twli+2mvhr9mRC7Zwxu6Rjp4qH1Y1gTSqKNYeLEUkJ0O/8n66w/4+58lO8ddYZPEwXLsXU8ZO3pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730645642; c=relaxed/simple;
	bh=I9YIkC+Jr1vfCxbUp9hWddXX3XizMNgS5ezZYWoSkNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oRGT4t4egbpe0d76UizZlBuuBMk3khx17jmPzRsMPaCuk8G8LicILeI/KBqQYlkHqaKkth6bZiQMUivDpp1tQioLGQHvnZYPYR0hUOz0t8L4Zo5NxZ9Sr8fIeA54y3Ala6pufqlIiEzIxwQSQxYI7d1GiY8Y47flMcb038mxG/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IwLOAFDm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IwLOAFDm"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so27191635e9.3
        for <linux-doc@vger.kernel.org>; Sun, 03 Nov 2024 06:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730645638; x=1731250438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nql3DD9359qdXdLLpVtxL8oa+5wIDas5DqswNkA3KmI=;
        b=IwLOAFDmmiiHzdE9o+zlyEuI1eZQCoqkvnE2g1WFiI5dQwK2UL80wONjuRQdrnbZoa
         iGXKkYHh+fRmiDei6b3ZIzGouZBWYphaxq5QteihSa0kZEcqUTsUHVBK0eZJaMZa0D2S
         pMRIZ917kFyxtBtJS49NORVCRFbo42TNBDCQbOh4PvZLrJC2YwMy8c2/3PuD+kLfSxlH
         Q/u1FFWbRWnOz+UkOrYpLjXroFVbmUHNW7D0mOcW69X86dTJZDDAXwR/N0DFkhNQaQtv
         hRrDvqMEM6yid6ieQg/EKs4L5t5FdNmbHiNQv/v9ehNcvjBMo9p2ZPI2zYI/uIQgO7cD
         S75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730645638; x=1731250438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nql3DD9359qdXdLLpVtxL8oa+5wIDas5DqswNkA3KmI=;
        b=AGzbAmWcpK5Gn9K6co2ecBTLeYNelHNXVPkGKN2pz6QX8cdCjJM4GuOt+MYhGylAHw
         Fuw8ik7dsKkwnocr/e2RydpbPkgW+KQvthUKH5KDBGEzwR6U8c3mTW8T5ky6ITF8g1EZ
         Ub7oJ61/vpP11CVp58TcTqhR90T5VieSKisY4EhNwMAjYPcgyXSvS5qjQ+EqndAaKDgg
         ZrkFyPCG16J6nEN7UBY7f2dAUVDny2rXNFjS3owmvRYNg6TrAbvjiksHEAmizXce3TFc
         AW6r9QxMOVWov8ErzLreGeo0bXd0Hoe/lklGS1y2ZUEKHAK/CR+siLKRIv7PUl2OiBYH
         ngCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa072tKOrRLjac8qRkmLR4iFhv3/xRmRsoXshDqadtw6toOKZ5kZw/7mbZAEpsV0ewnBZ6ho38vOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxDpaBEDHLnOg1a45ldDnRPC62TSPKZVat/WKB0f2GTVObaxb+
	duNYp1nLhv3fJxQshzJCzorNf68xp7NEWr2zss8ZtWqvpBrUDPRXswmTC1SIW/s=
X-Google-Smtp-Source: AGHT+IEzqXU+n6yFRFqvDrou02tN/4/eCcsT/sjowi0L/ehc2kcbHr+rCGMDYfv6CZMwRO5vLoFRDw==
X-Received: by 2002:a5d:47ac:0:b0:371:9360:c4a8 with SMTP id ffacd0b85a97d-381c7a472ecmr8333590f8f.6.1730645638302;
        Sun, 03 Nov 2024 06:53:58 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d7e0fsm10710932f8f.47.2024.11.03.06.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 06:53:57 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 02/13] riscv: Do not fail to build on byte/halfword operations with Zawrs
Date: Sun,  3 Nov 2024 15:51:42 +0100
Message-Id: <20241103145153.105097-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241103145153.105097-1-alexghiti@rivosinc.com>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

riscv does not have lr instructions on byte and halfword but the
qspinlock implementation actually uses such atomics provided by the
Zabha extension, so those sizes are legitimate.

Then instead of failing to build, just fallback to the !Zawrs path.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/cmpxchg.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index ebbce134917c..ac1d7df898ef 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -245,6 +245,11 @@ static __always_inline void __cmpwait(volatile void *ptr,
 		 : : : : no_zawrs);
 
 	switch (size) {
+	case 1:
+		fallthrough;
+	case 2:
+		/* RISC-V doesn't have lr instructions on byte and half-word. */
+		goto no_zawrs;
 	case 4:
 		asm volatile(
 		"	lr.w	%0, %1\n"
-- 
2.39.2

