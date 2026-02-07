Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9886631077A
	for <linux-doc@vger.kernel.org>; Sat,  7 Feb 2026 10:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460103; cv=none; b=evoUZ/BUmLwei7Ez18tK9s3G+hRNJc7LCYHOfzQqAVo8X01Y/OlF0PSPu0lrFbmLp/2Hdki6ueKSGOHQrkgN7iWEaesoCYukHN2WpsU8oQiSAS8HzxDY1DiST1s+jpuZ2D3fcP4ae+fbOsLiz83IhBV7WrhcUxZK6lM4veOSpDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460103; c=relaxed/simple;
	bh=ah4Kyb9idJzJL3l2/8ucbtcoGyaYHRM7GLq6Hfz2ZYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cwyENvl5qUNfxEoeiBgHIdc1U0QyfkNAZNzF6ymybCa8GwP0BFyD8845h2P3rc41nce6DuOF7lSlIcz9gW2bY25poj91v92Cg4L+9Z7nwks0QBslNEQqb/08MCgYVSeiiWtmBohppN3mScfUynavDbF76iLdHpbQ2OKkDTzMtlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=qUYkIAp2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="qUYkIAp2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a963f49234so1464985ad.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Feb 2026 02:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460103; x=1771064903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKr9V6mOpcffHWDtL8Wcd/TDNqYsCZ2Vf53JPWeLv8E=;
        b=qUYkIAp2Wv+q+MJwPz+Swdm4mL+OCYk4pdgftuvKcOeWFtSBYHXOOE76RTbUIhGmI2
         sEy64Jw4hqFv6A6tmNAqZ+MbwK/WJ3ZTFF0nYEV1nSH1Q/KcDlEXszKx5tHLFeHUjl80
         doP3cHvSaImeuLb1TrdxhygYEoYalGHdDlu8GhEF57JJypUFJmETQYL1Qt2h1GTHqL1K
         d/Ou0wVNOTasoOfbREa1cfOWmJgetqV1clsGKYMpSBepPv2Ee0NENxzHmmA8lLua4wsV
         gVn6bw8YGtz97VArat+2FeZucTMMO2SxFJs/UBvA5yjq40sQKDHTgS5L6JfRJyxaIqvt
         YwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460103; x=1771064903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CKr9V6mOpcffHWDtL8Wcd/TDNqYsCZ2Vf53JPWeLv8E=;
        b=ZhQjxHQIra05jwzWkqS2zTF1QuiBfYQydjVB3AI24Y18Jx7O8FaFeaxOedvwykFiJT
         bANFQ+eouwGEKzO9hO7wCd4lPmdcvcdgEa1ttvdilTJAU3o+zgDdPw6D7gb6wHtdQr2L
         iItljxRFSDykMrI0ixJ3qnwCwYelN39waoPf8Hn2rvu3KAk6YZDHrhGDMFZQGRZB8dIg
         T76AqQcD+vStzSxXgj4V4jGuw1Law5A30VkjnCHeU9yhITt7VmqJFQrDK1/FHcIzsdfF
         nteOcx7GUAZtfLgu41dG8rhNq34y3WGTP1bik1dth4pieRJ3mbSfTs3TdsnBVFBvkQ9C
         ivIw==
X-Forwarded-Encrypted: i=1; AJvYcCXtjjAVorNj0NUV+hVb62dYZI71eE65F55sOza1IJ2qTehthKgq6YJAY9s8C0lvboA/iAXzzqrgGoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbphLya47lyie7omr1FtNJyBwW7D0SKgKOdigVVSMJb/prGKG8
	CzbsSgse8hnKdMdsgJ/Spd0i/ADZjndvJAzel12RuVti4SRxmsCU9/kETistDjQaDTU=
X-Gm-Gg: AZuq6aI8T1kGvCBGnt9wd8J3rn6/1HP2RWg4+5l8kkjhJKzNWjY8YlZm0mSpdYGuzaS
	I/x5KkusnmCNmZ8LmQ0mYtktbXhZasZIytFuHlH1wwEukg7s/LsWFeyfvV9jdsoH+fLxiqlckVs
	AZS4wbOoycWg4vliU891rR7KXufmqVlx2YoqNzzBEmP03EGE6wEqW8u6iG7ZgYIdDUMHXxgzTvk
	MM5FKolK4m8bRZhSZJPUZRfheu2KGO6CBveivuDj6pS+gXGGkbgXQ0GoDZVFc2npGb/8mmUOPDU
	TbzBzjvTL+WRafBzF3j/mk5Nf62SM6jT4TbEYH2xdUnUSfj2Av1hu7AkaAAWAvQTrpa0uGLUI4m
	1AHZ4nnIpcJD5ra9snElJ9K0r62J8M5aaXST5kMK8amVy3dy2tKNY6+0hRLgkFsbSHg8I4AkMAU
	3C+lfcFDeEWjrKGfgzxexs0cOVa1SFQRENZkdyv8gqQWg3HKInNA29hQ==
X-Received: by 2002:a17:903:1c1:b0:2aa:d60c:ab68 with SMTP id d9443c01a7336-2aad60cabf2mr1522425ad.60.1770460103063;
        Sat, 07 Feb 2026 02:28:23 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:22 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:27:57 +0800
Subject: [PATCH 3/8] riscv: cpufeature: Enforce Ziccrse dependency on
 Zalrsc
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-isa-ext-parse-export-v1-3-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Ziccrse guarantees RsrvEventual for cacheable coherent main memory,
a property that is only meaningful when LR/SC instructions are present.
Since Zalrsc is the extension that provides LR/SC (also implied by A),
add a validation callback to enforce this dependency.

Introduce riscv_ext_zalrsc_depends() following the naming convention
used by other pure dependency checks like riscv_ext_f_depends().

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/kernel/cpufeature.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3d3af82a53250f29204a3fb138feaf520a878d0e..68c94fe29cd1b26925fa38a5c877d699bbc88e25 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -338,6 +338,15 @@ static int riscv_ext_supm_validate(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
+static int riscv_ext_zalrsc_depends(const struct riscv_isa_ext_data *data,
+				    const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZALRSC))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
 static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZAAMO,
 	RISCV_ISA_EXT_ZALRSC,
@@ -543,7 +552,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
-	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
+	__RISCV_ISA_EXT_DATA_VALIDATE(ziccrse, RISCV_ISA_EXT_ZICCRSE, riscv_ext_zalrsc_depends),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
 					  riscv_cfilp_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxenvcfg_exts,

-- 
2.43.0

