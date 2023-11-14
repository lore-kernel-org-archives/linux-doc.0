Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E563D405F8
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="N/thXekK"
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B141FCF
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:14:00 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-77891670417so55614385a.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971238; x=1700576038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rR6IoEmFXflq9Qi2M8/M8/Q1NwDbTzc9ULqQpExnZtc=;
        b=N/thXekKUOrWo0W1g0hZeBjK984McFlvDKnUJ93Fg8G3BU7BA6AIUwkYGUAmFm1W/c
         pZw+T6EVvJIIZiB8u9myTSLXJBGSJw+lsGbyCeIlFbeDS/vbeoEReROE9AWog3Tyo2TO
         NET3HmTC0cHI44r4kyrrPEQaSEhR5ldV2pKeY/KuPtg8THRluZTLIQHwpjRgufMxL442
         e89inI/nfS+OuSmybuAEElEkpOTcX3xCECORk97WbBS3fzMI+Ck7opbLbKtL0Ga4iXZR
         vvLwhfOAQIndX5luSPMJ5xGPWEXoEs+k6F6P/E55EuZIopDNCJoYnNuZ6HfBadt0/S+2
         Hblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971238; x=1700576038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rR6IoEmFXflq9Qi2M8/M8/Q1NwDbTzc9ULqQpExnZtc=;
        b=B5j4UbxWyCD4UGqNkbeaoyZgLQOU/9AHHAhwucTkA09S8lqvuc9aEEHtgDmAmoo5IV
         YHyOQbmLXeai70CGOiVpAwXV2NeNBTAV06Dl+3tFO+nfqhPy1DvqHM4ZvwxRCV0ojGKV
         ZUixbhT7z6IkM7FzYbq6jRRVeRVjdkDLMhulpvy/gHVlFIN4bGzxmDEs5x0KVcDxyhxz
         mUDE9Ur1VyZEZ+Ih3h6LqgPgOjRMEIob3ZuobhrIHmI6lQK9iciefX3hWUhZZTzpZFrU
         UyJrZLqOR6engEtpz3/p2/vSc/HxZLshRpdnAQcUBynR8rg+0U0GbQuTtGiwzh0HaVKw
         VrDw==
X-Gm-Message-State: AOJu0YxUiTc89B83FPR+2TzNF3POCDRFGTvcAzx9KsPI4/qmlqpG7EfQ
	X82G5YT5Txb+AXvb8iNXzqeYzQ==
X-Google-Smtp-Source: AGHT+IGC6MfMYTQMl9dKfVeKwBQV9tnSgNOr1rIW41NsUM7O4nwiZO4ELAHWdrBbYXRRG7zqxSN9cw==
X-Received: by 2002:a05:620a:461f:b0:774:17d6:31f1 with SMTP id br31-20020a05620a461f00b0077417d631f1mr2492695qkb.4.1699971238436;
        Tue, 14 Nov 2023 06:13:58 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:57 -0800 (PST)
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
Subject: [PATCH v4 20/20] dt-bindings: riscv: add Zfa ISA extension description
Date: Tue, 14 Nov 2023 09:12:56 -0500
Message-ID: <20231114141256.126749-21-cleger@rivosinc.com>
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

Add description for the Zfa ISA extension[1].

Link: https://drive.google.com/file/d/1VT6QIggpb59-8QRV266dEE4T8FZTxGq4/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index b91d49b7c3a0..3574a0b70be4 100644
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

