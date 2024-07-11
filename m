Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75B81A08BE
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 22:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720735252; cv=none; b=ZL9NZp7yEf2sO+lu57L68F0srrf5Ep1CDC3KcV1743OiIrZFpOk94IzGP9PBlf+aZv3j0gIx50RB7FZUflV+D8mGo2cEHzn68sPhp+CBFyFK7cVmmt122aunNTgnfEpFx1HaTPge+MIXkTQv1S7sZwA3u4diWXEn2FTYv4cNomY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720735252; c=relaxed/simple;
	bh=tsBFuB/PjfmD1aMuhYIz9kK3UffrpNSMuY1oBJAsP5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Emwk3xcDXlo88cOLd+GuY7uVVGJpf65Pi4eUSi2MS62ga3Nt9fmVEpnHDPWlzOYOE+vlHy4ta1V5S+FRUSo/bjL9a0Djyn/W9shW2vyOLUgrO277A5cXtVCEkKrE0LjQ1qiHmJAdmpX1Le8kCQEiLVvI3dB8GwVsDSlJbBLH+Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=JY1HB6n0; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="JY1HB6n0"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-25cba5eea69so658253fac.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 15:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720735249; x=1721340049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/pkJ+CYoKZVnlzYRMEGQL51DBzuBqhU5kxPKcWTdXk=;
        b=JY1HB6n0h2el0okF6glngqQ5Xf5wn04r9+DOHOb0R5RN5VbgFQzW7tZfCmp8C1zjGF
         0728kslRsXrv98FkT8m+JCz71QjwTGgIpy08QLFDM46xGnXWVgZ+dyQNHS3Mg4pXYyMn
         TVw6sXHq20zcZNTI0s6MK3MVkntPNEMAaRF4Ye7TJn7fxSi9uTP/y4V79okhMuPlcjab
         Y8ZGkOH9LTdm4cVi90PjaU3MRsG9GVRMguh9YzHvWqXhDnqORWILa/69k0hkpSVURrgr
         4E0G8Fu/x+qeGWXsB3qRlXY8N5g2yQjdiamDE2EVIL4PQ7jGqwSYCGziV7DAg+5kPTXv
         M8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720735249; x=1721340049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/pkJ+CYoKZVnlzYRMEGQL51DBzuBqhU5kxPKcWTdXk=;
        b=bLrdnmLZMKXOWtI1VvWPxxc2FJpDEUdVCV1tFxHv8VHfkWAYnTeAMnN7GMbKG1IT6N
         fySIaKoRKTX6uv3JesI45xCI+Wdle10k04JMK/JUkiQmvNVWRj1rHjeY0jU7IdIEx2p5
         GGqfCHzm229x8EwX74katVNBSTLtQ1IwdujEt94khFV1GD1F55HeDV0LkpI9ZvRbfKt1
         KcC6u8u8BCtO3vOJEstzz13KEYRgiJ9vMoGD71eU+Ugxv/uxPzD3Kbvak7yk9Wz+hw8j
         rAFs/NIGhTSt1z07SFVZjnW+ohW+q+PujpFoiCM3YfXhqjA8eKIxi0NYEWo5YsT7wVKI
         49pA==
X-Forwarded-Encrypted: i=1; AJvYcCXFbsfSCoD8y+/EcWmsV5yd0ychZ7xjV/n6RyoSuaS473U4FogLn/0mEsK5UjU0OwFE2OsFpIzP4FYHrA88nAKedCU+pQaHaIx2
X-Gm-Message-State: AOJu0YyjD6kiyiWmDcGMYVCMh8r43Vr7VtFEpyIRDOX6/4Idswl6NZfL
	Yfdth9hmaCKwbUbZ+TCN/9l1MsSw0GlviHTnEVTyNnnCxh2mChoMz/luaLJn5vo=
X-Google-Smtp-Source: AGHT+IHeT6FLUowuVFqR9T9fPR4cUTBZzugpJS7X9OZIU/p57BGSiUAt3X+LIR8D5UvHFasnlUUxXw==
X-Received: by 2002:a05:6870:9a0c:b0:254:a009:4c2f with SMTP id 586e51a60fabf-25eaebdf9e8mr8862381fac.37.1720735248677;
        Thu, 11 Jul 2024 15:00:48 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43898b10sm6169431b3a.7.2024.07.11.15.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 15:00:48 -0700 (PDT)
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
Subject: [PATCH v4 7/7] RISC-V: hwprobe: Document unaligned vector perf key
Date: Thu, 11 Jul 2024 17:58:46 -0400
Message-ID: <20240711215846.834365-8-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711215846.834365-1-jesse@rivosinc.com>
References: <20240711215846.834365-1-jesse@rivosinc.com>
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
---
V1 -> V2:
  - New patch
V2 -> V3:
 - Specify access width
V3 -> V4:
 - Clarify we're talking about byte accesses using vector registers
 - Spell out _VECTOR_ in macros
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

