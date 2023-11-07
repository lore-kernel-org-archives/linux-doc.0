Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3EB2C87C
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ayg+6gMM"
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3492BD71
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 02:56:20 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c5bacef31aso11257671fa.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Nov 2023 02:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354578; x=1699959378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7aEHK12fdFG0G9p5Ar5H42P12VBS+xQqa4RJxPd+e8=;
        b=ayg+6gMMwQQN8hONtjI0gXlKN5//lxIaiLRMm3z+XI5pRcz5oRJPAjz3sZIAXu8rXG
         EG3qYcyQAm0xYIEjefLnvVxZqOXSDC8MpMGdoSV0BJgIb2LfES8eGOfpgEErMJEBzZ0I
         e032kyevBqe+1YzlyxscLmOiDAMpxlhyqitti2VbYsLaIV7Q3XXLO5tlhQTf1jnbJG1B
         l1l7P/s3dEOfKqrmdPjHEP0aCfY13ecCvQR/VCGdPKEPMF0dbr1h4hTLOI5nVCoQdMjK
         wArv8Hb29G5EFWxqr2vGAhmX0NX0sxZC+Qhw+Ixlne/zQ4T4l2bthpzLdhWJNhi9oezG
         ivXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354578; x=1699959378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7aEHK12fdFG0G9p5Ar5H42P12VBS+xQqa4RJxPd+e8=;
        b=lOkwMzyPIel/pet1IFYjeHxIDZLP9Lh5Re9Usz6cPxE9Cg6WcUkoaYGUEY4vrt24S7
         uxeoQpNLExIDI6Q3GK4xhZQmSVpkdHzEJrbWYdDiOUSBN5yajPF9Ogdh+L1LYbawSZx1
         15mMdNZkaBrrTPXbJ07CyfRQtQUm7gbG2FMLBZx0xoRGX4Q5lNwzfsd1dsK8v7Mhy+FT
         0fQwGG714+dpr+IuwHVBE7XxBDtxYiudeqLjPg7kAH25Q9sqfIU7aDBeoLiqJI39V/zy
         S03TYOnXNvmxOTAjlD/zS+oCYZPBQtaney0uXDDQK3jqCl8E4JhdJVz+dI2ZIFU7f7rj
         ZbzQ==
X-Gm-Message-State: AOJu0YwZB2QNUWUxc/fqCctnxZaajCJa7J29UzALbPHNTNEfjSBR/G2N
	+rUOxO7JRkUqqiC9RVJ+qSjR3g==
X-Google-Smtp-Source: AGHT+IG6riKUjiH4caHBP0UY8y2QJ6HnExEb8OSRHzEi1uOV2r19/bcFPMSaXYWd+67hvhTH5Nkmjw==
X-Received: by 2002:a05:651c:1317:b0:2c5:36e:31ef with SMTP id u23-20020a05651c131700b002c5036e31efmr23580871lja.5.1699354578058;
        Tue, 07 Nov 2023 02:56:18 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:17 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 14/20] dt-bindings: riscv: add Zihintntl ISA extension description
Date: Tue,  7 Nov 2023 11:55:50 +0100
Message-ID: <20231107105556.517187-15-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add description for Zihintntl ISA extension[1] which can now be reported
through hwprobe for userspace usage.

Link: https://drive.google.com/file/d/13_wsN8YmRfH8YWysFyTX-DjTkCnBd9hj/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 62b5fe40b4a3..c80774b518c9 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -336,6 +336,12 @@ properties:
             The standard Zihintpause extension for pause hints, as ratified in
             commit d8ab5c7 ("Zihintpause is ratified") of the riscv-isa-manual.
 
+        - const: zihintntl
+          description:
+            The standard Zihintntl extension for non-temporal locality hints, as
+            ratified in commit 0dc91f5 ("Zihintntl is ratified") of the
+            riscv-isa-manual.
+
         - const: zihpm
           description:
             The standard Zihpm extension for hardware performance counters, as
-- 
2.42.0

