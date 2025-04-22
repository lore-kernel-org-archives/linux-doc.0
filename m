Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0329CE8
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 16:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339033; cv=none; b=pIs5qVo9V+sHeYn+3KVN+RiLaQ0vZDGx5ZsKbiEEFHSgjKzrOklhjmM37K3h6Ls+89ubHufkWHPrMx/XeSGifuRiIqTe+0NtgkOtaTcXjHThzPN2CGu0xfJBzubDPhBRV4oNyLp8exiK8/y2TV2sdo98YMsSKCZRhJY38rRXJgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339033; c=relaxed/simple;
	bh=V1few9iADl3Jql37d2sSjWVyST8COex3O6hgsGvnL9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WSzov7rDT1Mx65RqrQ797AnQAarC8vvTmWYn27JuGNJytoArlHQrqMIQ368pnujxo5xTJ/mnIme6ZvtCCefIOJF6G5jjVO/jhzWmOGiVrm6Q7FeXILhtSKbxSU6RjhcvVPOIZQdVSPMBt+1/4K/FSgbOHom2g3Qb6RbpWK4THtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=MX8rfLpZ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="MX8rfLpZ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso4967451b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 09:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745339030; x=1745943830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k21lSdGFw1ABvj7WqNf9xvlJy5uS9lN5lvHH4c8/sSI=;
        b=MX8rfLpZHlPbpZJhzgmC0WuqaXi5gxGij7pWSEGOirRq98iMFMu2Hv+p4PAiluJiFi
         /HcLY6neH9zdv2SLPPxxVwaONKT+i7rGXlyYE9PTb2CmODuKukgmQPz9mGpJYS0QgJGl
         btDD2N8z6z05fNwJ++UYUr5RjcvFVMYs5OMBnjShQ2kHoznC5xLTdDfb+Dh4JUZxrVG+
         v1mheup4GYh1v0IdcyeUH6ERa8ng8Bj9v6gLdDnm81UOw1rC985JT8bYBYKOC25YTNeI
         VWI0ZUKj+APOg66+a8+R3aAoA94MwiEyoBEuW3RVayt9QIBkxOZmSXejSsjxt69qiXyM
         UrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339030; x=1745943830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k21lSdGFw1ABvj7WqNf9xvlJy5uS9lN5lvHH4c8/sSI=;
        b=C9x7pfLLJafETsH8cjnghLbmRHqVw/+bz8EGBi91Bf+f8LTmB6yyu/XdoE9o9O/mZw
         gPAckZhtihEr89+X3lZReCaN0hULo/1W+U3wz+AYJa6V95WRKs1c42FAElfyY0G1gP2c
         J/rGYSYWw1YrIUzkJM2QwS32r2hnibBvaSV29W5PHB1jnoyI2ZBbWCmWC57H0sx3i0DJ
         bykPJTfjuu1KWkTVmf2pURWukfprk4BI80FJhZd/5KwNU0W5VUluKpS+oFtnrHyNs0Bv
         tAd4/egr3EUD96vsLuR+iBAzuuC8HbQ4qu0SuQ4vmmr0/P/1K6rn2H1HNs20sN0sCsmO
         qznw==
X-Gm-Message-State: AOJu0YxgNb+cjh3XwVea3SeIJKmqv6ckkc/er+uF7MZU9Cb2U/4m6tXs
	mr2H+vecNw7mSlmSu/qufPoMgN2gPlD4CsA7p05Qz037SzwXDcxsr+FYnDwdqbvTOQPJ0tSjKfL
	wKzs=
X-Gm-Gg: ASbGncunlY4X8SnkPEhDSPAjH5hnWQ1TIKhr1fZc189G+W5p4EG3kXLi2O3UBjFoK7T
	64x+XS8AoVcM6RFN6zo31q1S3cqTVPdUUn720QOqkcFY55gnoeYHnvDjJOQAWcYXF4XbC/1BcV3
	s33HiYhJoezMYJnp9+PrQhXBGfG4YhosPTaNnlWyJt6w33R8bC3fGXMMc654aYuhCDiHAwvTsf8
	wpgcYJlkj7bBgk/s6XqYyMP8iRP6FTgW+qXEukM/fn3m2p0zaadw8k2oVpmLkl+ELzhuiCPloOV
	zm3SqaD6qSU2I6uWXw76/EA4Li0KChK3zbejlkF19x+kWl3buWTn
X-Google-Smtp-Source: AGHT+IGBaYB+zcFYNZod6Dyq/XeUaZqkUk/RN2FexFvjQuv/xDbjUf/BD8XILM+dfMbhssRMX5dz+g==
X-Received: by 2002:a05:6a00:b4e:b0:736:5504:e8b4 with SMTP id d2e1a72fcca58-73dc156b0c4mr22113079b3a.19.1745339030561;
        Tue, 22 Apr 2025 09:23:50 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e13e1sm8850825b3a.46.2025.04.22.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:23:49 -0700 (PDT)
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
Subject: [PATCH v2 0/5] riscv: misaligned: fix interruptible context and add tests
Date: Tue, 22 Apr 2025 18:23:07 +0200
Message-ID: <20250422162324.956065-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes misaligned access handling when in non interruptible
context by reenabling interrupts when possible. A previous commit
changed raw_copy_from_user() with copy_from_user() which enables page
faulting and thus can sleep. While correct, a warning is now triggered
due to being called in an invalid context (sleeping in
non-interruptible). This series fixes that problem by factorizing
misaligned load/store entry in a single function than reenables
interrupt if the interrupted context had interrupts enabled.
In order for misaligned handling problems to be caught sooner, add a
kselftest for all the currently supported instructions .

Note: these commits were actually part of another larger series for
misaligned request delegation but was split since it isn't directly
required.

V2:
 - Use an array of struct to simplify misaligned load/store selection
 - Revert use of irqentry_enter()/exit() to irqentry_nmi_enter() for
   kernel space.

Clément Léger (5):
  riscv: misaligned: factorize trap handling
  riscv: misaligned: enable IRQs while handling misaligned accesses
  riscv: misaligned: use get_user() instead of __get_user()
  Documentation/sysctl: add riscv to unaligned-trap supported archs
  selftests: riscv: add misaligned access testing

 Documentation/admin-guide/sysctl/kernel.rst   |   4 +-
 arch/riscv/kernel/traps.c                     |  64 +++--
 arch/riscv/kernel/traps_misaligned.c          |   2 +-
 .../selftests/riscv/misaligned/.gitignore     |   1 +
 .../selftests/riscv/misaligned/Makefile       |  12 +
 .../selftests/riscv/misaligned/common.S       |  33 +++
 .../testing/selftests/riscv/misaligned/fpu.S  | 180 +++++++++++++
 tools/testing/selftests/riscv/misaligned/gp.S | 103 +++++++
 .../selftests/riscv/misaligned/misaligned.c   | 254 ++++++++++++++++++
 9 files changed, 623 insertions(+), 30 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/misaligned/.gitignore
 create mode 100644 tools/testing/selftests/riscv/misaligned/Makefile
 create mode 100644 tools/testing/selftests/riscv/misaligned/common.S
 create mode 100644 tools/testing/selftests/riscv/misaligned/fpu.S
 create mode 100644 tools/testing/selftests/riscv/misaligned/gp.S
 create mode 100644 tools/testing/selftests/riscv/misaligned/misaligned.c

-- 
2.49.0

