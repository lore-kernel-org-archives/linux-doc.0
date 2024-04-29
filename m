Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E5384A28
	for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 15:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403194; cv=none; b=pSr2L+V+quqccT8P/kSiQnQo2+NiXYAxg1PZ00SA51hd737guo4DhXrASz9B21ABi71xfkGcR5wCXliz6s5b2cTcfxx0RdNVCsQJNpblGZSX60i0MxmZsiQxH+Y/09W5YHUmYx4frtdZO7JphPZk5DQYgnvXNjifELqj5XhJyg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403194; c=relaxed/simple;
	bh=c7s/cCLz0BTTpKBz7lMpKDAzIL4xl5y8JfgKAVE07OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FfGYSryxUydLDdr+EnfIOQQD6boy23D0kll2xYKBEaywfGIChK462awWS7xeJTm20aKe02OAZAnuHJ0XJGw7WmSSgMsO3h0WSNV9+B3M+sxbJC5enVYHh7mZz6lGgbS8AJ6wDnYXx+XSR/AkLd7PUDUxYNmzRe/vu+wcNxKXJhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=WbVPizRs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WbVPizRs"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34801b1bc4aso856035f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 08:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714403191; x=1715007991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RY9X4nU5k+rqVQBtsNRF5VBDE3a2qL0GG+JxaikfjBk=;
        b=WbVPizRsZykqhG+apx0K7zKQ3O/bZDaLWasNrkcoqJOzvQGt020NR5MBZUe/lTIsWa
         /Ge/ZmGiTOavCxdzlrUJu7sILimaVy49o4FtotC0ZM83xGgkNd8/Ghi2pi2orh+wqnS1
         KuMTX5ymcRjp+6Lsdn7npGAawJywpHCbtowcMtM8Ks4b0KmOFTsNYtxR+7YzjEWXgeeZ
         /+gVhdKk0Lp3JN7yiPx3b/kEhf4+7E10Y7H13lQxGtdDICtzvo5akxnP+RU1AS7M3ceo
         PmyfyTx0Z9nW8oM3icbUrV7XvrD4Ul0HRHt9CSti6bgRMCMNAX6IqEDI3NW9EIgFhf7w
         lPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403191; x=1715007991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RY9X4nU5k+rqVQBtsNRF5VBDE3a2qL0GG+JxaikfjBk=;
        b=U23FBoVD5bTdtuitMJI/kI33dy62HbI0Ex8fqhoAaqRKk5VuDEnh29XrU5WJninwjM
         ECKaNiZAd6jK3QOyolrd+MIJ70JHnw4zkoHrlxj827+JQlRDJyDWovRUz0New3nsr3D0
         tm2GkkiED2fLxrpG6Al2kQPnXpdOkIdP3+rSwQBBYlt50ZtS1+c38nFbeu8fVKpHKVd0
         wX+Vi1jNxWJw+DrYsQb3bkn+B/QznNPSPD65YInCXQYpynScbvtS6JWiV2DMNV/erfWy
         hB3PjSeI3ZEps3EXV+79gtM9PGrRuGdlLCTBW52YwFk9G61cUaH6IJmot7IIzldXlYIw
         QNwA==
X-Forwarded-Encrypted: i=1; AJvYcCUv4gswRsY2r9+8jB7dS4rXyI7sohk0Q6voJAQfOwbJxIwBt9HuVZVu23tN970/6R7PsZaT5ezQt9PtaPHpAnDyWfVm3IDmEkLf
X-Gm-Message-State: AOJu0Yy6efXI9bweivqNbysHCxzFGCurMDiYwdZfRtoNp5Qch0cOzthz
	NKHGJr/rgRxK8jOkou702Gl8jFebO//V6W6QkjA5AR8EtkeJtqcX17/i63tahgY=
X-Google-Smtp-Source: AGHT+IHwD/f6j0k+0vNzFhy2RznGzipN5FrPHuin04m4sY7yIkUUU/BY0bxKQrQfnXJJGAuPflsKXA==
X-Received: by 2002:a05:600c:3553:b0:41b:e83e:8bb with SMTP id i19-20020a05600c355300b0041be83e08bbmr4648588wmq.3.1714403190882;
        Mon, 29 Apr 2024 08:06:30 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2fec:d20:2b60:e334])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b00418f99170f2sm39646638wms.32.2024.04.29.08.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:06:30 -0700 (PDT)
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
Subject: [PATCH v4 01/11] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension description
Date: Mon, 29 Apr 2024 17:04:54 +0200
Message-ID: <20240429150553.625165-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429150553.625165-1-cleger@rivosinc.com>
References: <20240429150553.625165-1-cleger@rivosinc.com>
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

