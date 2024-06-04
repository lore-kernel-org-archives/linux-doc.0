Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5133814601C
	for <linux-doc@vger.kernel.org>; Tue,  4 Jun 2024 12:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717505175; cv=none; b=NvtSfAyfgjY7UcJcL/tz1ltN+Joi+T0nd6b3dyA809NXid+DZRnFW5Gq/Kyzaez4llukVW6iILQCFoFg0aScc+0EsfBOiN7r6BppLVFeVxMOCwFntJRxTkuthelui9uQVBkxDiCHEJnAocgi2zTg8wu3jsGI1lEexwFRJsV89dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717505175; c=relaxed/simple;
	bh=rXkB9HSCpKxWLSjih7qqbvvJKhAnmk8tL5d1yBuTZvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qV2nKylskX1aX/y1H6mR/960mNjQ8uGatUrP3f+CIiV7ZthD8e7niF9AiTLJ9bUOPBhcqDxUZjfZ1ndycq1o4et1KH/XNgJOy2/yy25fZf3o9PxsE0kq6M+8tbgwCaTwLHMrsX1tA1jrV96sZfn85mz1bXRvDyD1T2OyJfa+ans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ZZ9gtc+H; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZZ9gtc+H"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-6bc1fc93a99so600025a12.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Jun 2024 05:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505170; x=1718109970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RlFfGyvlYpwu5mumxxHK+PtmO5s3+buvtb+SvPxc6V0=;
        b=ZZ9gtc+HzFnFoM18eou/rOcC3NuD4FVSM/dEi8JicBScNDcQrq+bw+4b0PlcchXbcJ
         Es+wj3Zsf0jnCklYbhskBaJIqBBW9kwgkV/qoUgxySJ5t+seyFhQEFscN3u3CZqERisw
         XtTsa04EFvTWu/faxFMeiQsK4r63Q4WMVTCZQpZVFI2fascUv0bW0qlvlFb6A7WDeXR4
         k1zQw8XY9TI4O0ki2x8QW4vq/HdIG7a7DODs8tqOFulQ3YfWoM5qiGBmnhx910yQed71
         Ml8l6ilx05hOOGkLF3BgcYu7MmJB6DvC22dxAKFEuCm/3Gn2aYDo1DwPlY9EGgtsvY5T
         iMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505170; x=1718109970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RlFfGyvlYpwu5mumxxHK+PtmO5s3+buvtb+SvPxc6V0=;
        b=LfM9YO1oSbTAJ+pI7nGF3nByrjMdeXa8i5c2v5pvxu8vqvylj75flwy8p+Yw+47J3e
         xFw5WBY5w60tbhsvw8y2hCmEMg2sYmr2uSFFPtZJcrlD0/UlKZQfb5fNudCdaMVuNBDL
         oD84aWSWGT2e4DCKecEfqsO/N2t82wkHvKIVxqQ6mjlkx0o2ro+/dOgO5wDWV/DkUA95
         f0bLiK0haILcQNHiuok/0x6l92OQQIZFx3EoWfYktUvB5aQ0Ijkk10a/+vA4YThSvQ6e
         yeotDlN9FS6r/TwC86OCQxN2sZWAKOlyZwHdfWPIANtUGDEaXHPUFnDqUBrjKx5Vq1ud
         JvBg==
X-Forwarded-Encrypted: i=1; AJvYcCVHDCV2tZcX+lmLgLMUJWMaInuxJuCkIM9vrje/+ckgjX+qqZM/36LxQ4WP47VTz1Z6gTuCj22Q2X0GrmlElK7PQJ7v/57WCl0u
X-Gm-Message-State: AOJu0YxYMEO81EIuy0Xpzu/yXpzQC0uVUgfKbT4L4wLxezhJ9yXbkRqL
	V/wWuWHqDhljxJi9VEqnxH+/KG7wQNLMDh5co0SAVWLB/NDgnVUzCR9kXnkowv0=
X-Google-Smtp-Source: AGHT+IHYa0Aw6/ZCoGM1K6W/t5DQ4yQlSVhFECl9FxLx/IWFviwLhyvqWExcUz4B81YUgol+CdCuQw==
X-Received: by 2002:a17:902:ea0e:b0:1f2:fbc8:643c with SMTP id d9443c01a7336-1f6370f2847mr137326235ad.3.1717505170463;
        Tue, 04 Jun 2024 05:46:10 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:46:09 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v6 00/16] Add support for a few Zc* extensions, Zcmop and Zimop
Date: Tue,  4 Jun 2024 14:45:32 +0200
Message-ID: <20240604124550.3214710-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for (yet again) more RVA23U64 missing extensions. Add
support for Zimop, Zcmop, Zca, Zcf, Zcd and Zcb extensions ISA string
parsing, hwprobe and kvm support. Zce, Zcmt and Zcmp extensions have
been left out since they target microcontrollers/embedded CPUs and are
not needed by RVA23U64.

Since Zc* extensions states that C implies Zca, Zcf (if F and RV32), Zcd
(if D), this series modifies the way ISA string is parsed and now does
it in two phases. First one parses the string and the second one
validates it for the final ISA description.

Link: https://lore.kernel.org/linux-riscv/20240404103254.1752834-1-cleger@rivosinc.com/ [1]
Link: https://lore.kernel.org/all/20240409143839.558784-1-cleger@rivosinc.com/ [2]

---

v6:
 - Rebased on riscv/for-next
 - Remove ternary operator to use 'if()' instead in extension checks
 - v5: https://lore.kernel.org/all/20240517145302.971019-1-cleger@rivosinc.com/

v5:
 - Merged in Zimop to avoid any uneeded series dependencies
 - Rework dependency resolution loop to loop on source isa first rather
   than on all extension.
 - Disabled extensions in source isa once set in resolved isa
 - Rename riscv_resolve_isa() parameters
 - v4: https://lore.kernel.org/all/20240429150553.625165-1-cleger@rivosinc.com/

v4:
 - Modify validate() callbacks to return 0, -EPROBEDEFER or another
   error.
 - v3: https://lore.kernel.org/all/20240423124326.2532796-1-cleger@rivosinc.com/

v3:
 - Fix typo "exists" -> "exist"
 - Remove C implies Zca, Zcd, Zcf, dt-bindings rules
 - Rework ISA string resolver to handle dependencies
 - v2: https://lore.kernel.org/all/20240418124300.1387978-1-cleger@rivosinc.com/

v2:
 - Add Zc* dependencies validation in dt-bindings
 - v1: https://lore.kernel.org/lkml/20240410091106.749233-1-cleger@rivosinc.com/

Clément Léger (16):
  dt-bindings: riscv: add Zimop ISA extension description
  riscv: add ISA extension parsing for Zimop
  riscv: hwprobe: export Zimop ISA extension
  RISC-V: KVM: Allow Zimop extension for Guest/VM
  KVM: riscv: selftests: Add Zimop extension to get-reg-list test
  dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension
    description
  riscv: add ISA extensions validation callback
  riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
  riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
  RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
  KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
  dt-bindings: riscv: add Zcmop ISA extension description
  riscv: add ISA extension parsing for Zcmop
  riscv: hwprobe: export Zcmop ISA extension
  RISC-V: KVM: Allow Zcmop extension for Guest/VM
  KVM: riscv: selftests: Add Zcmop extension to get-reg-list test

 Documentation/arch/riscv/hwprobe.rst          |  28 ++
 .../devicetree/bindings/riscv/extensions.yaml |  95 ++++++
 arch/riscv/include/asm/cpufeature.h           |   1 +
 arch/riscv/include/asm/hwcap.h                |   7 +-
 arch/riscv/include/uapi/asm/hwprobe.h         |   6 +
 arch/riscv/include/uapi/asm/kvm.h             |   6 +
 arch/riscv/kernel/cpufeature.c                | 278 ++++++++++++------
 arch/riscv/kernel/sys_hwprobe.c               |   6 +
 arch/riscv/kvm/vcpu_onereg.c                  |  12 +
 .../selftests/kvm/riscv/get-reg-list.c        |  24 ++
 10 files changed, 375 insertions(+), 88 deletions(-)

-- 
2.45.1

