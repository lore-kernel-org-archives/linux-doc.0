Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5FA16F828
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 18:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721846214; cv=none; b=gifTS5mM0XZpax2a04ojx8j8I/rjFlIFp/MhHfXvAGaFYQTWldx23z6OMGS7omHbbOpmtDu2g/UquwkQbH1+j7a3RvkYv9pQowzwFTKCruli+7s6WKHUYttXnNa9AgUM2Jg5jWlXCzgpvUSrfh9XPlbAq2u5zsh92lpkgyvnz5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721846214; c=relaxed/simple;
	bh=a1/mTzZfYWixOKvw7hZJPsNckjOGKvrprzOVGR3f+AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbYZ0uXlJ5CYxjcfExINJT2twxT3rLK0gbZ8yReIjjW1aRlybeWdL6agZ/RMqUHpOsyfiR1k3gxAEmIMz05cw7JFXG/UBiiT3O8TYRm4ap2h3oKN8m3i5G+PDVLxgKxjYesyDIczN+mxqaxc2RFdJncqjfKM4Y5Qg1uZv0bcPHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qYfacdvw; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qYfacdvw"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2cb56c2c30eso894925a91.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 11:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721846213; x=1722451013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EB5PDESy6Qo0Jcu13SGskHFDRhed/H4Oxxes6IQLnyg=;
        b=qYfacdvwxE87alPlFYRl6yItQaO4caMDifwmP+517389oqUxGCNsdUkE+8JSaN5+C3
         wvWGzt7C6TyJDszw1Vd2l8gBjNS+cBO9GXr1yL80nT0sRbc/iC34TW3h1NMBeNzOmFGE
         Cnjnp7oYXPvxfPiEggxyET+RR/PaKNniMPcOQ7H6I7obUHWBdQ5EGR+o3HG2zLe8ZO71
         1bn7dT3XsT4DXRkmCYA9rzt4yly0KkDGleP0QWqU3NoCPhM97UPffFaok4SZgFS4ohPQ
         TzR/9uHIKCMGSVjyeJh+C2KcBBt5T7UsGQ50auRHwDvizGB7cvo/q0lEUM0dGeJMhVcF
         DItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721846213; x=1722451013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EB5PDESy6Qo0Jcu13SGskHFDRhed/H4Oxxes6IQLnyg=;
        b=kuqgrhRIYYqkATEIUQLdPIuz4o6a16hm/BbQtrVQJBFYNGiN+3Hi1NU9/YAyis3Gaw
         ViaR3RCcRAzxtudoGXoK/jFpg7lVtIlZNWeQ0V0MV1c9HmMgi+uZk0sJs1KKuDUqOH43
         HY3WgFyzBhI9gerCfPzosyRN1QiBtd2rZHxi5SS9/d5wARKosj9bDLz2C+sKV5a/t8WY
         /BWqmBBJj/OCSOX8Pa0StzWK1ahEQnZG3FBwIX9EVQc/A5yLG7+s9yAcEig19hDEOGAz
         lxZ9QCzebYSnzomnI0EvnHorrAJPlPh2SrMIArlLpVtoxCvuO5cKDLEck9W+uHgv2KXE
         p34A==
X-Forwarded-Encrypted: i=1; AJvYcCXg5ob7utTmOleE9v9BRx3P0tDWaNvRAi7ei3cCW7+64qOl3KKBISmDBL1VEqMP4PaOsPK1aXXGbOy/ZmDpgYM5Z+nVdTqfqYBc
X-Gm-Message-State: AOJu0Yx9mOfe7Mhnf3HgHGKqjiuy8xccrg2VIqEGbm3E4sbu/viA7658
	8PzGJVbztHSFxf0D7aK4diA7z9UNyfI5lNraTfYEgIU5fls6+G1XI6GXT1y+m4w=
X-Google-Smtp-Source: AGHT+IFVaKgpzXil+XU1Q9k4O5zrYBjVM25TgY3w5TlHHmjl9+GYW2Lt07senY0UmNriHZYrgPG/Gw==
X-Received: by 2002:a17:90b:1b06:b0:2c2:d6ca:3960 with SMTP id 98e67ed59e1d1-2cf21f48eaamr801050a91.17.1721846212621;
        Wed, 24 Jul 2024 11:36:52 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73a189esm1997830a91.2.2024.07.24.11.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:36:51 -0700 (PDT)
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
Subject: [PATCH v6 8/8] RISC-V: hwprobe: Document unaligned vector perf key
Date: Wed, 24 Jul 2024 14:36:05 -0400
Message-ID: <20240724183605.4038597-9-jesse@rivosinc.com>
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
---
 Documentation/arch/riscv/hwprobe.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 78acd37b6477..f83a13dc4cbc 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -238,3 +238,19 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF`: An enum value describing the
+     performance of misaligned vector accesses on the selected set of processors.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN`: The performance of misaligned
+    vector accesses is unknown.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_SLOW`: 32-bit misaligned accesses using vector
+    registers are slower than the equivalent quantity of byte accesses via vector registers.
+    Misaligned accesses may be supported directly in hardware, or trapped and emulated by software.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_FAST`: 32-bit misaligned accesses using vector
+    registers are faster than the equivalent quantity of byte accesses via vector registers.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_UNSUPPORTED`: Misaligned vector accesses are
+    not supported at all and will generate a misaligned address fault.
-- 
2.45.2

