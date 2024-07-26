Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB05017CA14
	for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 16:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722011855; cv=none; b=fO5enz9rUapN9l7zeNmgmINaHfUs0pJOLQKjQ976GEJkhdvj4s9zHbLntei6ETBuFDbBKZmajlgKnpjhWFPegkqPirje6LdnOy/VaNhE9XkV+LP49CHVUgpTH09zHf63XlcNqcWmzVwZ7FF7VTyPLUO5VZXvdMp+xX6rEesitYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722011855; c=relaxed/simple;
	bh=vNIHtugGXysUf1ONK+0MY3ajgJQFX1BdZc09x5lwA3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pYdsoAw6JCHQ3leCs4JZMBu7ERjFmBbmKIv8EQvK7V+ncjCVJPy5AyugekdZqk83Mx2jftaO0fUmJXNmGX48bzPPNaemfbtGhKgXrg+KC51IAvk+gkqxwe+FV/TH/VItyWDrhsICa8T1fN/ZUhSmM1b/T+f57abnBE7+ugCJ7R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=WOshvIcX; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WOshvIcX"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cd5e3c27c5so850210a91.3
        for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 09:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722011853; x=1722616653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ct5IHVvBReq+T2pk7qCX19ZuVPxoUlBznhISu+pLlbA=;
        b=WOshvIcXhaNIRbhzn+8Vgi3rv3gzDyfsonqKa0oWEXIiNSLQqk3VQauy5HCBDVYJis
         r5S8va6YyMRQf+3LdfahRrCWTWPbe7ZDwlvgOHA7K9WeYv3xofCQ29ph16BTdxHLppoU
         4x/Z0nbFDFB5s8zWDDfD5nI6F+YHQdmZcgy/6jph40fzzIbv692NlI7ckitY9IenCH9g
         konSbNtA64Rq9vxNLwquShSr2MCt4eUOUghqZ3IvlZGf2/CjkyORkZxJmy09IpMHQn4Z
         nr1LHB9uAWefC1oeZvwvu0BeFBldIDYe/M+YKUhHJgMa+yg6SjqXhJVvdPMmqkuUq45c
         iGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722011853; x=1722616653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ct5IHVvBReq+T2pk7qCX19ZuVPxoUlBznhISu+pLlbA=;
        b=dq5cbVppakmaxMPjqlhOgB354jANLgYcCWNwDzpLigIw+RIRR3JTRYjShet382ufcR
         WmwYaHhsFsla8Yld/ejX+5i/L0cyMCCamUwuTmBlTN9IalpS+D4PSaloTAffTUj1Rb5I
         mynLg7xGtCGnAG24I8GxMEtgCs1pinzFbeIreNQT1YWm5O01zEnu7Sqp3lODrljeWd53
         1eIHhX/D3iVSCULurmTrgKYkN/QsZVXZEKKQM/vpz6D8Bm0rykIhg6mTmAwzTRzSIEm6
         91fP4r6cl7o//3lp60bpmu1OkCxAGdYP/k+N33pxTzdbogyaU/OfRLNuyD7ntmAAsFsQ
         lC9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkb30aMayec+wDJuyE4n6t0UczCnuqA8ARUVAGz5OI7n8tbIho05LsLaithFqf1pZKQPJWpjV/IRqvC+tuanwOL2DovGqzkVBS
X-Gm-Message-State: AOJu0YzZKVhvJMOTlZqdLFowB5dzrU1WI3r7VdKPQK4kOh3RvNVtJ82F
	wkfDOYJW+drmqdFkJ/PtBZe8RVAwTnA0/1Qjs7SexISlJ9kWmazy+AvYqgTT18E=
X-Google-Smtp-Source: AGHT+IGzZDQaijmw3sqbbu/8le81Z5VtH5YaKfaTBBpqys+glA9U5Y2/yFGQbXUxzMVFyUnSDk99Uw==
X-Received: by 2002:a17:90a:a018:b0:2c9:359c:b0c with SMTP id 98e67ed59e1d1-2cf7e82fdf9mr16585a91.28.1722011853207;
        Fri, 26 Jul 2024 09:37:33 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28c55a2dsm3676619a91.7.2024.07.26.09.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 09:37:32 -0700 (PDT)
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
Subject: [PATCH v7 2/8] dt-bindings: riscv: Add Zicclsm ISA extension description.
Date: Fri, 26 Jul 2024 12:37:13 -0400
Message-ID: <20240726163719.1667923-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726163719.1667923-1-jesse@rivosinc.com>
References: <20240726163719.1667923-1-jesse@rivosinc.com>
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
V3 -> V4:
 - No changes
V4 -> V5:
 - No changes
V5 -> V6:
 - No changes
V6 -> V7:
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

