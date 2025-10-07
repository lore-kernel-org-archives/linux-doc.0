Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04F72DC32A
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835894; cv=none; b=ZieWVi/Qkhr6LsIQcP3s703sNBE3yUp47NWpH/lKB+dtol8/Dtz2RQqhMlx80eiqYDaPntHqqGakxih7uRL/G6xEsq2REJIcrwUCFlUJTWu+7w09S1AVwDYvQprqFYocBpHXSnTswrte2wb6Wb+u/J3BSlcXTp00umna4UpMfPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835894; c=relaxed/simple;
	bh=EBXsHgi+TPtnux5Mjfvq3s8Tobe6+wN+A1W9K6WofCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGMopSM0PcMXxNNuoZ9e0+8VSqlVHLWZJwyLCf27dfxeHNm0aRID7EnppSxqGcDBVdbYKuSdbb+U1mvchVKrn/9ToFdXLVi+RNE6JaMp4jOe5y9kQa2GRjNXNhDE4zcHwqD/HObTWrUVhPXVDPQKuy6Bc+etg5Tui4FowKroH78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3g79q2R; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3g79q2R"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2681660d604so63608075ad.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 04:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835892; x=1760440692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=;
        b=Y3g79q2R3sTwjmbtS6j1kGagio7GsvlTL3JjcMezmmd2BPDZXaSIh0wYudVsmWWL6P
         XnDZb3g1VeBi1JYWZzoeZC2+BG9nuqzkREQwpe/APIv5IwXMM9+cBuqoZwSzoOBkkYxT
         r8hjDnHNLhl0nshZ/E492MPsB4i0PXCKlXvf6ESDuBH+oEmzgGiq8Im0EjjVwIcrMNd4
         2AUPvTvdigr0WsvEpJRhvML+PWunikkSCvqNAbUEeDd+V0bbBr7iB2wv8TO7sjfnwhIX
         iFap+nohZedl2KAY/WcLCdYpG/GIJ3OCkfcwcjzDmeujsMB8b9oW3rfDsUIsO7cNTD5A
         vNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835892; x=1760440692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=;
        b=HUPusJiAIOCunYyDVo8eoGGv5Yu5QR/IZOpr3hzXhJQpPHzRZqd671w+mRF+/P38HD
         SG5MO3u1yh+PRBHaCQa/9p6wVPVKWGwFfk4ZlkI6KMeYRVXovyB+Nl0ncuKumC+7njj1
         WWAd0Sq3nQnBPEZ9mIxviI00SVz6ls8dRqBbfPCZ3kLHWlAxCUbV+DEhkFeDFPb42BN3
         4HvylmLdR4zP6P3+pjWpl7ku4Mr6qXR4FTiHDFEYzvvnlbpLhaubGJKVyD9sJkcPh5G2
         5/f+RIF6Cs/uZQZxlEPXF66PVFIxTEgIzYuZnqqPtrTmudZ80XFza4DWm6LbmshRocO+
         WyJA==
X-Forwarded-Encrypted: i=1; AJvYcCXbBTKFeU7wqQBKDz99v7MqWjLpSS5Kye1QPmNv+qSCl7RNoW6YedOBRL4rQfvYXGFnuybfJ7kRD48=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMgMCr64EGF5iPHqI4vfH4iEp6u3uRNzF7ecTczkfWgkvaYh0s
	X0qGcBVPovpJqFPu53HKkecZdMawaOP/cTpQxvmSdAwZIrtds96K8rDBFti8g2vQ
X-Gm-Gg: ASbGncu7E7P6w3Tkj3xjZrLkK7engmrdwkpEBg2tOpMX78b50JG9d/1t07zcF65pX2F
	qxKcJQVijaMxwDXSsozEFKL4EQaf5Kx/SzsIREUhYWEq9z9tkCfoZ1h2kvUg81VzHSO3b/BARLE
	k245Mea5irxAOy5HL47khkuSV+puodRJara/IWG2EB6E4lop1qjy8Cm+8nqQArZpNmZI84ot+Tw
	bIw8OI9jkcuvovRnadBWid9qIBmgGP1m5uxo2AuZBmKyoWS3S8NilN0lEgFnOt8ARLHxzOGHXmS
	Fs3QcL5FbZ8zM1Cq9Cc85kpnl9WI8daR6S5egocsRC3RyGpR3hqwzdS6uvB0LgXcoyiqbdIbFKE
	UJWJwUR413Mcfq5BLqxVLFwYXqRkpU1DbmG0wW6eHB9Pa/9r1S8Sbg3w0cMs3Upavo9tTMrCGrK
	rKZdrDechqMRIc34EnUNQrXm274s8dLzYrA4Td5bK07A==
X-Google-Smtp-Source: AGHT+IGtobxlQxOmzElmeLrz6XbtLmYqUVeHEzRkuSFLIl/0CLj9uRwuwV2m/uCsqAKd9lcGvF8YVA==
X-Received: by 2002:a17:902:ef0c:b0:28e:cc3a:371b with SMTP id d9443c01a7336-28ecc3a3963mr25458815ad.57.1759835891715;
        Tue, 07 Oct 2025 04:18:11 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:11 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:48 +1000
Subject: [PATCH v3 07/13] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-7-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=EBXsHgi+TPtnux5Mjfvq3s8Tobe6+wN+A1W9K6WofCg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm1dVi8Ud3Oy5Jr9b70ezTox1bZcTX7RxhNtd28es
 6nxv3nxUUcpC4MYF4OsmCLLhiYhj9lGbDf7RSr3wsxhZQIZwsDFKQATWanJyLC3I+z5shiFivn/
 fhV4mitU2Nmznvq/6W5DGuupxz6KdRsZGX6JH93744nU5dT2JfGTeufsYWn+etDq6ZXeTB6t3T8
 s7TkA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 500395bb48da..51dd667d3b5f 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.51.0

