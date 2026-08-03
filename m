Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7214439F93
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782809; cv=none; b=fdeDLuexc5YKjw10TaaZBBb3WRv+tGuL5ri4gsvuAVbQrQoBfKZwnVhToeIbskj07tIAUUo5ZL6bmhmZOsYUlTW16R++tTk8KsqvPW5opSAdpN8WeIMEjPbeWHrjw3h4kRMOScJRAAP6OaCTP4vaZKhSDtJN3Zu6nN0lD8C3MIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782809; c=relaxed/simple;
	bh=LHE5r9HcJGmgdAN0lDq2vDv6+I/AvjL339mlhS4SPzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q2/7OhxhHQ8uZjtDU8owR6HOs4W27xtXZfPjpGE02jupVQ8nEIxCMxg0j1hH+mgLjpr7MmkfWJ0w30ONTW2oH/MZMotOAk6DjVvJMkhP18rX5zMvywEXHKFKVVOkBDKloM2bbLJcNA6QqX0iOwpGbqKKLMj3MtshQI2+9BF76bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pYDbU4bm; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYDbU4bm"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so3556329a91.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782804; x=1786387604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yy7DVKg39FEAhLMMdKRgyYcMZGvYjnaxEZ5h7r1ZLPQ=;
        b=pYDbU4bmVMsov+GZE9cys5voDKqpoMrqkEBN90nNUwT/ltBrOth1hjk0gAjDMM03RY
         bhj/TRfYw1mYQidAx6wyz8asXUZmp2MALCmD+qfO2+jCu+mIDn/EWM/uwuXmtY3GYD5R
         5NlX9kjiTN4qEeBHu+AbKipZEa4ZymkJSDwEclmrU+Z6bZEFUScPu+5ZCyWj+yk2DO3H
         VHy9cYm5yVLQnvueHZbyG17cZFBMYvPx4FCAG9uKbB0o7AxvniwFRRXMF16XgIxtkGyN
         3lEJS9c2P6SxcoDvlF7i6dTUY+oFteYyJqAkgwxq0BIC48wNoLH7w1j/76Ok7paPACkd
         hhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782804; x=1786387604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yy7DVKg39FEAhLMMdKRgyYcMZGvYjnaxEZ5h7r1ZLPQ=;
        b=WCCT/EIdM5+UEN/PTDh0lUoMenUCkNIo+6xHcQCmkTnd6JoQbmoB8ntBhzmUh+DoF6
         ajxbh5OULY89+ZPxZwzRMZ6oBbIQ3pDjgtLDrjOFkWiE/Ia9+rZXgmjzWwPhP8byo1CJ
         HClly1AdAeHekZbZLx0Z49eqEOzBf0KrCefcSDU4K4bqyixd8U4L2KfqjEbQ3RaRDDnG
         ng07CqEgOLFjk06tb8uPhcVPprClIkpuUGolz43+Fhyqibw918cm24eQ9d4ff22RrfmX
         gW47l5fsnrHNUVeB/xcY7CS7c9s1VX3jlfzBV8wAv4sfLmOVgpokD3Y8NSggHv1yhLGv
         klyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFi4WIP+9HHvADLTaQ3YKh1g95d+29Z1EfwRYB+4tjtxaat1esrDrEeZDGiamklXoYw0CcDldS+Uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwENqTJP6YP+KECsIitzuUrWTQU9lifHih6Mm3Ms1koYZwEUuH5
	RGDZrXlT9/2y2kY0z1rvhEebW6BjWqglafA/axofWZh1NwzUpUm5gY0M
X-Gm-Gg: AR+sD10o1vhBPur5UopNlxlRrj5IenBaGze7tW/OS4lTA+eR9ni63rWzMBySvMn4yR1
	6T1ij5+JXiamN0DhUjtB50cGzm5/An7HoDq0zz3+7yg1OdylV9NFdyawBMmeEJjC7g1ToJvDAMm
	ZfX3KiOmniG7KEoH0MDtVyzJihh9VzOF1n+jZ+pMtgaFtUnZCr7VDRLEh6o3tVDHyyoIrgnUfn+
	+k9DJDDfqMF+kP1RNaFVP/+/XFIPIUkTU8g3awbXPYkpBDiYMuwyukj4wAF2CNgxclYEZCzZczQ
	f8sOpo1x++bUF3iu3zcF3M7FA6YeDprpY8uOl6qpiqY2S0ZYJ7JjHwOBb649aoglrrJHYLldWh6
	xm7j+qMDiDI16ClNYChj4AOUehVnXxVsR9lgDWK2A/M+/cRf3N3ca3TSvd4FuoP5+LjSfFP8OZi
	70UMfCw+MMFJO9YdYXKNh0XINJ98oSo3sPvmYBOQy0HxO1QURy5YC+GUZv9/AiyxGcKPyYO8rcL
	yofMa/CJ7uyhn1rk+Jrfo8HpQhdJVmLv/rwXL9njVj7C9AsjS+m
X-Received: by 2002:a17:90b:590f:b0:38e:7a05:9c0a with SMTP id 98e67ed59e1d1-38fbc493f0bmr10257115a91.18.1785782803842;
        Mon, 03 Aug 2026 11:46:43 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d109:cdba:8a20:74ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab24ec10sm33935472c88.6.2026.08.03.11.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:46:43 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 03 Aug 2026 11:46:32 -0700
Subject: [PATCH 07/21] HID: emsff: move FF initialization to
 .input_configured()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-hid-ff-input-configured-v1-7-1dc9bbacd88c@gmail.com>
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
 drivers/hid/hid-emsff.c | 50 ++++++++-----------------------------------------
 1 file changed, 8 insertions(+), 42 deletions(-)

diff --git a/drivers/hid/hid-emsff.c b/drivers/hid/hid-emsff.c
index 1b4ad18f6051..d8e559e0524f 100644
--- a/drivers/hid/hid-emsff.c
+++ b/drivers/hid/hid-emsff.c
@@ -43,29 +43,23 @@ static int emsff_play(struct input_dev *dev, void *data,
 	return 0;
 }
 
-static int emsff_init(struct hid_device *hid)
+static int ems_input_configured(struct hid_device *hid, struct hid_input *hidinput)
 {
 	struct emsff_device *emsff;
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
@@ -80,6 +74,7 @@ static int emsff_init(struct hid_device *hid)
 	if (!emsff)
 		return -ENOMEM;
 
+	emsff->report = report;
 	set_bit(FF_RUMBLE, dev->ffbit);
 
 	error = input_ff_create_memless(dev, emsff, emsff_play);
@@ -88,7 +83,6 @@ static int emsff_init(struct hid_device *hid)
 		return error;
 	}
 
-	emsff->report = report;
 	emsff->report->field[0]->value[0] = 0x01;
 	emsff->report->field[0]->value[1] = 0x00;
 	emsff->report->field[0]->value[2] = 0x00;
@@ -103,34 +97,6 @@ static int emsff_init(struct hid_device *hid)
 	return 0;
 }
 
-static int ems_probe(struct hid_device *hdev, const struct hid_device_id *id)
-{
-	int ret;
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
-	ret = emsff_init(hdev);
-	if (ret) {
-		dev_err(&hdev->dev, "force feedback init failed\n");
-		hid_hw_stop(hdev);
-		goto err;
-	}
-
-	return 0;
-err:
-	return ret;
-}
-
 static const struct hid_device_id ems_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_EMS, USB_DEVICE_ID_EMS_TRIO_LINKER_PLUS_II) },
 	{ }
@@ -140,7 +106,7 @@ MODULE_DEVICE_TABLE(hid, ems_devices);
 static struct hid_driver ems_driver = {
 	.name = "hkems",
 	.id_table = ems_devices,
-	.probe = ems_probe,
+	.input_configured = ems_input_configured,
 };
 module_hid_driver(ems_driver);
 

-- 
2.55.0.629.g250fe7f194-goog

