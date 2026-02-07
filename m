Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DAE2E5B1B
	for <linux-doc@vger.kernel.org>; Sat,  7 Feb 2026 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460099; cv=none; b=EveXPj54BrWld040R4bh/BJa3DT6Nwgq6ErYWCi5IV9un2J9FPSRkglkqh2Z2FD/HS0tEwZRKhyA48kc2OwZJ1wj81tXOqcB1hNU9BGS+JS4DWv/yqpc0WmcJcYrtgOUWfbLeJP+W4UbLWfR5FCRdaNXJuy//Z4DQq7VfftBwTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460099; c=relaxed/simple;
	bh=wRJ9sQCp373puszO2fqba4lZpMNzWbGnEqTba6LQQvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JdiS2qBKjmTxsAcoMn9fqNkn9XfZOi4356aGNxdh0VhcYIZx09eGsLieKnuXdI7Aak3qtRhryB+Oiw14ah6QZpVXuNQ6FBhDjgBqwcmTuKZkSJkdPvEs22d+yG+ECMVL/IP6sSix1vp4+D/rnDNWDa9GloPnEFGJOTSiB9d6tfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tAyVWphj; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tAyVWphj"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a93210fcc2so11373245ad.3
        for <linux-doc@vger.kernel.org>; Sat, 07 Feb 2026 02:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460098; x=1771064898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwaoSKGFCCZq9SrY+ClofJYdLMOIdvCR/KkOdMrPfno=;
        b=tAyVWphje3fB8jguZkOSVWh1OY+ySLvVU0bv0rV0ePByKRrqRujYEzrRwtyyGC+BfW
         HidyaHyPcI8P2kCK4+8ceYfg14RGxVLKEKoKGO6z2DeA3RvnGaBftGbOIBgVHhOOKh3V
         WXl+CfKMhpA2HlrvrzFRFcQd0w/L0aPbmS6gwEB3UyQ/1pyJU6IyYlY56fgk91KICPWk
         bXoGi6vmz31JZWeTX6wcIibVv+5tIod7TmcWVT+ab/+BzIm36R2gHNxvJuTwrxWe65TV
         nTDwtRtwuT2LJN64iKitwC0+/BKe8heIGo23IjkLBwV/6Ptruqi/cwsnZp3mkvIHTOTE
         erSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460098; x=1771064898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kwaoSKGFCCZq9SrY+ClofJYdLMOIdvCR/KkOdMrPfno=;
        b=iN2NvkpX7k21bWtvA8G7MjQuwJ2ghSEpVPtJIXoIKCc+vB1VMRmbHM1nzlA6O2LK5G
         KOiDRzboMLqCjNPn8nsop+yxhUOl8JY4gKPzQVXSCjkFHv2+IX4V0Oq4CWKaQ2Ef6rWu
         cGspeFaeAAhi8wLS1CLVHetvqXJHRrlqX8+vqEFxjZypbJie77L1nfJ8f8tCIjYcPx2a
         1xivZgxen093p5g+xrPpUT5kJL6nCAVFVKFhArAH9/jeH1zHMzOKVppR8aWqf5P4IWT+
         wH6Ml7JHaC50kGabPakE/e7cgsngksgrbN4ogNTe6morC6gMJYjNS+x/O9A9NSGnWafk
         Fwog==
X-Forwarded-Encrypted: i=1; AJvYcCVbJeXtKEWUtFGUh6GvXf2bNqBdZb7cddj1WfDFjoc8jOfsSI+Em32dLbtnzd9A6zQY0H3xYrkY3EI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEakg6DYgUJEAlMB6tT24xR4+uUpJ1M65u/+n59hrC5YvceTfR
	rmtwB39R9Esvk4kIcz7wn5685ErbKfiAprhu2nlAVran+W2cuJq7yniWgSkEv/AyzYU=
X-Gm-Gg: AZuq6aI9SSAa7dagm4eFhCWF1rYOSBXH+O6+x/enmT4UXHp2Zf7VVKzTeRjLyt/kfn6
	xNxbzcdpckKGQgTgtcpLltaxAYPkE7utvM3P9kXJ9eWvkB6BCEFk8EMmoSAEmZtXZWeA/hQRye6
	yJmMB4qXYqhHr09Ah9aD2PfOzaeS+gIBsIqDN792vF2BN1TwU8sczrOKYAKe9bLIBvgAd5hBGYl
	HlVVr8K1nGN2i10VZ9FWNRkm49XV/uJdWHUR+YFZjr3sTtcqFw1huFUaDr+XDU9RlVqvKmPlZjK
	kgX6YNhrLTZTJxl+LAXcXOj3YBYYFYSjUfH/taiwGJ/UHCv8lWB4GeY6Yq1dNeuiS1VggGIO/Ry
	j6/74rI/Fv6axjikhsGBWpQWXthEs/mjUuJpDlOQasiJiFDNXjObEw+HJNmDXt2G5Hg4J4d3PIK
	JiNH7O2vJi+EadjqlLLhY36pLrIyGeUjzyNYBVZNuogiuLzcQcn0vSng==
X-Received: by 2002:a17:903:41c2:b0:2a0:9755:2e97 with SMTP id d9443c01a7336-2a9516864f7mr56133595ad.15.1770460098496;
        Sat, 07 Feb 2026 02:28:18 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:18 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:27:56 +0800
Subject: [PATCH 2/8] riscv: hwprobe: Add support for probing B
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-isa-ext-parse-export-v1-2-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

The B extension is a shorthand for the Zba, Zbb, and Zbs extensions
combined, as defined by version 20240411 of the RISC-V Instruction Set
Manual Volume I Unprivileged Architecture.

The B bit is added as a system-wide check in RISCV_HWPROBE_KEY_IMA_EXT_1
using the global ISA bitmap.

It should be noted that the kernel already exports Zba, Zbb, and Zbs
individually in RISCV_HWPROBE_KEY_IMA_EXT_0 with per-CPU granularity.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c420a8349bc6811573051154bc9c64617f3d7464..8430bc94fdba073e1e3ded973322c773c598a0b5 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -391,3 +391,7 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_IMA_B`: The B extension is supported, as defined
+    by version 20240411 of the RISC-V Instruction Set Manual, Volume I
+    Unprivileged Architecture.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9139edba0aecbf466098ace486658aaeeb6667e3..e7bd2e9ea33459572d01495f4063e32e3207e48f 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -116,6 +116,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
+#define		RISCV_HWPROBE_IMA_B		(1ULL << 1)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 1659d31fd288fc296d711c111e8d1a2e2fc8026a..491af3c5b66a0cb30471dafc8b31c70df2f9bed1 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -191,6 +191,9 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 
 	pair->value = 0;
 
+	if (riscv_isa_extension_available(NULL, b))
+		pair->value |= RISCV_HWPROBE_IMA_B;
+
 	/*
 	 * Loop through and record extensions that 1) anyone has, and 2) anyone
 	 * doesn't have.

-- 
2.43.0

