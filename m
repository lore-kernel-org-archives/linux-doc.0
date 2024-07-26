Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8F617E445
	for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722011880; cv=none; b=fCz24+pt/qZfTa7wkc2KBVKyXmOKE3uGN1x6ZoERm5RrMudYLrfu+eDO/vIFyUH2lg0o7bZYGngLXO/sePmzRsoEZ7UD49OKWVPFE8yyMP1tos/GuMM83NEb+eyeHoXcaTR3n70d3Rug18vR/D8QCs1tW0ICyTSZrk25gfMQMPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722011880; c=relaxed/simple;
	bh=wJlwKvHnHsmxr8ol1Mky5rqH/81g2E3nBO2+CHtrVdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hS3yCPvM5nY91B3hHywLrBY0ESA0PAKvRwvaXcp1aoVYI7CMZ1/Yp63t1k/5g2FeUhA31FFn4M5DvfsBAx/VV4sUsB/1UPsNkhxzhaPTenygYfjfiU/hSKh68VolcqGbEROX2RG4nZcoiG5hqnM0bFXQgIAmxHfiq8Bawkxc8QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=za7UJh5e; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="za7UJh5e"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7163489149eso906315a12.1
        for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 09:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722011878; x=1722616678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCBQVSPRYPBIeQ5EoC+hl2LHpusqOR8yThszxhSpMg8=;
        b=za7UJh5e5Y3eX4YWKOA56x87J3jAN9WbzToyvaj/bw1FEqzyYeHeZvN/dzpHSE1w0I
         jKYTMSkl50oPUmpW9+oV4GVbgbtNJEgq0oWFI7Jy9k1tESFSwJ78f+NwTTlHwl9OaMTm
         ZJh06JXzNdUYljZcsC1/Qc9Zxt953dIkQ32xbyR+sz/CHhqSS9oG9CMx4ruoeBLs9K99
         m1hkrZ5QhwkM06FLGttWuPlfEP3KRszeul5xAVzeZQe6BbCODrCHa0CQSnMllGDmWHj7
         lA5Qw3W9v1r41Tc9bOencUMeSWekDHc+8cG7MdTKoclxGWN4uaQ67nOHQasdInhKKFAa
         KgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722011878; x=1722616678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCBQVSPRYPBIeQ5EoC+hl2LHpusqOR8yThszxhSpMg8=;
        b=eLvhYE7OPhqRNXbsQ5PWUNmJhmObNEQB/UQZzl1qHnhn8elcAgB0lA/o3sqhxqRkQ8
         prL4TqjSIeslj5oMIFxTgTU0yvb2wHkCU9/VtCEvifT+YXgI5welRXZyxQ0bX2n7+wLR
         Gw9RR4YE00De5S4lSGdkrNal6KAmJ51819HoJKkpnBSyiExp5JCZJbrBscrlQRDvOsUR
         Y5ZELncBq3Lvb668iBuzZMktOPjjHmLe7cMPEXwZajqnrsf+phfUrFJCE6WRhFIPace+
         pxWMej7lRLQaOeAYg9LEWCgsOYJ5m+E0MHLJ9BSWk0ERhDsoFxvh+PPsXY0efiVSVfV/
         yZZw==
X-Forwarded-Encrypted: i=1; AJvYcCVJaUZElttX6pL1OfUqmFoQlplO/yUWe77v7Pkhjn/THMTi892/qoxyMeLlJBQSHx7MTpzhYsdRCCGAff2TFKKT0F5IHHEXg6Ws
X-Gm-Message-State: AOJu0Yzw8NPMAd778jNYzl5VJIdAbhtQ8RkKE6OHlWM+AxhTUZUKGmZj
	5oJaLzIINQnj0h+TE27ED4nmLGKUpDkG0hDuCPjl9H0iyhXUpsJeccTZaSIsoAM=
X-Google-Smtp-Source: AGHT+IEXYMNp7r6J/EYXhRPF4svQfnFw/pxaQt/HnMEC+56U/jYOIE7D/L1AibRAOg2CvPdeVu0dyA==
X-Received: by 2002:a17:90a:d98b:b0:2bd:d42b:22dc with SMTP id 98e67ed59e1d1-2cf7e868df4mr14654a91.43.1722011877991;
        Fri, 26 Jul 2024 09:37:57 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28c55a2dsm3676619a91.7.2024.07.26.09.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 09:37:57 -0700 (PDT)
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
Subject: [PATCH v7 8/8] RISC-V: hwprobe: Document unaligned vector perf key
Date: Fri, 26 Jul 2024 12:37:19 -0400
Message-ID: <20240726163719.1667923-9-jesse@rivosinc.com>
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

Document key for reporting the speed of unaligned vector accesses.
The descriptions are the same as the scalar equivalent values.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
V1 -> V2:
  - New patch
V2 -> V3:
 - Specify access width
V3 -> V4:
 - Clarify we're talking about byte accesses using vector registers
 - Spell out _VECTOR_ in macros
V4 -> V5:
 - No changes
V5 -> V6:
 - No changes
V6 -> V7:
 - No changes
---
 Documentation/arch/riscv/hwprobe.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 78acd37b6477..f83a13dc4cbc 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -238,3 +238,19 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF`: An enum value describing the
+     performance of misaligned vector accesses on the selected set of processors.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN`: The performance of misaligned
+    vector accesses is unknown.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_SLOW`: 32-bit misaligned accesses using vector
+    registers are slower than the equivalent quantity of byte accesses via vector registers.
+    Misaligned accesses may be supported directly in hardware, or trapped and emulated by software.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_FAST`: 32-bit misaligned accesses using vector
+    registers are faster than the equivalent quantity of byte accesses via vector registers.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_UNSUPPORTED`: Misaligned vector accesses are
+    not supported at all and will generate a misaligned address fault.
-- 
2.45.2

