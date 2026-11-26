Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661033;
	b=u5aSy4pxnVCVzbYCWIqEQCUrXGFC67YHawTK7q0yuHnfekQS2MV9sGS4EfefvimU4IwE
	 0akKKuxdL9m4c762WRYM2fDTlS0GcKZSTaiRgakgYLoF8nMCMg/DyHGZhegvfFzRwXbj6
	 j0SOrnBuMPblR+bb5ZVZHdmbEaEzAt7soliQIOvq3wMQt2KAnx6Dbkn8vJkSvzpbskfiA
	 ZcI2nl0kcUqvd5EGnPcUjIJ+dyDITyaMszfe1Hns4gTEuVUWq8uaFxGueCrdPXXb625Zu
	 4i2AXhZ3CKz0hbK/dBzPIug7F8yIVNqPrr3ULNaOy5Nmf0vf3at7794x6e9HFxCfU4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=S0zE4ZzEU1lxgtEwjpWg0ydPg9Imd6vmaVdGfev3YoM=;
	b=1cUyE+XW5ixQWRBvsh6scYsWBwNfE7Pkyeu3GwjTUdDpEPVCybkEGqnfi4kAF0K9JvDh
	 vztSgN+/HII0ZyocO0aZlQDnb5NvNVUYh1oB/SL5UEsQaO0DqHo4Bvu1ImMQVcl3a/rPw
	 zmPUOCcPbaYTnzNlJfHabOj95jPMQF4qiODw9q910xEvS7AfcgREqHlRDIgCsRPj6Cnzv
	 b78KFoQSZQNZFACd2luFslNmBlzertij/FnUTSwXYIGQc2KcIenBN78gYezuKp6j/sq33
	 q875grUT6HMErfpoHspIYTPY34TgijbKiBL8rJvP32hKjQZ42B01wAitHD0I4qB7CPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--svv.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AVr+QE5d;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF76C606A31E
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 02:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF76C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--svv.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AVr+QE5d
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a5005fd0f8so5615610c88.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 18:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795661032; x=1796265832; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0zE4ZzEU1lxgtEwjpWg0ydPg9Imd6vmaVdGfev3YoM=;
        b=AVr+QE5diCNk4az/bboFovgn2EqR32kN/0ODEX6iUYX3afYwgDPYLHoZcY+XljHbnV
         BCelDwDVdyeYMDlTRa7wsAT6f2tcjS0BeLTE/LGmRkmYzJhlStcXf5CE1h1UMd0izBTb
         R+rXsczCYeI/RCHaELZxGSEQHMQ3sCJCjuJGQCcQvKPtpEURjohl5+tZ0w9+pI/1LPYq
         ZYsyp9VZUb7uAu1o+HxXl0mlQiCNlB5w1rgW/2NjJoTUYdozAaXNzCylGxotfkf56NBZ
         vKv+70sw3xkEMBp0/nslC5WA/7eArRqXut7V9kEAUqENu73szrD5wvEeYEsfHbhtwHhB
         SoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661032; x=1796265832;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0zE4ZzEU1lxgtEwjpWg0ydPg9Imd6vmaVdGfev3YoM=;
        b=NmxOnFrgWbQGFNFhwqFwefAqvXrrcDy1idm+B15qKTWY3MPH+QGBpUIxUIohA+3kad
         ctkr454N9utATzEU8LWXFyc5V1FSi1cGCg9DEpL0w6vj+9cxDVNctnF2maonFOi/+1FC
         HXCLMwqcEmho9Qg80hAIasJPw6uFeP34wSDmg9XNDsCm/gl+tfGt53u17bMD/9TRihhJ
         rDn5pnQnwl0aHQ664NXif2Yfo/qJEj8wScB0r87IQJEWcUXWvrt4pgYJfuQNuekU8828
         z8XrQLjeKz0kYwLGEYQt8m50SOJE0OS21iLJ9Yt3AAuewerXjtuSEWbQ4pZdr2UR9WtX
         ctgg==
X-Forwarded-Encrypted: i=1; AL+hErHaS5c6xqrh6j2/T+x4mcY4n1fRU0L96vgUDNZAPFlMw4lLiJqAPkiWVV4US/4eHcdV91mSvSWI994=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rJmvL8/jgXhX4J+k1tRAkSwqrgTTWpQID4vtL1DKimINvqOdX
	Ma8ssPX6bDKoTvqcsD1SK1FxPQ+6p3+HPbFtGr0FFAjaIa4ep4oKtUh8cXr0AfWkWxw+Yw==
X-Received: from dyrp2.prod.google.com ([2002:a05:693c:69c2:b0:36a:1f25:64f4])
 (user=svv job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:e0c1:b0:380:c3d7:c263
 with SMTP id 5a478bee46e88-3856c0d076cmr22974891eec.5.1795661031825; Wed, 25
 Nov 2026 18:43:51 -0800 (PST)
Date: Wed, 25 Nov 2026 18:43:36 -0800
In-Reply-To: <20261126024337.4168845-1-svv@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261126024337.4168845-1-svv@google.com>
X-Mailer: git-send-email 2.56.1.911.g883d8bcb20-goog
Message-ID: <20261126024337.4168845-3-svv@google.com>
Subject: [PATCH v2 2/3] HID: input: map Digitizers Twist usage to ABS_TWIST
From: Siarhei Vishniakou <svv@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>
Cc: Jason Gerecke <killertofu@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Siarhei Vishniakou <svv@google.com>
Content-Type: text/plain; charset="UTF-8"

The axis ABS_TWIST is used to report the "twist" (or barrel) rotation
of a stylus.

Map the HID Digitizers Twist usage (0x000d0041) to ABS_TWIST
in hid-input, and calculate its axis resolution in units/radian.

Signed-off-by: Siarhei Vishniakou <svv@google.com>
---
Changes since v1:
- No changes (rebased cleanly onto v7.4-rc4).

 drivers/hid/hid-input-test.c | 87 ++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-input.c      |  5 +++
 2 files changed, 92 insertions(+)

diff --git a/drivers/hid/hid-input-test.c b/drivers/hid/hid-input-test.c
index c92008dafddf..a78a769b60f5 100644
--- a/drivers/hid/hid-input-test.c
+++ b/drivers/hid/hid-input-test.c
@@ -67,9 +67,96 @@ static void hid_test_input_get_battery_property(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, val.intval, POWER_SUPPLY_STATUS_DISCHARGING);
 }
 
+static void hid_test_input_calc_abs_res_twist(struct kunit *test)
+{
+	struct hid_field field = {
+		.logical_minimum = 0,
+		.logical_maximum = 3599,
+		.physical_minimum = 0,
+		.physical_maximum = 3599,
+		.unit = 0x14, /* Degrees */
+		.unit_exponent = -1,
+	};
+
+	/* 0..3599 over 0..359.9 degrees -> ~573 units/radian */
+	KUNIT_EXPECT_EQ(test, hidinput_calc_abs_res(&field, ABS_TWIST), 573);
+
+	/* 0..359 over 0..359 degrees -> ~57 units/radian */
+	field.logical_maximum = 359;
+	field.physical_maximum = 359;
+	field.unit_exponent = 0;
+	KUNIT_EXPECT_EQ(test, hidinput_calc_abs_res(&field, ABS_TWIST), 57);
+
+	/* 0..628 over 0..6.28 radians -> 100 units/radian */
+	field.logical_maximum = 628;
+	field.physical_maximum = 628;
+	field.unit = 0x12; /* Radians */
+	field.unit_exponent = -2;
+	KUNIT_EXPECT_EQ(test, hidinput_calc_abs_res(&field, ABS_TWIST), 100);
+
+	/* Linear unit (centimeters) is invalid for ABS_TWIST */
+	field.unit = 0x11;
+	KUNIT_EXPECT_EQ(test, hidinput_calc_abs_res(&field, ABS_TWIST), 0);
+}
+
+static void hid_test_input_configure_twist_usage(struct kunit *test)
+{
+	struct hid_device *dev;
+	struct hid_driver *drv;
+	struct hid_input *hidinput;
+	struct input_dev *input;
+	struct hid_field *field;
+	struct hid_usage *usage;
+
+	dev = kunit_kzalloc(test, sizeof(*dev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	drv = kunit_kzalloc(test, sizeof(*drv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drv);
+	dev->driver = drv;
+
+	input = kunit_kzalloc(test, sizeof(*input), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, input);
+	input->absinfo = kunit_kcalloc(test, ABS_CNT, sizeof(*input->absinfo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, input->absinfo);
+	input_set_drvdata(input, dev);
+
+	hidinput = kunit_kzalloc(test, sizeof(*hidinput), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hidinput);
+	hidinput->input = input;
+
+	field = kunit_kzalloc(test, sizeof(*field), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, field);
+	field->report_count = 1;
+	field->logical_minimum = 0;
+	field->logical_maximum = 3599;
+	field->physical_minimum = 0;
+	field->physical_maximum = 3599;
+	field->unit = 0x14; /* Degrees */
+	field->unit_exponent = -1;
+	field->usages_priorities = kunit_kzalloc(test, sizeof(int), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, field->usages_priorities);
+
+	usage = kunit_kzalloc(test, sizeof(*usage), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usage);
+	usage->hid = HID_DG_TWIST;
+
+	hidinput_configure_usage(hidinput, field, usage, 0);
+
+	KUNIT_EXPECT_EQ(test, usage->type, EV_ABS);
+	KUNIT_EXPECT_EQ(test, usage->code, ABS_TWIST);
+	KUNIT_EXPECT_TRUE(test, test_bit(EV_ABS, input->evbit));
+	KUNIT_EXPECT_TRUE(test, test_bit(ABS_TWIST, input->absbit));
+	KUNIT_EXPECT_EQ(test, input_abs_get_min(input, ABS_TWIST), 0);
+	KUNIT_EXPECT_EQ(test, input_abs_get_max(input, ABS_TWIST), 3599);
+	KUNIT_EXPECT_EQ(test, input_abs_get_res(input, ABS_TWIST), 573);
+}
+
 static struct kunit_case hid_input_tests[] = {
 	KUNIT_CASE(hid_test_input_update_battery_charge_status),
 	KUNIT_CASE(hid_test_input_get_battery_property),
+	KUNIT_CASE(hid_test_input_calc_abs_res_twist),
+	KUNIT_CASE(hid_test_input_configure_twist_usage),
 	{ }
 };
 
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index a4d3536c7af2..d216bb44b108 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -291,6 +291,7 @@ __s32 hidinput_calc_abs_res(const struct hid_field *field, __u16 code)
 	case ABS_WHEEL:
 	case ABS_TILT_X:
 	case ABS_TILT_Y:
+	case ABS_TWIST:
 		if (field->unit == 0x14) {		/* If degrees */
 			/* Convert to radians */
 			prev = logical_extents;
@@ -1064,6 +1065,10 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 			map_abs_clear(ABS_TILT_Y);
 			break;
 
+		case 0x41: /* Twist */
+			map_abs_clear(ABS_TWIST);
+			break;
+
 		case 0x33: /* Touch */
 		case 0x42: /* TipSwitch */
 		case 0x43: /* TipSwitch2 */
-- 
2.56.1.911.g883d8bcb20-goog

