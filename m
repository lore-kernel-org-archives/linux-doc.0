Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1741E1E504
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 11:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1EvNDN95"
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D9F6BA
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:29 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4053e6e8ca7so19945015e9.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023168; x=1697627968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6vkJpRdG/bLQ2xKu/qLTVaLR+B+KqIXN0A+WQhuda0=;
        b=1EvNDN95s8fo5kRPe1sDwlewaoKAlz8zqE7fsvjxMnU+V4mNLKzjP7t27snt1RvUjY
         76aUkUi9DL62UAJgI7APXDdwDfQcxvHxY5BWmA7TJ2sPJ45HnDPYMjAV7RiITP7q3eKU
         IkuMxA4zrxy4D1Pl4APy8hU4nBHR3fkcp5NFvgPRZ+6w0ccAjP3P1K3ach9dK4FlSvYE
         cmC7FDG959sLD6Ky6p/TVshA+YUHzhogx8wsH0ro9D4qrx4bBdmzPDHRUkv8VxCslEVX
         Hms+xEDLq/7DtiGO1vqLTvpSr4iOpiM1aHqxMKixiwvFctoh1V6M33HYPA33fo44SC9d
         xv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023168; x=1697627968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6vkJpRdG/bLQ2xKu/qLTVaLR+B+KqIXN0A+WQhuda0=;
        b=mCTcZTZGcofqj44/ZbkzjcuosydTZtsfIo2wpRs4QCX+OE41VKnvQhcO+2QA1CHZME
         nJ2phaMBtYQJcnFA5UGi7VrM9h7dDf/igRCfvY96P0sjicWEF6i98ER3TXU04tGST5RV
         wfqq1Ur/2J/Dqtcuxqc7xTLroCpqC8jN1A4kD1RZbGqGJ7ehgbtJ+NSMBIzCfIJHDf4T
         Wuaq/4gahDA5VLA8qqYEBj10w/d5kxOmKP76uvgFvlxekyCOpNzF5yl8ZI7iQLPLmhob
         MLrzv3mDbFr+EcnnOx4hv1GddJ9G1hma4+Pg/G8MTOjc8vNps6rOB8AlW/kHg8hDlQgi
         8VlA==
X-Gm-Message-State: AOJu0YxRehWTHw6Wqq4P0D2TFlJyIyt16MUaXSgG6Fi28MvMTJW2mZ5/
	KpB8ou6eK4Dc+0FqbAjJZ2/PRw==
X-Google-Smtp-Source: AGHT+IHXrxe2sFvVo+XelH0PH3G8nahvmswXp0qGPu5jm1rix/iAXBAzMu1U6LxnE5OCFMSwjGB0dQ==
X-Received: by 2002:a05:600c:511d:b0:401:b53e:6c3e with SMTP id o29-20020a05600c511d00b00401b53e6c3emr18807765wms.1.1697023167444;
        Wed, 11 Oct 2023 04:19:27 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:26 -0700 (PDT)
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
Subject: [PATCH v1 13/13] dt-bindings: riscv: add Zvfh[min] ISA extension description
Date: Wed, 11 Oct 2023 13:14:38 +0200
Message-ID: <20231011111438.909552-14-cleger@rivosinc.com>
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
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Add description for Zvfh[min] ISA extension[1] which can now be
reported through hwprobe for userspace usage.

[1] https://drive.google.com/file/d/1_Yt60HGAf1r1hx7JnsIptw0sqkBd9BQ8/view

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 70c2b0351357..ae7db420ab92 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -277,6 +277,18 @@ properties:
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

