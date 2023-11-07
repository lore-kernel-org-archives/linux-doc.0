Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F49C2D05A
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 10:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qkxdtbQu"
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496CB171C
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 02:56:28 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32fa4183535so811524f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Nov 2023 02:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354586; x=1699959386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiqFYUrrovnf1rhzBHvSluIgSBMGKUT9Q2F8cmlGclI=;
        b=qkxdtbQucEK7DLbiv1cKdTpCrLREePIFWimgYLnxfcHCSbA7Hw/4RlMhTwX/1y8H3i
         2AiDmSFI5R39zutNt6ytF7rgteIp6ZWOcZSOkBaIw2Yft/iUbjHP5yYW0OrFlOl+OhmD
         qj/HHvD5wAp/Tg5wI6GLNdwgE09YsQ5v1vCByiqUjqJjY06RVKGCfYkpAvVYZSUP/ccp
         DvkUxcUGFC3nLlqONCqce/kgc2zhXkFw71pd2axoIKSvio7w0nO9p5mcvIRaSWF4Oayv
         cqw5JLEsEUKTgB4Xrr0sBDAjMmWNXO5X69EVzHR7Dihj2OnZIXZUHCQ3vAgHPSGM/hmZ
         cPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354586; x=1699959386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hiqFYUrrovnf1rhzBHvSluIgSBMGKUT9Q2F8cmlGclI=;
        b=jny5stM+GkQQuLXxFDd+MtRa36WF/jEOjwkN4Ccsi9Xuhp9rWBc3WAhLNppQoax2Py
         RMd1u1kpa/fBk9viRbqnuq1z/rrdHWdohZe6CbhPzT6qUH9EBpLwsB2yUtUJql43roBa
         +1EqcZ8h305bUSCutZcInX+2GXuTzPKC0BnwbnaMTxZtL+hSWWbvnihsQcij1XhRCZvb
         PlbZC7tFQ1b6Q2nDn9zagv3AXaoaAjmcSO/mafI8bTk5ihZag053q/Yj8mNPEcUZiIhG
         E+NZkjHhFpkcbWX2rah/o3z4hBRngnUXiOd/QXHuZFlfFcdK11/gNgbMY6sB5crZ9tph
         h/Gg==
X-Gm-Message-State: AOJu0YxL+yXgixLCIttmY1vvtWKmZbzq1XY6a6w+Sd7GM9ulXvIoComf
	RKy/9FQ+i5eUWFo4eYYb4eyKZw==
X-Google-Smtp-Source: AGHT+IF7Zo2YtACLiPHwQ6dLVhxCBp4VHRs60nrkUPyWwGQZ1utTTeaxqjcqGnJKdNMWHeSZvxGiKQ==
X-Received: by 2002:a05:600c:3b91:b0:407:52f0:b01a with SMTP id n17-20020a05600c3b9100b0040752f0b01amr26054980wms.2.1699354585803;
        Tue, 07 Nov 2023 02:56:25 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:24 -0800 (PST)
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
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v3 20/20] dt-bindings: riscv: add Zfa ISA extension description
Date: Tue,  7 Nov 2023 11:55:56 +0100
Message-ID: <20231107105556.517187-21-cleger@rivosinc.com>
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

Add description for the Zfa ISA extension[1] which can now be
reported through hwprobe for userspace usage.

Link: https://drive.google.com/file/d/1VT6QIggpb59-8QRV266dEE4T8FZTxGq4/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 87c7e3608217..dcba5380f923 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -214,6 +214,12 @@ properties:
             instructions as ratified at commit 6d33919 ("Merge pull request #158
             from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
 
+        - const: zfa
+          description:
+            The standard Zfa extension for additional floating point
+            instructions, as ratified in commit 056b6ff ("Zfa is ratified") of
+            riscv-isa-manual.
+
         - const: zfh
           description:
             The standard Zfh extension for 16-bit half-precision binary
-- 
2.42.0

