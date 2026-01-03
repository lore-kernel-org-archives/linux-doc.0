Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40872512F5
	for <linux-doc@vger.kernel.org>; Sat,  3 Jan 2026 05:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767419006; cv=none; b=Pqg4Q86n6JStm17M/niGJZ2zy5sVJLDAxzboSr6aBcBfjr1J4sK291RK3an4j22RD2+Z8CCLDULOety9M7O/tfg/g5VDwdQbqpHXY0QRgxGg3eIyJd47hro+MUpN5G5pw2WYpii6SdyDaiZi0oDLJSsWzcNun/fiYljZymqSY/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767419006; c=relaxed/simple;
	bh=X+IfmcXSuoZDRyg42fHqoCA1jXYW6OikmoE5xXE6U3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=l2vGJzzhMWrIQiedOMLlunHYr6wcK4+Nnlqay6CUg3arQm1xlmEu0kJ+x7eAibP2JneyOuO3mIV1Pum0RMFjjKXypLAIeUwwx7gzIeZRgOTM+JCNxByXowvJYtk+JfeVvqtapntPukZadrymxMG41kbyoq5NRHxmMdITD2423jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6bvduk4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6bvduk4"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a097cc08d5so33013745ad.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Jan 2026 21:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767419004; x=1768023804; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=irsQJYV0eG7rEEfQaub+MbEnNO9+IN5xCWrTMsKLC5o=;
        b=j6bvduk4ZJ+R0NL3bQ7Quqp6ItMKdijCcczevRJ5MefujAEbgdcg50QRR5OHvmdaDN
         ZPad6RhW3xoc0nE61ja039KjUfV+Q1BURUmpjTrGu9p6rDVnd9jVjNrqRwUQykQCn0uR
         rTa3xiLDO4ISw+3ZR5EgFzW+jV42IjdYOsQv210Us89DbG//qNqUQkswIMJAd9Y5Y8Ak
         FpUg1gDhyL7zR6PJhnGYdSvpea9qVqaIbwmgV1ycEGzyaxH5l28kyXgAlEhRPzHk34HB
         sk0X8hiuMf78Xv29ntdpvzPefeHq3DuMv8EcZ47bmJhIM+ZOSpuiaKN5x/WvOSNN3mkd
         QvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767419004; x=1768023804;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irsQJYV0eG7rEEfQaub+MbEnNO9+IN5xCWrTMsKLC5o=;
        b=AhnOl2tmojmn18tygy++Qq7I1Y7N+D3psp7rFLDcgU8Ef4A+5mKviTtL05FcX90crB
         vJH6TpOexxElpaOLcYfrRorjzrENozN3Oc7SN20k9vR+kc9At91VE0k8x3c6hQoUKUrT
         FgffxQ605CI8fG1x5ggLhmMRQRuHOBY8NMDXHS0OMdN2cLMUAfWV4W/nbd6rdyfhdW8l
         kBuvg3mhVEB1qqNpPnj1XWje4+2Kn0nY8XJaEaqJ/6HOPP5rvXsyDKEUSU2l6hXHDrhM
         ypwGv+NKghsrVvwwYp2eKM2G4kEKXHtQNCkAa8skAeqoNq6KkPhsR0uHW/ZnntZ4E/6q
         eOLg==
X-Gm-Message-State: AOJu0YyLa6/eUXg/yfiBWGmGK9TW7OFgB6/fe8ttPYCophhCu8zr3T21
	8ObKG+j2Bl53MF6NQ6xt8EqLzb1KHRtu2+nBrATSijWDwhvGj8TgHB0iNU6rA/AV
X-Gm-Gg: AY/fxX6j6Bslu/QqsilMF4cCO7EzaKkGfOPDpDDoevRq72ky+U0hrLSCsouKnOhdV7u
	AAFLZd02vTXM8xlrWTch/iD0QhJwAkHz4Hp6w/Tu/dRLMmP1Odwc1Q0H6LH+pu0BbVix9tTwcCx
	YlTSrxEkjeXbB/fKjZR5bEd/8F3MlyxKI2WhVKcObU/Ar+oxzI8/VWgLl1/qFYWZoo1dyWvmw43
	Zqf4c3MI4RQOCO8olZs5TOeecydluTW+SxiGrf0A0/GwgmXTkOyNybmweMOFuGM+YlAavIdm3ld
	G2UDfZBeLgjsoYwkEBN9QDahz+icDUGOrRAdp9yYpzSljIL9AhliSPmWG8VVszx7EaOCQr5qVHZ
	M/Cdi0VdFJbuR1wQ/NjWP8NOJjMdW5zAPuuau+Xd8MpDMqjuaP7h/3qrK2lJ67al3Nr9uutHZuS
	6vMyCovvdBUqsS0M/H6Ho=
X-Google-Smtp-Source: AGHT+IFyvK8oZUDI2iN4F2hzCL9EFwLS4fRCLQTFp00CWjRKDSbp8hNeVq2/TfdhiVcPETWvlgQRFQ==
X-Received: by 2002:a17:902:da8c:b0:298:2237:7b9b with SMTP id d9443c01a7336-2a2f283f828mr306955155ad.7.1767419003943;
        Fri, 02 Jan 2026 21:43:23 -0800 (PST)
Received: from [192.168.20.112] ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d428sm388513275ad.73.2026.01.02.21.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 21:43:23 -0800 (PST)
From: Masaharu Noguchi <nogunix@gmail.com>
Date: Sat, 03 Jan 2026 14:42:39 +0900
Subject: [PATCH] docs/ja_JP: fix typos in submit-checklist.rst
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260103-b4-practice-docs-typo-v1-1-d68ad6a22ab5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswk6KuEi3UxpqNikYU0t2Tl
 m/xf4FMiSnD3BRIdHHm4Cu6tgF7aL8T8lYNUshBdKJHozAmbU+2hFuwGc8nBiRtJqekMuMkobY
 xkeP7/y7r+35x8GTjZwAAAA==
X-Change-ID: 20260103-b4-practice-docs-typo-eab9f424b792
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masaharu Noguchi <nogunix@gmail.com>
X-Mailer: b4 0.14.2

Fix spelling errors in the Japanese translation:

- "Menu attibutes: default value" -> "Menu attributes: default value"
- "Documentaion/ABI/" -> "Documentation/ABI/"

No change in meaning intended.

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 Documentation/translations/ja_JP/process/submit-checklist.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/ja_JP/process/submit-checklist.rst b/Documentation/translations/ja_JP/process/submit-checklist.rst
index fb3b9e3bd8eea318bdb9985238a9be66ebafac26..c118b853c44ad525a90b486e26a12347b398897c 100644
--- a/Documentation/translations/ja_JP/process/submit-checklist.rst
+++ b/Documentation/translations/ja_JP/process/submit-checklist.rst
@@ -52,7 +52,7 @@ Kconfig 変更のレビュー
 1) 新規の、もしくは変更された ``CONFIG`` オプションについて、それが関係する
    コンフィグメニューへの悪影響がない。また、
    Documentation/kbuild/kconfig-language.rst の
-   "Menu attibutes: default value" に記載の例外条件を満たす場合を除き、
+   "Menu attributes: default value" に記載の例外条件を満たす場合を除き、
    そのデフォルトが無効になっている。
 
 2) 新規の ``Kconfig`` オプションにヘルプテキストがある。
@@ -75,7 +75,7 @@ Kconfig 変更のレビュー
 4) 新規モジュール・パラメータが、すべて ``MODULE_PARM_DESC()`` によって記述
    されている。
 
-5) 新規ユーザースペース・インターフェースが、すべて ``Documentaion/ABI/``
+5) 新規ユーザースペース・インターフェースが、すべて ``Documentation/ABI/``
    以下に記載されている。詳しくは、 Documentation/admin-guide/abi.rst
    (もしくは ``Documentation/ABI/README``) を参照。
    ユーザースペース・インターフェースを変更するパッチは、

---
base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845
change-id: 20260103-b4-practice-docs-typo-eab9f424b792

Best regards,
-- 
Masaharu Noguchi <nogunix@gmail.com>

