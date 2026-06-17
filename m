Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA203812EF
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781686410; cv=none; b=eJXuPfztzLaZngBdMGoE65/0oKVwCp+q6eFF8AOJGo0rtCcSwrpixIwsq5S1F/6xNlTNnKveSDkCAwjjsIdK5n5Bs2vXRAIaPnZuKz1lTLseKB/rwdgP4lF22bfULTLFqc+XTyFVmBlFZmBRbPTW+FdesugM8ee7h3zB2VKNxyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781686410; c=relaxed/simple;
	bh=W5UZOBebmCXssNd2jRVA3RyZjigurDY1cLVEhmcP6kU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mDgTdb1axqwkIKDtW5U2yZ4MhSU93qMqZOeBhPH5zJo5jhLn5o8LTSjHlocVclgcSEMLIbXWSqBhpAHnVFO6eKIRx5mA6JSLJtAr31UquAkkpm7VWy76BQqvDlHLPAUy9CJ6yOZzut0cEm9U4txjDMARXwDcZtusYl0CFemMPeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rtZY/JNz; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rtZY/JNz"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-462f54dceedso25833f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 01:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781686407; x=1782291207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LtS3VFiOSPxBxRBN4ssLLsMzy9stbEumX6rsr9hmDpA=;
        b=rtZY/JNzhmBkn3/ikWpFMMESvkOXqGS1xmXrHAyqIq8f4lfk8kVf6zsHowmOcAdMzc
         wmdj24bkNzr2bmawkvX7qIDDOoEfiS2GXuuND1ghvfSPD80qhDrv/bi+WQPVlokGyOXU
         lGhYiA+i8STrkfndUh1GN96SsoRZmjDrtUevkUNXRC1KJHp5K6FzZm2rI2JAeTt5Cz49
         LJxmfNTp4XhAHtQJIsoEoJL+mn8tXW2ZI1/eRuZNO2yX/A24TFK6vKi+mkHsdnNX/zPO
         zJJYgpXOCzk+nklNFG339ZDqaNFBoCEsk1CY2Nx2j6hnhMJQh3lq+ti1O6Lt4cPiOo46
         9b9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781686407; x=1782291207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtS3VFiOSPxBxRBN4ssLLsMzy9stbEumX6rsr9hmDpA=;
        b=n8LSXU/lAZRscbg6n/M7VeP7mJ8k5NPinsZ1Kil8z+HBfmaoHVYdnnMJC7plB1KXBB
         7fFmxQ5WnECR/cMQzRE/xM8hgNBDyBRozBrkhGnTieeKre42Iq1Ey+kPGE4mQYuskKk4
         /gk1BQBHBMjQXp5hQQQH/BdlHEgMYg2TmVed6RwAO2HiZMG37FA0pOG9LtdWWAOyRZM/
         vmIXXjvXeq2RH5ya16W9lJmiYgNer6SckWlzM6xXnkduOYaIQWwXPzMSEvXxnWP/yyA6
         Izd9ci6n4UJWpuyPDdt0bkzSuJxeSz2FVuf46yG8HF2p6dg2+X2VfDuLaa3e0WUqHiUt
         N+dg==
X-Gm-Message-State: AOJu0Ywwv+3bljzdcbt093KFE8rjT52I+xKA2NOEtmsNd4zDU5uE/Vdu
	585ZTAVaMnJaWq+x6S8htMs7Dvg1F95RTwEQ5SDch0Kucy5eqDEY+m5fovSl2iyN
X-Gm-Gg: AfdE7ck4GkDS1MxGI5gKT7h6bl3nQz+iStVLSTog/+pgLzYLq+aDQr2Ul5cGPb23N0I
	2WHO4mHNYASAWe9y3EJE30xXQkem/xt6ShFUTszJFdTW0Owf/fFdCOloBlqn8z57V9wwJ16ms46
	aZz+I9VnJXpk5IKERUG7/Y/P4w53PnqBC03dFVPTvQBkePii90Qgyp7StBmS+M0S5j4fSqgM4s1
	3mcafpHk0V8FndB5WdlzRTNbIsMPY43jt54jCzeQ4lbzk2aXVya6EeskDB6nKMMRkP6IIznf5LX
	oXScy6/uMCDQjbBbuEIJu1W69B2mTq8V2h0+/E2SfrqFfailm4G7gTJQpBIsOGk0WgU7Ub162oz
	qN/mKNKrAsFsCcNvXdRI7aEmXy91kkJ+uUsGLN1S/1+IMToiNEIdcrpZRLYGUIbUGLkurmLeiQp
	5eIw+0pRzMHfP80xdNoyC2NAV0eyDEGXZ6wCony/c7sBwcWSHenJO0H0u8LAj5hslFoTRxrEMYe
	ucBZwqRe8YJlPqs
X-Received: by 2002:adf:e612:0:b0:441:1c35:4b79 with SMTP id ffacd0b85a97d-4623831c75amr1858059f8f.8.1781686406587;
        Wed, 17 Jun 2026 01:53:26 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-461eaa0d1c7sm8807088f8f.7.2026.06.17.01.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:53:26 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Federico Vaga <federico.vaga@vaga.pv.it>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Doehyun Baek <doehyunbaek@gmail.com>
Subject: [PATCH] Docs/translations/it_IT: update current minimal requirements
Date: Wed, 17 Jun 2026 08:53:05 +0000
Message-ID: <20260617085305.3205822-1-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the Italian translation of the current minimal requirements table to
match Documentation/process/changes.rst.  The translated table still listed
older versions for Rust, bindgen, pahole, Sphinx, and Python.

Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
Cc: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
---
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
-- 
2.43.0

