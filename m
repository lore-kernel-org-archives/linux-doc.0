Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E44D1917CD
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 00:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351927; cv=none; b=SoqFWQeTIWtIRhSrxk4Cc4kjIcc7diRVvaSTivWeNNTgVH+qouLGMUTzMoZicY5eBxu+sLtexoF7IyZQj/c0mdA6rDbpMZyUvn+bonXm1mTwQu+RdAm8Ejk7Lk1CDoCcwppVnvPKWBUfH0T2C9zLmC5vEsV1vbLkmiAw7D96VvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351927; c=relaxed/simple;
	bh=DIjn1i6LYuHnBLhKvNWo/fynkhJW/iU4X0uf260tH6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OFXWtZEhbU5xa5YzspT9+SqsmvFI5M6nduxbYmSJqAgccUIyqvBzBXSdTEm4hpJp5QNB5WMa3nolwCf3WxEDXhAYxsJ4RK7BLPZfHVL6KitLfV1x8ovXoZdPQE6Ffp6YSWQSLTnJUi0DhKGgJtubHHSPz4kqH6ZZEXrTx2srkUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bynZe1Dl; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bynZe1Dl"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-290cd62acc3so31220985ad.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 17:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351925; x=1761956725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=;
        b=bynZe1Dl3wixpsJtZ5VraFHDvtNdkXGPDfRyGHiaZkV3UsRltVmZxze860+P2hFbs8
         QiEkcmuQUaYSNG72BMx3NLzy5KfBcN1j9NMmxMxNYkTYKcabEvIqjms5US19S9Yhm3Nk
         vxPKJm7lDV0gkBdPal5BAIObYytjZUVfTnLb9uZSyBWoWrtkDvy2eFX9VPE4KKE/GyMz
         seESTLnVgqgNUjms6kcHE3anx7xvcMfw75ElTfyWKBxn6GJBFgXtuZk5ve/bbOKBtzk4
         lPnQNKN/AFj813dosBNiylXs58hFm0hd9CtEk/A/DE0upKPZDTnPTYnsEmhi9ByBdmHB
         B5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351925; x=1761956725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=;
        b=YjZY0aKZz+pSIyo/iTIZCF/raLXwelTJISw5xmv9+84k3E0W9KqF5cVqea5GHegGft
         XbLX/gGnMKxay6U/fg2iwaGMzbRmlQ4TJDq6lUoxcae/7p8q7flpp+4YwLftlgwDYrgz
         kOBsXzPECvyt9d0Mcvmg8dNS2nFgy9KCw2qAufUPGMYf8h9c8aiIg5LW7KHZtyHX8tdb
         Am318IUrpc5RBEk0+xpPbfYrHrl7TfXay5TMNonj/Z6uG22b1wqNuNyT4fzkDsg+h500
         uiefZKjmW2MRvIrOGa5q2N8K9S0Cze2gzcpQnOnNLaku4im3klAI7XtVuQxxPajeateV
         nUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQHkIGtySseF2ErOAds4U0TGVguDIAqTsXRJpXMHJsK/kgV8K9XfwuAeDEGIqv8pX47167dowqGm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRylGEMrIdtD1aZEBzx/cb0s2NFPOjmoufd9tqa4Cx5OdvL/2B
	GK2hjPCTnSwQwpAq3IhbTaNT2mbHffh7Hy1wExkvA+EmAQiPh0yqiHiA
X-Gm-Gg: ASbGncuDFb8ZukVxqElBVSrek7v/+2g1Q/kMjBN55ACFAiDJyA383xUKGigFd7it9cT
	H5XbYGdJzSwMdbKQCoLOo71mGmcTntL/QH/2Sk+f7RCGjmIXBNUUHmdfa5IdqTyF2v5zYVlSZW8
	KBHNyy2ZDiWMQkqKRHQxveAs6Twu5sVKsigU9KhNQ31St8nP971K7cKE0wC5tRNup+zKjLnS+Uo
	k9HT2MIHc8hRf/A0pC1JZbiJWNIvzZXrdR2IXYj7PIlvwFRXFPlJonAPmAvNcB+A01uUWPQTo9T
	+FVTFuZETzx5KNtFgEnXxRD+0bGpDA/K5yNdykTfrxMbcK2gTCr8zi9kZUbe0n+7aCKIjv1YWrv
	zxd4rDVeOlvVmjMHq57ofN7bix09/A6PI1llTdfNR/YaB4i1iLm8MDJmprbGpFyFcHdxs+IT6QX
	Z2x7gKolDxCcAEBD1Sbt7snb7jL4GNDu5tKpJEH49b0Bg849g3ai7D6t/FuClrhVO5CMDeYtp08
	CyIA0Ud9FkCwivGt5uXCGbFXKg9RocOe55LKe8ApnBAiJEwavYZeNXME/vm5YH7
X-Google-Smtp-Source: AGHT+IEcAIrM5gDLd6A2M9OWpDkFvdgMAQWlJmHHcjPPAuvS+4wY77QHgPJLW5SNNNq/wEEOrEct6w==
X-Received: by 2002:a17:902:dad2:b0:286:d3c5:4d15 with SMTP id d9443c01a7336-2948ba3c6a1mr49230345ad.36.1761351924748;
        Fri, 24 Oct 2025 17:25:24 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:24 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:35 +1000
Subject: [PATCH v4 04/11] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-4-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DIjn1i6LYuHnBLhKvNWo/fynkhJW/iU4X0uf260tH6w=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM66XLGLz/n50Chebub0Ao9Nf53uT3wfl11dXS33N
 9x2ymOzjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFSfMmdkeDBb4PWe+6s0vbok5oTvmR4jwlY+maPo+DIp1m2PikI7LzD8d963dV/
 l7GSLoMiFjx35q83EPmxqWT39yQmNyVyhhrPc2QA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC RTC function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e6cdae221f1d..500395bb48da 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -47,6 +47,7 @@
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,

-- 
2.51.0

