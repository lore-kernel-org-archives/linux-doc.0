Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46829436B5
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vUzuwDjF"
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE595110
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:44 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c52407516bso3494801fa.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548542; x=1698153342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtPMZdfKNirfdqr6CT25Ry/Z9PXKAMnWV/SarPOTmxE=;
        b=vUzuwDjFpK8zXlw7NNPao3q6RfPmFGKv5CB8ColfSfqcO/TziBYC1RV6RSloiJ15v/
         1InahkhlsDf4ELmPB5Ys/kuCZBZw/FM4bUs27hJTR6c9ySP72CMNfSOxuZqIBDQtaCxt
         v7uCEdUu3t7oauDrxqm8BN3fNEmU2pn/QWf8gSsL+5tRefjqTFMgo8/o8chp2oGt28wS
         /+9OxX/oElkvQ55VUCiwLv4ohYMqFRUFJdlj8TLL3b31rLc/1BrX9sWrv98RIsxO0AbA
         Ubvqgt5mK32umIAnUW5UaR8nbLV6oX3i9x/+tuyiO5uIkOYxxuEuzTbW5qu5hbYSZq81
         aM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548542; x=1698153342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtPMZdfKNirfdqr6CT25Ry/Z9PXKAMnWV/SarPOTmxE=;
        b=ScQNV5OICx0bYmodUzyZGaIHxC3Pd9ugwU1TzjhOUN6DqElUg1KFjrkQNaEKzP42qU
         5qhrF3gGEZpkZOmsDoL9b8jjWJ4YesDGhR5WnkEjiuKm1ohsG1gmlt4HGNdAacTQ9myN
         YOpFYOaEpYsfkUntPwwa4Keg0BD6jvik1L9TE3BMF0jDLSDKBxi+uWo9iShSRx5SwNKV
         LTIyIlecQ/pjHtPv2+SYq8TKNu6hBxsN4Qq3fIMznTTl4+iTh06EN+qW163zqiuqgm/9
         CRcoQhN7F1Ax3LDY/Jc8PJ9fgre4IOpWgCWno2EhITBfUerRxivyXj4YOiT6YF9jEZ4f
         LEUA==
X-Gm-Message-State: AOJu0Yzttnw7KLqWdpUnIuMouBzddzosc886/m+6cJbWn2o6YSv7gPW/
	6Fi/iyPCRlGVQtpJrnQObtL6Ww==
X-Google-Smtp-Source: AGHT+IExgz+Jty8kJFWoAX6Xk7Uc1rKCCTHS2Tyfw+6sRSdA20AS2nN44InvEEqP/AyJZhlfjEW/6w==
X-Received: by 2002:a2e:8745:0:b0:2b6:cd7f:5ea8 with SMTP id q5-20020a2e8745000000b002b6cd7f5ea8mr1903128ljj.1.1697548542173;
        Tue, 17 Oct 2023 06:15:42 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:41 -0700 (PDT)
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
Subject: [PATCH v2 16/19] dt-bindings: riscv: add Zvfh[min] ISA extension description
Date: Tue, 17 Oct 2023 15:14:53 +0200
Message-ID: <20231017131456.2053396-17-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Add description for Zvfh[min] ISA extension[1] which can now be
reported through hwprobe for userspace usage.

Link: https://drive.google.com/file/d/1_Yt60HGAf1r1hx7JnsIptw0sqkBd9BQ8/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index eb4c77b319fb..07678564f11d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -354,6 +354,18 @@ properties:
             instructions, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        - const: zvfh
+          description:
+            The standard Zvfh extension for vectored half-precision
+            floating-point instructions, as ratified in commit e2ccd05
+            ("Remove draft warnings from Zvfh[min]") of riscv-v-spec.
+
+        - const: zvfhmin
+          description:
+            The standard Zvfhmin extension for vectored minimal half-precision
+            floating-point instructions, as ratified in commit e2ccd05
+            ("Remove draft warnings from Zvfh[min]") of riscv-v-spec.
+
         - const: zvkb
           description:
             The standard Zvkb extension for vector cryptography bit-manipulation
-- 
2.42.0

