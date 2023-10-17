Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BF042C19
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 13:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dOZ25igJ"
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5796F2
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:37 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-406aaccb41dso18299545e9.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548536; x=1698153336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWnPq2gaUY6Bw+QhkV+/+BvTRtvqF4BIiAlwEf1vKGM=;
        b=dOZ25igJytRqCFx+02/whVtQZ+4db7VtNy56yNr34omCyC19Q7ftnT4nBNG+8l+itS
         8e/1GQY1tywkRBVigwGY5IePkvht4uLyon03ZukrXArgZs8kZr/WWdj8mKtwTC6jXkXd
         wuZIgliOrwijtHFozT5lFKMxO/NfMToDq9oltwCNE+jVPlFMhfotBcIikfEkKr9pNr+S
         P4XuHnqfRVUAuOXxC8IgFp3YAS9lApiqyoAFM0gDDtELf5p5q7Hvjpo24ODKXC9nIDDp
         DWfNV/qgoQ2IPgbszDgyBqEQuRgIA8tm46ALVuRycaqgeG3sY4r8lpzRiFgUzFMfAv2T
         dryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548536; x=1698153336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWnPq2gaUY6Bw+QhkV+/+BvTRtvqF4BIiAlwEf1vKGM=;
        b=LB7F2pWcGPENDXEaOPIJIauMaUVPROVQSHNd4PFVM4zzMQD+OH/kXMmLS+dge2S6Hu
         U0CB+4Nt0iETcVBm6Q6iyOl8Ulcl27l3wXMv2zj595JOVTnXbC6m0bWfhTnGgoHP2/Vw
         Yaz4U1PZXXVcwX0gu6yVXfaNq3gfpRrlRdKJlwRs8KqPlkB7bdZAMKoO6UhoItb0XRIT
         jsLk/C+cOaU2hocmflENEAThsFyexu5AEA0NFXn3KBJv7TTHyORe2DAEcPejxqIQiG0e
         9s4gjMf22Me33URsE20qQM+UqXgSM+EKVN+Zf09VJw6MtOwkab3XvQnJhAL5OnHuWLJn
         xjWg==
X-Gm-Message-State: AOJu0YwUQW73D1sKWbJnaQxQM36UiDKnE73ta4F/Beo+TxLUO5mkj09H
	ywIXVcHTPzlq7R0oJTMzSuYbQZUCoTtJbjuC79dK1w==
X-Google-Smtp-Source: AGHT+IEySb+/Q17ICv3l76yF8jJjBFEiH3hFuZYYjFi7wwKXT2ljs/AM5fR+ARSo4sgAbdGf5BuQog==
X-Received: by 2002:a05:600c:1d9b:b0:408:3836:525f with SMTP id p27-20020a05600c1d9b00b004083836525fmr251193wms.1.1697548536185;
        Tue, 17 Oct 2023 06:15:36 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:35 -0700 (PDT)
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
Subject: [PATCH v2 10/19] dt-bindings: riscv: add Zfh[min] ISA extensions description
Date: Tue, 17 Oct 2023 15:14:47 +0200
Message-ID: <20231017131456.2053396-11-cleger@rivosinc.com>
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

Add description of Zfh[min] ISA extensions[1] which can now be reported
through hwprobe for userspace usage.

Link: https://drive.google.com/file/d/1z3tQQLm5ALsAD77PM0l0CHnapxWCeVzP/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 93beb9872900..b0a0d1bdf369 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -208,6 +208,19 @@ properties:
             instructions as ratified at commit 6d33919 ("Merge pull request #158
             from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
 
+        - const: zfh
+          description:
+            The standard Zfh extension for 16-bit half-precision binary
+            floating-point instructions, as ratified in commit 64074bc ("Update
+            version numbers for Zfh/Zfinx") of riscv-isa-manual.
+
+        - const: zfhmin
+          description:
+            The standard Zfhmin extension which provides minimal support for
+            16-bit half-precision binary floating-point instructions, as ratified
+            in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
+            riscv-isa-manual.
+
         - const: zk
           description:
             The standard Zk Standard Scalar cryptography extension as ratified
-- 
2.42.0

