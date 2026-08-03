Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC77441609
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782821; cv=none; b=O5vMDuCgbog+GQxyusIUs+xXaqSgrdmoN6yGg8lSTnpOaT2OfcE8s+UaWqDyC9JU7H384sEUGTEy+OarXZHoeUmR7/aPkJIQY/GnQGFq81sc0jC9sb7chGZiTsmg+VG+yrlEWPHlOiiZQpKTmvtoAr09j017JgvuA2w7AfkiW4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782821; c=relaxed/simple;
	bh=9RXXUuoTfoL6J5em10rnlXUTmB4DkBiDhCtVINGOk9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f+QRRzlyzhDLHFdmCNFqvnN4ou8ipZYgwJzJ3BsRorA1OJ4j4BdPWi+nOrIIPrqAsNtvI9EEDGSd9FUF3jXjfK2/Ds1mBON8qMZzbYqpQU+gqbCJ8JRfDlpLKQwd8fwpjmEI4HQ7uKkbnI/7tZzlLGSwZ7CZo6cYgmQjS345Msw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlZXoGnt; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlZXoGnt"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3309462a91.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782817; x=1786387617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6FvS+GVirUFZzmRqDLJtbKL/PG96hr59JxKd1SuplY=;
        b=UlZXoGntD325wdxjz3gEDrGJcIf3G8EwUmjB/pabb5S8aYHPeOEEuJdS+PToczmwzs
         moPeHa0a76vYNPQ+hXJibjRr1roQEw4DmMdTxRq6/KmXGK6C5e8lL26Uf1lnl5NUi8Qp
         34/0Vb/Z34R+lQ860stkxRJvhC5YP6vTFzS4JXHpcrrUsXpl71oxzOtmD2oX73ctK8+U
         hSAnrmQl9UEarJyXNdvMKJtnRHemx0OKTZr5WG0GmrDXqixDsNfvfpA1NtDWP6eOhOji
         98SZSJbBcd5RZ0B4/ZEyJM1gZk5SoLkhpNiNZznmHNUF2EQi5JTkFo8qss9Gz7GiSVmV
         Yv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782817; x=1786387617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6FvS+GVirUFZzmRqDLJtbKL/PG96hr59JxKd1SuplY=;
        b=hZCPCtReeZMeT6m5zSLyuc4QwrgWGaZ+hCp8EKRtmqN1y1D4um7WzTgjSoEDzexSVb
         A7ggwNQz7vXCV4vy9y8eAzUMbWT8pMhYvYUSkU6z5AiyZPIyYJzOdvbgIgnZjMkWbHxK
         qTjtHBAjtl6nlkU/YJ8zne5BK5duPWCdaqeXO0KMER16WnsH/PyC4UehSyrfz+lfzTWY
         5e93N0h0JvOsBJJCAsktccLsPlJdqYyQWugFivrXwgVi5/VuNZZbdTDhlu2JokXireUV
         umlmwXFzNxC+iOE9oRSMA/hZ4fEUht7FYolMm5u8PTkUUEwOIGiSgS6i8S3sI75IH6Eu
         9HjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqw60Opo4uakWTIoHd1Yv1RBWZnyw2NElUmHgnzOHJCi1Hufa2SNTFVi1hthpZ0MQQreNlKjqy+KQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/y0h131T/VBM/MBocLjwL/KCNi0zJyTQbXnpO+GySqLDs5JBQ
	NOAcpteAnFEAJjvw5i+GLBG+77JjkyKxDFsQUr7TPu8vjzJQ8LN1/3Nu
X-Gm-Gg: AR+sD10+F5MuxiubWxNEPnUOsS+y8Ra1yCS5ihozvlrmwBfkorOFl8iND4yQj975LCA
	z7LHOUJQPmAba+JU3iNdSkTcWB3PnJ+KXdXcQHdmktCpI9LSNa5wPgOGL4K5vId7uYgBQ9LSVsF
	xb9Tkur6nC+RbZrvAqt4pyrWZr5YnwaTMO7OsXrs4daitAB6O7nGChFZiVjFdGeoas3Gb5ZmRNu
	5BJXsHU5u6EE0LHEpvgvg1UCsB7FCP0wL/+B06GH5gY+75kUy+kNfcfI6GFBbma5qWTXsV4yvSx
	TwmSzqZpe4EHbkJ6XXf9ToWM9mnoPgsML2XUXYvQZl7K74Ck08Qy4ybTdTadZTVLALouQ+wB+X3
	Ob0qoqlnzcxMAUM+VM+yKRDcJWtrabchrQUTxrdFHm7rHUqhqUFq6jw+CE8DoqeCKu+AkqZDlsC
	84Rn2NnUchCInBEKNPY098dM/SDU4Lg9nSIkC2FZKUhXvyB3KSIVn9ShiIA4ecU1+FrNNh+4MOg
	mAmpEK1e7kEr02kfhWGfrT7AYu2CovDZFmcfL/BaWY5LyiXcBkNBa3+85VcHgU=
X-Received: by 2002:a17:90b:57ec:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-38fbc4ae59bmr11034812a91.21.1785782817176;
        Mon, 03 Aug 2026 11:46:57 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d109:cdba:8a20:74ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab24ec10sm33935472c88.6.2026.08.03.11.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:46:56 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 03 Aug 2026 11:46:41 -0700
Subject: [PATCH 16/21] HID: zeroplus: move FF initialization to
 .input_configured()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-hid-ff-input-configured-v1-16-1dc9bbacd88c@gmail.com>
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
after calling hid_hw_start(). This is racy as the input device is
already registered and visible to userspace at that point.

Move the FF initialization to the .input_configured() callback to ensure
the device is fully prepared before registration.

Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-zpff.c | 43 ++++++++-----------------------------------
 1 file changed, 8 insertions(+), 35 deletions(-)

diff --git a/drivers/hid/hid-zpff.c b/drivers/hid/hid-zpff.c
index d8e023c8aa84..b565c59d3dfe 100644
--- a/drivers/hid/hid-zpff.c
+++ b/drivers/hid/hid-zpff.c
@@ -50,20 +50,15 @@ static int zpff_play(struct input_dev *dev, void *data,
 	return 0;
 }
 
-static int zpff_init(struct hid_device *hid)
+static int zp_input_configured(struct hid_device *hid, struct hid_input *hidinput)
 {
 	struct zpff_device *zpff;
 	struct hid_report *report;
-	struct hid_input *hidinput;
-	struct input_dev *dev;
+	struct input_dev *dev = hidinput->input;
 	int i, error;
 
-	if (list_empty(&hid->inputs)) {
-		hid_err(hid, "no inputs found\n");
-		return -ENODEV;
-	}
-	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
-	dev = hidinput->input;
+	if (!list_is_first(&hidinput->list, &hid->inputs))
+		return 0;
 
 	for (i = 0; i < 4; i++) {
 		report = hid_validate_values(hid, HID_OUTPUT_REPORT, 0, i, 1);
@@ -75,6 +70,7 @@ static int zpff_init(struct hid_device *hid)
 	if (!zpff)
 		return -ENOMEM;
 
+	zpff->report = report;
 	set_bit(FF_RUMBLE, dev->ffbit);
 
 	error = input_ff_create_memless(dev, zpff, zpff_play);
@@ -83,7 +79,6 @@ static int zpff_init(struct hid_device *hid)
 		return error;
 	}
 
-	zpff->report = report;
 	zpff->report->field[0]->value[0] = 0x00;
 	zpff->report->field[1]->value[0] = 0x02;
 	zpff->report->field[2]->value[0] = 0x00;
@@ -95,35 +90,13 @@ static int zpff_init(struct hid_device *hid)
 	return 0;
 }
 #else
-static inline int zpff_init(struct hid_device *hid)
+static inline int zp_input_configured(struct hid_device *hid,
+				      struct hid_input *hidinput)
 {
 	return 0;
 }
 #endif
 
-static int zp_probe(struct hid_device *hdev, const struct hid_device_id *id)
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
-	zpff_init(hdev);
-
-	return 0;
-err:
-	return ret;
-}
-
 static const struct hid_device_id zp_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ZEROPLUS, 0x0005) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ZEROPLUS, 0x0030) },
@@ -134,7 +107,7 @@ MODULE_DEVICE_TABLE(hid, zp_devices);
 static struct hid_driver zp_driver = {
 	.name = "zeroplus",
 	.id_table = zp_devices,
-	.probe = zp_probe,
+	.input_configured = zp_input_configured,
 };
 module_hid_driver(zp_driver);
 

-- 
2.55.0.629.g250fe7f194-goog

