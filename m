Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84DB43686
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 13:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="xa8kyVmx"
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C8D10A
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:41 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-406532c49dcso17776665e9.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548540; x=1698153340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcwMvdrQT7dDiQfvq5mk8auJjq+yKDjdUlNI6K4rk90=;
        b=xa8kyVmxIMdgaf2ZwDbPGSzStRaubmGVqg+N2Ez+3aBJMLX9F1s7NeyquRbLn1WvHa
         JVOkzFUCAbAHJwaMRdSWl3HM7wN5vHYLAaw+hX6yKoGleqbEDt13vFcV23C1Y4sMBYuY
         BbfhmHkLSFl6y+Yy9KA+kP1IYca6qY4EP/labyUaUQ5nfPFUv4e+YCcGM02O+eNAFQ22
         aY5PSQn/2OxN14Tpp/8Z9EdVFAah7ebH7FpPTq04QmpWHZ1Sr3DT2K0xmeOTBT531OjL
         iTIDz/4HMQgceSwbTvNYwOhLZxRdk1fphcMrNkabml6cak/CJAcR8be9oovZSkg/JqG8
         vnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548540; x=1698153340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcwMvdrQT7dDiQfvq5mk8auJjq+yKDjdUlNI6K4rk90=;
        b=dk9cdNoTnL4DdPSA/r2kPj74HwKW2r7qjb0PrJErBKApOh3+K6AUC1hMA0X+h+Nfm+
         J2nnlSKBtrcGWvb1ajWhs2hiIClnObMUlk+6QjUaqPvsnCQpw3clcLZNBxFljLIDTYI/
         iFuWv9c1+jnKQyv61uUum29t84ohctWICIlAFYl7MZ4re+i6N6KqrftuOR5AbUdPXj+p
         cR7IX6GjJmiVZQuqfnXg3rcE2FXHdAOTcbeJeHtfSodULvVeaGP5uLZqJxotFiQVlyJj
         8C3yQBfSoqChuA6O9qvBsiZrPhmGVZpAqpdLzABuZJmPZFKQiCjK/rTCQb5WktCUOjt9
         AUJQ==
X-Gm-Message-State: AOJu0YyXwekEqhAmFt+QsMblCtu8PAu57a6F+9fa9hAU+xlkXO6A8If8
	ZMVxO/bTIGd0zErtVGd3TMLI1g==
X-Google-Smtp-Source: AGHT+IHVBUlyPGQBU14EXa9PZ6UFLb59Nwth5umwYgIAc2moUAd+hl54lbf8HW53OTtnTpusU2Ppyg==
X-Received: by 2002:a05:600c:150c:b0:405:38d1:621 with SMTP id b12-20020a05600c150c00b0040538d10621mr1641826wmg.3.1697548539594;
        Tue, 17 Oct 2023 06:15:39 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:39 -0700 (PDT)
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
Subject: [PATCH v2 13/19] dt-bindings: riscv: add Zihintntl ISA extension description
Date: Tue, 17 Oct 2023 15:14:50 +0200
Message-ID: <20231017131456.2053396-14-cleger@rivosinc.com>
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
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Add description for Zihintntl ISA extension[1] which can now be reported
through hwprobe for userspace usage.

Link: https://drive.google.com/file/d/13_wsN8YmRfH8YWysFyTX-DjTkCnBd9hj/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index b0a0d1bdf369..eb4c77b319fb 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -324,6 +324,12 @@ properties:
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

