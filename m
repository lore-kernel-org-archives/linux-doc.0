Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E522D033
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZwmfC45K"
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C202310EB
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 02:56:24 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40a279663a2so3106555e9.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Nov 2023 02:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354582; x=1699959382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uOByuhC3t5IOOn5XXUVJDYNM9V7BqpeySL2m3Y9NXo=;
        b=ZwmfC45KanPoyi3EQ0flR9PTXNktZVL+T0y1GuTCB3Td5B62nf568a7HbxWDABJkCK
         wKrooWxPVDMHCCFVcsuOvLEe1aphVAA+tiF3QlfCYyHwRrFzpk8nCfteqRRHAfZgAJmP
         GGuXkPP2yv9g+YFsjusUdyBVk6opgFEFFwf5jkopuGmuuVyX5WCJONWM/qLNH7jL4NYl
         D5Qv0VNLj6en9aEcxAhDvhbSwUY9H40sBFBdi6Bj6efCR2NbloiEbhNRcvUclruYNU7t
         Hy3Z/9VqQotg3Xlqyok6X9CbG89qCEIFvGbRiUlcXFk5IppjtZF/iIZkUfF4Ln5Xyn4P
         L8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354582; x=1699959382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uOByuhC3t5IOOn5XXUVJDYNM9V7BqpeySL2m3Y9NXo=;
        b=hAOwF3vIiF9pOvd2bdrDEdErWrXSMG4cM9q/ZYvM7WfHitv6ydm5q7F/mk2kSx2IX7
         ocVmW7zRLboUXY9X1RB/Xgqf4cbkP+r0s6Bc+NofNVSfLImBilFDc06lQrDDOEabDTPR
         Xtc/Fxcc106uFTLirgz67lHjV4X7brotQxc1FWCj+QJ41yYJCB0YXtwgUIzJx2XdtKiS
         z4jAs11UXXueArg7IgtS9TVvf7hVIfH20gn9+Km/omBj4oVFXXrjEToJFC3d5zMRK2Yn
         8d42nUCF0eUY3BUkHiT/oyBStQ6Xbul9l62Rn7qQegspL2p2FDfP/Pg9XMHK6aAzp2hg
         Lhwg==
X-Gm-Message-State: AOJu0YzDjpC/K1vWJAen7fOcEFCpB0LKsPfSNI9y+v0o/IWI1s9l7hxZ
	T1kGWpBFvhdjzR7Mzcxfekkp0A==
X-Google-Smtp-Source: AGHT+IELIW3LIg2lrza+HJKbS5ridEWLR16IdBcQqrj8daJI6htUFeT4tLiej2ONYAZOAOmlBwC5Kg==
X-Received: by 2002:a05:600c:5128:b0:401:c07f:72bd with SMTP id o40-20020a05600c512800b00401c07f72bdmr25945621wms.4.1699354582180;
        Tue, 07 Nov 2023 02:56:22 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:20 -0800 (PST)
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
Subject: [PATCH v3 17/20] dt-bindings: riscv: add Zvfh[min] ISA extension description
Date: Tue,  7 Nov 2023 11:55:53 +0100
Message-ID: <20231107105556.517187-18-cleger@rivosinc.com>
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

Add description for Zvfh[min] ISA extension[1] which can now be
reported through hwprobe for userspace usage.

Link: https://drive.google.com/file/d/1_Yt60HGAf1r1hx7JnsIptw0sqkBd9BQ8/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index c80774b518c9..87c7e3608217 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -366,6 +366,18 @@ properties:
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

