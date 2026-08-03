Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCAD445ADB
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782827; cv=none; b=S4QzZW6p1pQkBya+hlP5TV/jVOgxd/P6sQDB0xMwf+FvMUB7IqfbJvG9kwJ1dMslCV0FtPPAyK56DA0Gonkuf83IvTEzUnNvvgZV1yH/fz6EWvh1OMP/8kgff7yIJ9rCRQwVm5V9yDVagKBWMfcnkrjquZ8pGRKr/qKdlEc9k3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782827; c=relaxed/simple;
	bh=vP4IwtvXrpZhfmJWbeISKZ2NnXGuGtLCc+RIUUejyWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qOBds56ecUAyQbaO/gZlsaEzEBoY+l7LJlpi22qB79XO9NwrSlH5raRpADiCfQ11ECkQ/hsEE11mF9f7OMBKa0F4hH2XRjdOZthugDMZipmDxqEpOJP7K+ziKAaPp7IM0mBBK1mU6HWhmRgJ8ZLqb9pZLzLgk8S6v3be+7owdO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qI/V1ImP; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qI/V1ImP"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbb973e6749so4163579a12.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782824; x=1786387624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHw3HXNYpWvYMonYbPqZXuVoBB2JcVG5n1iAzr9iHHw=;
        b=qI/V1ImPScdX+9joozEqP1fBIRb5BOQQJAp92RHw/S82xm9ERqP0wo1JZv5H0XsZ94
         jT6rsx6DGYE8FRiw3uJxPnbtbUK5L8dng3q4gnK/gyT0uQFpzEF3ob7bJE0ZYfimDPw6
         Zp/FtJsZIRlfTh3EGSbQ0qT9Y3tZaRSvchMQkNXxY8cMH34UlG4VojFehcERz9xs7A/Z
         f948C09t4cBX5Zw306q4c23yrieIfnTgiZK7NkroRgYUdZqkwKo1hpj92sa37wNIbjSJ
         1RB3OliCkPddYV61uimAZzIHP++GYCK2PBtTrvXQfMeKfSd5rlSzo+Jan3BY40DlfJHl
         VwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782824; x=1786387624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHw3HXNYpWvYMonYbPqZXuVoBB2JcVG5n1iAzr9iHHw=;
        b=rmq8cMkZ4OFvaZX1r+DOCEyGPQNkyPotpNxaN2qxPvJA/gtGpKS609amUBsxNVdjln
         Y+g+BcAAGH7nXwlUgf3NIR+0+3+17jqTrxzevBwMQwjr0+BGu51nmgXBgQk48Xp4Y+eF
         yO7I89JLktHvdCWtMJvUNBHjq8qhhoEu7mHLWP9ZsLkTbW0Z1Z/BCRos8GSMFaQogTV6
         e/CBTOPHG4ww51gbzGEb8VOOiUugVGVeazfSXkcg0RXzSpl3q0/M2ALypTOW0MJVvTuj
         UC4x6/PWgcrMvf0UMxSJprjnVPsO9pvRaZjGE2GCPDLhBSHTjavtPQw1X/aWmhq3MtIJ
         De4Q==
X-Forwarded-Encrypted: i=1; AHgh+RohBAVbNwNUYLVrZOLdo2NVwUOSqui1FELrRfNg6W+p6a/GHEDMiTmood8zzZOzHkYgC5cgJtLohOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP0V5gjxwJg0HHWsbGuB4YgS3dIDwCWgzqJ1mfE1+H9wp/0Igu
	CiVtY3j2w5744ZIT3oK3Jkax4+jkokkB5qatWxtkggKnlZV6z0Tx1DCJKedgsg==
X-Gm-Gg: AR+sD12w0ROVMunRLJygLH9qnn6bsuE2WaCv3tIOqpzYOpG1Dnc53MkW8zCmu5I9KgU
	F4XcmtrUA+xk33M5nu4UXBTSWzT2MuX5i6DTmNcSDnFiJo8owV692B+Uups6EVAvea6wX6PpAtP
	Ed1xX3DzQxjFcqkwIGUbAj18W1Zb5nPgVkpqCk0+E0Z3cyulYXFBxvEYL1V/ixKs/3T8RoyxQyk
	VuwdT8IbW0Od4D+/8xT55q2lffGd3expuZIw6LPIG3pK9YsBCH4jcyu/6oE11qfDNoDuBMzybAh
	VkmFtmz5ab8GJAgtaSVGr2UkCe68IDLcj/QDUkxQpQ6ykPMiWwvtjiPyKpd66G70/CvE5U++T1I
	HqX90ByUHUdzoT4VZb94wJU8ycMMXMtAb74QJF99B5x1bXPYpQfbJMPNI4SdT8vfFm++VEi1uIm
	ktZmPnvP1igHD3PaNnPoVU6XOx3rEtEJOdS8/e80j6DLBV1ssxpNj5HkyvitYLDoveHiUaI5R9C
	psNc6SKx7OtMkD4QnL0qxGhw567/lAswE+I2xGVDBV4r33rZawx
X-Received: by 2002:a05:6a20:4e92:b0:3c3:bb13:438 with SMTP id adf61e73a8af0-3c92a74cf9emr11650080637.32.1785782824005;
        Mon, 03 Aug 2026 11:47:04 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d109:cdba:8a20:74ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab24ec10sm33935472c88.6.2026.08.03.11.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:47:03 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 03 Aug 2026 11:46:45 -0700
Subject: [PATCH 20/21] HID: logitech-hidpp: move FF initialization to
 .input_configured()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-hid-ff-input-configured-v1-20-1dc9bbacd88c@gmail.com>
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
after calling hid_connect(). This is racy as the input device is
already registered and visible to userspace at that point.

Move the FF initialization to the .input_configured() callback to ensure
the device is fully prepared before registration.

Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 90b0184df777..db53b45b0752 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3861,15 +3861,32 @@ static void hidpp_populate_input(struct hidpp_device *hidpp,
 		hidpp10_extra_mouse_buttons_populate_input(hidpp, input);
 }
 
-static int hidpp_input_configured(struct hid_device *hdev,
-				struct hid_input *hidinput)
+static int hidpp_input_configured(struct hid_device *hdev, struct hid_input *hidinput)
 {
 	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
 	struct input_dev *input = hidinput->input;
+	int ret;
 
 	if (!hidpp)
 		return 0;
 
+	if (hidpp->quirks & HIDPP_QUIRK_CLASS_G920) {
+		struct hidpp_ff_private_data data;
+
+		if (!list_is_first(&hidinput->list, &hdev->inputs))
+			return 0;
+
+		ret = g920_get_config(hidpp, &data);
+		if (!ret)
+			ret = hidpp_ff_init(hidpp, &data);
+
+		if (ret) {
+			hid_warn(hidpp->hid_dev,
+				 "Unable to initialize force feedback support, errno %d\n",
+				 ret);
+		}
+	}
+
 	hidpp_populate_input(hidpp, input);
 
 	return 0;
@@ -4530,21 +4547,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	schedule_work(&hidpp->work);
 	flush_work(&hidpp->work);
 
-	if (hidpp->quirks & HIDPP_QUIRK_CLASS_G920) {
-		struct hidpp_ff_private_data data;
-
-		ret = g920_get_config(hidpp, &data);
-		if (!ret)
-			ret = hidpp_ff_init(hidpp, &data);
-
-		if (ret) {
-			hid_warn(hidpp->hid_dev,
-		     "Unable to initialize force feedback support, errno %d\n",
-				 ret);
-			ret = 0;
-		}
-	}
-
 	/*
 	 * This relies on logi_dj_ll_close() being a no-op so that DJ connection
 	 * events will still be received.

-- 
2.55.0.629.g250fe7f194-goog

