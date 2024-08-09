Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8456E17ADE8
	for <linux-doc@vger.kernel.org>; Fri,  9 Aug 2024 16:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723220569; cv=none; b=prgHESw9hu3V187ydbuyf/dj3+e1HnjVLzLShzd47Ih9TbLrdmItk+fyZdiI6FMw5Lv3iY/eqacg/+TL/4ZdquyZuBTprYje9JLYSuhuLGrK7lEGCTPAEE2UP3NsuUEJamFgft1qJVwf2gszbNNvvx8+af+z1kztR1d99FWAH8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723220569; c=relaxed/simple;
	bh=aAtoJEzbqNi4y8YfNn568kzbBwzWSOx0J0mzAknFX3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lgTu3o0jD23CGDHiYN+KZiYqQfXBW1NdDXzV6nRK3g1gteyBiWC/zIUiL7mAzeDa7+3q68SdrPEy/n/f3Fy3zc12DrK7RoV3GOaU7JgrEYp8nkeuxUyOobaGyRhB4QyCEiJj5CDJhQiKIkg0+2w2RRHFk7Rh7zfKjyEJj5F2Jv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=S2N1VkLw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="S2N1VkLw"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fc4fcbb131so17126615ad.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Aug 2024 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723220567; x=1723825367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fM2VDWjrqv9lrjNKWDnw+ItVMCPfvg36IuOKi51U2nU=;
        b=S2N1VkLwP19YArFQ7b6u1fp2usOkTk7fMXSK0qcmTSafmiG3NHH8h2bmL1RLGCLA2U
         kti6DoisrpEhjmxeEAZSw31eVDXrycW2s3Ua06ykxczPlsMniIDnAw1epRQcdXDKdbBN
         sKFn9yij1+LYxGy1pycU5qJV14HH6sqA/m9zIl479qDeWXsXjCnRzjhpr48Nk9gfo7W1
         PncKVCR0P+WhdY4POXCHYPZoHstx60/peoQe1VIYTupkPxwXlXmNIVF0DiTvpn9i5w/4
         d/1KQOgbAQyTDOlRCDc0zz4/kQnjAGLzdJf0A9+UMPynFwzzgIHBMRDwHwmQGbbkSefK
         q1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723220567; x=1723825367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fM2VDWjrqv9lrjNKWDnw+ItVMCPfvg36IuOKi51U2nU=;
        b=brSq+pf0nXxvH/0D5EJv0+tTFpJfVQMdyOKnNhJagiAxoiP5ZcrW/lU8xNuD2mC46s
         01P149jJ3rlNoDpNE00RYGfxnI1oH5LsP4WjgCTWrfEJzKKfB7OxDxp0jJfy9VR0FJ0f
         fzVHrpuW0EiuQUoM0UnjcJkKXblWPP5aFjCiHToGX39ZHZEL2Ji3tFUFRfHOEDqV+RU0
         JCOF1XrED7E4vewGQc4F1i/kI32ueOugnW4VkJSaR5oXgzTuov07kT5okJGxHkd2gztI
         phZEdUptCq/oXxfRn9IODV25sLq+I9hDZ8pQeXCGKHqGh9zh3vva7ozu9tKU0gyRuCXp
         yr6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdKtZOIkpQVbXmRX+qA3bPUwkRaz5tiqpLleQNGVCsXKGROYlNRQG6c6acuqBLgAwMyQDoD8WBcmK4XOYT7pm285QGDyF8clab
X-Gm-Message-State: AOJu0YxIJFXH2Wjp+L24wExnMCeKhijQkFqQ7Pnl7IJOqt3zzIQGc0Fg
	j++kB3+nexGdYXGykS7VOC5NUu18fifJ0eOI9sei/YeUme87BPesQGxS9Uc2nlE=
X-Google-Smtp-Source: AGHT+IGqUO+CKpGZVaOzZdHApACfqVhHv0z7O+fN2b3OLvcB9p/WYhCAE/fx1r58g+9+NN9ktAIaPg==
X-Received: by 2002:a17:902:ecc2:b0:1fd:d73a:7cd1 with SMTP id d9443c01a7336-200ae5da91bmr26359905ad.56.1723220566767;
        Fri, 09 Aug 2024 09:22:46 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200668fc398sm100414505ad.207.2024.08.09.09.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:22:46 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] RISC-V: Add Zicclsm extension support
Date: Fri,  9 Aug 2024 12:22:38 -0400
Message-ID: <20240809162240.1842373-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set is the first two commits of
RISC-V: Detect and report speed of unaligned vector accesses [1]
rebased onto palmer/for-next.

The rational for adding Zicclsm was related to detecting unaligned
vector accesses though this reasoning is gone.

I don't see why Zicclsm shouldn't be added which is why
I'm sending this set.

[1] https://lore.kernel.org/all/20240726163719.1667923-1-jesse@rivosinc.com/

Jesse Taube (2):
  RISC-V: Add Zicclsm to cpufeature and hwprobe
  dt-bindings: riscv: Add Zicclsm ISA extension description.

 Documentation/arch/riscv/hwprobe.rst                    | 5 +++++
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 arch/riscv/include/asm/hwcap.h                          | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h                   | 1 +
 arch/riscv/kernel/cpufeature.c                          | 1 +
 arch/riscv/kernel/sys_hwprobe.c                         | 1 +
 6 files changed, 16 insertions(+)
---
base-commit: 2d1f51d8a4b0c3fc0b2b79d4e5b95a6813500092

-- 
2.45.2
