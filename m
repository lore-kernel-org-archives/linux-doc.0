Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC42112E1F1
	for <linux-doc@vger.kernel.org>; Tue, 23 Apr 2024 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876253; cv=none; b=QLuqm2PcUc+RfQfu2QzJ63BgSpX1Qg+OgN7EiUlbt+yd0onpBgMaqyYAgy05xE68+8m6L8PUc67Y12JCrfV4OpxOLhOkNiFRjNY4VEitMQdvW2gBOQT3+asvSUkSjHlaAnWeOdj4Emee30yMdIKURjy5NC5zisQA/k2gar6n3eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876253; c=relaxed/simple;
	bh=Vz0s8AKnndRQ8cJTZ/3LH6Q9O7ZuS04mMnmJYlpWcHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j2JAc4g8XccWTleXB33HJtHQUs/xVkCXbnepkx8xHw0li+VhOCbbgOk/x52huMBL2Eltdvqjt6xoL19s74sfAPMD7j/qXk0DcFojoNh5/O1+9XRc+Tf8WZ5jOpBeagf1MlC6GGSZe9cEzHQUkG0OdjC+98dDNpITaUdHIRYK14k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=QymOpNrT; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="QymOpNrT"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a556334c556so110140566b.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Apr 2024 05:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876250; x=1714481050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqUXz3P/ILbAY/obovxuw/ulwPrEeHHfsINnJJgombQ=;
        b=QymOpNrTCZiTMXTftlzGhOl0j/afxFwB8k7XuJw7SgoTjRkLzcG5BsXBBlHjkQeJ4D
         GIDs7xc3vLDjvtmLx87lsGSwns/mWBPGE+98ixO/98dgIaooY/C0ZHdsXKPKyp8n9SlT
         dsAYy2BJXRXEbA+E2YtLZa0JBJph06niDUaSDyFAkUddAGCysdU6+DrooE/HusevFz2F
         hMpxWn/Fv+YGc9qfx41uEaBx/Lucefi6hYQfBvbbUh0B+DpqdOp//r27OkEEj6ydjPJt
         Zq/Drt5X85Li3Dhodh8uflj9CvJBqBKXdcRHP8LMdxQgilC0xuFdaFfDlbvW4U/5kzQE
         ZTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876250; x=1714481050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqUXz3P/ILbAY/obovxuw/ulwPrEeHHfsINnJJgombQ=;
        b=Ou7nP9o/geI8k0kXInSeP+vUDXecE549QqQ0PBrfmDQVMxPIcSBOUsqcJ6DoME8OV0
         FHFdrQ+vNQVnot6MMueuiF0Nj9lqG9reeSj1cNrFD8t6jYhqIRiv+o4v0e1b8Egn/9uE
         gjjRMaxicKxBSo/nVxuiDC6mNIesrG+Ys49pkYKHWZO81T5TnOj33mKEikQkKkmL4fSb
         q9XCJFkqxnn3sxLwZO15aSyrj/uGdHIG192rgr4MLsa9j63ZM9eLX0Fjgi3xuQPKdS/m
         1O2JsxUvlFYADrTYCWJ1R99jqWeUdGlFTgCsKdZCm2FMerwz2YIUPjNhYpiOxEmrQcNZ
         uTfg==
X-Forwarded-Encrypted: i=1; AJvYcCXhHT1z1F/m0+kaoOyeb6dLasDEwu1tA82AwjI9B5JFj4xdviExji3Hoinp3qj0lJwlT18Nr0avdy+K8IooJFzNhksOPar+0s2A
X-Gm-Message-State: AOJu0YzwuQC5WQq32YFieIRfU9wDJzMTkEncby2AHITILTLa0/SViRlY
	Vl/ywZxSPzGStSYC+OXPWdTKZ1euD4efYcKcobXqIvYQxmrX9Tli5Nt6YIslDl6bpyrByZO5APc
	E9cg=
X-Google-Smtp-Source: AGHT+IGYD6R7lCuFXcFn1CiEepxwRzLgpJssX7t6iPTjHzI3S73/lLM0TpTesKJAZsPqOxcquQWylg==
X-Received: by 2002:a05:600c:1c27:b0:41a:c4fe:b0a6 with SMTP id j39-20020a05600c1c2700b0041ac4feb0a6mr1112456wms.4.1713876229210;
        Tue, 23 Apr 2024 05:43:49 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:48 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 07/11] dt-bindings: riscv: add Zcmop ISA extension description
Date: Tue, 23 Apr 2024 14:43:21 +0200
Message-ID: <20240423124326.2532796-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423124326.2532796-1-cleger@rivosinc.com>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add description for the Zcmop (Compressed May-Be-Operations) ISA
extension which was ratified in commit c732a4f39a4 ("Zcmop is
ratified/1.0") of the riscv-isa-manual.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 81bce4fa2424..1952d20b8996 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -252,6 +252,11 @@ properties:
             merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
             of zc.adoc to src tree.").
 
+        - const: zcmop
+          description:
+            The standard Zcmop extension version 1.0, as ratified in commit
+            c732a4f39a4 ("Zcmop is ratified/1.0") of the riscv-isa-manual.
+
         - const: zfa
           description:
             The standard Zfa extension for additional floating point
@@ -549,6 +554,13 @@ properties:
                 const: zca
             - contains:
                 const: f
+      # Zcmop depends on Zca
+      - if:
+          contains:
+            const: zcmop
+        then:
+          contains:
+            const: zca
 
 allOf:
   # Zcf extension does not exist on rv64
-- 
2.43.0

