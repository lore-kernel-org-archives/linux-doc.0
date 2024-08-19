Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655EC1E2100
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724102800; cv=none; b=ZVV5RfgLHQNGJnbiEUQ/sEAgvEAc/BsjweU4+HQ9jdIKNWsrKKGNVZ2v5xNlg0ZD1bWXT5KD6NN9N8lTr+dDFQOOh0FBvctHT59g8XyhAzGWzbDnio+yFMYjZQljq0Vkw1We14OanZX9GfEOHGn1MVl5TDcjwZLsT2ZnH6AvXig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724102800; c=relaxed/simple;
	bh=vyBB2VPkbo/YguQxEyNKoXCcndWMcAWDpN6VCQ31fRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JlttGeKvhDjjj+rI0qZQql8/5oZZpjCZ/DtsM41yyCY52w5YmWLsK6JI2oihM8EFxXzXkJ7mc1y/ineaYjI3fiP23tGt7Lh6sUE7nUmwgpFCjAmYGZoHz9baptkMNzs4yxEv9MGEqh+PaypvrDIwiuNAKBijS2rkofbcb1V4cfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rJsz/ZUe; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rJsz/ZUe"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-713eeb4e4a9so1169503b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 14:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724102797; x=1724707597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s43X7evCjKi9zInSsUCIPGJsRlY2xGUJ2ODl/cGyTuw=;
        b=rJsz/ZUeq7N6hmFhfWUADKk7+rMOeO1hD/V6451K99x7VSgH1B3zVz39D8YuqWaM66
         ZX4p1O1TiJ67790+gutcOMFrRFswoIeWdL9nl3OTLfZdRZhqRf+LzHpSFf6/KDoHUB2N
         zv0JFS9aJpsJd8R/gaksbG1tV2c5Z0bv5izLFP4uh/+UKV9GqaPEeMspwbvS3hpAhWHI
         L3v79fah2/5BN8gaO/1Z0ubFXYMImRt83gXmfNNL9VrywsHdYzNv7nQvOFQytig/93L6
         JLGnHDygdqrhWv61T0wWOLvTQ3p5pXdF/ub5lce3eSEhB0jytyfsCDHDkVQkQ9J3I2Jn
         K3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724102797; x=1724707597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s43X7evCjKi9zInSsUCIPGJsRlY2xGUJ2ODl/cGyTuw=;
        b=NUcYXf/QQk/3OSKhUYOjKfjSunN1eHD/Iqoz9Cvukeyla8VOk4OiFRuXVdcx7zUNaF
         rGerpAHA6uOE7QdzDh6IDGcqxBTnvCeUx6fr+Xa+OQFM4XsfETVPxGVNH3YGzUyqnP03
         6UQXac1akG1BRCCv+cW9el1K2LCavBYrVAyLp6R1Q8W+1Q/cjOwP6X8mGpfSn4ar27tn
         epWjF8IO2IVKjvtT9R/gfEX4g7CsrgKXaHcemKKqDR8P7v0molnAZXx4y/2Z+KKxqlGQ
         36EfbFphH3ltvmuS3Sl+5HIA5tTuSFqB20OFk0Ye3mL5mafGHgIZTB6C8rJMjx9omwGe
         GK5g==
X-Forwarded-Encrypted: i=1; AJvYcCVoFd8eguKhgj3N8wUKLVpAfSU8D0L9Come15Lh35E3EICq7yEc5GZenY5Wu9D+04qvoxROqsNBthiQ3TzrABV3aaAHEeZhFAfh
X-Gm-Message-State: AOJu0Yw6vNJD5B55hA1k8NQ3ZMLNNS5EVDG/dRe2O3z7cAQtHlyjpLen
	oZq9pF61zVYGaguJJLSUvvYQ6DpcuOew4+C5QGpl4i/CsBZr/CgwtcTGBHabVSM=
X-Google-Smtp-Source: AGHT+IESrilsqeNFnuhHuDg2m5x2ld10lJLnQAZcYJQoTxOQaJmA8uC159f9B38i0ENzTWeHkfim5Q==
X-Received: by 2002:a05:6a21:2d84:b0:1c4:e0d3:9637 with SMTP id adf61e73a8af0-1cac8fbcd34mr520343637.52.1724102796643;
        Mon, 19 Aug 2024 14:26:36 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61e7bd1sm7004694a12.53.2024.08.19.14.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 14:26:36 -0700 (PDT)
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
Subject: [PATCH v8 6/6] RISC-V: hwprobe: Document unaligned vector perf key
Date: Mon, 19 Aug 2024 17:26:05 -0400
Message-ID: <20240819212605.1837175-7-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240819212605.1837175-1-jesse@rivosinc.com>
References: <20240819212605.1837175-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document key for reporting the speed of unaligned vector accesses.
The descriptions are the same as the scalar equivalent values.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
V1 -> V2:
  - New patch
V2 -> V3:
 - Specify access width
V3 -> V4:
 - Clarify we're talking about byte accesses using vector registers
 - Spell out _VECTOR_ in macros
V4 -> V5:
 - No changes
V5 -> V6:
 - No changes
V6 -> V7:
 - No changes
V7 -> V8:
 - Rebase onto fixes
 - s/RISCV_HWPROBE_VECTOR_MISALIGNED/RISCV_HWPROBE_MISALIGNED_VECTOR/g
---
 Documentation/arch/riscv/hwprobe.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 85b709257918..ea4e0b9c73e7 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -274,3 +274,19 @@ The following keys are defined:
   represent the highest userspace virtual address usable.
 
 * :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `time CSR`.
+
+* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF`: An enum value describing the
+     performance of misaligned vector accesses on the selected set of processors.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN`: The performance of misaligned
+    vector accesses is unknown.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW`: 32-bit misaligned accesses using vector
+    registers are slower than the equivalent quantity of byte accesses via vector registers.
+    Misaligned accesses may be supported directly in hardware, or trapped and emulated by software.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_FAST`: 32-bit misaligned accesses using vector
+    registers are faster than the equivalent quantity of byte accesses via vector registers.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED`: Misaligned vector accesses are
+    not supported at all and will generate a misaligned address fault.
-- 
2.45.2

