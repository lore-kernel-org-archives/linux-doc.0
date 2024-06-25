Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EE0176234
	for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719334299; cv=none; b=LAsnJdLX3SEn6ELpR/DI8QTuBZIWkpSDCDkTdSGAuD+TvPcfJsSm9zvzRiGYJhyhfkVHKQxNRae8DTrFfAe0fMbMyjQXHP0PD368pyFCKPsJ0ukeXxit6eC7zuF9T3KTP5Pr+YlAg1gsNbJ9+QWf3aVnNQPf8mh//dczhuYNj3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719334299; c=relaxed/simple;
	bh=VbQJ+9OJwbV0Bm9LzghQnyawcJ4Nbd37jO/zq2vW6U4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cQP1/fwxLVkGC2DrmIvapb4spn5iGnAz623oX4oku0lZR2znRXcaQZe2IDokf4LnxYhGLDSjBHPSOEU0FRXIuFMd7PYgxpudCMuHAc3z3iwvFjJ1RlpQf39cTHox3cJWd6lSwAm1kmS7lokI03n+NIgX0g4gPkXRP1rxc49YaYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yS+0m+Dr; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yS+0m+Dr"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7066cba4ebbso2196626b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 09:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719334296; x=1719939096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7DHb9nEZIyQ9TZyVFBVE55L2or4EVbNlnKkt0llmzhQ=;
        b=yS+0m+DrYw9a6YIwoGDQoSocBBZ2qZeeGhdqkTl+F4StqcHrUutsfBMmRMuRep2SQu
         NlZNeetbfOfOf4nn5zGN/fz8dSU5qERjuodqKpM587TUpEkB3QRc1JthewxcGBMnwQ1o
         Id4cs/bG/haisCckHZMrMr0Wy6iCml8cbkyEZ2LO9zU8Z0Hg+TWAgyhspbFag50E69N+
         orV2eoaiJO5gQSs76X0ClS6gmGrFBk6OGmtxDxve6WzjDt7DSw8qMm883manea8sMXch
         QlAcuqxwarVQ/a3wURJEClYuoajzt1QHyPNypQAkdga1kgpqWvezySNhiLWZQfnoRp87
         cN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334296; x=1719939096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7DHb9nEZIyQ9TZyVFBVE55L2or4EVbNlnKkt0llmzhQ=;
        b=DFmHb/0XkGxjgAAvWwPrRBCM0GNHYlAl4JkivAw7R8y3cNcoDiSJtRrtb5InNo0aPc
         pXcDKTEs2V9Lcpu3GQIDFNXVQQJUIHY+XFrkvx6uAlaQSS6EGi5YA0B+K5wU0UCuCG0f
         8DHfnfnrd52VFUp8KWbCzz7aJHSHfWi/9SOJtJcTQSsAJsP6TxtSG6DrxfAeFxmgkRuc
         KFffy6HVK2uRph07DDadCdg/kyF1HC5ZdWFqyDbn8tzJ5NsiNKmFATBPLymFXVSwtYTJ
         Jcrwzz3JxrUWzkEStAdL6jG0Mw9MmvM0a06WNzFBPPxR28xodLLXKI06MArydgCoir2f
         1doQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsq68/y3GDcxO0idHRJwnEVKsTIdx1N82j3kfYunGNJkj0zI0DoP8I1xZSDKB/7lMMhBOoYEwrVIRCgX0fpuDjv0YHA7pFWTHL
X-Gm-Message-State: AOJu0YxM4UbeLDuEm9uLmaCHAAmZT5S0T5TBdO88e10TMCDbv3hYlbBU
	j0PEI1h7bwNHSuYip6I0hgPLCTOj6h9fsztg59GYKU278qfJafdC0fmpL8LvNEU=
X-Google-Smtp-Source: AGHT+IEr5KdO47tCR36GyprkazgZVE78Pudd+YyNM8RkVP6FfAqnuG0pdu9FULtAHnIWPsI0hDA1/w==
X-Received: by 2002:a05:6a20:341c:b0:1b8:5967:45bc with SMTP id adf61e73a8af0-1bcee98ab11mr7553809637.61.1719334295798;
        Tue, 25 Jun 2024 09:51:35 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819a623a3sm8991226a91.5.2024.06.25.09.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:51:35 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Erick Archer <erick.archer@gmx.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/2] RISC-V: hwprobe: Misaligned scalar perf fix and rename
Date: Tue, 25 Jun 2024 09:51:19 -0700
Message-Id: <20240625165121.2160354-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The CPUPERF0 hwprobe key was documented and identified in code as
a bitmask value, but its contents were an enum. This produced
incorrect behavior in conjunction with the WHICH_CPUS hwprobe flag.
The first patch in this series fixes the bitmask/enum problem by
creating a new hwprobe key that returns the same data, but is
properly described as a value instead of a bitmask. The second patch
renames the value definitions in preparation for adding vector misaligned
access info. The second patch has the side effect of causing users
using the old key values to fail to compile, which may allow them
to see and update to the new key without breaking binary compatibility
with old programs.


Changes in v2:
 - Clarified the distinction of slow and fast refers to misaligned word
   accesses. Previously it just said misaligned accesses, leaving it
   ambiguous as to which type of access was measured.
 - Removed shifts in values (Andrew)
 - Renamed key to RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF (Palmer)
 - Added patch to rename misaligned perf key values (Palmer)

Evan Green (2):
  RISC-V: hwprobe: Add MISALIGNED_PERF key
  RISC-V: hwprobe: Add SCALAR to misaligned perf defines

 Documentation/arch/riscv/hwprobe.rst       | 29 +++++++++++++---------
 arch/riscv/include/asm/hwprobe.h           |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h      | 13 +++++-----
 arch/riscv/kernel/sys_hwprobe.c            | 11 ++++----
 arch/riscv/kernel/traps_misaligned.c       |  6 ++---
 arch/riscv/kernel/unaligned_access_speed.c | 12 ++++-----
 6 files changed, 40 insertions(+), 33 deletions(-)

-- 
2.34.1

