Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="QqJV3DhQ"
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311A7114
	for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 03:33:21 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c9ebc04891so16179301fa.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467199; x=1703071999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWX/zjp+iAoc0sTO0EE360u/fHh1vFE2puPVRvnlJSg=;
        b=QqJV3DhQ6ASn3wBywS585XZ8tatasBB+VWjS6bpB+Lh6xbLL+3fHeQ4ypAICs3Kban
         FCOvu1L9UZA+W26yp3rwLoe7IEypPJ0U09kxgk5Ei4MDYoGzFiTwocaTsQIXcnc0MCYY
         SjBqCMwGhi3ZW8bF77p+VsXsL9MtmKI4dLHIFjCYXMRsHOClhsgz7k7Q0kaOuDwaZZBG
         1gnCTVrouE2fsxLNeH2Zm7RV1qlzyltplavBz6aU+oEZDSGa6rM/EbWreC2GRX8dRi17
         +Y88FMIt2AFjhb12AzUDvWiHEV/1m+nVW/Joh8WUsbrnf3tJrQqUno5U6ymmmZdK7QxA
         eFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467199; x=1703071999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWX/zjp+iAoc0sTO0EE360u/fHh1vFE2puPVRvnlJSg=;
        b=oO5odL4aXALy03iHRH5i7jrCNCWEhEJ/cC68vHUcrelFRAwRLlcnFJBcyA3ZSHkg74
         dxyuel+i2JDSml/FuP3214ADq1/jvVA196g+K9qaCpo5jVPNprp0MGXTeKt3y7bYEQko
         NrECHlrotK9XAoC9tHb4eylSD7bMBBsdjWX9kbECUMAEUITyLe9XBXkQhUjUqb/mWGcu
         24ItSNHpts+SvRbP+YhDFuNeeKzV4V7z/YuW24twkZUdmamocOkTXKwwk6N4cklmEJpH
         86VHsEClETk0LvIFaO1+wJvgJ42bJilT7xienXdPw0tqskRzlZhNgfRk8zQLytdXl2gO
         hAaw==
X-Gm-Message-State: AOJu0YykIKnbCg4VpCeFkjkPbf3cDYz2fYLktqwfsFnwISwrFFVqQp0A
	qA0QBUPjcdoxNldvDBuNWuPh8CnmA/j2R7bOkOI=
X-Google-Smtp-Source: AGHT+IEuXYkwYCdXUnQRj5u26PSyylqZ1NgdfvKlwWU8/MoItLq0cyd9mcOkAanUk5MDzRp5gaQUuA==
X-Received: by 2002:a2e:918b:0:b0:2cb:2d8a:a28a with SMTP id f11-20020a2e918b000000b002cb2d8aa28amr5882241ljg.5.1702467199112;
        Wed, 13 Dec 2023 03:33:19 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:18 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: [PATCH 6/9] dt-bindings: riscv: add Zacas ISA extension description
Date: Wed, 13 Dec 2023 12:33:02 +0100
Message-ID: <20231213113308.133176-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213113308.133176-1-cleger@rivosinc.com>
References: <20231213113308.133176-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add description for the Zacas ISA extension which was ratified recently.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 912cc6a42eb4..264114fa943e 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,12 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: zacas
+          description: |
+            The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
+            is supported as ratified at commit 5059e0ca641c ("update to
+            ratified") of the riscv-zacas.
+
         - const: zam
           description: |
             The standard Zam extension for misaligned atomics is supported as
-- 
2.43.0

