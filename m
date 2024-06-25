Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90B912B82
	for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 00:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719276651; cv=none; b=aK9/SCV6Nz0vr8k2K2eCM+ncSw3Sdl2Hp6YHXJeOo893ArAL63wGHH8mCugYArmWLG35l2wi69VOjYVo3PsMRsOqrPFBRRT0BB8Hi3CDJ5uAnHLWxZ+8f7HLs0xgbDSGoWaPzIaK+pWhl7TPZlqJAz1VC1JuS7Glk5/vZQXBIXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719276651; c=relaxed/simple;
	bh=vR/roTozkIKi/rFdo8G/JZEoGEMw/txN1fNmvqOTGTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tCzyeJGXyfixEQlEIFmGdCmgnZ0lHKx/nyyjXN22O/KFaeRF7cMDxgwpovnnBiLnz/DyW9oZcWCZ3eHtX7Y4UvGciIWDCMfMKS4ISwRF3rIQy6Nou10+FTorbIDjpzpGmSMbNqzEqIfjzWqVNrLLu+C0icSE5aAKWMYJmLtVi4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=m4S3GEpG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="m4S3GEpG"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f480624d0fso38571265ad.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 17:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719276649; x=1719881449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJQbdAAUHpsJIDvU82Jg8JV8IiFb5YWn87NOrnsuEk4=;
        b=m4S3GEpGbVAB6xMr3EWAa/6y/fzTIaXCKSAZE/evMXDF/DxB5o9rwOB9JxrYJL8SwR
         HldJefTQfrt/EoH4jx2G0HLg5qM+fiQrLVuzCUk3n7MU/kjsQb3Kvvz1IA7K/kOqtHh+
         9aesBN6Jvt+C5lgW/xEsIqlTwfzte3y1pNH0GJAecaQFTKv1WfQx8LSaBjfJKXkWYEYO
         aPlc7942L28HLgrMI/TNa2wNrW+N/EhtyMuPhJwrS6xJGezIhj6QwM3q+HOYGL8gruFK
         mXZiz37fa0eUXiHEpOOO9GPx+B52JqYXmnH/NHRfdDm8fjzRSmh6jvTA0aspK3khJ3Ed
         x83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719276649; x=1719881449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJQbdAAUHpsJIDvU82Jg8JV8IiFb5YWn87NOrnsuEk4=;
        b=MAcUxd1WNcGMDl1sKR+2EMfJnd4yD1fJH2WsD48K7XKbZIVu833dm5X4asCEhqB8z8
         tsvCNIbn+JU6BQRylZYGnDkzwVcHpXlSaBdKHKThxw6Ov6EWdNsBdETDC91f4hj+kZ9o
         PFa0ttrh9xAyn+Lc4g23qN8mBmtEU1PBHkNpsvsbcsK4zJDf/Hy1OHzizIXsCHKYgmrZ
         6FtRikemEyOLnvxPIy+zsZjTy2iRrvcMPFKtYKRPvsetpbkzZ/BP+vsuHOIuk+DRR8M8
         GXhDhjYUpEL5TAPfQJRzxh2jIjny4qQ0eqNVwOmLSIDOfORBJoIHUUFfmx1FiIg+hSau
         NOjw==
X-Forwarded-Encrypted: i=1; AJvYcCXMdURQcANRYN/2z+jRJ0Teryv72/y4qP6rPnv/EMv8CrSl9mQAj7qnm0XSk+a4fazSpLAVp2NLrIkbV8Bg9YBG7M4pCI0YUopH
X-Gm-Message-State: AOJu0YyABSoYbT4ObkDRASxG7O9A+BGfVG/uIW3/Fug+e4VdYWLkcB68
	9n2FI3cFZosZi1FspSomO3YI4UnA+L+KdkzQlGmFPJChF2LZRCaqA6REkt0tGMU=
X-Google-Smtp-Source: AGHT+IH7iNOTk2dACUhxktOMTo7VpX1zJFsXLc4rOo9b8V0SM2fkV7dKQh6SXUdWY9e9smQZdIjpvg==
X-Received: by 2002:a17:902:e811:b0:1f9:bb24:b21a with SMTP id d9443c01a7336-1fa2401c0c3mr69837055ad.41.1719276649116;
        Mon, 24 Jun 2024 17:50:49 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb2a7csm68150235ad.256.2024.06.24.17.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 17:50:48 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/8] dt-bindings: riscv: Add Zicclsm ISA extension description.
Date: Mon, 24 Jun 2024 20:49:55 -0400
Message-ID: <20240625005001.37901-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625005001.37901-1-jesse@rivosinc.com>
References: <20240625005001.37901-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add description for Zicclsm ISA extension.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
V1 -> V2:
 - New patch
V2 -> V3:
 - No changes
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
2.45.2

