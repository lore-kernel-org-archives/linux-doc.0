Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3A12BF3D1
	for <linux-doc@vger.kernel.org>; Mon, 14 Apr 2025 12:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634161; cv=none; b=SS+ti0ob2aNzb284TjpTEkfo8YvmXYIk2aQc88GhegnPw6QgjJAYdoc09+6Jck5Ava6wfUHPVANJ3hsMG0+tIpIPtXK1ZmuE6yC+Xuohy4nGa+l6ymlcPZdEKui1zhJcVZZ/7nZ8pFMsuaErd4bweHvGkULPebEwd7EIhoKhf7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634161; c=relaxed/simple;
	bh=AyXNAWI0/0gE40uumDJpJdOVMNYZDU5mvwjK3PbJnn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CHAc7eSLhv4NpWucmCqQiYGlM4XFf1SNeEZTkYo7neOsvPotETm2bhoxoHehnvpNp7W2NY5U7PLOt+KsG7UFazCUjri3ISrpn7R60EsCAjmRV5SLxrhmlfKhsh+RLTbbsdnR5TKvUFBbq5ErgNs4gpAhGwcmVK+h1RXrjuSzoLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1NE6LcXk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1NE6LcXk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so47514985e9.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Apr 2025 05:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744634158; x=1745238958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBLPFCAF2kFHPFPqsZ7gzO7W+qircTgsDB5v3GeiCmE=;
        b=1NE6LcXkxxL3S9zlYHYBm6sE5ZWJeVpWp8+WfofbB9p758pe/xMtCdBWNKt/vL3yOK
         yMgETPtgpEHdp7oczCcBkrDtypy0wH9nEA09AC2uw2S09sEXSM7SY0VAQU//0AxtrplG
         3gZfRS6gwe8drMBzXNT1C6R9B7145R1R2IIJL+/dw7Lhfied7nS8prTNLB/yKUDSkDvs
         ZdHQEsIL9/4kARghdNYzYddQXufdwOHAsRzncWimALGUyhv9DBkiYa0v6DMtoZQsnjXM
         QXD3OIHplCfzB0nZKJuipFMAvKZFMo0XcAsIKgL2NnQEr/Y5A00kwC1bytGFgl2fBdRR
         kihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634158; x=1745238958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBLPFCAF2kFHPFPqsZ7gzO7W+qircTgsDB5v3GeiCmE=;
        b=rbiaOdIBqrZkZU0WxRVjVgzX945t23qtEVTf3gHKnRzj9BGYhHjy8LRCAgW+GdENfe
         1gdnDfu1Rw9DP52uyU/GBgjZlAeGBP48H8/y+Mv6nplOIJ1WmHpXOzG/FXQk7M+sG3cL
         A6wDBqDcUT22NUHpj54Qu7gNEKsA7EUhJg9lYhmfeVqyt/JqnDsXvFjmTNuB+k/2GHC7
         sJplQmpdaRi48rSEeUffVP10vfdiNmqxIn52PMyue68gc+R0I68WKx8e6SFOc/2AV30W
         amme4NEjSbrVs08zA9Qm0pz7O/T8ra1ryEUt3Y53i0Ruda7RVEbfbT0LPFdND/0Px81N
         4h6w==
X-Gm-Message-State: AOJu0YyyP51oCzsQ8Irkbe2DLp5Pwl57YFPlDinCJi5wFWiNczMVNJXr
	QRkWix3xfpFYDi5Q6NWKA+rOwAVHFTMu1zTIPR9cLtn/AGE7VAHY3ZW/U0KNkUK75YS0/joileN
	Y
X-Gm-Gg: ASbGncuAFlxncSAJ5YPqRc7UlixquIRydxw4KeqYZ1drl5nGUeWOuPxm5oH0o3ylgN2
	iKt3kvwCHQayVTVcXbby8z6HqZ8ipfObM/SmTGNnOn69+XmKqFjDiHXssGqzP0RYVBr7jrzSig6
	GC5MGejHtu3Z60lvvMtsKI6GLtTs2X3rqki2rT8nMwAsdYxOfbF9Tu1qVxQEcUAbetZukh6kB5D
	joGWfVbh3kqy5JViWVE8BUIkdIotSXqed6jT4netn0+NgrYgpyqqXZesp61WU8T/6M1M0SkGB6T
	mZbDhWhERrnzqdmiFJB0pJdL9FqKjcN8swXqNSQquEEy6rzWbhCN
X-Google-Smtp-Source: AGHT+IE7ESI9/ydkjbVeedcglNd5VgE6W7NzmKgufSbnzN+RWnm218oxoJgC0K2N8RXVX/uDv+F3kg==
X-Received: by 2002:a5d:5847:0:b0:391:1218:d5f7 with SMTP id ffacd0b85a97d-39eaaebebd2mr10756640f8f.40.1744634157684;
        Mon, 14 Apr 2025 05:35:57 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9780a0sm11003166f8f.50.2025.04.14.05.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:35:57 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 4/5] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Mon, 14 Apr 2025 14:34:44 +0200
Message-ID: <20250414123543.1615478-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414123543.1615478-1-cleger@rivosinc.com>
References: <20250414123543.1615478-1-cleger@rivosinc.com>
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
2.49.0

