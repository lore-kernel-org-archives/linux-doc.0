Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9983422D4DD
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741619670; cv=none; b=GGVtsV1NDAQO8oh8aA0MzJ4uU5F1xFUZ2LT1sY4D9KRQk1izbipXaJ3z9mOefXp/TiwmCpZeYV+0RrwqHjuFvxJD1tacLnTkEN+kGwd9+YNBIqbcHCDMlwpc86CmmmEMpfmZFYB35R/NiO7cDQrRk5zZ1erwmTPbh6bFjEGJYm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741619670; c=relaxed/simple;
	bh=4ctq2Y9j6Ai2zXepSDGwSaGD5sKanUbwQl6UjhiXbqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UgJbkZdKHGnBtFG/DeNWb5WlrUsO7lM8sBUY0MXFTzWiP1XAxVdBz9SYASkEqcEpaLBCp8oMpR4/A+XggiWOerNQfw3X02ipo5s1lI6/yMhM1ZoNmbA8idhTFGFF/HhIY9lRAfhqDDSu9mEagmMeMCe0oPdmGSTqvh9il+s+C+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Nvg/ZGFq; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Nvg/ZGFq"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22403cbb47fso82381275ad.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 08:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619668; x=1742224468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZ6ZtCFLM2HDQCXfIF+4ZGwXAoERFl4mcxOr8+ok9D4=;
        b=Nvg/ZGFqrNZtscVsbTYfAORJvCoMPMZJNwv92/JsMTCYz+mOxmmnQzUHnWJyUE/D08
         WvTXFpKackj8JbpaDjjdHXcXBAPEw0Krm81RTLUSvpESA7PURwp/oOqooMrcj7g2nJNO
         I5Yo+ATYJUBXbDeKfsxB+jdXwADm60moLf2ySHWDU3mIWK7tj3lznTKEvV5yAlXa2CPn
         fI7rZswSfoFmBmDwsIc/rt8ei3COabFx0FwCoVD6V3Y78Y7XyL1KJNsg00lG26NsL3Bq
         uzKJgZl5TzJMDD3cut2mPIcFLW9HBPsdffI6M/vm/m85BW5NlxwKJ3cyQSQTLr4tHtKD
         0U/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619668; x=1742224468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZ6ZtCFLM2HDQCXfIF+4ZGwXAoERFl4mcxOr8+ok9D4=;
        b=fftaZymuUVSirK8Jlj4QDSdZ5ph7QYXxxQfbmqubOYC45pEQ27QqoNHwFjagwjwXia
         FNklsExZgvPgV6eAs8zTRihWC0v8SixIs4CDSN5HA4gu17EMSSd2hM4VtIMNPncqeTFu
         REtOGNC5wmH3gx7V9alGAlE+pcrO5XDLdow8/x9eTEWCQIFUMGKbiH2uCUd66AiBNQ1K
         LQE07zs18pA86MAqyoQ74yX/vsuc1qnQ8Cm4kL5HcL8j4ErtK3exfeBxfrEViOCDiwLv
         nTTEDUt+bL46Tr9N2YDhsdVelQpQQmYz9sl9TzZtryFYniEeoSXNWrrPTw6AUqWoDXKE
         Dlxg==
X-Forwarded-Encrypted: i=1; AJvYcCUV+QTKk0t8rqpSQ+lzVJ3LQmGbdUCCGUGKDzd8f0rcYz2i3pwn2zmvoAhYIWZ6uDJWYbuzyTaDBrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YylP755YLyI4ti9TgGbsojffVDDFTF9KFppXSEpRC4E1Ye3olJb
	mRg8K8eM90okeBgnXwjiBokPmdC+qGxLKGc8nGgqsZMnwgfLEHVr/m/roXWrv7eMVLZq40d9MLb
	1mXA=
X-Gm-Gg: ASbGncuEDTR971RuSjjQdlDUuPdATNzkYbboIT2rbSvNbZpAT2F9Zxpwx7OY6DIK75W
	1IL0v5xOMoG0Xs6AtX4l6s7GsvDZHJJWxrkX9a1K92YbnPnzi+vQe3XGhf25R3UIO3dTbl77Y2f
	KfFKwMtc4NWzNpqekNSdj6YlzhlCb2gajnKtQgmAfue3z8zpi00gAu5bBUWP4aSyIOQzyTvOXZy
	dseG097i0B49yjQjJ4ZsHKV9M9+d6rZIPMeGDOsQ2DMYaCDSveZXAMpv2GluldOlmHeQ5W7iEef
	bbD+y2qJNFXe5q3zVv+pXnYo5+h59qkZs26/sr+VatF19w==
X-Google-Smtp-Source: AGHT+IFtA7ejSY4XIE1Y8FAoh6UcQJS/Qm4jl+kbYc+4FdTVNJHdwGd9aRrsWNeD8S620FnvoI8t0w==
X-Received: by 2002:a17:902:eb81:b0:223:5ca1:3b0b with SMTP id d9443c01a7336-22428bd592amr282068535ad.40.1741619667997;
        Mon, 10 Mar 2025 08:14:27 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:14:27 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 12/17] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Mon, 10 Mar 2025 16:12:19 +0100
Message-ID: <20250310151229.2365992-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
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
index a43b78b4b646..ce3f0dd3666e 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1584,8 +1584,8 @@ unaligned-trap
 
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

