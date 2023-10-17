Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2721843699
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="N6VSQM6+"
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D75F181
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:48 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-407acb21f27so736265e9.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548546; x=1698153346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VR7lcVmAz+UhHjZIcV3xEUmifohwbRxKjtUEu/6fWYw=;
        b=N6VSQM6+LN05iMnXVzLwoywZD8IMN96hW9EZUE0Wwx8wMtQMP2A2loQ8djiaZzvmSc
         8eKhDmtdi08J/gV3FXfS0YMFvSj++Ki4nBjRg9i+Uh0X3yMWzaoEDMR9LQRO303Uv3rg
         S05Ut2C/0vkpf6P80kRbNiMTdOK6tRRVqegFjX1awkBr4KNYh/h1abOS3bcj9HAzTbxk
         9kVB8JgLwqRMh2mkslG/VH4FmGfhDEtDWaVIBmTu8dSyIn3oQJoeqW6QNPBjrHKw8OQB
         8GAzxvcPAH9CKzngs7SoSwDgyRhIXwXAgToRboGS8k80ox1wgRE5B/XBxCVXuapY1Kq9
         HhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548546; x=1698153346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VR7lcVmAz+UhHjZIcV3xEUmifohwbRxKjtUEu/6fWYw=;
        b=GBZQl854XoTzB4RuV80hhQ+SwTNPS8trJCD1snDZ4HBJCz1/gj8OoUWt5zt6ZMLzPp
         wL+3qsnewvC4Jj8H0gNE+6fuxkTNuoAWGjK9M4Rp1SUStchke0O0GxiYj0FW7dtbrppq
         Dwh2A3Aqjc6Ob4gCBw4BE7Wix8aVeJNADpaoH4jgU9fpZZsbSMWUeLzCHNuw/LyS96Xr
         1ifxG5SlqX7LuxgVQEY8xvUVYYEYR8DTkot7k0Tj4H9UMWAgQEK5nCkjOXny1K9z8eIu
         QtY0j8LnNMV76ikWgHJTFKNNjPftuWG/3VibPtvc0F0on8jrkoqYYs7eFijX4ABBiu18
         1sxQ==
X-Gm-Message-State: AOJu0YylOcsP/DM+HFiy3sRC03UIYz2XdxwDwfovhw53vvj3d/w9jrPi
	QpZPqFeXhtjzgzZwlg8ZtDsOFQ==
X-Google-Smtp-Source: AGHT+IHIQDkhluCQslFyJdgDxKAY9q+c4pJ4JyE/Vo42cW4xdwk6uSfnB9uiUpQR0s0lka7NJ6WUWQ==
X-Received: by 2002:a05:600c:5026:b0:404:75cc:62e6 with SMTP id n38-20020a05600c502600b0040475cc62e6mr1650073wmr.3.1697548545908;
        Tue, 17 Oct 2023 06:15:45 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:45 -0700 (PDT)
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
Subject: [PATCH v2 19/19] dt-bindings: riscv: add Zfa ISA extension description
Date: Tue, 17 Oct 2023 15:14:56 +0200
Message-ID: <20231017131456.2053396-20-cleger@rivosinc.com>
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

Add description for the Zfa ISA extension[1] which can now be
reported through hwprobe for userspace usage.

Link: https://drive.google.com/file/d/1VT6QIggpb59-8QRV266dEE4T8FZTxGq4/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 07678564f11d..3033afcea033 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -208,6 +208,12 @@ properties:
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

