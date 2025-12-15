Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4AB21B9D2
	for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791539; cv=none; b=HaY1yRfDTg/hoz2oK85UUqr3qZnA7U1kNVLb7yWSMImtrWjJ7eVuDQF4EF40EqkuHoZWwmLHdgEnpLhe0sZ7gel0gO6aUFcw6z4fM60zXxJWgNy4nk/29UkeD0hxgZdQVkNsHal94Hy+wOBT1CcWH4au/Yd+PWw7OVZGrJjSTm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791539; c=relaxed/simple;
	bh=QydWi+DoiY9Z64QzfXeb7huM2KW3vZ6y+zBjHRM0skY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cuBYuxIQcDGmr0HLyt6Cu3RTHasdbiqdhBgHMQyovlblUg9+yej73jez+MHOQL5KIpKOnVCmMfdYpmD/o0guz3qlWDlcnQ5BPIak/PxLnGgMUfHmXBd4/8jn/TEoltYQjfb4ZFbI6MGrZCjwel+4HDX25kdnezKKKEZ9AHPJu3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjkvHY0X; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjkvHY0X"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0b4320665so17140785ad.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791536; x=1766396336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pK6jEIYP2YnHjgeCSwjCYgueG0ykJpebH64ci6c2Og=;
        b=UjkvHY0Xq0UJy73I/OqNKpoBSQdfFQq4EqazPhDCvXTFAZv6dXFPgoZ7LizwceY3c4
         nOAcliXa6uoVCLHLEFuzqRNfgpDPG8Ha39dKcYpWxQa0StnCCvmPUUJSmSwGO1oFAgvH
         /RTKri5+BrUcs8ZS6rDZpfhg3GaPiNmQM+jdcabWogNkq1iiuQlFhCBzIKYM7y78CcB+
         1pcj8QvNyOXcebiflMSfvNKtI30AcIvyIW03yPFYi++xHj8ZZaGUqpGIK+WMfa2wg4K5
         8vGFkXxARywAmmovJ1legc+uCwA2nLWrReziRO+93oMUoO/zyS+0/wHyQ3tZhcVghsFz
         t2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791536; x=1766396336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6pK6jEIYP2YnHjgeCSwjCYgueG0ykJpebH64ci6c2Og=;
        b=iciKXer5phTqfpDVfMPoN4g2frJTbns4cAl1Z2FqmVWBy3vujRSx5NjsvXBjPtaNlR
         JK5DCgvc6jqElLhJLx/ucL4AY5G9PrG8BXOYrZdwV2YqVfLt9tFAj5QWlKMl1afQvExP
         ZIqfM5eg4SFOK5xY8We6nJtZJX3H/Z/WvmKGMXGyGzRKjszOkCjrfxxlsWKZmtBIcW9Y
         3LtfMr/sehxDSbBcJhJ7mqK13lFxm04Xivj5WGtaG0xTUo8OcZnaqDFG9M4WigB45z3Z
         l07D+lLpl3y+AHeE8pzWzJIf2QUx3glVAuqqbaBknO7ClC6n/Ovybsf9nMfPqiryv8YD
         EvqA==
X-Forwarded-Encrypted: i=1; AJvYcCX5mwz4HvfVqM/rVFCiM3nr8Q4JMFd56HfgqOXTTFxNcA0aELmYbApcQVl2VxH/NbQBa6oRgF+UyXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJyIwEyFE6QuZjQ6L355fBB9iGu+qmOjBGDCUWLdWn2TftbndK
	z2gIBDrL2l/mQh98LS/piW4yId5fWz/btpXRlT/wgecMTHrMnqbMbAFQ
X-Gm-Gg: AY/fxX58HFroTw4EnDL/L9Si7FYn/PPFd/FwfrIAX8lDkVsJOEhWdA2BTXqk+EW/wDp
	IqR5+FgG6RheicoVETPRsXH3WVrCSpbOfryeCym2UkNRrJeCJ/0cH/CZu19EvlnETz5ro06dUiJ
	3Bvi0TkAFIiHY1U+VMiy2i0FPiq4FsLptLdq1ndwIeSA5w+/J6f1ageRVBQeHlellrnBM6QPLBO
	PMDmlW85SA3ESKJDzPbKVlyPeLZHcUmWKAj+TiQcVLWtuLRur3OUdpleb3Cch9WurklBrPjjitj
	hSyP3xyvaGDVKc499j5abqGzl6WZ79WHWCUOW6cVrlyIAdr0nUnAkHZ8odWry6YZeQlw5wRcHK4
	WYEsdmwIp8IY8FnTCue5GqUxx/hCLFMjLOxF8g47qw9MuzNJWByBM9Oefn0oOO9n62FNMj4yiMW
	ZocRz1XGJsthJ1QRwdM2XRfjPhtYXAvvErQChJ4CWcolkfDSRnzgjTx6bX5ZMgHvXE1Z1Mc0bou
	SytOZNrej+M5zCevtLc/HUzIjkHlVDmPzEqWffcI/W4hMkdFBSJ3DrWQ2po39+LheLXcblwOqq4
	8r77cM3y63Ee8pi2jYHjwi2KehbWcYkatEUwokkq1AtXcgrMMPM=
X-Google-Smtp-Source: AGHT+IE7R5Rq59mcZglu2dMbSmwzQA0DuoEDw9ET7Cf1MleDlYYipJlEUwm/OuRe6KJQVxXlQvBRNA==
X-Received: by 2002:a17:902:f70e:b0:2a0:97be:61a9 with SMTP id d9443c01a7336-2a097be6574mr64303105ad.35.1765791535968;
        Mon, 15 Dec 2025 01:38:55 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:55 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:49 +1000
Subject: [PATCH v6 5/7] mfd: macsmc: Wire up Apple SMC input subdevice
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-5-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QydWi+DoiY9Z64QzfXeb7huM2KW3vZ6y+zBjHRM0skY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215ktRXclLcr81bZJ/cztR0mm1/JFf93fenKz6+6l8
 py6fnM3dExkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKY6uJGR4amuWV/mXtO6mp0XihoUH5fHRSRaVhe2f+TVfXRAQXC6GyNDh446+7P
 CrSess8xtlknsz/4hc33JghmFvFFfQ2ffZbvLDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC input function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index fa7b822d55bd..85410f357603 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-input"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.52.0

