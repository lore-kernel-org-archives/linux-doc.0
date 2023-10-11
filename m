Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6431E502
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 11:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="nCJtqCc9"
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19569D
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:25 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-406553f6976so17190245e9.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023164; x=1697627964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgOpomIA0gFd2Dumo10XdK5WbanlcO0t/Ib98/qFyoU=;
        b=nCJtqCc94cfvZTkE+xghYUTxC4nV6QIGHXPU0p6Cu1fQbBmiZoJt4f5TJCpFYqKBVj
         yB0j6+683LJUgv5DfSppE4KuOwtnAjNU+jywjEa4gey+7sTwh1TqZRrvGvnANGnVvL7t
         2zdghABIO3ApI2S1ilCCFL1iDxCm6wXBHgmiXDrLy6//hG2cgVQivetNRsmJyP7AXq8V
         Tok4Rzv1mMTE6hgsTg5wcygX0Z0Kn3W8KGH1EaMONvdE1HfMU9Ykryj8RfQiHZV7jlDD
         a2EGfE2GKNywn6SXhAAS/y7ZHssqJW8TzWyIVK3PnnvzC3fpwlr9DEDpMkvzoRrSZtWw
         ADTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023164; x=1697627964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgOpomIA0gFd2Dumo10XdK5WbanlcO0t/Ib98/qFyoU=;
        b=XR18hB5UTBg1dqzLjZWc7UT4qEqfrdtY53EFEKJ9vbOXtkCXgZjFeYjNSuRWHVKO1Y
         yyZvHE5N7Qlq3GnP8FV8CCBPpjzdrp3EZbxsGJBvjNSxssmVYUgeaGgfeD6bmLV7xB3Z
         i09/8pri8agrZ+vIQrxGZUX+pBODrEHvYu5FafDVeE/i0Hac3YdqlNAAkmFyTVc60xUw
         iZAq78khM88k83uIpqadaqdckqpLAxO1YJY0tWod2l4mIr3fLh+/zhYofkeszNJXh0xj
         uocVU8KeV+iSu0Rz5pNPThLK7Gq4YqMqNVwh2oIHHk91JH9sQXFMubfjL/4pn1qO75BS
         5o7Q==
X-Gm-Message-State: AOJu0YxIuDXIEvUpHC2gGJsD4JJij95YLGQXzF2IALGhrzaSmfwwyE1z
	ckNuHCfOzEX1P1z0RJEoppShCvkhFZF3Jb0rdLw2jw==
X-Google-Smtp-Source: AGHT+IFVFIbx7DKNbft8CuPYlaXxcUAmVstIo+qHMKhRiCsnw92NpkwOTsKvZdeKecHBMfd8bUqpbw==
X-Received: by 2002:a05:600c:1c1f:b0:405:38d1:621 with SMTP id j31-20020a05600c1c1f00b0040538d10621mr18328348wms.3.1697023163815;
        Wed, 11 Oct 2023 04:19:23 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:23 -0700 (PDT)
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
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 10/13] dt-bindings: riscv: add Zihintntl ISA extension description
Date: Wed, 11 Oct 2023 13:14:35 +0200
Message-ID: <20231011111438.909552-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
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

[1] https://drive.google.com/file/d/13_wsN8YmRfH8YWysFyTX-DjTkCnBd9hj/view

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 4c923800d751..70c2b0351357 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -247,6 +247,12 @@ properties:
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

