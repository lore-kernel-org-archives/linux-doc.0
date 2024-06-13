Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5DF14A616
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 19:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306226; cv=none; b=XUjuISs7oyIUQNO8HqzpnfwBvofeL37vb7sdl85QCsmy5/+3ttkErWu0jZkJPIQPFSILRqY0YLZcC8eixzX1z3YJM7xMv+P5AT54v/KvHNVzTRPtRpnUt2YQr1RTxjIaC6CYJTNeXB9dGqUqYUsDDXXWBHIAPjB0NoY5t3dGlTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306226; c=relaxed/simple;
	bh=SV+MkVPA7IjipbxXq9CYQ51R+m8bJWkmFeRtI4XsMPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IATeFItlMr1niwJw756b4mXnCuvp88/9Tzp+JMOgHV7DawfCPTaDZlV+4LEnLXIjHWRt3M/CvG8J6HOFi0bB0VB3cmmJz8vv++f7tJUOv9K2JS2p8U56WQiI602OBaIRhc+ZWVDvp1yWuPXvCpr7nyGaSkVmNIboP1v6JCgB17o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=LEnauKVe; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="LEnauKVe"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f6fada63a6so12052735ad.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 12:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718306224; x=1718911024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpE2Ww+0dze0r9EN+Ae4oSiwfKGmmGKW1FHSshUbIM8=;
        b=LEnauKVeetD1sZlkRpPpsMHTrPbS+TqXrZocfREPhDTr7AfLrpre5nqNFjdF3LcWj/
         pfJeo8G2qa/DmRxS0QWSB4XNjzQkRSTPGGL3BfYD1gqwaxp7tSiwIPpL0XNO6biUoSur
         GezYDspBKwx2RYUUX3LcLC2DvKZ5KTgW6oTROkI3JZ+VcnL80MGfQO+a5O4lhQyl8qbd
         ADNa6yZZjtrT2y5Ze+kyDAy4IAJgji7lYWuC2qfFKlkRjzkRKhjX3VpHkEyhEI3bmSgH
         gLoqLviQMaQav4tuS7+3J0cZEVm4Qbda0s+S06VIzPu3szLsAyv2Z+j6m17sZKPanrXQ
         tcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718306224; x=1718911024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpE2Ww+0dze0r9EN+Ae4oSiwfKGmmGKW1FHSshUbIM8=;
        b=oXDFJqhNJ1Z7g9u/3Zsz0nI/1VP2kHYYlpZK/UkAXsjck7MduIONCaAE/tmD8rXU1p
         A0Ti4pY/Bz9KSpCqKJDOU0xNoQPsuxkdy84EVWari0/J5P+1IXhyK2EAkxrNH2m/nemX
         /JwdnrLNRxMVNaMU9ahs/CVF3gZ8KD7jVLaK0TNu5uD6BpzIsUbtPo+OK82tS4EyviGO
         gcR2+BTdPNs4CKGv7/bFgtTDQr+7LM1//euPG1SNYfXrgIRynp7t3Gec9a01cRgWurkO
         HOrBLo9VA94ljgzzsbJqSNWZYINQZTYKgHiJWW4ehny7jnB5fWE+cerK9Eb/CeCNv+Xb
         bbDA==
X-Forwarded-Encrypted: i=1; AJvYcCXuewi+b011Q5cEWeX1no4Nmdaq1UbrZrhlgqd5KN5pdVEp/v3HTvTPPms9YZNfX/Wk9tyRCIZVr+zqWA/G+JDWjSxqRC+S9AuE
X-Gm-Message-State: AOJu0YzjhJiAFQn32T2QNK0XyxMY3xXHLSKSAmaVSEtyybstxOFcNRbI
	lBr3qnWqeOF9LPnnSmbs9GtgoxvyEugLBGZVHb+1QnyZvvRBXLSjo7AWFPAvM24=
X-Google-Smtp-Source: AGHT+IEBHUiOGS6vq7hxV351Pocq5uf+7spoaKHpPHfr2Yp/P2zIdVv4yVxvGq5/azSD93awMnHT+g==
X-Received: by 2002:a17:903:228f:b0:1f7:317f:5454 with SMTP id d9443c01a7336-1f862804bb9mr8516685ad.51.1718306224484;
        Thu, 13 Jun 2024 12:17:04 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e7ca78sm17471015ad.106.2024.06.13.12.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:17:04 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/6] dt-bindings: riscv: Add Zicclsm ISA extension description.
Date: Thu, 13 Jun 2024 15:16:11 -0400
Message-ID: <20240613191616.2101821-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613191616.2101821-1-jesse@rivosinc.com>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add description for Zicclsm ISA extension.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
V1 -> V2:
 - New patch
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cfed80ad5540..9f6aae1f5b65 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -317,6 +317,13 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicclsm
+          description:
+            The standard Zicclsm extension for misaligned support for all regular
+            load and store instructions (including scalar and vector) but not AMOs
+            or other specialized forms of memory access. Defined in the
+            RISC-V RVA Profiles Specification.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as
-- 
2.43.0

