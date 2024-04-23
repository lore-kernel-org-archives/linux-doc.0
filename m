Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA804B5CD
	for <linux-doc@vger.kernel.org>; Tue, 23 Apr 2024 12:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876223; cv=none; b=MfVYq3QM2rFaK4QEOT/PK8OPOnNzH0bsPz9A/Gku+Tq0EhdwudO/FGnuOR6op3O9/j7n3w259Iya/CZlokM6O6lnUOdZ68oYBYHoV2uDlYkzc1lK+D1TpTi6Dy1ZyOzkFpJZ81ek/6AItZo5MHf2tTehZBf3RAi6I0oxBaDipp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876223; c=relaxed/simple;
	bh=KFTgdydb4lEVKcKMSrUXTV8nL0BiY5SkmBYLlzxl7F0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lPZLsPz41tmb719/pFUV3K9FZQFmWPpfVramLwd9f7aae9kxLnDFFGV+rK4CNLMN3JdXBPqgfX23qBccTn21MU59OFhU93PJzC3BlqXi9vITuMBheg5xn1PJiIoUj0WS+pf6BQg7Z7pPzH2/PBxklAcGK/wC07kOOFTuk8X/z60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1MLIH4z4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1MLIH4z4"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-349a31b2babso830128f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 23 Apr 2024 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876220; x=1714481020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C9WxKxISE98J4DR8ayongvF0iJ3p8rHkiA1LnrlMpVw=;
        b=1MLIH4z4Q+7/YnVtmiaHYKGDV7pr/oww+tOY7BaRCpi07buImlOwcJoqNXnFtKbdgt
         Gw6HuSr9pNM34RB90Cgts/q6gmDiQONj5XVxY9o/WSt2jX32M6c1X69uzOXaR6HZypKR
         nGPSVfQoC9UmJX3DEm9RPUPzZKbD3J2LNIXiO4Au5mgqDvzpWvIDRt8UtrYrj10DIuK8
         l/IF0/Q2HlmSsZ792Su1K8wVeFF0n/4l+EpMY5U1sLwvD1J+vuHE/zIFnvkNm+rRCgHw
         6nPjR51BAsLPMEyHvDAO5fbYew+Z35TsskqB6gArk4nyUdXTp6VbCib2YZiPqWWA3dEE
         ZwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876220; x=1714481020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9WxKxISE98J4DR8ayongvF0iJ3p8rHkiA1LnrlMpVw=;
        b=QFaAQs1KodHIsKe9nKdEre3dhxwbB29dzxbWaJZXw8YQQl43+Hw6BT8eV8sebH443G
         oYU9ED8woV21WiCUf+oyx786cUH47dPZ/c3jk2ibd0uuWCRoTCJmGHnGDSLwVp0vV47K
         iFs9WUXhZuAlYM/aVSgE+WaYJea/UPuzYQQ4SU6BgNmV6oOjcU1DSbpdgNsNbPJb1qc7
         5OvCFfl0GzKRCuwZxeMsRO7u9EgpSDJ7pgvWAuRatEI2RmUIIXYOHpZpSZQeF4WxP0IW
         POLYvBLhj3ur31bhDgWypGDLP/flfILUAXm56SWrTuPXVTnw2hwmJIqTH5c0nY+VUC/Z
         kA8g==
X-Forwarded-Encrypted: i=1; AJvYcCXIRUkmKQNas5tfSV9CKWgFPQz+KHZIqUEDVITvrnBmkXtBk3hE0JecxZvy1vovBJ1WNCUHHhJEPFk8TwtQLwmfr/HrZfBxMD5D
X-Gm-Message-State: AOJu0YwfU2yERUvzPw3MiZXJiaNZuZXQ2TQvY+qNX1SUUQSu6H9FMp4k
	VK+RE2jHZhMRR1mGMjP8FYbMo5bLBW7TForE9TPjvZzeyMdwhB11sjmuZxcHRuM=
X-Google-Smtp-Source: AGHT+IHpI2Tpv9REfejw04rEmQ/PVuDNtz+wncAv+sSz/yClI0MXsOsXH9hJ+L4XIOgzD6O4fSViLQ==
X-Received: by 2002:a05:600c:1c90:b0:41a:b9a1:3ecc with SMTP id k16-20020a05600c1c9000b0041ab9a13eccmr1166991wms.3.1713876220072;
        Tue, 23 Apr 2024 05:43:40 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:39 -0700 (PDT)
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
Subject: [PATCH v3 00/11] Add support for a few Zc* extensions as well as Zcmop
Date: Tue, 23 Apr 2024 14:43:14 +0200
Message-ID: <20240423124326.2532796-1-cleger@rivosinc.com>
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
 .../devicetree/bindings/riscv/extensions.yaml |  90 +++++++
 arch/riscv/include/asm/cpufeature.h           |   1 +
 arch/riscv/include/asm/hwcap.h                |   5 +
 arch/riscv/include/uapi/asm/hwprobe.h         |   5 +
 arch/riscv/include/uapi/asm/kvm.h             |   5 +
 arch/riscv/kernel/cpufeature.c                | 249 ++++++++++++------
 arch/riscv/kernel/sys_hwprobe.c               |   5 +
 arch/riscv/kvm/vcpu_onereg.c                  |  10 +
 .../selftests/kvm/riscv/get-reg-list.c        |  20 ++
 10 files changed, 329 insertions(+), 85 deletions(-)

-- 
2.43.0

