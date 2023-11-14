Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280E24120D
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 14:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="GUbaUU6S"
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D9E2D5D
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:57 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-779f81223ebso9063685a.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971234; x=1700576034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoTFo90940vK77kTlCvHvrvp3qqCfWhzk2ZkyIVF9ns=;
        b=GUbaUU6Samn1yyulWPTYQwi9e2erNmDwXfkPyAwopdbM/x4Kyy1BkL9Fhp3m9sW4H2
         sGR/dQk6+64bURNcnMFWDrDoWDs9+1PgUkxV2toMU9HDjceHb3V1G+foANlVFhn56RVk
         p9fzw6H0S8mGcfd+fHbJX03t16QIUfhMqx25ExJ7v5kR9hxhuTWi/kowl/4cGfIZmvDB
         1XfuEuUpbrHQymePeBn60CIPA2qquqPvOgoJMwzllyo1aPGL0G4WeaGjhzkCiJgk6gW4
         SFTYhzYt2Eaz6jvVZQe8hs4s9ib6GuE2/3pi/Itr6RHxsIDfJvOak+PD+Lq8iR5MylH/
         2qdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971234; x=1700576034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoTFo90940vK77kTlCvHvrvp3qqCfWhzk2ZkyIVF9ns=;
        b=b1oVSfyLM4DkCbMQTGJVCT3bdSXU/g6v5jcWFVel9qSHtY6W7QcuryfZ9MUn9MKwcE
         5iVfUpGgqefYha3Wa72JvbMlDw5B0pbGX5aV522ZOZ8gk/UJkPr/FdlA1Q5ETPvEGWOk
         yAD0UcZ0rTtiB4vT7vnQ9xRaDp/jzMLkbIuQQNw5byFuhghSy/kVpZTDm3j6qN+hdWO1
         BZOMArxsT3uNbF/5q9kPk93qlU1rrFwJD3aSKMwO8tyVcVG3k3kghCEUUCsf0PlQNGb/
         Xq13PbOFnQfcdT3wQFjNWLZAQEQNHrM78EFU736j5VtRjq9z4+1Oyht56Zs8YVya2yEM
         HP0A==
X-Gm-Message-State: AOJu0YzdbrQA+HvyVltZBUKYcA/0QIBMt12qNWMprE/EkY9ehyxIw2cg
	l3SKRB23PrxBdnLb1r3xFD51vx8cLQtmyTgK4lbIRQ==
X-Google-Smtp-Source: AGHT+IFNCPX21/Ri63YAzgADy+EVaz2PJ/ebWolRkZq99YoI+InQVMnXeGM6ah9IB3zm0CykKOxaXw==
X-Received: by 2002:a05:620a:bd3:b0:772:5300:1c3d with SMTP id s19-20020a05620a0bd300b0077253001c3dmr2154010qki.0.1699971234326;
        Tue, 14 Nov 2023 06:13:54 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:53 -0800 (PST)
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
	Jerry Shih <jerry.shih@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 17/20] dt-bindings: riscv: add Zvfh[min] ISA extension description
Date: Tue, 14 Nov 2023 09:12:53 -0500
Message-ID: <20231114141256.126749-18-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add description for Zvfh[min] ISA extension[1].

Link: https://drive.google.com/file/d/1_Yt60HGAf1r1hx7JnsIptw0sqkBd9BQ8/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index f953c49be90d..b91d49b7c3a0 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -369,6 +369,18 @@ properties:
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

