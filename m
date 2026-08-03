Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512E043710D
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782802; cv=none; b=gyggCqBn69rHwMwV90rUeBFL9uZiO2XAg1zxJitRbNpwBkAJqNMXLPVXqoQk1nih6SfGbILICpysE8OCa/w5H92Zm7XZzOQbn10TN0iZVQbsRbbPYMwoAr5klkedILB6IdJagVkL9aHKivg6wTQ7pV3tzjwyjghD8/H9Ma8MYE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782802; c=relaxed/simple;
	bh=qUdUerWZwKVXSv6CIvxcpUQFOknhL3yaUu9ghBMZ6OY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BnP1RFG9GUeHZGDMUHJLYeAwfwSNw2AISyY7+APn0YXaFS7HnvmiZnAZ/r2+R7cg06qgm9CxF6WeB+l3GId3Sg76HAqtoVaaurLmYCLZDES0mzsQkF1f9WWcSBFaF89NqiFPWLnH3CeNlOtSPRQWn44dRGdwGsfeUKMn14kmFE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwNyiCWJ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwNyiCWJ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso2827645a91.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782798; x=1786387598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xe1aQNIISsGkO8ixPfjdrXZ79Mm8F+hvVCxfc95I8z4=;
        b=CwNyiCWJcP0h4N3lRmUbnuoSMyPhbdYxGYueTwIzCvzspMhbJjTHFIK1vJ4AAZLtpL
         GlWRiTW5TJT/onvO/RLRNuWpIlniYmKZyCgcQgofab8czQzB/l0lrATflh6zBRF9hZjF
         DYyKL/CpjAu8X3YB6Xj6dkXU6f+IEEHCaeAIifFs5b9u+1/Nef9lcXPjJyaIFMeQwswb
         LduNyiftwL2/0RcvZh5d+iOdoVFC7dkFVppOa9VNwHhl+xUtibg2/A4udbugr+gYWPYJ
         jHbNeBcJO2Gj0Qqd+cKHAonKLMcRYgAZjBLM4bej1h2S/PGdw3OhFn2f183aT5us0nVD
         XNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782798; x=1786387598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xe1aQNIISsGkO8ixPfjdrXZ79Mm8F+hvVCxfc95I8z4=;
        b=fmBIYRS8PpyjESdEM9Rlqdnb2o/YP9aXj6igLwmLnmQdeIJKOESFz/vZzDWoJdO6kR
         qQTMfU7novuBolDJf0YSYQD1Ok7pb/09Q/ZxUw3Qz5IePSiAmxCYqh8pyiN9tTKIgSUJ
         V03wk7YBxWUlChBOG5WLJ9YU8k3aDfYlbvk+oCZu153rjQJkismTp3E+98+SSlIj07fc
         PNV7qdhKdiLKLKlGiBR22LvejkwKqp2jcio0DDzIRllshSbMd+wG12Fht6k9r/exFdd2
         CDzSV/O9WT3tYC8XNjsSTyeIG62K+gLGtByQl89icwu45wiDcljbeJb0FkT/qfCFq7ZM
         MJTA==
X-Forwarded-Encrypted: i=1; AHgh+RoEFjfGnMwkqioN36LmLPaI5d55w2sIGZx4xhNcz20o4Wx6Pzji+H+ed1Qc1C3fzQ8zb/q5f7lsKRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqQUysKXoIssf98wV9Qf27j6WcJ6hAoAF38XX8Ou2f16PKq5O0
	W+GfzSC6yZycFEpJupNKIQ6MUlzTBkIfHUU6fw1R0aavxz89Bi+OvSr4
X-Gm-Gg: AR+sD10Km7IzQ+85mKq3TBjTIeUNeKiEGU7SKUMbaWaC3G8O8RrQW4dJes2U7ggMs+C
	NxnXbXFZFKjKnlmlRb+KjxdTyWE5IedFEdoyuoNF82GQjJPJVQmEaBYhZ0kEQ3NwIRrMTCKU0Sh
	VbAl1UcWD0KzPOk4CRIId06PtyYWUWXbXXY7BYVlKprQ+5mktjSuPO4gJSd3h0nGX9GbS8zI/A5
	NYj0RUCj3+5lBoGdDlxgA5xm2PrbN6jz+rgS0qhPr4ockvq9kWXJRL8sZn1fpBC/6CaK0IA95ke
	93oEZoJRdmZ1SKMVqYGo6Novg4Twruyzzb/VpbpKE11AMkZVe+vK4+16jIRo2XbygDIG19DChvX
	yU1eH5PobyD1t6hYeDXY/025K2Op0ieJWOazxg9RfUoW3HO3W6hQMjWxkxeJipOE6NGmok911Cl
	zlRh5coZPrAAYhbHTfKzdyuzvzykJrgGIVMawla3a+RwOIn99+MdNgh6+omXG6XwGUPIGXpfnQg
	6qMoNeZUbfxK/U4fBi5IXTbDJkhlkDow5BhzSKb06dxLj4kWUQ8
X-Received: by 2002:a17:90b:1808:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-38fbc40df10mr10254715a91.4.1785782798371;
        Mon, 03 Aug 2026 11:46:38 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d109:cdba:8a20:74ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab24ec10sm33935472c88.6.2026.08.03.11.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:46:37 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 03 Aug 2026 11:46:28 -0700
Subject: [PATCH 03/21] HID: axff: move FF initialization to
 .input_configured()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-hid-ff-input-configured-v1-3-1dc9bbacd88c@gmail.com>
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
 drivers/hid/hid-axff.c | 40 ++++++++++++----------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/hid/hid-axff.c b/drivers/hid/hid-axff.c
index 3c5c2bf02425..2f46447086df 100644
--- a/drivers/hid/hid-axff.c
+++ b/drivers/hid/hid-axff.c
@@ -59,30 +59,24 @@ static int axff_play(struct input_dev *dev, void *data, struct ff_effect *effect
 	return 0;
 }
 
-static int axff_init(struct hid_device *hid)
+static int ax_input_configured(struct hid_device *hid, struct hid_input *hidinput)
 {
 	struct axff_device *axff;
 	struct hid_report *report;
-	struct hid_input *hidinput;
-	struct list_head *report_list =&hid->report_enum[HID_OUTPUT_REPORT].report_list;
-	struct input_dev *dev;
+	struct list_head *report_list = &hid->report_enum[HID_OUTPUT_REPORT].report_list;
+	struct input_dev *dev = hidinput->input;
 	int field_count = 0;
 	int i, j;
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
 	for (i = 0; i < report->maxfield; i++) {
 		for (j = 0; j < report->field[i]->report_count; j++) {
 			report->field[i]->value[j] = 0x00;
@@ -100,13 +94,13 @@ static int axff_init(struct hid_device *hid)
 	if (!axff)
 		return -ENOMEM;
 
+	axff->report = report;
 	set_bit(FF_RUMBLE, dev->ffbit);
 
 	error = input_ff_create_memless(dev, axff, axff_play);
 	if (error)
 		goto err_free_mem;
 
-	axff->report = report;
 	hid_hw_request(hid, axff->report, HID_REQ_SET_REPORT);
 
 	hid_info(hid, "Force Feedback for ACRUX game controllers by Sergei Kolzun <x0r@dv-life.ru>\n");
@@ -118,7 +112,8 @@ static int axff_init(struct hid_device *hid)
 	return error;
 }
 #else
-static inline int axff_init(struct hid_device *hid)
+static inline int ax_input_configured(struct hid_device *hid,
+				      struct hid_input *hidinput)
 {
 	return 0;
 }
@@ -136,23 +131,11 @@ static int ax_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return error;
 	}
 
-	error = hid_hw_start(hdev, HID_CONNECT_DEFAULT & ~HID_CONNECT_FF);
+	error = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (error) {
 		hid_err(hdev, "hw start failed\n");
 		return error;
 	}
-
-	error = axff_init(hdev);
-	if (error) {
-		/*
-		 * Do not fail device initialization completely as device
-		 * may still be partially operable, just warn.
-		 */
-		hid_warn(hdev,
-			 "Failed to enable force feedback support, error: %d\n",
-			 error);
-	}
-
 	/*
 	 * We need to start polling device right away, otherwise
 	 * it will go into a coma.
@@ -185,6 +168,7 @@ static struct hid_driver ax_driver = {
 	.id_table	= ax_devices,
 	.probe		= ax_probe,
 	.remove		= ax_remove,
+	.input_configured = ax_input_configured,
 };
 module_hid_driver(ax_driver);
 

-- 
2.55.0.629.g250fe7f194-goog

