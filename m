Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324051FECB8
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 17:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231305; cv=none; b=HcEwwIGossWSJeC/Biy90BwgyfEJYn5UJVIbvQqkur+VMTPxe8R/gPFYceh/B2TytQvN3J5T6mIgUpHKvuzqOQ4k7c9NOAVwCPooVdGvv9xklM/AadnZh9saYRsHwlN1Eoub7f3gnf71ZIyoalp3fQt3OvuOjZmOmWwtAFeBims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231305; c=relaxed/simple;
	bh=Nf3XuDar9gitRVwziVjGXEjo/ltPNzme/nCKwMDO140=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PZuGUQADIsr0FoJ4dEu8i600gezI0L7inQ95Sk1KotQGwN7xoYXR0kHlFAe+HMuxfZDpgr6MKlmLVgPtL5ufDU59dFylqej3yjqEvr+EAQKjljA1Xn8WHpAbOZq3aSHQueWGjeWiESSNfTj7YIpiUCpnl3q0ci+rQGvpI7bKlVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ofsUQIZx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ofsUQIZx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3154343f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 10:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231301; x=1742836101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pNqCCOYMsZxxXyyqHIS5snuORKLAQN1trvRZ+awEuI=;
        b=ofsUQIZxvs8LTJ56g982crtRu6dTuFCOkCYZVrQCWEM9tNwWGc1A6HRz94CH1V87MH
         B4CtaDJ5EA8iRA8aj+Qw3axJREL5n9xqwSCj4nwn01RplBuROB7Lz67ZX7QT6akWUHah
         gopoaQKzRnZugbRPKYYYXR9uq1Hc0tC6QABH79m51W+4O9+a8g0LjEB6zxWDTjNyB/Fj
         8BcvwfOE83wsZKwYkLJpajNNfRWPrcq2hcAp7fU9fDhGmQfXVMFfgX1MmzlbctXI6MSL
         8XvmcW/VO12HZtFd+jtyTPhMJXyqBxV95XQk0bhtTKu5XLpIdVZmbhetpI9hvCzkqvpJ
         qfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231301; x=1742836101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pNqCCOYMsZxxXyyqHIS5snuORKLAQN1trvRZ+awEuI=;
        b=EGlvZDo1PjpVPwX2NzPQn6eemUwRq+H9NYJeh6qgRkVFYDYtAr6ZjFQwwRV4Iw8jC7
         4i2QSFxvirvCTy+vP6oSnJeAaiwLjawbsdiJ9MX28zbZiE+pUJ2ashaz9ftMHJA+h27N
         4vnEdTCVVi//JwGYVa9bEDKdFqJCnPRrsdRLlbnviqoQKk0N08TcwNp2UVzV9zqvRkz5
         uUDqhjpE7A2TUNlwqQeBrVGRUorum4sNiikXzPmCPz+pH0YNIvmZmLK3WBhJuTSBUXee
         9tBhYPmZTLSaPYjD5LYA6io1JuqLVbRwP44ryc45dRgeXH/7Zt9pz1YzmwN9VrDPRI1I
         h1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYsTV9tUbHqqXdhtEEq3139XYJ1l6PRjErS1b+R/iewUYoMcvTbep0/XK7dNEOOtDCzw2TnDAjhRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQQ12MvdGxb7wK4ca6dozIcmdMdWq3Zl5AfN19REioYflE9LbL
	HsM6mRoc9jqRzIjIr8KyibHDDYH9kMj2L6q9FNgosQluaAJX+zBz4mxtHqaj/BA=
X-Gm-Gg: ASbGncukNZ3wG2GHajxsMwyefj2siSIN9JkwUmRJ5zAplncR3iagOuMkyv+JEOX7VD8
	EE5KnxKesFdTLgMmlb5nVdhatleYZ4N0X0I/YCj/swvEQ2JWyD2NEGCgZT7hRoOPdWw2BRyN8ey
	RHL5TkyZoLfR20maZV4CJHWizdgUkMvdhm88g3T9kFwk7zr/ueUvCQTYG663KZhaYSTn3Zy2jKv
	+P7e5iHSQ7SDFFqWYinIVVU6UpnEm7QtguvXd22MpThO9Z2dsZga9904VT1klB5BsHVLerSl0SP
	K1+5ChdyHDXoo8HvyVQf2RZsRNKtq+6AD9cSAxYkL6I5dQ==
X-Google-Smtp-Source: AGHT+IE6X4Zl2SvCnLBWCWxVkBGrawQ8DSM4qV1sZG6LsJ3FF5B07Zi+O2FlbpqV8a0E2j6PRS6VBQ==
X-Received: by 2002:adf:b183:0:b0:390:f88c:a6a2 with SMTP id ffacd0b85a97d-3971f12cd8emr13396928f8f.39.1742231301480;
        Mon, 17 Mar 2025 10:08:21 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 13/18] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Mon, 17 Mar 2025 18:06:19 +0100
Message-ID: <20250317170625.1142870-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

riscv supports the "unaligned-trap" sysctl variable, add it to the list
of supported architectures.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index dd49a89a62d3..a38e91c4d92c 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1595,8 +1595,8 @@ unaligned-trap
 
 On architectures where unaligned accesses cause traps, and where this
 feature is supported (``CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW``; currently,
-``arc``, ``parisc`` and ``loongarch``), controls whether unaligned traps
-are caught and emulated (instead of failing).
+``arc``, ``parisc``, ``loongarch`` and ``riscv``), controls whether unaligned
+traps are caught and emulated (instead of failing).
 
 = ========================================================
 0 Do not emulate unaligned accesses.
-- 
2.47.2

