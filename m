Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD49439349
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782805; cv=none; b=U34mww4jJveeZhlBrC6lHLIKN6C3chsOjRbhduaI929JqpWm5Ae/P3Bt6QUajNYfhybYrKs3AuKJlXnMGdUnOHcXa8qNn4pof7MDx4ob6oLq4Vg18kgCT+DVMpZRSGzbckLvVHjgCqVqOVgv4NIVWVAUj2NpK0josCNtX9yihd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782805; c=relaxed/simple;
	bh=FLBZ6TUpfMBXlB7N0BVa7vU2Xr9/kJojTsuqYcBwngA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cdoa3Zw5dp8y34bdS0WmKc9/wRfmkpNJTrnFC7IMANkHInJ8CKVBhDhKmIjhNoKltkLZwpIs8e+nrHh07GV8FOSZ8iDk3AMtNQdTCI2Q67XfVZie27j6BMW0ueD1/WCF0DIBiA4Mz1X3dAZ2S13cBn+loHmW9oB01g9yZIhof98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3S2ayFk; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3S2ayFk"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e08baf860so3286778a91.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782801; x=1786387601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nlCI4/gle3R9IwS53kvCY4cjueCVDjt1k2gYqGOMeAY=;
        b=F3S2ayFkYSrOLutKodBQQBz/tdE97usQ4NB3iYYl4PQZYo5Y+nDiQ0+L+817rYK0nU
         wE3wR5/ZDSo5gGf9LejuS9Z9Trhj7tdGjy9R9bdk1C1+11VjLFG/gDMFxL8/APK7YY2J
         ILFyBm1yWJo6aFpJcWqBcsqIRa7Gp6Ib+QmmA/k0oprEnSnrMHLivcTjyMCA4lfxwxCq
         WALBLSc9N0Iu1vZiHwqm4pFLhOCiFKMFmhrA8TNkDZCpFvGO4nyRpuJG5uzHxrwOUGuC
         AL6QwdT37KpmHn3VAiumWLm23NhVn4/6b28paj7dnFfzEs2BsNKNW3SiOJQXbeXhrb6m
         Y7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782801; x=1786387601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlCI4/gle3R9IwS53kvCY4cjueCVDjt1k2gYqGOMeAY=;
        b=kqEMdrLrN9WvQfY5NWuxJDXOFD0/SB9tmrEvE9VA9Pn8FOPKqHl5ZlZRvowcd/C+pN
         iUgGwqpxn52JdvRs+lNGMqzky2+ydRe0HppMQjv0irIC+oUSRKS/qTZj097Janm5b/ic
         TzfG1fwa/i4CF/e1sRxdN+0prYuClsrKUCkexefFwQ+Jd9+Ygk+zJhctXqshiIVxaBND
         2d0g0zDfFpkASMHpUTJhnlm3rixmv7U80wdCbHE2+wFDQt16hIuXwpQZuMfsY7S9nUCd
         wAri6jm9JzKUW7QjssayXG0ioDB3Yqh6/4IvPqV27tsAi0evNfUcfwbomx6HE7XnqSDA
         9NNg==
X-Forwarded-Encrypted: i=1; AHgh+RrfQx6J7zsW+mESzfg+f3kB+JIUh6+mQ3x9jEFAEj+O2/LytpvPbAG8CE8yTDBCTTPfaMAxFdvAO5g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1mVynhLBg73olkSBMO7kNUI9ympg+7ugjSq1Zvsg/aPcrks1l
	HWmbvC4StLtEAbfY8ShMK203aIloPBqFVZAjBxa53c2y0QkARWHMSHH1
X-Gm-Gg: AR+sD10MvkFuvzXw0PX7xxDuOgB64KHgdKvyYPBA4CYnFJM5bxjHQa0G9YgXYpXSFPk
	5fLD7JsC7scIuyN9Mx1geZYdyh1+zzyPG6FIpvRmtx4QfEO1fbJ64hRKcTDMdhA5gdrCr2O0VTo
	AXvOfHx28vJcm3emFXMMhjuIRL1gd5opzqSko3XOcawl2+M1TgEs32y/OcNyT/vlGcxcsWkJ3w8
	RblL9xrE+Xmpu17l1uQsd8wp1wsrSE/KI2T6tHXMdkjm0XnzAkBElgmRIPbv/+D3ARqXMDARLX5
	/8hKyqyOh9/EBLgArTcNi75FCWY9L9mBBK5GTcD4fvPezLLWOH5Vwt7d2X9NwTB1a/Nz/Ul3g7U
	YDYb/ZVh25mEz1cjaKZE8r84V6HvIpmlwPf0amDoBAfGDWrjHmkk3EEj6O6KW5vNB9/yW9su2i/
	EnfLJQ6OyK3mNZKOw795DmiJ12Uwxpomox95KBkLym/y+nLQj1kamYJoprTi/mBTW9D0NEkIIJj
	8oOENPfrlv5FGeI7biaVARq3jYvUmmbocZ8XxkEVtTVcn8NthiuazN1gJiAIco=
X-Received: by 2002:a17:90b:2649:b0:387:e0db:3d8d with SMTP id 98e67ed59e1d1-38fbc552923mr10107203a91.40.1785782801117;
        Mon, 03 Aug 2026 11:46:41 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d109:cdba:8a20:74ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab24ec10sm33935472c88.6.2026.08.03.11.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:46:40 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 03 Aug 2026 11:46:30 -0700
Subject: [PATCH 05/21] HID: bigben: move FF initialization to
 .input_configured()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-hid-ff-input-configured-v1-5-1dc9bbacd88c@gmail.com>
References: <20260803-hid-ff-input-configured-v1-0-1dc9bbacd88c@gmail.com>
In-Reply-To: <20260803-hid-ff-input-configured-v1-0-1dc9bbacd88c@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
 =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, cocci@inria.fr
X-Mailer: b4 0.16-dev-b242f

The driver currently initializes force-feedback in its probe() function
after calling hid_hw_start() with HID_CONNECT_DEFAULT. This is racy as
the input device is already registered and visible to userspace at that
point.

Move the FF initialization to the .input_configured() callback to ensure
the device is fully prepared before registration.

Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-bigbenff.c | 89 ++++++++++++++++++++++------------------------
 1 file changed, 43 insertions(+), 46 deletions(-)

diff --git a/drivers/hid/hid-bigbenff.c b/drivers/hid/hid-bigbenff.c
index 9f05465358d9..3c87317ccc6b 100644
--- a/drivers/hid/hid-bigbenff.c
+++ b/drivers/hid/hid-bigbenff.c
@@ -366,58 +366,29 @@ static void bigben_remove(struct hid_device *hid)
 	hid_hw_stop(hid);
 }
 
-static int bigben_probe(struct hid_device *hid,
-	const struct hid_device_id *id)
+static int bigben_input_configured(struct hid_device *hid, struct hid_input *hidinput)
 {
-	struct bigben_device *bigben;
-	struct hid_input *hidinput;
+	struct bigben_device *bigben = hid_get_drvdata(hid);
+	struct input_dev *input_dev = hidinput->input;
 	struct led_classdev *led;
 	char *name;
 	size_t name_sz;
 	int n, error;
 
-	bigben = devm_kzalloc(&hid->dev, sizeof(*bigben), GFP_KERNEL);
-	if (!bigben)
-		return -ENOMEM;
-	hid_set_drvdata(hid, bigben);
-	bigben->hid = hid;
-	bigben->removed = false;
-
-	error = hid_parse(hid);
-	if (error) {
-		hid_err(hid, "parse failed\n");
-		return error;
-	}
-
-	error = hid_hw_start(hid, HID_CONNECT_DEFAULT & ~HID_CONNECT_FF);
-	if (error) {
-		hid_err(hid, "hw start failed\n");
-		return error;
-	}
+	if (!list_is_first(&hidinput->list, &hid->inputs))
+		return 0;
 
 	bigben->report = hid_validate_values(hid, HID_OUTPUT_REPORT, 0, 0, 8);
 	if (!bigben->report) {
 		hid_err(hid, "no output report found\n");
-		error = -ENODEV;
-		goto error_hw_stop;
-	}
-
-	if (list_empty(&hid->inputs)) {
-		hid_err(hid, "no inputs found\n");
-		error = -ENODEV;
-		goto error_hw_stop;
+		return -ENODEV;
 	}
 
-	hidinput = list_first_entry(&hid->inputs, struct hid_input, list);
-	set_bit(FF_RUMBLE, hidinput->input->ffbit);
-
-	INIT_WORK(&bigben->worker, bigben_worker);
-	spin_lock_init(&bigben->lock);
+	set_bit(FF_RUMBLE, input_dev->ffbit);
 
-	error = input_ff_create_memless(hidinput->input, NULL,
-		hid_bigben_play_effect);
+	error = input_ff_create_memless(input_dev, NULL, hid_bigben_play_effect);
 	if (error)
-		goto error_hw_stop;
+		return error;
 
 	name_sz = strlen(dev_name(&hid->dev)) + strlen(":red:bigben#") + 1;
 
@@ -427,10 +398,9 @@ static int bigben_probe(struct hid_device *hid,
 			sizeof(struct led_classdev) + name_sz,
 			GFP_KERNEL
 		);
-		if (!led) {
-			error = -ENOMEM;
-			goto error_hw_stop;
-		}
+		if (!led)
+			return -ENOMEM;
+
 		name = (void *)(&led[1]);
 		snprintf(name, name_sz,
 			"%s:red:bigben%d",
@@ -444,7 +414,7 @@ static int bigben_probe(struct hid_device *hid,
 		bigben->leds[n] = led;
 		error = devm_led_classdev_register(&hid->dev, led);
 		if (error)
-			goto error_hw_stop;
+			return error;
 	}
 
 	/* initial state: LED1 is on, no rumble effect */
@@ -458,10 +428,36 @@ static int bigben_probe(struct hid_device *hid,
 	hid_info(hid, "LED and force feedback support for BigBen gamepad\n");
 
 	return 0;
+}
 
-error_hw_stop:
-	hid_hw_stop(hid);
-	return error;
+static int bigben_probe(struct hid_device *hid, const struct hid_device_id *id)
+{
+	struct bigben_device *bigben;
+	int error;
+
+	bigben = devm_kzalloc(&hid->dev, sizeof(*bigben), GFP_KERNEL);
+	if (!bigben)
+		return -ENOMEM;
+
+	hid_set_drvdata(hid, bigben);
+	bigben->hid = hid;
+	bigben->removed = false;
+	INIT_WORK(&bigben->worker, bigben_worker);
+	spin_lock_init(&bigben->lock);
+
+	error = hid_parse(hid);
+	if (error) {
+		hid_err(hid, "parse failed\n");
+		return error;
+	}
+
+	error = hid_hw_start(hid, HID_CONNECT_DEFAULT);
+	if (error) {
+		hid_err(hid, "hw start failed\n");
+		return error;
+	}
+
+	return 0;
 }
 
 static const __u8 *bigben_report_fixup(struct hid_device *hid, __u8 *rdesc,
@@ -487,6 +483,7 @@ static struct hid_driver bigben_driver = {
 	.probe = bigben_probe,
 	.report_fixup = bigben_report_fixup,
 	.remove = bigben_remove,
+	.input_configured = bigben_input_configured,
 };
 module_hid_driver(bigben_driver);
 

-- 
2.55.0.629.g250fe7f194-goog

