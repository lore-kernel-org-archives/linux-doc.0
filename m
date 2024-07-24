Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DE916C690
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 18:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721846184; cv=none; b=GZFr2ECEkdkQ6w8lqBNl+ou474pqpzFMISVPXR3qEIhPrNA6kkeqOPhNI9ADf1cJlVciQJi6lZo7EVLfkF7hZhK4seGkQZJslevvVKNT0pU8/r18BpxBYA9ELRYIFtMP3LwtDgkWrzp2Je1HS7KJE5rR/gG9ckcF0yChAj3JWr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721846184; c=relaxed/simple;
	bh=NkZY56+mt1V0i7e4GK/9lVY+JFswGZayTu7rI+JvHMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xtsop/iWLIOHePjnaEYx8Y+CT+a/hqTAKHmCOq2Zaw7Q7suRr1Qyw3J1ZMnJkSNeqVHCgg9TjsghizMS5pYbqZ0fZOHyQFkYDsDtcm2nXnYHb/mYyZnFe9lQOW6UD5gOgVQlcgcjr4trQ+1TIfkPfMUW7+F9ocNM5SvGk+sU8MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=eUTqcLVt; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="eUTqcLVt"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fdd6d81812so743315ad.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 11:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721846183; x=1722450983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GMGTUDyEMPZPRQbrhVrrT1wBy+Ea8+8tZqDMP6iisk=;
        b=eUTqcLVtxOm3rEQAmGJ2EowTSD6hrCoqF2Yw3X8a+dsMXs/VF3d3+LdFtFrFyQVmG8
         c7OyHN17VqbCkEmlsKGTa3Fu9HRWtor0nPqYHyTXHW2EBO5i75mZwrhj9eEwyb9ZghUi
         IYX3CuTGfIHUSFLzfzwT+cX2NgWV+Z3e7CV3vcbq6qpfx3Wy1LSDiErTxDafDpNADbLJ
         L1QJLRkU4m+sEq7MeV+VbLGYm2U0AwmSYLM50tpA8c7SksVcRtTq1T6Nd1LdlcdUGGIc
         wndp92w6NZg8zgULiNG/vsU/pTB+Ffe3miZYfUhqa1Ode6ro+nGnCWBP8Xbe9OPn30Ja
         1y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721846183; x=1722450983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GMGTUDyEMPZPRQbrhVrrT1wBy+Ea8+8tZqDMP6iisk=;
        b=Sd56cphaWzn1Tjq5tdxXX84ZRLY7fvCOJ3Ttrikx3PPS34K/2otkW53V9gafwopRfw
         uMjP1u9sCzDTaL+YsZwDswIG+yKJNexVT5V5nhEE0JFgBMWHmZ1z+dwXL6zg3hbXvx3+
         hfNEJ3b/2FITEcHXbQBtKgGcxLUWEEmXocBgYVzwBdYEsSIjewlatCzt/FEEIWgsxI3w
         aiPzVAV7WqKwDI8a3DJyZ5eIzyxS1HfQUGxeeggYHmn6VPqRZHQ4ruihD+nIqWlz1xVW
         5GfQBnitCjmaWbqPRKJIWN2Xc1ytOeBFL85ICfe7H4+3+l/hIVkOXvV454MvFvYdTc6L
         Jn2g==
X-Forwarded-Encrypted: i=1; AJvYcCXbLkLqlbH+N/lZoJJPu7OWB0QL87ksNyJtXVOmBzZmRDGBLawv2rvWzDMm/q6LLHPz13hRZmUHlyE7ta0KxRDbtmq44vXX++Zh
X-Gm-Message-State: AOJu0Yy9VDRMDOSuh7+suLTqjNYWV/tW8Sa+IX0dxP3i29T8MaBy9/C2
	ESqRKvE4XB7V+vp6ojoJocgl0lHeDKI26ygSX2qV4eSngPctJUHuBSN/gWrLp3k=
X-Google-Smtp-Source: AGHT+IHcxsxL5PKRr6EL0FnouwIrTDDXxRkbZnLzFn5sPLGCcy444dkDYSsiX+Ck+UDZ1DX+oV9EGg==
X-Received: by 2002:a17:90a:d344:b0:2c9:7611:e15d with SMTP id 98e67ed59e1d1-2cf237daffamr465749a91.20.1721846182726;
        Wed, 24 Jul 2024 11:36:22 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73a189esm1997830a91.2.2024.07.24.11.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:36:22 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 2/8] dt-bindings: riscv: Add Zicclsm ISA extension description.
Date: Wed, 24 Jul 2024 14:35:59 -0400
Message-ID: <20240724183605.4038597-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240724183605.4038597-1-jesse@rivosinc.com>
References: <20240724183605.4038597-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add description for Zicclsm ISA extension.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
V1 -> V2:
 - New patch
V2 -> V3:
 - No changes
V3 -> V4:
 - No changes
V4 -> V5:
 - No changes
V5 -> V6:
 - No changes
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cfed80ad5540..9f6aae1f5b65 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -317,6 +317,13 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicclsm
+          description:
+            The standard Zicclsm extension for misaligned support for all regular
+            load and store instructions (including scalar and vector) but not AMOs
+            or other specialized forms of memory access. Defined in the
+            RISC-V RVA Profiles Specification.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as
-- 
2.45.2

