Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A6E17AE00
	for <linux-doc@vger.kernel.org>; Fri, 20 Sep 2024 16:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726850852; cv=none; b=hV9jX2PMO7yumPP1rFDyIRjWavstPljOvAceegehg6ZbkzRpGnd1a21+GvHLGlDCErKIyPtCT7+PNFiNTWQT9P1+gug8fTfPgdmkN+S3N2WCXGLZa2SMQWXXMfvL13pbrGRNsN4CvpaVyTJpuRbntqV68JBn/UuinlrVDtm0W64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726850852; c=relaxed/simple;
	bh=kWmDB7nojGoj156gSMkRuwtglVlXdhF+7Ma/4bI48yE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XyAUPHKaAneMhjteyW2RGnUmg7qgfJ7LmKn7ClnsHJswYUB4CRDkGUgwxm5DzJQJhRPOI6nUs0sxqPjDZ5KI4PfhonTR8kXvsHU1lnRkwXXhCe21YZ3vaWn4cNA/XUn8o8sw0oW/1tzmiJmQog3zDZtvEGw0Ypfb9X0RUFuUfeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tJ9pNwkn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tJ9pNwkn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so21034145e9.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Sep 2024 09:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726850848; x=1727455648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2l/YT0SVwM2BKGIIcvG36vkjoblImIQN3qbMI+AN58=;
        b=tJ9pNwknkdzccDeLhxn+N4AGuBfk8VylLBxb1rdRVVXSaf9Gz8in5TN8NL9Rt8wTt6
         0Zf7C+gfNZEFkUM2kdCKSp7AiaXcsD31+LCQPY4LsSW9oEcLdraDOAkw3agsg9gUSoyN
         b0QgqIlWHPlqISwoI+OmBHF+bHLoahFIyfel4tuIu6WCfe3X5NE5RtlMZoUhVnVPALdY
         MllSM1rPMiel40/RUlGi0u2hQC+AQmuNvPyWpvK84E+lehGaJRE9NFMYR1NAOvDCTJ6O
         woJG0JEtm1t03of37vEwT1vjIZeTTeq5YJ2UCrFTX+YoEjwgyJt2hOmG6ppvQtc8yOFM
         pHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726850848; x=1727455648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2l/YT0SVwM2BKGIIcvG36vkjoblImIQN3qbMI+AN58=;
        b=c2Zm6LxFfk6jBit3kIXT8VTusqfnUL0IzPp3v/tnLK4uOGH5vxBla6Rlf5rQCdz9tT
         jXfPR9EBmnKMGQEnrPIilcVrKUz5ZcTxpL29hZmIDia9fYQTpfF0Ykwiar9e9Uj13yCo
         4BhP0tovf87wtx686i6PHwxsPlyyaS8ExL4NI7g6usG3vlbqXhYRN2RlVhxheC7TlroL
         xAkw183MHhUhmMiCm8SZzjLbMYQIzPNNua3QFgBKrvezHjq4O/vy1Uy1vTi9xj5wOG8h
         ABbmE3LNV/Xfkh+K5eUisB35vIxhnbSB9+RI6AWHsxLdYW8zpo5XkAc0Da5MhbtR89Bt
         oGBA==
X-Forwarded-Encrypted: i=1; AJvYcCU6nMzExnuprs7tOMHjs/+B+ywOoFA1QZ2o7lUimL+gkBOKZdB8qrWItOnE6WAMXpvmcV6YzloWatc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWirshpAcet+ZyHJPHdNesbCTUlcG1hs7zL/cdvHUy7jGFyrZ3
	ugHHYhxikl69lHvh4lTEIT3iRtQOns9+ZuOzdOiL9sA//nFhRx6H3QAhNcR+70Y=
X-Google-Smtp-Source: AGHT+IGJkUkTnhqw6d3RXsoe5pIlfc7IWhH06fn71XCVrA7qhdEYf5C1n8nmKLARkeSlarPrXdjEiw==
X-Received: by 2002:a05:600c:3486:b0:42c:bb10:7292 with SMTP id 5b1f17b1804b1-42e7c159dcdmr25826755e9.1.1726850847740;
        Fri, 20 Sep 2024 09:47:27 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8e69:83a7:a29a:ba83])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-378e7804476sm18172250f8f.90.2024.09.20.09.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 09:47:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Sep 2024 18:47:02 +0200
Subject: [PATCH 1/5] regulator: core: add callback to perform runtime init
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-pmbus-wp-v1-1-d679ef31c483@baylibre.com>
References: <20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com>
In-Reply-To: <20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=kWmDB7nojGoj156gSMkRuwtglVlXdhF+7Ma/4bI48yE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm7acZjTiI6NYDcqe/A6lJd9wte11A1ks5RZgzs
 RVe7T000QOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZu2nGQAKCRDm/A8cN/La
 hW52D/4yGNHNYs/Bd+K9A1vBnJCVbqpRd3EMOUqpTxOkIOnUFDHhmUoSfOSSwh7QKsXytEH0GLZ
 66qRDZPV+81S+h2gnrSaGBhUy9ymbKLIsi6VyKUvINvVFInEdqjb0isi9b4Y1AkA8YmULf2bdbh
 6n6ly35NtH449jTH5b+c1rX9D5urlYZzhzvNTdmybs6YS4KLDJrVMkRGhzIPfn+0l7LLXtjqN0j
 TCYDyXvHVb7CX1KGoIgFqYQelQLA4rNNDO1JSM8uYQOgquyCS6b7tUONQqoh1qh8yg3bNpU18fr
 DUQqVze8T1r25olUFlu0AmGmcpwdI7mf/d+iSrB29HHhsud58QL9T7of6VPE6dfxKB6zq67VEKT
 7XbY/1OVnaH/1pzKHQdDErG7dL3O8uWUp4xU+Cu8bEtCUGBLR9FJ5Y1cNffJw2A8irD/qppM8vg
 KN6bnWOjhbjLHa71unWmaYBufmbgC46Md8ckZ3/9lA57He1Ka6wbkz828zqWqCn3iGrAlJh2BXM
 4LId6A2tDWJtrKOAST8PtMeowzHVesROoizRgXAhF7p3TPCJWtq6CjDts+ImL33+Q4ZVeizI1xd
 JsSBKhX77pQ6AcUW8F3WGVQaq1NfNiQlJ/ciQPANrnnTNVsKZ29PE+nlUIfUDtVs+yf2EOMIVIJ
 8mX63BgY3kjQVDQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Provide an initialisation callback to handle runtime parameters.
The idea is similar to the regulator_init() callback, but it provides
regulator specific structures, instead of just the driver specific data.

As an example, this allows the driver to amend the regulator constraints
based on runtime parameters if necessary.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/regulator/core.c         | 6 ++++++
 include/linux/regulator/driver.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 1179766811f5..4c90ab5ad876 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -5747,6 +5747,12 @@ regulator_register(struct device *dev,
 		goto wash;
 	}
 
+	if (regulator_desc->init_cb) {
+		ret = regulator_desc->init_cb(rdev, config);
+		if (ret < 0)
+			goto wash;
+	}
+
 	if ((rdev->supply_name && !rdev->supply) &&
 		(rdev->constraints->always_on ||
 		 rdev->constraints->boot_on)) {
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index f230a472ccd3..d2f4427504f0 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -365,6 +365,8 @@ struct regulator_desc {
 	int (*of_parse_cb)(struct device_node *,
 			    const struct regulator_desc *,
 			    struct regulator_config *);
+	int (*init_cb)(struct regulator_dev *,
+		       struct regulator_config *);
 	int id;
 	unsigned int continuous_voltage_range:1;
 	unsigned n_voltages;

-- 
2.45.2

