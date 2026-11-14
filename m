Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678000;
	b=KsqHjOFaDz1Ian13wT6bh7ks8lFwMfgV5DYJeEAc96oXyMZNDq22eUYCEiFCKE/c8mo7
	 9+rKuLTFEOWcxu7X3P0BPmKuXcmpEd1aMx9tvW2XDXIRV+MeAlBiuKl/NtXEDiZ/pt9jG
	 QJaXDo7EhEGp8Q+tnXSFj/huVEyyiFlvBBbC7BQWjjDN/D5vrpOuc0vh4sweSab+TZh/X
	 Xf4nenYVmPbbfKrJhyUnkb7R1aVJQ10Me/TUE6B++9vgHpP8yqZ1uBwhpgyb9MAHQ/SEA
	 PIYAJh9+Cf6eTKR4XHVGSj2ZdYassIwcGNiYXesQqW2lkI5H19qmmN+lRwSmybUsckA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Lyal3OiBd+dT9BC358VwYP1xMvu/A2SqglZVPhlyxLg=;
	b=i9Vw5MNmaQmV9ulBhnL0VOk5sdlz+W++8h6QCoIqSu2AqlvLm4vc4JT+jCkLX4UbqLSu
	 pupWwWYu3xSQ4x870fC4lVrF+LAbkbR+VxZuAUjZbVftAa2BRZeBnl/VxT/R0rbc4MbRA
	 o0PsaCJlRLWfHQiyhFynckGsSrtKwXrQhgzTs724QSq9EAs5kcS+qOvGmCls9gnZy+M0p
	 3ITOa8NyaVA9fwMWS7SJrKWIJIypEOsyHuBDt9fmwUwhQO/FtqefHPStDZ11dRWzmddJq
	 jBLq1IrPCnhOWF2jDnBNWHxvAKDPVIO/MDEwevW4k3GZQtiGBYJGBvJf8gaJfqQS0GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7Js8QzN;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA90606A33F
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 17:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DA90606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7Js8QzN
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67dabd38cdfso38589d50.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 09:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677999; x=1795282799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lyal3OiBd+dT9BC358VwYP1xMvu/A2SqglZVPhlyxLg=;
        b=C7Js8QzNBNhT8bsatWEGhvlzBN6jeTSYgOsPLNr/9v4GbZ1GRn/qzyBEydnjYdBhss
         eUhS/vNq7zC0HatHggHMpI9lUnsudaf9btf3EaEBBP/sFi9BgL324g0N/Q4mknXas4sq
         Dt2zqw+CC7wF4ypOWxOFoxPjnDf7v06nhVgSiWntOD9v7myBlXZetXEHJ1s9Nd1jgZVh
         HRv0W4OcDwg3faMYXRlMU/mHAR53I3kuUNlRowtOIRZ/PbfDrwDUPFItmQXqJ49cEZN7
         2IeHezGihUM2chlihjLlEA6AgKTM+x2Du94fVGjHejoHfS9dNJDNKb9gp/1/jX8s7eSq
         uz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678000; x=1795282800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lyal3OiBd+dT9BC358VwYP1xMvu/A2SqglZVPhlyxLg=;
        b=CZzwyVoJV6mcQ1JG9xuoucM4y1oSNxvO2trnqxCRxZlAnHtbFzNoyISpw+u5E0idLx
         mjj/7Z5smukHeKLDbWQUBV+0gNRk2dbNaNr5qWE7JoFOziZxLQZDeLGPOxP14L4+FXTx
         ZL+77532W38QFiGrpHPVmX6XH9P6NW1bTOttoBH7ij5nfgq0RPwQPsIY0SvNzP6c+eJL
         yjCgLyR0xP+/4YcdzIl1zVtcaFGdeNn6TR+qwhgWp05/T8xljvdqmtgFSS15DYW+vckG
         Awl/0KnHprgNO1R4uZiJN0yJcI8mZY9lZSlNt1basN7pECC0ETrs/k/okPg6UmbRPBjp
         QtJQ==
X-Forwarded-Encrypted: i=1; AL+hErEtTgZtmSfW5q7FP82/sjHPykIicPVPQwwgxfk1BoOsnyHUVrM3bcjIA5P7qNVQRXcsAFlqeZGMjCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z916Zek7yHckJiZn1uRRfGRzP8K4BDArVNfV/T2HJfW+Kl/tGpP
	pVB+OqjOT8sGM3IUG7tHaHG5KdYLD7l6hE6SVIAkbduWc49xKMV5f0xv
X-Gm-Gg: AYBFou0OToom+roQMyzGvudd+J45OqYzIwsDXlreg2q8mjnjATx8lguefUvx4LRUHDi
	jwFCepTJBdLBQPi4+6E3xN5SqKDWouqjJXvMC4Dkn4XB+K9ITp4BG3p8ONCHz8ewOxWeCCuHGNo
	EPuUez6JCpxSFEpmsfRT9vQ/4ta3Lb9CzF4Kit3neQFNWVBk+mN7QR5oKMHbldZc7A+7SaWvoxr
	u/uLQBpjG8vEdi+I/btJFwB7HCfcr0BDN10qPklK2bo8CKSXBGtWBCVt0LFFvXHlhshKG33eQHI
	jJQT8YFcT4o87DIYGl2+BmriOWDaSakgZdDEhYNlkFelHCr98n11ekAuSvHj0SrWdW12bdKYyyK
	UKApQXl2hiR5tpnWi9BGwlTqUv0nDF4e1xNAbDrRLWm/OX61iq4hyrv5cro1eR/BEFgXM/8bVhg
	R/ZSZMXW4cCZI/2raQAo2EEWgTgDN2Vm9h5xA8QNBVppmFLTmNuGVzRVELIRdvOyUPhgJ08uPkP
	KozDsZ/LpASpqMC5PVEZvQDR34cYRKQRGXgIfddRdTcwfETXd7ldm0t4PCpUxuLkTLBE5ndSZrv
	5URi+hnCCl7TDgmRlPHckD0axsQp/75qCQLUD0hkxkYwB7Vyl4bPMBj/CQWF/F3fvKe6+5k3lDN
	IFjbQ3Pir07ka/qMfOPEL4BKfQqqM4cbD2ohxIcktNQ+NBFIgdjBVM3nqN0N9mg==
X-Received: by 2002:a05:690e:b83:b0:67c:1fc:2a49 with SMTP id 956f58d0204a3-67d970207c9mr2180388d50.54.1794677998636;
        Sat, 14 Nov 2026 09:39:58 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a55ab71sm5322721d50.4.2026.11.14.09.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:57 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:50 -0500
Subject: [PATCH 4/7] alpha: marvel: register a platform device for the
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
Message-Id: <20261114-marvel-env-v1-4-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=mVh4JvfcK0k3ESBDJMdG/SRPetVbGyQ1JJmKBQZfeiU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHm8bJGPx8k1Qg5dEu2+fbeTjyY5LHjjENeTlfdPg
 mE3u3NUx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFxjys3IsOjQh333tt
 0W+8x1PjbuR/OyiMigNWFFrC8Et9yt5NC9eY/hDx/PoUdFf0/1N257rHlpu1WB+6S17qxr9xxom
 J3AJzRZmAkA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Assisted-by: Claude:claude-opus-5-5
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

