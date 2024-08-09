Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D07199222
	for <linux-doc@vger.kernel.org>; Fri,  9 Aug 2024 16:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723220577; cv=none; b=HQ0pXLYLpwbCIyBkUK2JAVjmE3uR3qoIwNrRExaBnaV6edAIj2zYAhZ0TKczWhtNOzDKROu8TKEEEp04tKyj8t75tcEq9/d19WWjDrHbrgquiIosTuFcbxBh8R+Jtrm6709kc77pmv8KiuEBEGkmEGHgkm+7E1lGP6KMXekv/00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723220577; c=relaxed/simple;
	bh=Q7+mHfaG/gPeyphnTcK6yRgJq6izjUUPKdZlakTOdNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOWxIe/e0Iazf8M2uaOGWa89yBHx6LhQd2ALmq2BDotqksgw5QIQS4qz9c8CoJESHcvWF9K+B2RXIV4v+XKjQsf3RX+xDGJ7KxPLYsyO0eGM/RsNsSKEd+0pYbkzy1UVa1i3ajKqCNKJTxL/9vYkET6wMLefn7L45n/FzOmt378=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=GfAjM6/N; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="GfAjM6/N"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7163489149eso1561627a12.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Aug 2024 09:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723220575; x=1723825375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9KwuCeskSHSsK6Ge80MByzX2lckhBzz4l4UPkzzqNs=;
        b=GfAjM6/Ne+yZDIGc7Hh3LvhCoHfcA6Xu11M902TZPpip/79PHPtf7g48DWwCivUens
         BKVtBJf+/8KKgbuBiZIuziE3ekpIpF5BD0cbWK6Q9x7UmPI1Tk7EWls1Sx5mP6RaPpZ9
         FTE4VAarfotAaHN49Ky4DTTbP/s3OIKP0olG+6hI58cctg8qxPn9hhD+Mr/dl5TqQEZM
         q5TyNgf8ZUy/5vpTD26BJrGeEfvbnMaaQuENuh/PNIRdId3LhfudYZqLgNeW8oh6xPMo
         Q8kUPlC8Q5ggQWiFFjrM5x/QM7+n/FHwfWXPZknCxbWLm3YCbPM/jDDQdRA1arFmkCa8
         wM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723220575; x=1723825375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9KwuCeskSHSsK6Ge80MByzX2lckhBzz4l4UPkzzqNs=;
        b=XhDoGwGwlpA7dqEJoQrPs8P42MyFt9AtPAhfNVieL6kZy5YweiAcPSQyX0NBo12Jh3
         2DFgH4iQWNeDBMZWz/tJr/XHKsD5beREfdlrDl/EKQGpmyd8dx3SSvwhKu7Gz60UD2qJ
         HRnKQUeGzaEvEVbHUXGXe/PNvJSmzV+V9j8+fEkJ3oXnZr2Rf9opNMJvp5P+QJZ2n/kq
         aNddJ7Xu/X1qcRX7PBSKl7nyDfM9aY9d1ZG4jJSdci+Eyoiy9cepdVMrkYIAjeUbKP9J
         rQj0igloIYIDMdSQPkhnlVAa6H9+y9Rbt7bLFCAwN1KiHn9sKmVdt5rIetBclMbV6Poh
         7wbg==
X-Forwarded-Encrypted: i=1; AJvYcCVxum1zvGS/bm1auJwGQrNmYmkccHUHigV+3QnB7N/VvIuPHvBqD1VMELJssKpz8+WSnM+z9CzQcFCRAIAHJQ/EvPeRJfIii8Cj
X-Gm-Message-State: AOJu0Yyflz6BQ0IjWexQJGLNKYZ0GYA5XoqoMKAMG6q2T6jIe6OPlwRi
	3+8dQ/ghAPE8HpE1Jufq78gOmX0VW+PdswnYGpUQwP4bz76gmgI28S9dinqJGBg=
X-Google-Smtp-Source: AGHT+IHp8h7nr4BcWcXSmFlRdpIdfs78+tQ8JlqIPTYsDMyESOd63kL6pHIyup+248wklqPMUEbOiw==
X-Received: by 2002:a17:903:944:b0:1f7:3a4:f66f with SMTP id d9443c01a7336-200ae59b5e2mr19226275ad.43.1723220575225;
        Fri, 09 Aug 2024 09:22:55 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200668fc398sm100414505ad.207.2024.08.09.09.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:22:54 -0700 (PDT)
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
Subject: [PATCH 2/2] dt-bindings: riscv: Add Zicclsm ISA extension description.
Date: Fri,  9 Aug 2024 12:22:40 -0400
Message-ID: <20240809162240.1842373-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240809162240.1842373-1-jesse@rivosinc.com>
References: <20240809162240.1842373-1-jesse@rivosinc.com>
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
V7 -> V8:
 - Rebase onto 2d1f51d8a4b0 (palmer/for-next)
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b4928..d06ee82abcc1 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -361,6 +361,13 @@ properties:
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

