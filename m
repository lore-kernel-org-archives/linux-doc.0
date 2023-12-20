Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA9E41212
	for <linux-doc@vger.kernel.org>; Wed, 20 Dec 2023 15:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="e/P1rVcY"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50bcf41379bso1520387e87.1
        for <linux-doc@vger.kernel.org>; Wed, 20 Dec 2023 07:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703087860; x=1703692660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXGoVjd4u7kYD7llneKYEOWLFOV8IcsaMr6UiEiL8lA=;
        b=e/P1rVcYmUsiM1fmhSSFiPrqRd8lPfUKcqkqZ7SZ/A7pKZ/tSf2GzBNbeRhjsMNFci
         HTLWJPkkHL4UD5dA4mbWb85ohq/10Gm4FGl+nY8y92irooWsF7ix7hOuPImdgr69T64b
         hlwedr0RAk4uNU9toPWZim8nhfalmtIugZGydZSKyCKbQUA9sAKTbREtpYnrdnx7j6MH
         EXcUOCibfKZiVORp0gk+pVWMP00QBhzbUl/2ehHjSkGc3QU5NK3IZd8IUt7i6BwlMGB4
         AvPf3XFancLBjd570dqHc0vehvTpPtQBD1IGID8TmU6F4GTFPUPvoxU8AsXDbJ1D1SOz
         xmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087860; x=1703692660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXGoVjd4u7kYD7llneKYEOWLFOV8IcsaMr6UiEiL8lA=;
        b=SxfF6QdAwgPO0KUXzsuwiw3xKCeYoJyxXxFxhUv0NcjTFBBf+Iq9N5JfyryiqPmaxf
         KxoD5S5EoPDShl1iGLiVCO1WJujBTyEIkRToZJOca8sUm4UaQwtik989yVVhDuygKfgX
         iRVlcl7W9K+z1RAcOGGJgl3+fqBF2Ul+4xnXInuqgCv7nxKhz/eunAUA+y5t07gNG4mg
         VPN6XUstcd6Lnu7cUXElIMQWIWq0agd8UCLUMo19ZmH//7rojv2aJ/Iso9RUI9QRhblK
         WncrG+3xL6YC4D+jl1rsK7aoeYU0jn/jg9VtFBhigE8ny7lo3r8gis90JAgHB2Xce6Nj
         O1hQ==
X-Gm-Message-State: AOJu0Yz6xwh2Rk85hLOAL/Prw0HaZhAejxeNS9O1d5n3kZJ5qY5k16xn
	P7TZTD6WHnRCLiuzqc5mA9zmEMXJbPqnJfni98/Oog==
X-Google-Smtp-Source: AGHT+IGvk4pAMVhFAQz7BALeRDKatbOjz/HnD6L+wq8WrKnoDOVFvFkoMQFUdTnt9ae82wR35gTXGg==
X-Received: by 2002:a05:6512:3a95:b0:50e:4a7b:f506 with SMTP id q21-20020a0565123a9500b0050e4a7bf506mr2980459lfu.4.1703087860189;
        Wed, 20 Dec 2023 07:57:40 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:3eae:b70:f27f:7aa1])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b003366af9d611sm7279693wrs.22.2023.12.20.07.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:57:39 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: [PATCH v2 0/6] riscv: hwprobe: add Zicond, Zacas and Ztso support
Date: Wed, 20 Dec 2023 16:57:16 +0100
Message-ID: <20231220155723.684081-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series add support for a few more extensions that are present in
the RVA22U64/RVA23U64 (either mandatory or optional) and that are useful
for userspace:
- Zicond
- Zacas
- Ztso

Series currently based on riscv/for-next.

---

Changes in V2:
 - Removed Zam which is not yet ratified
 - Link to v1: https://lore.kernel.org/linux-riscv/20231213113308.133176-1-cleger@rivosinc.com/

Clément Léger (6):
  riscv: add ISA extension parsing for Ztso
  riscv: hwprobe: export Ztso ISA extension
  dt-bindings: riscv: add Zacas ISA extension description
  riscv: add ISA extension parsing for Zacas
  riscv: hwprobe: export Zacas ISA extension
  riscv: hwprobe: export Zicond extension

 Documentation/arch/riscv/hwprobe.rst                | 13 +++++++++++++
 .../devicetree/bindings/riscv/extensions.yaml       |  6 ++++++
 arch/riscv/include/asm/hwcap.h                      |  2 ++
 arch/riscv/include/uapi/asm/hwprobe.h               |  3 +++
 arch/riscv/kernel/cpufeature.c                      |  2 ++
 arch/riscv/kernel/sys_riscv.c                       |  3 +++
 6 files changed, 29 insertions(+)

-- 
2.43.0

