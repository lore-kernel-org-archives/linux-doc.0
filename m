Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B943BDB1
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782812; cv=none; b=mrQv3TSKODaJdnjN9zQEpA5v3cVB/dxSF8Xy+gNSwM1ZO6fJ5UFnOuTwqvaO1n4pHrfrudqZCwODx6PtelpuseuMVjt90AE5Xt1z4RqD1gpYOhXjyTsUHcbTw22SwWCNwsGlP6mNW835Qe0zeLLtgOA3yiZ1HnEWIJjDv1vj2as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782812; c=relaxed/simple;
	bh=Uf8he7nAsG/KRuBT/yGn3TrZ1ExEAQm9BaOvzIjqfp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fZFn+/Uf+hhSEbT5ZIduW36gTSQqm/ZJ3vnhshYRcQIH2VOrs+zeb/htRVe/Pv/tzNRgfoNTjwMRCYx/SA5dABlIK4y0kjdmoyrYcxDlTHZEic7LXChXjpl/XeEW5DxeNTCUoaPUZl2vgq+ErVLI2twIEA297S4Nh6JKdtwdtD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7/0T1m2; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7/0T1m2"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so2674615b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782808; x=1786387608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87bvLzjv5ZZpsa24dDBIH3Ak2KXTk9+GG+h8XVlqydU=;
        b=V7/0T1m2pKy5JIoxdxw587Ans8MZ52s3+7VT5Otak3wz43+yBND7QqRp1pTalwv/IP
         5qvZlyrfUUYHLXh20nPCPWn8C9w6Fn9f2ocz2uf3rwmqAm14LDaZ3z2Xfe6pc11NlW/q
         jnG9akAG6xcDjkJg+uDc3+DF3+dffYXkURl+CpyfWOlFeykOE3iHuZVqIoRrGQk5xPTk
         s+B39781ZYOGFe8siOO0cal1RwjZZNTyDUj4SCVzk6SnIPkqH6iVze/9fkf/ERA4L/EP
         7UNBLxowUXw5VpLmgNBurqAUk5DYbWc7lH+VEjZLTik75bh5ZIhse9v5L+p8K1qFHKxm
         8/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782808; x=1786387608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87bvLzjv5ZZpsa24dDBIH3Ak2KXTk9+GG+h8XVlqydU=;
        b=YzNsz+bf1aoQThKAGdb3ORal2USFufEh2OYDE9IB86o/u3cPJlzr6N3kQ54mjJg0R2
         Rh/CkPkjyARY4cB8WBqCtiT30BoMl1NrtE5plXPONRGdJlgevN+OKRLjpEVpO1ZFzKjr
         7vH8F0h2vovfhMbz3xVElP3iMFKGCiKRD70ukz04U662id1fj2S4VGZmKNEdNY4/J5ok
         cXFhb6v8lJLikcgVzY8kj0Oe6Tt8dmy7/t2xqUC4nLDcAlRrHvdHGdGtQiXNDyU5AZzp
         iP/N9ZrcDzbEvBNP2AO7+2GG3VGtZBDLSvn07a2tF6b14dP/JaI2QFEx5JweWoxqqqDe
         BR8A==
X-Forwarded-Encrypted: i=1; AHgh+RohbHYHT0+YIYlHuRahmdro/GFcuZHVJJs9F8niaASFW7DhpAqZFF9ysqUiyM30xkdxImEnioT4ljs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTPhFQcxQEDlDJv6M7J3J8t+AjB1WA6XxvXyOJb90HViCW6OUP
	eo5mJIK0ErKhD7QgJKTyohfdjHYhzIAkbJn9a+5/aAaLXqP/xYNFH+vttzjfHQ==
X-Gm-Gg: AR+sD10C9oLJ0I3p6seWI5y5vHv0O2nU9znHKFBJXllMemnCvMP4UWuJ4IvrMWwy3JL
	+qoonD+U//Zmv0A8u9+Cnyg3WOhSj4qsBliQ8gXSf2zDKvOaRNo+NwISBK2iXEnYf/EegN5B60/
	//WfgGz/yYB7csgGuDSxkaLAlLRt8rv2dSMGE+2Bav5NGdv4qthDoLCZKGN1xGGk2CStLMKWbVx
	Kibbp08RmcpOd5wPwYxM6yoZv0krn3Ek4rGyzxwtsxtzPLUZEUaGemiDBBT1oP/Z0TvP5H2JVln
	dmNGhhHaID7dGbbqCpV5YQUPEl8Sl8D8PlVUisp2V66Wro/4A3cMA0dq8DEMjKjAt8qiuGKnySh
	RYfEzZAY2cPtGs2FklbTSj6I+mm0bLRopWXRw8GuTGCqptas8mOoqXlytxeSSoIu2CstkUxwihg
	z2eNKpy3LuXFAHfg2JFVYksPBhqcJtU/EQ2WCUG/0K64gPGwMnyxHT/QyL6Myy7AkktcOYIjRNe
	WhnfFT/SYbP3rH7dgQBc0ksTSQhu3Hzv3DL94zLQ8jwf10tuy9n
X-Received: by 2002:a05:6a21:1fc4:b0:3c3:c185:f334 with SMTP id adf61e73a8af0-3c92a95073cmr13139560637.66.1785782808357;
        Mon, 03 Aug 2026 11:46:48 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d109:cdba:8a20:74ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab24ec10sm33935472c88.6.2026.08.03.11.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:46:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 03 Aug 2026 11:46:35 -0700
Subject: [PATCH 10/21] HID: stadia: move FF initialization to
 .input_configured()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-hid-ff-input-configured-v1-10-1dc9bbacd88c@gmail.com>
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
 drivers/hid/hid-google-stadiaff.c | 41 +++++----------------------------------
 1 file changed, 5 insertions(+), 36 deletions(-)

diff --git a/drivers/hid/hid-google-stadiaff.c b/drivers/hid/hid-google-stadiaff.c
index d6a73d210599..0214aae6b0fa 100644
--- a/drivers/hid/hid-google-stadiaff.c
+++ b/drivers/hid/hid-google-stadiaff.c
@@ -74,20 +74,15 @@ static void stadia_input_close(struct input_dev *dev)
 	hid_hw_close(hid);
 }
 
-static int stadiaff_init(struct hid_device *hid)
+static int stadia_input_configured(struct hid_device *hid, struct hid_input *hidinput)
 {
 	struct stadiaff_device *stadiaff;
 	struct hid_report *report;
-	struct hid_input *hidinput;
-	struct input_dev *dev;
+	struct input_dev *dev = hidinput->input;
 	int error;
 
-	if (list_empty(&hid->inputs)) {
-		hid_err(hid, "no inputs found\n");
-		return -ENODEV;
-	}
-	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
-	dev = hidinput->input;
+	if (!list_is_first(&hidinput->list, &hid->inputs))
+		return 0;
 
 	report = hid_validate_values(hid, HID_OUTPUT_REPORT,
 				     STADIA_FF_REPORT_ID, 0, 2);
@@ -120,32 +115,6 @@ static int stadiaff_init(struct hid_device *hid)
 	return 0;
 }
 
-static int stadia_probe(struct hid_device *hdev, const struct hid_device_id *id)
-{
-	int ret;
-
-	ret = hid_parse(hdev);
-	if (ret) {
-		hid_err(hdev, "parse failed\n");
-		return ret;
-	}
-
-	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT & ~HID_CONNECT_FF);
-	if (ret) {
-		hid_err(hdev, "hw start failed\n");
-		return ret;
-	}
-
-	ret = stadiaff_init(hdev);
-	if (ret) {
-		hid_err(hdev, "force feedback init failed\n");
-		hid_hw_stop(hdev);
-		return ret;
-	}
-
-	return 0;
-}
-
 static const struct hid_device_id stadia_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_STADIA) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_STADIA) },
@@ -156,7 +125,7 @@ MODULE_DEVICE_TABLE(hid, stadia_devices);
 static struct hid_driver stadia_driver = {
 	.name = "stadia",
 	.id_table = stadia_devices,
-	.probe = stadia_probe,
+	.input_configured = stadia_input_configured,
 };
 module_hid_driver(stadia_driver);
 

-- 
2.55.0.629.g250fe7f194-goog

