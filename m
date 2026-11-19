Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047000;
	b=JCRdH4VLJhw8wxq7FmgP3aiA/nsXVywlmjXeNDOHOIlwAtI72uQn/DCcL712rD03KXTZ
	 sOK5i1w3cFcIwNBusuwPBoNFXbrAg7pr8loDtxDv80odgjxGWBaHrFqpPXu9PVcbA+B19
	 xaAwF4O6Y840Cp1s5aFEmF1n00ACE3kA76icG3qKBNIUSGM43PSWpTgWqLi6OUT3utZQq
	 Neo6qHhUDCwhy/e7Sf1VgxhtiNQCJbNEjjt6+QNj5HgdPIUTcQpYxQO//KUYSORgergXP
	 nfzGhvgaDCdgQswx/Bhp5h1TaQ9uD+32Zln9N0s+0PnO0VLx92h6ZAPjzFJSqwlRU5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
	b=yU9UVfKkGyGE/0Ed0B+v7DHQpYIFKaKJaa4vxXs24/faeB5SwuZ1uG4Stq+J7M4Pf4iT
	 bpnHKBqysse3mKOTLmONqqlpVW7svHQwzGP0gjhh09mnCghKGebGzauq0ats7W7KQhqtu
	 WOMjzZWoi0JweE1/ufYtaApdU11Zje9oFbAArtMpIhdRudi7jDTmqGzkc2/E3y1AbSf9I
	 O8QUiC42uj9yUyKzIr4fkZpedbaOpRERknsdAlXH1hF2M1o4mqJFh6k7j1rOdtd8m73Q0
	 9jZpYKzVFt8pcNj/YzB4jNBVWPm/mM7l5kyF+drtZDobjyN6T6yrZNhXCsZpDS1WywA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZAuzRk/b";
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAC260A2600
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 00:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DAC260A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAuzRk/b
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4cc793704so13597457b3.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 16:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046998; x=1795651798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=ZAuzRk/bH1C4XHaHJdlF0uXoYYurW2uwPPgfvYAThPdAbsuhTmt1wlr7vnOoallGgd
         Am8JwCShq150uXr2awS7XyI4TvG/bUNdQW0zqh0XUnDvJJEFpegQSMpCzdxWNA4WYGQ5
         sd0h7CMjf6EktPMHEFp7I7zjGcexZD5AKtbqHnOUgOciVzg+4r0A0sC9tz0Jefm1DKAw
         8sX/w5yYU7VfLNmSnaM4Iw7nsADPQvBlVKb5KfS6Z67dStOeq6DQ+VGFdcuWd4Xcjia2
         lY2OvjuZf7D0edokHbv//lmLbSBi+reqa6oXUzaClNqXpCKCdsvUHIcT3vQ7ip5SEE+H
         c/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046998; x=1795651798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=MY1OSirV5TB5l9BXY/L1TJALMh1vdfiOD5cVbKzbUnPRZRBPACqPzc4RlxiQv375Hy
         wlAVmwjMy6YJqZK6dbVL+Bx1Yfi4GLInLbbPoBLgi1lhAEDCn/dAab6gTBpsjZ4wT6Zf
         KI0us3yQDJMVzPdrc6s2IXbrBLl7Ml7NH7k3fudyOkP7MhOjSnSFEHxb8TtnUliLCFfP
         Pn+L9uM6Y11DCc0VPCZRCOjclz6B4Z/FklKqC2ainKvPB9LsD3G2Z4DT0UhsnulcAQDc
         LPwWGLNFIuI5Oy4EWjc9928DUyS6PEuX5TsbZwFCfQwOfMkMw+MaUe+RI2A7r/iGlETL
         HPkg==
X-Forwarded-Encrypted: i=1; AL+hErHtkMz4lhr9XdfnRCF27FiEzqtWJfERkrxbMaScrPbnWzXVNAau5/jBbYe/WPAyFJXVmj6vFMsK2cY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w2PvxLLPRuBVFd28knA81H1+oOWZPk7+ZZNHxAPTSb065mmS5
	a0E6KxnNEDszRbePIR5mHgBNuJSlAVGg1q1MCIIWIseY5gmXRy1pxKI1
X-Gm-Gg: AZFdTZdMtUM5U7pn1IAmkLxh8bu2APHoQW6XiEJOV2AsDU2HCr9GBnn1Qb5iz7TPD+h
	WZZdKG1bNdDCKjiOntEiQ0JLgvP82c5lnV9HbEs94IwVrs5LREPea9VYj/i9D6G5fnRzOghuJ6w
	y2N++nF5uqPIfcvf19rzsU3LzbY3lpaw/8biKclckd8nk7c8dxnXnWdVcp23X6LDQmVJjUX/1PX
	wSZpsZcuTRFiMXcoZ2s+nQ3FTQ8i4yatB/LfzeU0ko6lrp+SUrp70tYGNm8TgN2+6MJnLcXKY6L
	E9MbnOH5WfqKXZJCJn9XlnuIyFJs7X70U3uAOePcimp0ml441NSkmoMCFrS88oU6jJX/BzIwsg2
	nZVAm314HmCYzZk8iKfozey8MfCHsf6KvMBmeyJZu2FsIcCrCnxDIg+ar1CZrCVw+J7EOtVMGl+
	uZdP7+t9jpt5+WGhu7pYNU5bLIkqbUuWiEEHujsXWifkgTNDUmVP/4mqwXTVx7Qo9BbHvQuVg4j
	dO9JO7mjYFjhIcjJzjlAqkJV2ZWrS2n7DNKzh5jo9dCvutFgpItS5j5NXnXwdHApx1033CuSOZX
	7PXQ4l832DFHpGIa254cWRPTKd++P3Zu+gp3t6dhBY1e0U3v+LZz6/o9nUihLnzXRH9566V+ofM
	m4xRyjcPnzomPANBkR1kjNodM5PkU7bGr5tdKwlwGWu3pIW6BVCaypDHUFI6Cv4SGlnd+AV/Xhz
	etzj7xCrb+laaf3W+gOA==
X-Received: by 2002:a05:690c:9a05:b0:8b4:e2dc:3f20 with SMTP id 00721157ae682-8b4febf1d10mr16920757b3.3.1795046998443;
        Wed, 18 Nov 2026 16:09:58 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe10d935sm25708467b3.41.2026.11.18.16.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:57 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:50 -0500
Subject: [PATCH v4 5/7] alpha: marvel: register a platform device for the
 environmental sensors
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-marvel-env-v4-5-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=eCxTz6/wFgOEYqUhWdz1P8hGqwqPQw6s+J+8BeCiWlI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2XkprM/7qq30VG5m4Kxye17zp8biqRvsPTcJbq+qu
 hD/dJtax0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFwz4ynDLybDw7+5jL
 4/ThWsO5z3fdmFfX2dBxK8fIQubMw46v+g/A9Qhe5V0Yny98/pxd3OXu4/VW6TkNCW77PPBi7hi
 1O9J76SFwA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_marvel.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index bd918028b410..d2e1e45cdf1e 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/memblock.h>
 #include <linux/workqueue.h>
+#include <linux/platform_device.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
@@ -1142,3 +1143,13 @@ long marvel_cfgtree_partial_update(unsigned long offset)
 	return status;
 }
 EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
+
+static int __init marvel_env_init(void)
+{
+	if (alpha_mv.init_arch != marvel_init_arch || !alpha_using_srm)
+		return 0;
+
+	return PTR_ERR_OR_ZERO(platform_device_register_simple("marvel_env",
+							       -1, NULL, 0));
+}
+device_initcall(marvel_env_init);

-- 
2.56.1

