Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF528151D
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 16:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339066; cv=none; b=sHsOo3F/pA0MhPp8YoxtO3Lz+p0pxg3z0ItJhMwBq7msTThmGfHw266mRF2HrVAWllVq1X6MGaSQBvvM3pXZ+Wx+pQV3oGKfiNDax37K/9RVq192VK79UBOlxwWzteG4NYDZic/Ro19McfWJEPZ5h0lXWsDrrKFM1dlv7GllV3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339066; c=relaxed/simple;
	bh=cnNngG1SEA++0p1pjRKLRhcZbXg8zfVDDmR8Yj1S+C4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZDijeBFLD0GZEe7y4eD0oFiQ5usnwF6tJ65lgI9AaPX2IZXhMA+qSXHnBShy3E/3IL88t8ziNoAFZ60lcNnFY03VLFNrC35HGYUxmFPzNiz3S/xiYlEmvX+FNK9cGwnpm/TR6jHqxE5cJAby11BIgPI7FcLJkJO6QLd1WXMwXkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=clDG/FZG; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="clDG/FZG"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736a72220edso5379010b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 09:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745339063; x=1745943863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbKVfcaTHYuJWKRcGFqU1yco7PJvUrfVpm2zvqDMXhg=;
        b=clDG/FZGPs5IxQovqixh7N43uaBkd0ltXi8+M7KTm2m+qWMjwU3NLva/oArFvnXvbH
         TZwaGpM6QchTWK5BAqFxkZ9eCYq8WXTkmhxAGgtnLiYZuzF3GXuL+cbGAoG726iv3eFQ
         MS/vFD5E7kTISyXPZ9gUq2bXNwa7W8i88m6M/af60OGgPhG5Zs9Xca4n35DXbfNeTXEv
         TmlGzvoMFlubCQTY+CDlGAwFJP762na3VB/msexZ/XSfVhPfS7jP5171l77ntT/UtPhN
         Nn2bnMN0SBnTiyXID28m5oowZ32iEgcDUq974uGvUfWPbKVRKYjlhepP+yeOi1QDAYts
         O7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339063; x=1745943863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbKVfcaTHYuJWKRcGFqU1yco7PJvUrfVpm2zvqDMXhg=;
        b=Pa55//v1irBYswo1gBCJvU3kk5Ony5lluVUmb466m4vrmOQmEP9VmOyOWM3ahCWHgH
         k7CSGv/YNMTAnzYoJFBHAMwRmVfhjbh16BrP1KN1Tvf0WndLgcgoDeKY8JUhjQ5Oiuha
         Iq1X4iBp+voKwc17jc/ioIaNbsvql6hhdVjkMTzZOv2ILi+tscaDydlYosMjoe/O8rzP
         KpoorYlDbKL47R0eU0HYEi4jdFJmcT5nQmVY/noejoaPaSQkp9/zzFqFwmnRNVlN/nS6
         8GFtVsu511ZP0phiA1Hyw3bu57JVxdKhp7JYS0XDfaHvKaMOd6NC9boRBgXuss7F1RKT
         Y1CQ==
X-Gm-Message-State: AOJu0Yz1NLsVhKx1fJFQsMhwz7Lp3HECkOMTo2ODAYsxZXQ+66fPLuIN
	xUkoK5/dTPV4f3UWVyr9p4vhXbmk2HwDw0UdJ3jQjDZVql+kwUyIz4yRDsU0qp8pdLXmVTJojjQ
	+Tew=
X-Gm-Gg: ASbGncuyMuLz1AjrLcKvwbyPp24kmJ89xTgPLF0O3UoQD+Vr7RxQ6VnqUI7y2izEiTS
	+U2JMDP5K9FlgNh6JBfyztxRG/RH/x4eDJj9jLVkvhuTjrL6tPtWmK0UG0xuSROUwDBHuuFpn+t
	32hR0gnvBNUQuwRrmsDvpLYeVisXCo2gSBsbYYhYgPT21NMGTREZL0wCURFyTVxq8rKo1lrViTD
	iJhsbOWqF/1CdIktBgMAOsywxxIV4lYgDxlOfv/diVCzePFqAkqZRucU05ZGK9tSFZQ3NlmwoBj
	mkaYVK9vClP1uMcKS0QENJT8MXNAC9WZpcxGzCmB2A==
X-Google-Smtp-Source: AGHT+IEFf0tssnpfmlIbhqMb84KZUlhUCNzB5IiKyJZf9ulfPIE7IN7Goopu3beJAt1h94MrpDZmZg==
X-Received: by 2002:a05:6a00:27a9:b0:73d:b1ff:c758 with SMTP id d2e1a72fcca58-73dc159de28mr23833026b3a.18.1745339063142;
        Tue, 22 Apr 2025 09:24:23 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e13e1sm8850825b3a.46.2025.04.22.09.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:24:22 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 4/5] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Tue, 22 Apr 2025 18:23:11 +0200
Message-ID: <20250422162324.956065-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422162324.956065-1-cleger@rivosinc.com>
References: <20250422162324.956065-1-cleger@rivosinc.com>
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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

