Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B0214431F
	for <linux-doc@vger.kernel.org>; Tue, 14 May 2024 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715693780; cv=none; b=gKke1eq8vQVwwL7xp8LoHlPTkJkwAJ710DZTodK/e4WZDP5wuT8Y/uD62NIvBYQKQldGenzOZDVO29WIqCp1wcXrAJHgRn4S+Ik4Fn6YPawXDGHJZA8gLPX4f6CMuV0DSBZMv/cci9Ua4RpfhUGvgyzQum0cQM9ophaRuhjFWnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715693780; c=relaxed/simple;
	bh=Nyi+RCrf5Y+WqMKXmI2T5cOWnyBug0P72f6XYQ0uD+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WlrjVwGf09Nd7sO7G5mcHhkmHiYleuBmtluWqpQPGvD8jYW6eNsJBj6g0maYWlSic98D/JhgrgV2ELew0XMlWUPyDHJ1PHg2Y1b7L/0g2BxtSvJm55FauJ0n9XzHAwD3aWzua8zyFkqnwZqCIo1zM8CQs37Ny69LFosaa6GJJUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=cjQAaCNW; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="cjQAaCNW"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ee0132a6f3so41581255ad.0
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2024 06:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715693778; x=1716298578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ELhPDbgArQNQi6ZkTuNkJ3HaLG9b9s1A9lZNaSj8kas=;
        b=cjQAaCNWjw7QS+MgedkvCizu5HKRF47jei0ErJEd0ePdKLT2SQINUHQoDDXemBmidt
         Telb3uiSw13AzXQQVy69rJ3bStqmyd/DNklO2BwfM3OrJeQIkYAUE4c5M2Lm1fk5ZyB+
         aUB6UguHsioz5/FttR0JX2IV8AS9Yf3GpoZEzTiR6XoPuDYPVrtywguR6n4WZlojvrVj
         UO56fgXh49mHl4JiiQOo6REyzgIw7Y63GIM5b11SO6jQTw+NmzaXWjLMxXujFGwABtaq
         EcrDp3SP7sWy4SeryQzIkwfcNAHl9heP1IwvSshtvz5OAGCHu5DIVncse4/LHs8PTO+i
         QC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715693778; x=1716298578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELhPDbgArQNQi6ZkTuNkJ3HaLG9b9s1A9lZNaSj8kas=;
        b=oSj+6E5FXiDooC1xU0Uwf6xecwzKtI6rJTjgPVqTkVnPJ1dUBCSK8nTMkSqn4guxAb
         2nhAkpI7jDF2LALXAwHABGZF90Yz86d6SYo55JvGHSL7ihIz6K8DnIa+qVkb+VAmLqry
         naoq7jtzpYEfsyHhBJ4gOWF0+4OtP38M4Go+GMExNvnRffGAJe5/wQ5R0WbWEj8jN/sB
         8reM1WW+9iXKye4weHaFbcrbOzSwpmVHQIg5qj1mg6Q8D7XpEgee7s1RnjYx2RTLQAor
         i2YO1bDkfUSqAfhki+dyitJp1SgTo62zhJNCCbci+C4qgQ/egTKCZQzhvVapqfPqHKLI
         LSIA==
X-Forwarded-Encrypted: i=1; AJvYcCVEYGunA2zH0fSXIgO/1ClsY1wXvFOAl7OFibn6PJqz18ydFq77hPJ1EeTXkXrCGvuxF7hVnu9y67i1296OWdYe70yQ9lR8wVy7
X-Gm-Message-State: AOJu0YwLMQmqus9/aAHdgeB9ZVC9CkHP/1WM57wzeT9nD2vnxtLO7wHr
	a80swWTBCdiR7x1Ud0V2DFbQyKOt1Xqzo+LDN1GgWgtb3WPKY78nH4taMWp+JyM=
X-Google-Smtp-Source: AGHT+IHfPx0KBY4rytS7KmSuQawsfE1ZSfpv7vPPScV5D9GsMRlZ30zNYZI5mhzzvMLWaliGYlVCAg==
X-Received: by 2002:a17:902:e5c2:b0:1eb:2fb3:f9fd with SMTP id d9443c01a7336-1ef43c0cecbmr165256165ad.14.1715693778566;
        Tue, 14 May 2024 06:36:18 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([50.204.89.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13699dsm97908565ad.239.2024.05.14.06.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 06:36:17 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Extend sv39 linear mapping max size to 128G
Date: Tue, 14 May 2024 15:36:14 +0200
Message-Id: <20240514133614.87813-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This harmonizes all virtual addressing modes which can now all map
(PGDIR_SIZE * PTRS_PER_PGD) / 4 of physical memory.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/arch/riscv/vm-layout.rst | 10 +++++-----
 arch/riscv/include/asm/page.h          |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
index e476b4386bd9..f37812863991 100644
--- a/Documentation/arch/riscv/vm-layout.rst
+++ b/Documentation/arch/riscv/vm-layout.rst
@@ -47,11 +47,11 @@ RISC-V Linux Kernel SV39
                                                               | Kernel-space virtual memory, shared between all processes:
   ____________________________________________________________|___________________________________________________________
                     |            |                  |         |
-   ffffffc6fea00000 | -228    GB | ffffffc6feffffff |    6 MB | fixmap
-   ffffffc6ff000000 | -228    GB | ffffffc6ffffffff |   16 MB | PCI io
-   ffffffc700000000 | -228    GB | ffffffc7ffffffff |    4 GB | vmemmap
-   ffffffc800000000 | -224    GB | ffffffd7ffffffff |   64 GB | vmalloc/ioremap space
-   ffffffd800000000 | -160    GB | fffffff6ffffffff |  124 GB | direct mapping of all physical memory
+   ffffffc5fea00000 | -232    GB | ffffffc5feffffff |    6 MB | fixmap
+   ffffffc5ff000000 | -232    GB | ffffffc5ffffffff |   16 MB | PCI io
+   ffffffc600000000 | -232    GB | ffffffc6ffffffff |    4 GB | vmemmap
+   ffffffc700000000 | -228    GB | ffffffd6ffffffff |   64 GB | vmalloc/ioremap space
+   ffffffd700000000 | -164    GB | fffffff6ffffffff |  128 GB | direct mapping of all physical memory
    fffffff700000000 |  -36    GB | fffffffeffffffff |   32 GB | kasan
   __________________|____________|__________________|_________|____________________________________________________________
                                                               |
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 115ac98b8d72..727ed7887cab 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -37,7 +37,7 @@
  * define the PAGE_OFFSET value for SV48 and SV39.
  */
 #define PAGE_OFFSET_L4		_AC(0xffffaf8000000000, UL)
-#define PAGE_OFFSET_L3		_AC(0xffffffd800000000, UL)
+#define PAGE_OFFSET_L3		_AC(0xffffffd700000000, UL)
 #else
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
 #endif /* CONFIG_64BIT */
-- 
2.39.2

