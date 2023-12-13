Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="RC0pQrg+"
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD947125
	for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 03:33:17 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c317ba572so12199505e9.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 03:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467196; x=1703071996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bstEpC4Wn7eojNR4ey8qLYKe/MWWQca3CdSgitFw4Fg=;
        b=RC0pQrg+1tzni5Y/urP2QWDVAWmKqQUsrkRj0mkkRUeu7RUyjQAaNL9xs2KZ8B8u7w
         qAyP3KEhtSBooyTraLIgzc97Zdu10Lx9T1Q9kCZ48YupxjLt1+XdRDesCjuKhqKZn6FG
         FZVe8wO+gH6jCMj+J8/4tSIFL0w65DgvzsVGTvvGa1b58Ji7zudsKY2+sPasFIale85o
         GHGLg5ufOgZWrGr/O5GmVaZvKWcAkSiUNQkVs9prh21o+vH+SmG3XAhe4zyDwUlWmfio
         Nf+uMiXqj3SgPD8H8wef4UCjj+48zhsFEK9XtAoEQjEoyRyz9yYTf6R1gODpJoFg50p4
         sNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467196; x=1703071996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bstEpC4Wn7eojNR4ey8qLYKe/MWWQca3CdSgitFw4Fg=;
        b=rDJLkKY/eV6YZl+DE3p+fkC/PQ3V0cHoUSzyWSxrmDf+roPmAtmBSooc72AuOFgp+B
         lRtKwbJPkcckUWkInEGoNbT+g5zCmyOw8BGa7ivGniWWWw1wBCF+PKXICFOHsG38IvRF
         XQYAvNo2P4MTQHorNTWWkSHAH5iRqKcIt/d3MqbDE21erStwQPhWaXldwgUjcMPNWy12
         fPnOBzKkIxWNUCuVEaLGeFRs2eR9mBorVX+cm4axtejr49DAfbkt6UzQG8hlx6kZw61O
         /k4rWibfAUybsoXXnv0fGTQE+T4FD9bn9YjJLtRylnvUZ10CIWCMl/X4oBgxRlvnI2ul
         X5ig==
X-Gm-Message-State: AOJu0YwZpp51x0SoWehCynO7411MtccN3fa6K9UQemZ4OZjscSMaG5SD
	SuVUmZuNMtx3AOtKsNzDDjTX/tgoHkkW6Y+S9lY=
X-Google-Smtp-Source: AGHT+IG2tOfMAS1pydsf4pPawIp50fPoX384Fx9efJpcAm8MmIokurwGuZwz8GEsZl7/fbAwTEX3Lg==
X-Received: by 2002:a05:600c:358c:b0:40b:5547:76a0 with SMTP id p12-20020a05600c358c00b0040b554776a0mr9797289wmq.0.1702467195152;
        Wed, 13 Dec 2023 03:33:15 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:14 -0800 (PST)
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
Subject: [PATCH 3/9] dt-bindings: riscv: add Zam ISA extension description
Date: Wed, 13 Dec 2023 12:32:59 +0100
Message-ID: <20231213113308.133176-4-cleger@rivosinc.com>
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

Add description for the Zam ISA extension.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 3574a0b70be4..912cc6a42eb4 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,11 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: zam
+          description: |
+            The standard Zam extension for misaligned atomics is supported as
+            ratified in version 20191213 of the riscv-isa-manual.
+
         - const: zba
           description: |
             The standard Zba bit-manipulation extension for address generation
-- 
2.43.0

