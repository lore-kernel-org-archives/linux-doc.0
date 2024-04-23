Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3A151C5C
	for <linux-doc@vger.kernel.org>; Tue, 23 Apr 2024 12:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876224; cv=none; b=fg2+zZ4fH6QMEBcBGoxqXsNlbV2Wm9oEPHClLue0f7YWH9gz14WKco4LAw90jTFRK3t5tp08NYhl12pA5nUlFUngjmLp6Kny5bV5SN+AUgoI+iekam2kaUe/h6sbEVduBUtNBE1BULvNHS9PFXD1idd9fQNaLov5ADcGYKfiFdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876224; c=relaxed/simple;
	bh=c7s/cCLz0BTTpKBz7lMpKDAzIL4xl5y8JfgKAVE07OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iTKBkLAP3ecOkHgnjDHLb+PkPq3yJHEhMNq/ZdH9wsMx0qonZ4A98A9jMrtC/N7Dwrao/DpdBNzVzS0YXNrNvSferh1MdZ+80Z6BEbxkc2E7UOczodD9UalBiMVOnHi6TZwwcH46ZF8oO8GIipR4uBNNVd7vH6mriKI0spUDeRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=D2lQLCj1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="D2lQLCj1"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-346a5dea2f4so1223461f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Apr 2024 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876221; x=1714481021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RY9X4nU5k+rqVQBtsNRF5VBDE3a2qL0GG+JxaikfjBk=;
        b=D2lQLCj1iQITHENDLC27zXuQCfIR49oIos4hw+WriLqMkAqwpRoCqcYLvOdbSi/tfQ
         RjQFZW9UbyWkm/hoeV4wo9O6YpM1xGKxcd3aWGQKp2jLbA+jW8AY7ecJRlZmUZv48DSk
         NKxG87C6DhkXesU4obISfAFbemKjIPwkjWfAeiCk0PcgYMqTXURjw7KLeV0Ci6bFYpVW
         8ZqLPMuUD9gFAVnaLjUeOg7A0R9ymmOTne1iylObp4TaA4OhbWOO3Cbi8do89xBPrDpY
         y2x0CwC9j9Ivi2nBpB2XvTjZEQBqh0vIg0s278gqgwxEAbkjUGxM/6W1JnKrCvvT91C+
         cp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876221; x=1714481021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RY9X4nU5k+rqVQBtsNRF5VBDE3a2qL0GG+JxaikfjBk=;
        b=B/6fKBzFjWQm0UihH9vs07ei40p8tdbfxXTHDEu2kywif4wn6g7O2Z+EePx+lxs/cj
         rmMPqVxx+RxNcLSKpaUYsE9kcmtN/VOsuJ+UaS+fuCq1yEwzgqiB+SUK6CaO8zx5jL/E
         MVBuul9vbyxcT6Dv0sQ21Y0AgHs3V+3JNH27s7MpRJc5Xm9vDppKB62Lxxfw9oQ9iEY+
         emV/RZmdt+0hzASjVH+Z+vHFEWz8Hd1dcqeRaFx1E+U1NC3fX0VIbiIumx3bo6odde4H
         4Yd/d7lz+WC7TtFbdK5lINup7vs/OXKz2Fe3smv2Lc6AxsuN6mIsMdoiiJ3yTGhzkxpR
         /xCw==
X-Forwarded-Encrypted: i=1; AJvYcCXBLwEkH7uTPcdJel33lUNURB3wa19/ONPwUv3+l6eSol0eMiO+6sv6+72t/0S4UesN7h14XIOT1tOr+5gcxUAtRMejyVtXcGmA
X-Gm-Message-State: AOJu0YxPPuj8usAKl/yjEgHAHFhT52JmKFzBOyiW3xGnMnBwJxsPT1hS
	F+G/4BNEIq/ViQgod6uU8BaDA6geVcu2msAimjrAp61ifVh8ZUjd2BQdrcAY280=
X-Google-Smtp-Source: AGHT+IGBgbRJ8rS0V6sOY/Pp3/+7YVKywNh0XxOcXpBBLcmpeUTMJ3+uEL+uOgTO/2ehZ+OVVYWaaA==
X-Received: by 2002:adf:f850:0:b0:346:408d:42e6 with SMTP id d16-20020adff850000000b00346408d42e6mr8871797wrq.2.1713876221498;
        Tue, 23 Apr 2024 05:43:41 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:40 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 01/11] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension description
Date: Tue, 23 Apr 2024 14:43:15 +0200
Message-ID: <20240423124326.2532796-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423124326.2532796-1-cleger@rivosinc.com>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add description for Zca, Zcf, Zcd and Zcb extensions which are part the
Zc* standard extensions for code size reduction. Additional validation
rules are added since Zcb depends on Zca, Zcf, depends on Zca and F, Zcd
depends on Zca and D and finally, Zcf can not be present on rv64.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 616370318a66..81bce4fa2424 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -220,6 +220,38 @@ properties:
             instructions as ratified at commit 6d33919 ("Merge pull request #158
             from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
 
+        - const: zca
+          description: |
+            The Zca extension part of Zc* standard extensions for code size
+            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't exist on
+            RV64 as it contains no instructions") of riscv-code-size-reduction,
+            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
+            of zc.adoc to src tree.").
+
+        - const: zcb
+          description: |
+            The Zcb extension part of Zc* standard extensions for code size
+            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't exist on
+            RV64 as it contains no instructions") of riscv-code-size-reduction,
+            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
+            of zc.adoc to src tree.").
+
+        - const: zcd
+          description: |
+            The Zcd extension part of Zc* standard extensions for code size
+            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't exist on
+            RV64 as it contains no instructions") of riscv-code-size-reduction,
+            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
+            of zc.adoc to src tree.").
+
+        - const: zcf
+          description: |
+            The Zcf extension part of Zc* standard extensions for code size
+            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't exist on
+            RV64 as it contains no instructions") of riscv-code-size-reduction,
+            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
+            of zc.adoc to src tree.").
+
         - const: zfa
           description:
             The standard Zfa extension for additional floating point
@@ -489,5 +521,51 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+    allOf:
+      # Zcb depends on Zca
+      - if:
+          contains:
+            const: zcb
+        then:
+          contains:
+            const: zca
+      # Zcd depends on Zca and D
+      - if:
+          contains:
+            const: zcd
+        then:
+          allOf:
+            - contains:
+                const: zca
+            - contains:
+                const: d
+      # Zcf depends on Zca and F
+      - if:
+          contains:
+            const: zcf
+        then:
+          allOf:
+            - contains:
+                const: zca
+            - contains:
+                const: f
+
+allOf:
+  # Zcf extension does not exist on rv64
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zcf
+        riscv,isa-base:
+          contains:
+            const: rv64i
+    then:
+      properties:
+        riscv,isa-extensions:
+          not:
+            contains:
+              const: zcf
+
 additionalProperties: true
 ...
-- 
2.43.0

