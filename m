Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494A215026
	for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 20:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729110501; cv=none; b=D0dCLpnEXwOvBplgxnKLtLWx+H6KOvIwBR3hf06F0/9latgaffj9nqiNjbkoitIRrvwimj53jbXN8HcwWG0n9wvledBXuE7t2e1uQQRI2mDWkAMKeHsGAxX/rfI91jkB/Cq0B1Rm/d7QmsJX5NjIS7FiBwGpbnb2QnH4raAYvkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729110501; c=relaxed/simple;
	bh=VKn9uJMsOsTjjYre0G0WrWsRlaciyvDyOJYk+dw8fas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fT0bWaGe9RSdJFshVXMqXDvvLPntDoaact73ljUvs2zy8VNUaD5xwEO/gwVvgFiX7br6XZp6EsKHwSHEU4AYlvhCYzPa1Hw8vvLQfoyzXlvSbGr2BPCjygjZz/UkewRfRaiy6lv2hLvJ7ByIVGgwlK4gRBJ4ar3udLXnB8l9C6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=RmCjY/M6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RmCjY/M6"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20caccadbeeso2499745ad.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 13:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729110499; x=1729715299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olAKLc1ubtUo3zWjyBg9w1ODcp643i2ah+QLaW6GItw=;
        b=RmCjY/M62ZDQPWk3lDkidhzaZgqK71xT2bL9T7nkIYBTNTx8dA2/Zfpc5HyAA1l5Iu
         2Z0n6lqPkKClOW/JfVhL2UHwiA+1Vgxk8wRWxZEUKs1S8PjRRmYJorB0ivnzpjcNSv1j
         8dfrEI8JyxWJ3b8FUwogONE86aB1P/Gtk/Cjpy0ExErof4IrgW2RMEkrcstzWXMzcKYn
         eNbxN/R3J1xzse5FYHWTbR8p8elKWqKmlrePnFWhd0FfbN45UJ28DG/RLUe9urK69ik1
         lBkc/w26zRHpuufItiLv1xdXGCGQ5s0GDmfTEWqKyA/Omnz2mmqlhIWhDZLzWyGSLpMU
         oh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729110499; x=1729715299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olAKLc1ubtUo3zWjyBg9w1ODcp643i2ah+QLaW6GItw=;
        b=hZezBf2eswdGkmHQOS/LK5lEVFoOFzB948iEn5jV6paVp1HtDI/oVeGyIckcNPJnkG
         ABuxmt/arEetorhUnO+fZv0GOqP1LBGWkcuryokqMdB1F6QoDnOpd2jlyZK85T4jf/oK
         4gxpYcw+owpvCeuPsTc32aZmvZYz7EJGlOLruI/kJQBgC6vNey5+m9x1enehBlGIRcRR
         323VSKx0WHvvVXxDfmsSekexUFWksXbt1EpX2+aWKx/baO8uziyD7t9oAZZ0xM+nKI9T
         ui8aJAgErYRSzCqcX9mv4NYZW0Hkx6A00hFQMfBE/kKryn2+Ad9NEB27zLfwImAPn8UV
         zKyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+ZqC0f+EGaSgG1yEAbs/lMvD5+ZDeQRLPqdIbNOLsBlSAhRGHeVPrNYo+3nsvIHuq5fAizRGZE90=@vger.kernel.org
X-Gm-Message-State: AOJu0YwykQj4zFKUwVhWseNS4f+BkWkhaGT+PT+pTXu56CV3xJ9C0GXa
	bGF8FWtt7QZA/M17G57EUweT1ctTq8cabNM6QRos1V38/MxV9lrIvBax9YTq4Bw=
X-Google-Smtp-Source: AGHT+IFM0/E+iUAS6tZ0dnNm0aBuUaS4hqVs4p2U2s4QRcOm7iZw1qqdWPovB3OjQaczkhgEOCQhtA==
X-Received: by 2002:a17:903:1108:b0:20c:ea0a:9665 with SMTP id d9443c01a7336-20cea0a98aemr161412995ad.32.1729110499094;
        Wed, 16 Oct 2024 13:28:19 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08f8f89sm228613a91.38.2024.10.16.13.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 13:28:18 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-kselftest@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	devicetree@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	Evgenii Stepanov <eugenis@google.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 01/10] dt-bindings: riscv: Add pointer masking ISA extensions
Date: Wed, 16 Oct 2024 13:27:42 -0700
Message-ID: <20241016202814.4061541-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241016202814.4061541-1-samuel.holland@sifive.com>
References: <20241016202814.4061541-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RISC-V Pointer Masking specification defines three extensions:
Smmpm, Smnpm, and Ssnpm. Document the behavior of these extensions as
following the ratified version 1.0 of the specification.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v5:
 - Update pointer masking spec version to 1.0 and state to ratified

Changes in v3:
 - Note in the commit message that the ISA extension spec is frozen

Changes in v2:
 - Update pointer masking specification version reference

 .../devicetree/bindings/riscv/extensions.yaml  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2cf2026cff57..28bf1daa1d27 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,18 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smmpm
+          description: |
+            The standard Smmpm extension for M-mode pointer masking as
+            ratified at commit d70011dde6c2 ("Update to ratified state")
+            of riscv-j-extension.
+
+        - const: smnpm
+          description: |
+            The standard Smnpm extension for next-mode pointer masking as
+            ratified at commit d70011dde6c2 ("Update to ratified state")
+            of riscv-j-extension.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
@@ -147,6 +159,12 @@ properties:
             and mode-based filtering as ratified at commit 01d1df0 ("Add ability
             to manually trigger workflow. (#2)") of riscv-count-overflow.
 
+        - const: ssnpm
+          description: |
+            The standard Ssnpm extension for next-mode pointer masking as
+            ratified at commit d70011dde6c2 ("Update to ratified state")
+            of riscv-j-extension.
+
         - const: sstc
           description: |
             The standard Sstc supervisor-level extension for time compare as
-- 
2.45.1

