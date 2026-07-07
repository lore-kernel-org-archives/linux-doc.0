Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F26381AFB
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416382; cv=none; b=OXeKRdeCUhicByy8G3c8qZblkfIXMK45F0YLVNj3yWzc8ihNVhNya5OtftaXZHVcbSGAoAXlcN2uNsYH3BxYluNjHVxadmtwz8KY26XEWLXADLhhkmbxW0opkXRtbCrju5e0hdiambl6Bb34+Mtui5Z9XdMqhSecEiJXjf79GMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416382; c=relaxed/simple;
	bh=10Ql8HMFRiPcneEAdb0CWJOIlVAzu8MZ55kxOP9zjp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TUiEWWZud52AOiFzkg6ceDAyrVJP2PLninHRB5Ero+hDFYA4BJN9rSZRSYDS4jbKwRPe7oSw/JwM/PpOkSk877xpxoGXYzclm/VYbzQF6e7Ht7CturOsw9qbACc+9E8db8jRutP6X3JtFgf5q3C++/BThyr83yjmKuygj1gNGYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8h7GV7Q; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8h7GV7Q"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46f88060e8dso590193f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 02:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783416379; x=1784021179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctoANk7KJy0pzkgXleoOuJemvnXjUxSW8rcXFb0CcGQ=;
        b=N8h7GV7Q5ZRPaoDrteyVyWgkWKp3DRuGZC4rIwZiu9tldYGRKxWYLBJD3Yd9SYdk/A
         Qh7nPvivzdye2LrNjTV5fKzt0i5gEImqoBdCYkS7oTYu4+vm6xR1nw3AIEauX+ZLd9cm
         LAqNxx80WqhVzijwi+qdZAJTjrd7dx6vOtjxJAKLvHG6Z6ceDOEv2DMUOi8M6AM8YGx0
         5mNQVoTT1coZU0z2Yr1ahX8/CAN3DLPfrorzsZcbx2/VYUEUZDl6Hv7teeLkL0C8BY8G
         pSZ1j13HCg2nKXMvv9YdXH4uro7l/5L3gxYBDk6MsGWPasAOYU2Ej+JpUez8Cvj4Zt/O
         2PvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416379; x=1784021179;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctoANk7KJy0pzkgXleoOuJemvnXjUxSW8rcXFb0CcGQ=;
        b=m858XZpvs2PXt9fXzfv/dNQGkO8rJnwBHskbUNSZ0o2RMcwhvB03ctxy/+NzKJjnV+
         K9BRkEz8axvlKZrwRbod+cU08gn25vcrzkrD129GkoLM5rSuMI1At/ehf+O1eGPgZpAy
         Ncu8bDlUBA3bbGvWcCTBj7J5pVbIGVNxibAHMcjGGLRBqgkjeQljx1iFki2zZ9MmxBnQ
         hDsJ6dMQuhP6oEovh4a24BSknFAoHAFq4xPVbUv66fphJr0aauNZS3Ro69RhSpW0uDrK
         EdZDNChtvbjL8Vxv4wGrqOpqF/ydlMX/PmsU6pPsmkF3spcV8Li20Z0fecouvG7NmoK5
         9AUg==
X-Gm-Message-State: AOJu0YzyOhdfFUNCNQ9OTkbpOAR51W2Cg+V2ax6f5iRVfhNhaGyfj4KJ
	wNw+AEbouNDU8bPHX63LZzpT5Jnp6zrmvyrmxpUGifkxYzVbTnV6L5KkFdGYRGp7
X-Gm-Gg: AfdE7cny13ropS7gzUKMcEGYS3ARD0lD8S22MFfwCu2eyUgLUJiSCzJcOrZJDHeRfhK
	ZF7dAF8XpksygUq1UYFN4WI8gkzV8YMpf+r4w5rSq5M+ofKYtNPJGBV2LaCN+89edM7dCj2Hfzo
	5l+z3vQKwirh4/O1El88McWuivL+FmOY21wGcFBJb8Qcu0y8W6bzRORmIr/f4RNyZuasdvokMUW
	nSYOI/iNzcfi0A23HpEpSSslm6YnN3RM5GIDmZW6IHqLFWa39UG6CgZyQac4Kw3AIlHfusfdtKU
	LeiM8Yz4891zdzjt7mKqaZ8YXMRW3JxYRwB9JZFVxHl8lnK+hmVDm1DYfLgxq3FXfoMAMwP9JPF
	f1g5a8MH1Mpmr6bPAX4yK0ayELepIbOo/YX8aBVVBT2LFTtR+IazpHxh4L3qqpM+qZdM+T2/njn
	BqA0i12qgw19r/x+OTqpBrXmlnuKPHSEAJNauMFZcodddLkzfNqPFYOjibbxy/21ZxWF8bdtvvb
	6m1Pck0xJHZxNuZ
X-Received: by 2002:a05:6000:604:b0:470:3d8d:dc33 with SMTP id ffacd0b85a97d-47aac3f6a6emr9598856f8f.6.1783416379239;
        Tue, 07 Jul 2026 02:26:19 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm29240846f8f.31.2026.07.07.02.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:26:18 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: linux-doc@vger.kernel.org
Cc: federico.vaga@vaga.pv.it,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	Doehyun Baek <doehyunbaek@gmail.com>
Subject: [PATCH v2] Docs/translations/it_IT: update current minimal requirements
Date: Tue,  7 Jul 2026 09:26:13 +0000
Message-ID: <20260707092613.1373425-1-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the Italian minimum requirements table to match
Documentation/process/changes.rst for Rust, bindgen, pahole, Sphinx and
Python.

Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
Cc: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
---
Changes in v2:
- Rebase on current docs-next.

 Documentation/translations/it_IT/process/changes.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/it_IT/process/changes.rst b/Documentation/translations/it_IT/process/changes.rst
index 7ee54c972418..1f89bae7b6c2 100644
--- a/Documentation/translations/it_IT/process/changes.rst
+++ b/Documentation/translations/it_IT/process/changes.rst
@@ -34,14 +34,14 @@ PC Card, per esempio, probabilmente non dovreste preoccuparvi di pcmciautils.
 ====================== =================  ========================================
 GNU C                  8.1                gcc --version
 Clang/LLVM (optional)  17.0.1             clang --version
-Rust (opzionale)       1.78.0             rustc --version
-bindgen (opzionale)    0.65.1             bindgen --version
+Rust (opzionale)       1.85.0             rustc --version
+bindgen (opzionale)    0.71.1             bindgen --version
 GNU make               4.0                make --version
 bash                   4.2                bash --version
 binutils               2.30               ld -v
 flex                   2.5.35             flex --version
 bison                  2.0                bison --version
-pahole                 1.16               pahole --version
+pahole                 1.26               pahole --version
 util-linux             2.10o              mount --version
 kmod                   13                 depmod -V
 e2fsprogs              1.41.4             e2fsck -V
@@ -60,12 +60,12 @@ mcelog                 0.6                mcelog --version
 iptables               1.4.2              iptables -V
 openssl & libcrypto    1.0.0              openssl version
 bc                     1.06.95            bc --version
-Sphinx\ [#f1]_         2.4.4              sphinx-build --version
+Sphinx\ [#f1]_         3.4.3              sphinx-build --version
 cpio                   any                cpio --version
 GNU tar                1.28               tar --version
 gtags (opzionale)      6.6.5              gtags --version
 mkimage (opzionale)    2017.01            mkimage --version
-Python (opzionale)     3.5.x              python3 --version
+Python (opzionale)     3.9.x              python3 --version
 ====================== =================  ========================================
 
 .. [#f1] Sphinx è necessario solo per produrre la documentazione del Kernel

base-commit: 2933b82083e758fe6cfff570143541d4dba672c3
-- 
2.43.0

