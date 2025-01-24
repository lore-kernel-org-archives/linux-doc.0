Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C501D5AA7
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 04:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737691258; cv=none; b=jmrSXxiNV+wRmlZB92NaYD50acHFozenYkinmc6ilD7jASTZ0h4TkHMjYVG/zdc1QiwZpeO3IiRbcwq/CcFjSuXaVGS7AJu8DnHgoTaW2+YCMWkvTyLC3ZkFcE13+YOmtSCIep9tCVG1UMEJa6juXWhqavDUO5cjOrnBcCwYdQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737691258; c=relaxed/simple;
	bh=A4F3SeT+aF6tRKnf7dmtupnBo9KmgAZ9B973BYeZgF0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=kZc/E6cLNvMofuvZulLvHqrRyKefg2iq3uyMaUnOHdSRzWehcuRhl5lc67CbtW6/1/WE+pyQgK2hbdggZAXrRoFjp4SP0bj51m5quWX+wea4fWkVDZW2YZSSqE7zw7lg6i0bxKdqbl/7GGqzrqHSpFDZQYD/kfLXAED03462ZlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=X/zbK6mt; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="X/zbK6mt"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216395e151bso22524205ad.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 20:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737691256; x=1738296056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lowTk9aiYfu2S+1YMHhjcUoy6Ifdfd28cH1lFEtMNxg=;
        b=X/zbK6mt7goXOfHsRHa9vmbSvR8akafAg8IldPHAutMl6ur0vLRHTskV+cvhpltPVK
         YozenBdGT2RJG3PdB9acDmnXRGo9RxvlAXoaDK45DzjoXOWG1XzKUC2e9JyQDKhR7fZe
         vaYDsud8BxHOmKHtkRI66zuf1ycxIt9q7Vo4ri3ZJSaptLvSw938FxqFXN3c62L+F0Zl
         R63kVdrwdlpnSACtwNIOhFXOWxUVnejp1B7t+m5cB7zE9KnoX6QmLFvF8OtplgKhf7CT
         yJBGgJa7mVUi8FbG/1mePXyB9DyCy5AorP6djSu1aAFaMX8hBTHNIoFp6hxYTXyUBW+p
         dVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737691256; x=1738296056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lowTk9aiYfu2S+1YMHhjcUoy6Ifdfd28cH1lFEtMNxg=;
        b=LjAkHw/YO1S+IUqxjkbEMVkes3SZAslS/1yyhCNy1uZU0J/iML18abjwj1HP2WJUEk
         wrQflJ4gjD4C1dO0GaUP/VVTHlrrj5k5q96Qszw/RVuEMtnqiOflsuH6eLttVtLBW0UL
         FgX6U4zs9XBlPezQ8xLfu4qQraBIB3n7NtXzosfVDF/QnZ6uwgcoB5yc/vVktrdbWUoN
         5hs0FbmplEB+JdXcAteC9Ldm47huoTh2n6fMoAJ6bmBUqedaOjFFkWwJXM4DB0eolp55
         lJPgqzrs6JcwFD8LOCDuwbEBHeYwpXI4nZ+STzLdNfDaimt8Z///eEgG4LvL22V+KRpy
         oG0A==
X-Forwarded-Encrypted: i=1; AJvYcCUCvhYF7akA9a8zCJaMO3yq9n4r8qhdRTnKrch9WpKNVNUgyWWCsJn8+WWqixj2KDrcSheYhB+9aoA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp0H5C3GLz0Yzj/jacMH3zHRVpcsdniLCk8u36lKu2WT28+EYt
	Q3G/Z2mlEz3EkPjThsJMrwd4Vw0qUOFPwd1ZO5ND+zC7MVDaxTJQbzhTjJyZY2Q=
X-Gm-Gg: ASbGnctOxmwq6YDkv/QmOerMgPXFkZjEk2yII9JNA5Bm7CfNP1CcawvNS7ChtmpHbJV
	CWXO34x9FN4AV++cYy/XNMDv5tJCDWP9geV4MgpxP/VDivHSBwagLmf3eoJoJflqkA/reVCINxP
	XWk6MnKOdC2jAKThEVeP1V3Jp8xjIrB+U/TlTCCyK55IhvsKchJ/BRMBnGz9CdB69fqCBzIwSbQ
	0BQzGHWtWduKLVpxCk5c6dhqS+bnpCt2JMc+ySvCWHw9QhqTs+xvGz0+qwfYMDXSfEUdzrLCGd+
	vxwpLm0yLYwilRN1D7n8IAzwbbV/EnhHgKCrOFi+9erKho5HVA==
X-Google-Smtp-Source: AGHT+IF2S4YVOk72i+gmuMaJGfQDN5Q2NrC3RvrGrOxrDJRorKXpriRqzs16K3FSFHQ6l7Vpi8ulYw==
X-Received: by 2002:a17:903:124b:b0:215:98e7:9b1 with SMTP id d9443c01a7336-21d993177a2mr87571155ad.5.1737691256294;
        Thu, 23 Jan 2025 20:00:56 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([2408:8406:78d1:bf49:24c4:f518:9b3b:36de])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141d67sm6758915ad.153.2025.01.23.20.00.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 20:00:55 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v6 0/3] Enable Zicbom in usermode
Date: Fri, 24 Jan 2025 11:59:56 +0800
Message-Id: <20250124035959.45499-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1/v2:
There is only the first patch: RISC-V: Enable cbo.clean/flush in usermode,
which mainly removes the enabling of cbo.inval in user mode.

v3:
Add the functionality of Expose Zicbom and selftests for Zicbom.

v4:
Modify the order of macros, The test_no_cbo_inval function is added
separately.

v5:
1. Modify the order of RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE in hwprobe.rst
2. "TEST_NO_ZICBOINVAL" -> "TEST_NO_CBO_INVAL"

v6:
Change hwprobe_ext0_has's second param to u64.

Yunhui Cui (3):
  RISC-V: Enable cbo.clean/flush in usermode
  RISC-V: hwprobe: Expose Zicbom extension and its block size
  RISC-V: selftests: Add TEST_ZICBOM into CBO tests

 Documentation/arch/riscv/hwprobe.rst        |  6 ++
 arch/riscv/include/asm/hwprobe.h            |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h       |  2 +
 arch/riscv/kernel/cpufeature.c              |  8 +++
 arch/riscv/kernel/sys_hwprobe.c             |  8 ++-
 tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
 6 files changed, 79 insertions(+), 13 deletions(-)

-- 
2.39.2

