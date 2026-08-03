Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4A24399EA
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782807; cv=none; b=j7bU1ursUWnPE+PWh+Ajx5eIQnOikQAedKH8xmmLNonNgllQ7BPWpDsYQTlcUJWxrQb6GnsyKbpDC22kUtLr4mOCElIxIh/VkPNmQcEpa75h8sSVXI3KCkEohJZtbhrhTvm3s3lBWpxVl2lSLxAncNSda8DskSvaiuKCgsZ3GSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782807; c=relaxed/simple;
	bh=92PvuERNoxRSPO39JTqhB9ZUwSyTWzKMYKZ36bV17RM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SPX5T3CyJlVxGzfhyimNQ5V8NTvfe/fAoQcyoew9l6h8aAoe5715GXlNlxq3dTeUqRnqWw8PPvhlLzE92q48jMP5bt/BGCC/ty+uN8hu2wSciWXMak6OVR2RdOT3EmfgVnpvzeiy652b8/FewHh1MT1Wtuk+nEwmLtf0MO5cI6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPKUMAA/; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPKUMAA/"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84830c774a0so3610634b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782803; x=1786387603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HOz5PiX1ZSB+vLRo+K76aRMaf9WXlDbNtHntTklC834=;
        b=NPKUMAA/t2xrKi+aTUBD2QU1v0VlE5jVyU7vt9T06YsF6xLBz8DGgXnd9QEMwGd4Gc
         +hvOzyOG4w9MjXvicGW08yfp4GNtgQv2HfZgg4lBgaVnW0PGoZ8QBaay1B18uEYMjgO5
         C6UGmf3ZVNSDAW7ngmzim62HUhN1qXqxBDr7exnPiRPiH5EnqT2Q3zJryJE7oP0BJmPo
         lftWk1pPCM1l1e4zjwtsFhchyJlNkWN1DXQrcFVPwRaFFwaIsLKPRCajBfqltv1we2t6
         HviYcAS1EgIYuLnjh4zSwiW4vIgqxpAtu37JQSYaCrP5LfnZAXqy+uv/lTdSW2AwIOF5
         xCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782803; x=1786387603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HOz5PiX1ZSB+vLRo+K76aRMaf9WXlDbNtHntTklC834=;
        b=ABS1hrY2C1AGoBQm8scDHu+V8y8lOlo72SwR8aTDEuC9V4sHV8SuPieILUgjz/GHfs
         5BDwc2yBgpnL+DPW9Ltdrp6CeISMzonyqabVNLOauHffS4teZtwdOWVFNwVC+/3KlNGn
         sCbGdKIRLHKCCnqY98QQibX7Wvq9YfgMsl133ZNSDi7pQUeXRA/KDI/tNlj4wu9DHKon
         k6ObE+det10Stg/2vw0xFE5vLN9Nch8IYP/5MGjMFRUDEAgxjdAkWos/hc08ejBYarri
         IcIQ5PGPL3e4YDHuQe8T/oKxIe2lykDPxzKPjh38MsJztkC/OjtvVU3cY9ozVbWd26jH
         VYSQ==
X-Forwarded-Encrypted: i=1; AHgh+RrX8h4uS2/Xv/SyLf7abAQAfh3M/WiNhcp8igQ93kDr2ajv/y2bZmsh/a1bpU1sXSeiabMWITi5ctg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1bQS9yw9BZOJ4F/obrkNC+XaOE7fbDvaDExwAz0PO8zJzlAa+
	W7LZu2/xd8UiN5An4SdjVrIxXxIOnjTrDyrSqHgOtPuTxVvNRwsjGfMH
X-Gm-Gg: AR+sD10+DkfkiGXdtVS98IwnYykHppA0aHj2jqBCjueOTVCoxpNJonaTYYWm6pxlg7S
	HGdyS2BDClaX/3nnkMMN6oZunXHXfQD/WZtstm6DP2l0a9svYoTe1O+vyLUrC/7uf9XofFWnqUG
	o2/1jyMpeb7gwipZ1cLbpT4wZibezlFRGPLO4shGucrFCZ1j8sIqYNZbfK6z7AgaXl9NLKkGXjP
	n3yWzfx38MgOoyvDmVPoj+r1EhuJsHOFNsElSAEir1qnaZ8IWXpyfGyv5ojpKAnQPHItK8qXLfx
	I5AKOS31W0I6j69HG2ZJtwoPxPxc1eSiDwPV/Ec/Av41eMeFnLUOYj4MpUDTtfWFqPMLjFfrSjK
	AEyz6bHUAH6qT90u4Je0D0Q5HOSnFarYZtcDqIqwkj1EiJaBa6tGtASbUeGEznG2rqK8D90goXn
	Z/WYqY+VGOLL6wrhshqxvmq/R/Lxa0Qj500pxrlFX6ICekl157f2tyC7EL2CJPe8cSJTULArygt
	/ynp4uw5Nk0nflHNffhXNYq5grBeoMYbEIOhR6mZ8MXAtAUfvVyrTJT3hj5eyE=
X-Received: by 2002:a05:6a21:648f:b0:3c9:e7d:b170 with SMTP id adf61e73a8af0-3c92a8f3f7dmr11102990637.58.1785782802450;
        Mon, 03 Aug 2026 11:46:42 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d109:cdba:8a20:74ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab24ec10sm33935472c88.6.2026.08.03.11.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:46:41 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 03 Aug 2026 11:46:31 -0700
Subject: [PATCH 06/21] HID: dragonrise: move FF initialization to
 .input_configured()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-hid-ff-input-configured-v1-6-1dc9bbacd88c@gmail.com>
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
 drivers/hid/hid-dr.c | 66 ++++++++++++----------------------------------------
 1 file changed, 15 insertions(+), 51 deletions(-)

diff --git a/drivers/hid/hid-dr.c b/drivers/hid/hid-dr.c
index 8a8f68a7feb0..a1e10ee8df4d 100644
--- a/drivers/hid/hid-dr.c
+++ b/drivers/hid/hid-dr.c
@@ -71,29 +71,26 @@ static int drff_play(struct input_dev *dev, void *data,
 	return 0;
 }
 
-static int drff_init(struct hid_device *hid)
+static int dr_input_configured(struct hid_device *hid, struct hid_input *hidinput)
 {
 	struct drff_device *drff;
 	struct hid_report *report;
-	struct hid_input *hidinput;
 	struct list_head *report_list =
 			&hid->report_enum[HID_OUTPUT_REPORT].report_list;
-	struct input_dev *dev;
+	struct input_dev *dev = hidinput->input;
 	int error;
 
-	if (list_empty(&hid->inputs)) {
-		hid_err(hid, "no inputs found\n");
-		return -ENODEV;
-	}
-	hidinput = list_first_entry(&hid->inputs, struct hid_input, list);
-	dev = hidinput->input;
+	if (!list_is_first(&hidinput->list, &hid->inputs))
+		return 0;
+
+	if (hid->product != 0x0006)
+		return 0;
 
-	if (list_empty(report_list)) {
+	report = list_first_entry_or_null(report_list, struct hid_report, list);
+	if (!report) {
 		hid_err(hid, "no output reports found\n");
 		return -ENODEV;
 	}
-
-	report = list_first_entry(report_list, struct hid_report, list);
 	if (report->maxfield < 1) {
 		hid_err(hid, "no fields in the report\n");
 		return -ENODEV;
@@ -108,6 +105,7 @@ static int drff_init(struct hid_device *hid)
 	if (!drff)
 		return -ENOMEM;
 
+	drff->report = report;
 	set_bit(FF_RUMBLE, dev->ffbit);
 
 	error = input_ff_create_memless(dev, drff, drff_play);
@@ -116,7 +114,6 @@ static int drff_init(struct hid_device *hid)
 		return error;
 	}
 
-	drff->report = report;
 	drff->report->field[0]->value[0] = 0xf3;
 	drff->report->field[0]->value[1] = 0x00;
 	drff->report->field[0]->value[2] = 0x00;
@@ -132,7 +129,8 @@ static int drff_init(struct hid_device *hid)
 	return 0;
 }
 #else
-static inline int drff_init(struct hid_device *hid)
+static inline int dr_input_configured(struct hid_device *hid,
+				      struct hid_input *hidinput)
 {
 	return 0;
 }
@@ -266,43 +264,9 @@ static int dr_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	return 0;
 }
 
-static int dr_probe(struct hid_device *hdev, const struct hid_device_id *id)
-{
-	int ret;
-
-	dev_dbg(&hdev->dev, "DragonRise Inc. HID hardware probe...");
-
-	ret = hid_parse(hdev);
-	if (ret) {
-		hid_err(hdev, "parse failed\n");
-		goto err;
-	}
-
-	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT & ~HID_CONNECT_FF);
-	if (ret) {
-		hid_err(hdev, "hw start failed\n");
-		goto err;
-	}
-
-	switch (hdev->product) {
-	case 0x0006:
-		ret = drff_init(hdev);
-		if (ret) {
-			dev_err(&hdev->dev, "force feedback init failed\n");
-			hid_hw_stop(hdev);
-			goto err;
-		}
-		break;
-	}
-
-	return 0;
-err:
-	return ret;
-}
-
 static const struct hid_device_id dr_devices[] = {
-	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, 0x0006),  },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, 0x0011),  },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, 0x0006), },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, 0x0011), },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, dr_devices);
@@ -311,8 +275,8 @@ static struct hid_driver dr_driver = {
 	.name = "dragonrise",
 	.id_table = dr_devices,
 	.report_fixup = dr_report_fixup,
-	.probe = dr_probe,
 	.input_mapping = dr_input_mapping,
+	.input_configured = dr_input_configured,
 };
 module_hid_driver(dr_driver);
 

-- 
2.55.0.629.g250fe7f194-goog

