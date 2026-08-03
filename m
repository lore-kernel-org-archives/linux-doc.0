Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B051F43F4D6
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782820; cv=none; b=H7vX+aa8YkiWyXD06WTj1zBJHsV9KWTEJ7eUEXq/Dg1aT7iu+kCnmuhopmgARFYM1SPUUk9PdO9sERPhSkTogg8kvMpgqD81fY0rXCNe3X+odi3X9w08ooU2WXWd2KfUThqx/sR26B0QfazVRWf1ZFljII1qOLDg3rzXfBt87wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782820; c=relaxed/simple;
	bh=bkkjuJ7kHovlBy2GQl50Xio+Ck7Q4NkLDSybgRgkKTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XKs5H+frkWkYpZXBses4QsAS+hTslCv5+ydHyRS0XmqqUILHhyyHCRdzGFtj5E+HaqWQcjWQOwD8hT5cOdkbqEaeX45anktoiVpZQ8bYmz6z6p3QzGZSTn+VLa49A+36G4iFHoufblde6OilUrVZKrqC1XO6iLi7vWcx6jNpPhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDn9GZH8; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDn9GZH8"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so3556559a91.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782815; x=1786387615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMeooT+Pd2wEyftNL9TbUExuIFr34iBpC5GZzR8qYww=;
        b=SDn9GZH8AF7tWgGkUBLPSHgFgyD7EBkNNjHYiDdgT6pDLHMfHEbneYcHCPz6k4dlQi
         fOrgQtcb9AQwMmYHPIv5auX+7pJCg6wniuJxXEf1ho1DBnCq2cKqyIW8DAlcSA+sODt5
         8/Lkp0GlG8+w/ggt6QhYML/LDmkT9eKDXZUx+i4lSPmnSy8pc/zzh2H0h618pOxGutda
         xD6eBWZxF2gbISWE13ANQiWY42Mas8WOiGbBqKVxRsbA3YnSZOM/1r77L3+K36Ho9inr
         lE3LcfWhcRh2EKc2gwPCK/uwYVO6B6Do4lTgHhzSnbWYfq6ksradlqlMkyCIf2di5Jof
         P7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782815; x=1786387615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMeooT+Pd2wEyftNL9TbUExuIFr34iBpC5GZzR8qYww=;
        b=X8LjFXbPmUcJnvvrYWj89TOI6kb2eD6FxiEcznQQBabS4YcQFjI+5qVvVhApHn3FMv
         +VI5PfFkFHMeiQ7AUVcnN8edI8wr/sUBfm3xjnM9QRrhHyobKIKudE9dDp+AOaV39gFI
         KLb+G6PqzCcjgfpnTaCgVrO+4wEytbbrhzAS8HMUvJTAxI37C0bX4K8lOTz20q3l6Piz
         IgxpumyljAuq8lZ6Or/dpWNosF/+6Z4OZiALE6YhLl+9O8KnzVG/k+F32RZAL8y6M9NU
         4mh2TQBguxkfhrMwHN9SbuSx5pGg/vm7FNYKs52LyF9qjGLfc26aHhyiA0zA6TLGYFQb
         5dXg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0UmMvb9RYcOs2R0dRaUHxitIdhEoB7pQDXtcI6c2RkgXMMRAPQnlmv/DJFZROzAqcTzTMsIybELY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyqbTP63cdvQDNQHKals+112tQDdVu3eM12RtP2oodD3QsWCfS
	eLEuvHnU3OcsB6zWWpBl4LCzl6gFrhTKtZroEAajhkA+jTrvZrTVih3/
X-Gm-Gg: AR+sD10X8cFQ28TWuSasBt+jh86GD7NI3QcBq6kXjGnSEvdToXco/HAeD+LDTh9JXBV
	FsNZe4XZCf2AVRceEkysCvtn5p3ciPHYwc8ODN9nWqbaR6I4GjOgG/8i1Skvh6sIm797EacjrA8
	bs89cHZlf6JVMsKwG0y6NCqbqt8cy/GkoaLqZ0KDn/bbWd8vFKdILhirDiNeHwxWCZDqnpc7x2/
	d6VvT07PP+quqMi9XwQEAEghF7IHRfzXttkhKXj32yirBnNgaWMZCsaJ+sEOWCADTiHH9FS8ZPl
	I06fKbMKXclooyILs9IsAKMEAkZDbhQuDxW9m2dbgINZOUK7SU2E7beS+NcvHWSFXUUOrjl1bkj
	hMRJ16CweqO3YHYdsyXwG6E2nC8zD0yItKhKVvKeHVPrwkhAQF3HC3e7zxeo5gNEXwSaU+4FRsd
	/BjTHk/DWpC0P78RIOF723kHVx0l1Vxi8EV82tLaCV8QdLY7cgL5lJTygs0T4i02kYbaOmt0Zbq
	/elL10WYUbtgtR4L3YkIUOtWChLebnXNMtnlHSTWCk70z3U0gdPF+OcsPnwnGB/
X-Received: by 2002:a05:6a20:a114:b0:3c0:9c19:65a3 with SMTP id adf61e73a8af0-3c92a98cd35mr11005065637.75.1785782815610;
        Mon, 03 Aug 2026 11:46:55 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d109:cdba:8a20:74ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab24ec10sm33935472c88.6.2026.08.03.11.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:46:55 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 03 Aug 2026 11:46:40 -0700
Subject: [PATCH 15/21] HID: thrustmaster: move FF initialization to
 .input_configured()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-hid-ff-input-configured-v1-15-1dc9bbacd88c@gmail.com>
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
 drivers/hid/hid-tmff.c | 47 ++++++++++++++---------------------------------
 1 file changed, 14 insertions(+), 33 deletions(-)

diff --git a/drivers/hid/hid-tmff.c b/drivers/hid/hid-tmff.c
index 423f395d01ac..0ed152e0dba9 100644
--- a/drivers/hid/hid-tmff.c
+++ b/drivers/hid/hid-tmff.c
@@ -115,22 +115,25 @@ static int tmff_play(struct input_dev *dev, void *data,
 	return 0;
 }
 
-static int tmff_init(struct hid_device *hid, const signed short *ff_bits)
+static int tm_input_configured(struct hid_device *hid, struct hid_input *hidinput)
 {
 	struct tmff_device *tmff;
 	struct hid_report *report;
 	struct list_head *report_list;
-	struct hid_input *hidinput;
-	struct input_dev *input_dev;
+	struct input_dev *input_dev = hidinput->input;
+	const struct hid_device_id *id;
+	const signed short *ff_bits;
 	int error;
 	int i;
 
-	if (list_empty(&hid->inputs)) {
-		hid_err(hid, "no inputs found\n");
+	if (!list_is_first(&hidinput->list, &hid->inputs))
+		return 0;
+
+	id = hid_match_device(hid, hid->driver);
+	if (!id)
 		return -ENODEV;
-	}
-	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
-	input_dev = hidinput->input;
+
+	ff_bits = (void *)id->driver_data;
 
 	tmff = kzalloc_obj(struct tmff_device);
 	if (!tmff)
@@ -204,35 +207,13 @@ static int tmff_init(struct hid_device *hid, const signed short *ff_bits)
 	return error;
 }
 #else
-static inline int tmff_init(struct hid_device *hid, const signed short *ff_bits)
+static inline int tm_input_configured(struct hid_device *hid,
+				      struct hid_input *hidinput)
 {
 	return 0;
 }
 #endif
 
-static int tm_probe(struct hid_device *hdev, const struct hid_device_id *id)
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
-	tmff_init(hdev, (void *)id->driver_data);
-
-	return 0;
-err:
-	return ret;
-}
-
 static const struct hid_device_id tm_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb300),
 		.driver_data = (unsigned long)ff_rumble },
@@ -261,7 +242,7 @@ MODULE_DEVICE_TABLE(hid, tm_devices);
 static struct hid_driver tm_driver = {
 	.name = "thrustmaster",
 	.id_table = tm_devices,
-	.probe = tm_probe,
+	.input_configured = tm_input_configured,
 };
 module_hid_driver(tm_driver);
 

-- 
2.55.0.629.g250fe7f194-goog

