Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD09438012
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782803; cv=none; b=kMgnzCFDiO0vJrEAcLMVDjX2O8L5LLTS7xPyWdKlI6PWMXJKkgeyNjjcegp/XmhiX+P+xovuetfBheR6qrPWzeAKVmDRv0IxRIT41Vas4j5YydZOC3+8L9OQ6LEDMELf55DGlKWk0ikdPi20sRrld9fM0A3V50fpWrz9XBdszdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782803; c=relaxed/simple;
	bh=zxac0YZ+UVGUyIsLRlzYrg6jB0A4yFDf8Ymaifq3hLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ix+nfTOmzFlUNafqHLtMKgXXHxc3bGFEnE8vtGcV5kt2fpA3Qcg4OEMdE8PgPwzgwgJ1vgNQzZzmd2rL/I2JzmaI1hj/LAJPwpOdY+tbMT8hNPMYYDhOU80fmDB4RE3CWcSMjIG6M1pOYeSxPefzQprAruKmFwVWehJfd9luhZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faOe3ROc; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faOe3ROc"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso39761825ad.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782800; x=1786387600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yfk1wrUGljf1bo39RPlNvsXr+Q+XQylnHMnMfOANzM4=;
        b=faOe3ROc7KpPbqp6++9+I9YT4D834TCPYeXkF2qMJu7G0GNgk2reJ4xtMyYQ4YLD28
         mR7x4g9mSp6YAxNcIZkd3jdjGyiPQQ2LXV1czD4y1dsINbD8NObkangPAQ5V4D2m5RnZ
         pgY4FWpWS6ltNtiGznl0ONEi9Ou9618Z1OdScMIdmauCJs5EoNGe66JR1rnNXRInr/g8
         7xy5cTTy9jdwXs1dfy+473mA6vjmM0amjrckj1fzYK+0XcNFNNSaTOx3NUUl/2PR5A/S
         pbxUVauJCHQpTJXVNGpU8FhMi54QR4nwTUn7zAbtW7Ww3Jc6AurgyCswLEdgbImYfCKU
         7x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782800; x=1786387600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yfk1wrUGljf1bo39RPlNvsXr+Q+XQylnHMnMfOANzM4=;
        b=WCQ8nOy3mO4x+TsT5yMrQGu/gvf+0PrGPQA3z2hxvWWAsmHGh6LZzzMtGoyztzP7I/
         Kk64PCtzPJmo2g+RQPXXxKF40zYY1xu0mnQcfzKy+THQ4RfQoYY/7tVP2O4ufI7YDHab
         BeAmImdf23EhHNdO2VWhm3QGaxULgkh9CctYzSQSa5yyxzvAVv+SmkwTT5uJKG+OW/fp
         kecF6VzYdIP7barm0rp1nxh/yKrI4TS8ZFBCoO0IgpN5idjftwQW1SikZIXyC9Njl16b
         le83Fh5yTNhTpB+wh/nyNRpJzRvTxQ0dtqYQmnJcG2TRVDDJ/yjozPAYSEAAHahe5p+z
         wJtg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0yDDPwtqCopQYf+et15w058zBiViFMb+NSB2qql3CuGJ7J2kCLnvVtVoYNISbxz5KPGPU82N8LGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWpFYhPl5JsEgkiVeyqXW8uXNg8qOAP+BqZNI9VX/Z6/X4JYN5
	hpWa/3m8MwNiUjtO7RqruFZn61isfkm/CcqF4S1oFPmv0ndUhPqiBfGg
X-Gm-Gg: AR+sD12IoLBa68coNCtVLMcVtdbJPv3zzIUU+vH7B2iziPACGKeD+yCCKnjC8DwkSTj
	KlF4yyZH5MtTOv+28rMWKNXSlw3jYA4sNOmf61f9vXLcbEFWRgPB0qd2AUZLxURrW+CM6DKYsiv
	gIaCKDrSuR7+v4I6vlwqTI7+0tip2GYsCAmkX683HRTWIjIjFfKmIez6DsmwgTgV97AE6IG7yaW
	1AMxnw/HSOyIQldigbrysKlbfspnm0Q8flmSryO3apE4E7gPaNL8bd5PD8WgC77zWBgiXSSRJSL
	5ClC7FoaTFToFf+Dele5Hr8sRaOmsZbx2Ykd+SgYfj3ER07D0yK61dYnrRPhiNwbQXAsPr9fksc
	l/7BMS3P08/pScemFP/K++Zzh6Vzu2o+8/n67hWgtpb4WybanIo1Yjc4J4WNuHULKtO+X0KUg7m
	kH4bd3MC01CBIE+WQUG7ftd29iDyciSxyQwRB1m0IcUOmys9MFS0s8K1e/aSpPfClBJHlyNW5iF
	PFHD+vZY2hktGUIsBQGOvrQYg/bMBXII9DMMeYeHViObgEoTfTn
X-Received: by 2002:a05:6a21:7a82:b0:3c3:652c:664e with SMTP id adf61e73a8af0-3c92a98f2camr11892049637.69.1785782799808;
        Mon, 03 Aug 2026 11:46:39 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d109:cdba:8a20:74ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab24ec10sm33935472c88.6.2026.08.03.11.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:46:39 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 03 Aug 2026 11:46:29 -0700
Subject: [PATCH 04/21] HID: betop: move FF initialization to
 .input_configured()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-hid-ff-input-configured-v1-4-1dc9bbacd88c@gmail.com>
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
 drivers/hid/hid-betopff.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/hid/hid-betopff.c b/drivers/hid/hid-betopff.c
index 8a7fe895926c..f802046a688a 100644
--- a/drivers/hid/hid-betopff.c
+++ b/drivers/hid/hid-betopff.c
@@ -52,31 +52,24 @@ static int hid_betopff_play(struct input_dev *dev, void *data,
 	return 0;
 }
 
-static int betopff_init(struct hid_device *hid)
+static int betop_input_configured(struct hid_device *hid, struct hid_input *hidinput)
 {
 	struct betopff_device *betopff;
 	struct hid_report *report;
-	struct hid_input *hidinput;
 	struct list_head *report_list =
 			&hid->report_enum[HID_OUTPUT_REPORT].report_list;
-	struct input_dev *dev;
+	struct input_dev *dev = hidinput->input;
 	int error;
 	int i, j;
 
-	if (list_empty(&hid->inputs)) {
-		hid_err(hid, "no inputs found\n");
-		return -ENODEV;
-	}
+	if (!list_is_first(&hidinput->list, &hid->inputs))
+		return 0;
 
-	hidinput = list_first_entry(&hid->inputs, struct hid_input, list);
-	dev = hidinput->input;
-
-	if (list_empty(report_list)) {
+	report = list_first_entry_or_null(report_list, struct hid_report, list);
+	if (!report) {
 		hid_err(hid, "no output reports found\n");
 		return -ENODEV;
 	}
-
-	report = list_first_entry(report_list, struct hid_report, list);
 	/*
 	 * Actually there are 4 fields for 4 Bytes as below:
 	 * -----------------------------------------
@@ -104,6 +97,7 @@ static int betopff_init(struct hid_device *hid)
 	if (!betopff)
 		return -ENOMEM;
 
+	betopff->report = report;
 	set_bit(FF_RUMBLE, dev->ffbit);
 
 	error = input_ff_create_memless(dev, betopff, hid_betopff_play);
@@ -112,7 +106,6 @@ static int betopff_init(struct hid_device *hid)
 		return error;
 	}
 
-	betopff->report = report;
 	hid_hw_request(hid, betopff->report, HID_REQ_SET_REPORT);
 
 	hid_info(hid, "Force feedback for betop devices by huangbo <huangbobupt@163.com>\n");
@@ -130,20 +123,15 @@ static int betop_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	ret = hid_parse(hdev);
 	if (ret) {
 		hid_err(hdev, "parse failed\n");
-		goto err;
+		return ret;
 	}
 
-	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT & ~HID_CONNECT_FF);
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
-		goto err;
+		return ret;
 	}
-
-	betopff_init(hdev);
-
 	return 0;
-err:
-	return ret;
 }
 
 static const struct hid_device_id betop_devices[] = {
@@ -159,6 +147,7 @@ static struct hid_driver betop_driver = {
 	.name = "betop",
 	.id_table = betop_devices,
 	.probe = betop_probe,
+	.input_configured = betop_input_configured,
 };
 module_hid_driver(betop_driver);
 

-- 
2.55.0.629.g250fe7f194-goog

