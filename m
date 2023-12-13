Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="OSKnrqJg"
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72BE3E8
	for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 03:33:14 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c9ebc04891so16179121fa.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467192; x=1703071992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Atjvu7OpzxGHnkPKQqqXLCnjWBuSkCnCszNZgaSB4s=;
        b=OSKnrqJgH19YrIIAPWS75xo34p2ioAIwMXE+I1DXvozttVQeL0NALcKpVnB1nsEAQc
         7HOQLQu5x2l0H645yjf3zWYf1bLCKZwY//8v2Yky7K+SkS0RvaUhljcyjxxTz0jVBfAT
         bJAW1caZFxTy+XcJaAYxoUyuw4QAkNTFokCZCS0DphgUTKVcdgvv/jh9ENWpgfvyRRXB
         5mfic6L9olBpaI8mropePCVLkiryylGnlIbdwrzubn9iCKFpXLybpkVsUtq4ADOyECyh
         BeMkLluuxBtss233mxpLUiIgQGmbZgisugGpVNISjYAPzEVOlam0+eVGyuE8ctTfOQcm
         PRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467192; x=1703071992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Atjvu7OpzxGHnkPKQqqXLCnjWBuSkCnCszNZgaSB4s=;
        b=eB3fhO8k3h5r9qPIxTjOIn72eEtLOh6r/vo5t97RUYiQu+sC/Z2TD3DP26NCM4Ymim
         HwRy31JMMH1dtCHg0/gjLyBxKXLIDWXSt/J0PXwjVmxyi6+jNnch59C2uPWTLSH9g12Q
         /5l2CJVTgEDFhooJRLfFZOLnvSn8FhNSxAw2HhiCgTH+yTGju1cl6rI1aUs8aF05ZJEq
         Kcs82IaaqsccSKyng85x56B/pjhFjD+TT34k3rrtnVpdecSbWEZIMhad1zvW+n1qFEv+
         5Qyi8Ac0lRPmsQFRTQGGzurL1v9ZwrxogoPYx50sIiOInDDgV589bcZiXpbpX5gU82l8
         MiLw==
X-Gm-Message-State: AOJu0YxmJGMSrlUrcQj5qTPpjGkXH0AHTQXJbqQ9N7p0laFw2tOGRlGE
	g7/W48kPQCsRaGkl4iqFtVyH9pHqIi3/xsT4EDw=
X-Google-Smtp-Source: AGHT+IF28n7Q47rA9vhQP7ckQSu28DeDIVuzSbICtoXTbPIgLDR3icG5MBbRpeB8E8SvlKm6RVJPvA==
X-Received: by 2002:a05:651c:211e:b0:2c9:e7cb:fe8e with SMTP id a30-20020a05651c211e00b002c9e7cbfe8emr8509940ljq.2.1702467191993;
        Wed, 13 Dec 2023 03:33:11 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:11 -0800 (PST)
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
	Robbin Ehn <rehn@rivosinc.com>
Subject: [PATCH 0/9] riscv: hwprobe: add Zicond, Zam, Zacas and Ztso support
Date: Wed, 13 Dec 2023 12:32:56 +0100
Message-ID: <20231213113308.133176-1-cleger@rivosinc.com>
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
- Zam
- Zacas
- Ztso

Series currently based on riscv/for-next.

Clément Léger (9):
  riscv: add ISA extension parsing for Ztso
  riscv: hwprobe: export Ztso ISA extension
  dt-bindings: riscv: add Zam ISA extension description
  riscv: add ISA extension parsing for Zam
  riscv: hwprobe: export Zam ISA extension
  dt-bindings: riscv: add Zacas ISA extension description
  riscv: add ISA extension parsing for Zacas
  riscv: hwprobe: export Zacas ISA extension
  riscv: hwprobe: export Zicond extension

 Documentation/arch/riscv/hwprobe.rst             | 16 ++++++++++++++++
 .../devicetree/bindings/riscv/extensions.yaml    | 11 +++++++++++
 arch/riscv/include/asm/hwcap.h                   |  3 +++
 arch/riscv/include/uapi/asm/hwprobe.h            |  4 ++++
 arch/riscv/kernel/cpufeature.c                   |  3 +++
 arch/riscv/kernel/sys_riscv.c                    |  4 ++++
 6 files changed, 41 insertions(+)

-- 
2.43.0

