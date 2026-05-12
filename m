Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693CC3ECBC8
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506601; cv=none; b=QyhNzInBGAXLHnbLqEzEDbwxBR8I026u7eY1iAWnARWpKvthJ5HZV9UvDq7Z8K/PwWSD4AGHgUYYLivd+dG2HYcu2r1lgFMy/rj8uR5bP6cVr5wbjheI2FQGaju5LK8SCEktTAuYV9Ls3RI0shpslVFqJwItN2IIBjnxnYKaFuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506601; c=relaxed/simple;
	bh=0RoxEeTW+dkRhWnBSljqlypTBfGWhhyYzVBMtv6J90k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gFSunFhG5LnJ98dhO6RWH3tMMykjAdn6vXPxnqsu2zqRJOEcuhwnvX90AYPsqD0er3u6Zr1JCZEP9aYUihP9SaGYEvcBlkdyyQ/VUqMOJWVEP6eJLKAJIN+I0rQMp/Jd06G2tMkkuAek3pAt1DXK2my2nanJzdPKtja5WLXezmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=wGRPGnYq; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="wGRPGnYq"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36622412e97so2680144a91.2
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 06:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506597; x=1779111397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkBT5A6/LBnTeUPklgGzPFjB6isZzD11PPCRi8U3YM0=;
        b=wGRPGnYqM2xP6Xl5zyTyn17PSjpSTCxY0jsype3eiNLMmfsj0JXvxduOc98m6/NOfV
         M5+dVGRJ56lULvnvl0jVfm4RJOdr7bnhOwQsvzO0IokTGYPTRNP4m+8PXcYQxKMZ9pp3
         liGNt4gZKRnDn6ihVkQyhSmerZG37trM5U63Rb9SIcwAhw8fW9s3cy/PBZo6rjUdX2ZP
         neJrrjVgq4JmMSV9/lMtXd2lx8obwM2Q2+I+64uG64CqiZRFhBe2Y5tz7aNaK4bPC/9K
         DoBY0wdX1RgBgdmF9WHco5FBnXroUlR5cC/kEKbPP2cwnGqYFZ4jgbdIutcbg5+uHH6x
         BjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506597; x=1779111397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zkBT5A6/LBnTeUPklgGzPFjB6isZzD11PPCRi8U3YM0=;
        b=qV3cm2XbLQ+Hm+C+lla/nXz8+gU11+uFmr9JQQtV/fbR/iXGFFZrSUlokyhjRRB9Le
         7ov29N4tNGsi6ggD0/zJEcs9izFWOu5Z1X3Dbgg/tn7orgN3sSxWKY8/fH9RsjhjIxUe
         jQsrGf8mdMfU76yZe6fBuy/X5zY4BkLkcbScwHQKMFKDP54oIRQAdfPM36mAx0gC+gFk
         aIPrciX/EcC2+vhxVD+XL4zm6pTSvK+RKV14Y+dLUIsmT61lsh3cS0A9dgfqajjaYih8
         /Ec8e5w0RHLw2Zx04EcoxcY9wzAxCzcCyi/N3j1Vof4P1J859U+bO0/xzPern3Qs2UVu
         3q9g==
X-Forwarded-Encrypted: i=1; AFNElJ/In6BDJQ5sjBIFhm3390RuSlUSy2LB+S7UuG2TenCvlez33Z5T4vdsJp5GcyF+fdWvuw8ulQEBkKE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7i+KqGTPdS8CdPgq83MiW0X41h+MeY8xasGaCY4EY9DMGg3Lq
	Xc1e7St6m5jXDqUFpAqvA9vuVu5WrDfs2W9oSXGHOz8v+Nqm43AY7cC5qKmnuGNncy0=
X-Gm-Gg: Acq92OH3/K5bBkv68c6CFGJDJcdZP9AXMwqsPRvQSRLPW81Isru2m7FDjnaPRlqRKlc
	x6bsSIHLvnlsiaJ//5a6SaXcxI5BAF2s1kg6TMidviCs5k07b5UlwvlYocreZizUa4D8xIqbERE
	q3y3S2L7SLF6EddRn91anJxJ+pFUSFAw1FpKYxJMVBiFBjLpp2rx3RGbqPl1qOH5OgzANKygafz
	bhQa8wLdOTtEN0O2HzViME8BgKRr/0cOOMQKKyMKPmbPZnIk6ezfk5I1AycgDpJne1m+EG8a2UP
	PnjKI0HkOXr+LGvaDXKS17Hnw2v/GSZ/OR1lxlSFMUUB//ncdgD3Z5A3WDJJkkej0F1vCxi4bTR
	YfiwM2xUK+Ds/WjYWo1UIzYflBrKM5ioe0jvowK5813m5rE6Gp3FtLcwiiqIVLcKL2MK2KHWnBm
	fUXltoTJ/5X+o8z6rmvbv6nGHJcgUALX3mNrJ1Gjh9Gp4=
X-Received: by 2002:a17:90a:d883:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-367d487d1cbmr11028452a91.21.1778506596853;
        Mon, 11 May 2026 06:36:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:36:36 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:47 -0400
Subject: [PATCH v2 02/10] riscv: hwprobe.rst: Replace tabs with spaces
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-2-21c5a544f1dc@riscstar.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

A handful of vendor-extension entries indent continuation lines with a
tab character, while the rest of hwprobe.rst uses spaces. Replace
those tabs with spaces so the file is consistently space-indented.

Cosmetic update, no functional change.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: No change.
---
 Documentation/arch/riscv/hwprobe.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b1a84ac06da75..c3bb26d70c748 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -358,7 +358,7 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
         extension is supported in the T-Head ISA extensions spec starting from
-	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
+        commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbom block in bytes.
@@ -371,19 +371,19 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD`: The Xsfqmaccdod vendor
         extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
-	Extensions Specification.
+        Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ`: The Xsfqmaccqoq vendor
         extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
-	Instruction Extensions Specification.
+        Instruction Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
         vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
-	Clip Instructions Extensions Specification.
+        Clip Instructions Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
         vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
-	Instruction Extensions Specification.
+        Instruction Extensions Specification.
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbop block in bytes.

-- 
2.43.0

