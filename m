Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAE283A09
	for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403195; cv=none; b=ocRAWR5mUSxhmrzCR/A1Yp7MHCzHy4pDWPRQFHa709KIRw7K7T4XAM4H5J2WEqmfVUf2V0f7RJAXLAOlklH7Bq36FQ537IWEYr6HtqM3dog6CndF9fQmHr8ZP+H0eZV/bMrbX9ItUnfzcac0jU7/zOuv8kIVLcHaeFJB5CGLaTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403195; c=relaxed/simple;
	bh=ZVcAG+OzER8E5YrxGpABeX9SY2L97uaCD62n5fHEDC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uoYEVNosakrs5SORUZY56JX3GbP84ihkKpHU4XKbqzLq+yCqAtP5EPRjeuloj5J3i5qJ6JgUk8jkUYNaD7Kpai++n0S0+UTip3pDTYUhWJzHSDXgTyYwY9HD2M8irHe08jtsj/8qTAZE/m0+dKLlrsKQysF+ZL01JqShpqbjf7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=NIZjB5Pm; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="NIZjB5Pm"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51d9af6bf36so199636e87.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 08:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714403190; x=1715007990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9QQSGk0Y9Ubz9htfULcfpBCmdaYN6MR+rakpquodwmU=;
        b=NIZjB5PmwUuRqPa4NzQd0fJ4uDlI5Q6lVyUH6dtrFfpQkDk4iDy3ucmvrKcP/aFEzz
         aSwFZEWLnpSaJ0bVbqUK8fN84wENhAWzJ0NlnALF7RPfdqAxU649yzRqsUgXp3xRg+8w
         JARGW4hMoyFZ13rSflhoOELX6ByuWZDp+tMPCoeXh1803kXNw/fF1H37/fESNVpPON8e
         a0nKfAbLoc8AeEQsIaW536H6o8X0PwfZaRMYVKPJ7IMwoHc1hw/3tWUe6KVgiocDzoog
         NDNuCtqOn4hW7M4X/Rs3QA/p2qD4E3bSAtJHQQWjYMSNT+1zAxCttNe1TevBV9c1nlR2
         Bnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403190; x=1715007990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QQSGk0Y9Ubz9htfULcfpBCmdaYN6MR+rakpquodwmU=;
        b=LYHS0z7dVE6Q4CiudqRhmleDMv8v4ooQD7jpRT1GsiOvJL6v3EIUvMwArzjQzmaqdR
         Eso2Y7k7avEm9MQ/THI3eysbj3+fOzXSw//+Js80ZijQq/1KZHOdv9ddt/rB7htfzsad
         64syx01NDjboL4uHXZTcmujQCaFskOl1dCUdjGBY3uwUtlaGdSG8jn7gq39lU6RP0BFl
         gNVWN34ujljPKgMGUTxS4/U6hUXaZCkzYAr0WtKAD/1YfYMhtdy7RKz7yUdxHRTMd81q
         LUl7yqVsfGdYqsRthrca+tIfK/r2H2p3r3zAHFu4URP8CtzIUur370mLmws2JHL7FM44
         6OLw==
X-Forwarded-Encrypted: i=1; AJvYcCXMWy3A7sv8i3XfGXcFm0K8eqw1fHB9Sc0QHdrPfihCyYqzbuEeI66h+dYisMjChLbUAelC5IWqUtDauf6FyJkHTbNcaDvFfihO
X-Gm-Message-State: AOJu0YxAaq6PmJ1BsCt2gmwUj7y9glC5cj7fERZLUPrUz3LsmsAaSzMM
	xur66ZsdgLvo5wOhjYa1cQAoq15cjxlmtpc/q3AqGZ6Q+qIQcbkv0CaGpOS1/dU=
X-Google-Smtp-Source: AGHT+IGpsgfHeGU47OML9OlpyOLM1Fu89w8RTY/kpzyJSvnqOjqxI7tIAWzXykio3VNUfhS0z6TjLg==
X-Received: by 2002:a2e:9547:0:b0:2d6:c59e:37bd with SMTP id t7-20020a2e9547000000b002d6c59e37bdmr6422086ljh.3.1714403189917;
        Mon, 29 Apr 2024 08:06:29 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2fec:d20:2b60:e334])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b00418f99170f2sm39646638wms.32.2024.04.29.08.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:06:29 -0700 (PDT)
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
Subject: [PATCH v4 00/11] Add support for a few Zc* extensions as well as Zcmop
Date: Mon, 29 Apr 2024 17:04:53 +0200
Message-ID: <20240429150553.625165-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for (yet again) more RVA23U64 missing extensions. Add
support for Zcmop, Zca, Zcf, Zcd and Zcb extensions isa string parsing,
hwprobe and kvm support. Zce, Zcmt and Zcmp extensions have been left
out since they target microcontrollers/embedded CPUs and are not needed
by RVA23U64.

Since Zc* extensions states that C implies Zca, Zcf (if F and RV32), Zcd
(if D), this series modifies the way ISA string is parsed and now does
it in two phases. First one parses the string and the second one
validates it for the final ISA description.

This series is based on the Zimop one [1]. An additional fix [2] should
be applied to correctly test that series.

Link: https://lore.kernel.org/linux-riscv/20240404103254.1752834-1-cleger@rivosinc.com/ [1]
Link: https://lore.kernel.org/all/20240409143839.558784-1-cleger@rivosinc.com/ [2]

---

v4:
 - Modify validate() callbacks to return an 0, -EPROBEDEFER or another
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

Clément Léger (11):
  dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension
    description
  riscv: add ISA extensions validation
  riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
  riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
  RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
  KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
  dt-bindings: riscv: add Zcmop ISA extension description
  riscv: add ISA extension parsing for Zcmop
  riscv: hwprobe: export Zcmop ISA extension
  RISC-V: KVM: Allow Zcmop extension for Guest/VM
  KVM: riscv: selftests: Add Zcmop extension to get-reg-list test

 Documentation/arch/riscv/hwprobe.rst          |  24 ++
 .../devicetree/bindings/riscv/extensions.yaml |  90 ++++++
 arch/riscv/include/asm/cpufeature.h           |   1 +
 arch/riscv/include/asm/hwcap.h                |   5 +
 arch/riscv/include/uapi/asm/hwprobe.h         |   5 +
 arch/riscv/include/uapi/asm/kvm.h             |   5 +
 arch/riscv/kernel/cpufeature.c                | 259 ++++++++++++------
 arch/riscv/kernel/sys_hwprobe.c               |   5 +
 arch/riscv/kvm/vcpu_onereg.c                  |  10 +
 .../selftests/kvm/riscv/get-reg-list.c        |  20 ++
 10 files changed, 337 insertions(+), 87 deletions(-)

-- 
2.43.0

