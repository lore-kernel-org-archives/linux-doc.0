Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276428;
	b=cIHBslmofeu/ek+YM3uQbmSTRoX9pbgQqZ4V5T+MFGCt+MMCZzAOLVtw3R7aCEIFSIAA
	 HETAH++MK+K3ibqiMYjMuF9tr5OgC4MnvA9Toeue1/o5yIb4XgBc9FpD/JBH3ErOX65mo
	 6pWq52/a+peo1kawYHxUoJ4xbF1OgMkxkRuRE3SzdW607Gq1EcTZCZ5llnaDq6Lrh/fpp
	 zGJEV0qrhUW4u14vRy+VYy5DeJm7byO1qSPm8EXHENwYEHg9060sq4tJ4fTRiO0TAkF1r
	 8yOBtq6aCFausr630Jn9GjiwwfC3827YOSHd2hFyrjvx3Sb1f1G3o+o8OA8izcou9kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=K/av2BriCz8NVScOG5d/1bxoH4heIhLqhdIv82O1IyU=;
	b=BjjB2JeVQDNeWyj7ZA8WZSTpBVjWC6O2Cyr4emefV9vcgYGw7scD8pAP6cf7dI81Zh+M
	 9q73oxDxObGGQprJxC2OJvk25H//NN7MnYxESSy4a00VDJV5EZhAaMRkLIJ2q/wwLYvFm
	 IX8PUEt1H+OtjHMQKZtRN0qup+Unkd9201xWe7md2gyonlQHaKp/fQIXQ0rrgMt+fsp+D
	 IOqPAmD+nYZcvIPZsCFzARi8eke5CTbgwmynNJngJHBx3RW9OgMRDQkfPmm96+rrshp1F
	 LpddzHr9KDf5zT3Gn8HDpP+jC2tFqpX3i4NbU64d+iYJbFt8LvoPn4DHgfrzcdw/MUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--svv.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hSNHMond;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392C9606A325
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 02:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 392C9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--svv.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hSNHMond
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46509ab0149so1585620fac.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 18:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794276426; x=1794881226; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/av2BriCz8NVScOG5d/1bxoH4heIhLqhdIv82O1IyU=;
        b=hSNHMondnBYbIRLUWvCnfkTQAwILCHFpt5RjmAe4kPuRaI0Ort0tW1OnxYsMZ/ZHKe
         y/AFnIOdwHHBlT1bntsIYWdrWg66wFvo1q4SsPVBiVSpTF+/tHYrYoTDOR2Mq2Z2eFut
         HdxhEajo7Htux2STaBFs3h+EPlz3y4J9GZDqmYGuqegcy6DMcfkuL0VLeQE2YCMKXEhm
         PqftDzUgchsO2a4Ln202VjnpbugpURuoAN2Zd09PxUxyvot/+VF102cZ5SX7uIvGVPLI
         P1F1usBgexQi0aY7FTW9XfaDYooSX7Ua80ZZthRF4ncoxF8Rt7seP4GDKhOO0Zk+Jdfb
         ndpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276426; x=1794881226;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/av2BriCz8NVScOG5d/1bxoH4heIhLqhdIv82O1IyU=;
        b=ZTA5qMOwHaGEHF34TF3w6n4LioiBV3TIxbBa79rp5shCDGtZJ/SgLyPug6YMRDTdIw
         lGu/rARpzOLdeQFhByw0tB5xRvJeQNC3RFwUShtKsYb/h14WuPDf6eUMeeCRcT87IBxb
         xz7818rslsSsrpE8hVlhhwuFgiQbroK34N8Uh0Ic4+XwLMlxY08z1SC9J3cnyxQV0BaX
         ZMp+BqY9tp1UNL3HVKWQTrHmi+U9ZFgVBViAEbTGscOK/KQmPlAFgK3qWyJN/sL5TfMe
         0Gdn9jc0T/zrn/rewyiDcORwhF+WbS8+zFkqDL72OKkAvBG4pY0bmmrDEVBNOUr2Bl3D
         ToWg==
X-Forwarded-Encrypted: i=1; AL+hErEYfkyHGUplAQe62QVbD1vCBo094dQ2jVbBjkd9ScLxZoyqUXiZ14ajwCsDPDp2rGewlZDZJpulylc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YwMTgZ+BU6FoCzdgP5N6Z6blQWdz6vCGkpG2h/L309svfN+yw
	ZC2QVmxVE8rRNZbFMYD7GwGO3aCNUAtH/DzTQlVHDqDcasG6kJizznup0lTZf8xCJaC1cg==
X-Received: from oacfi40.prod.google.com ([2002:a05:6871:e2a8:b0:4a7:13ab:40d9])
 (user=svv job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:c992:b0:497:4b0a:61fa
 with SMTP id 586e51a60fabf-4ae2261a569mr593185fac.28.1794276425788; Mon, 09
 Nov 2026 18:07:05 -0800 (PST)
Date: Mon,  9 Nov 2026 18:06:31 -0800
In-Reply-To: <20261110020632.4003499-1-svv@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110020632.4003499-1-svv@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110020632.4003499-3-svv@google.com>
Subject: [PATCH 2/3] HID: input: map Digitizers Twist usage to ABS_TWIST
From: Siarhei Vishniakou <svv@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Siarhei Vishniakou <svv@google.com>
Content-Type: text/plain; charset="UTF-8"

The axis ABS_TWIST is used to report the "twist" (or barrel) rotation
of a stylus.

Map the HID Digitizers Twist usage (0x000d0041) to ABS_TWIST
in hid-input, and calculate its axis resolution in units/radian.

Signed-off-by: Siarhei Vishniakou <svv@google.com>
---
 drivers/hid/hid-input-test.c | 87 ++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-input.c      |  5 +++
 2 files changed, 92 insertions(+)

diff --git a/drivers/hid/hid-input-test.c b/drivers/hid/hid-input-test.c
index 6f5c71660d82..6f1717c0cbe0 100644
--- a/drivers/hid/hid-input-test.c
+++ b/drivers/hid/hid-input-test.c
@@ -62,9 +62,96 @@ static void hid_test_input_get_battery_property(struct kunit *test)
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
index 6a1651f572e2..dc4bd2a579d2 100644
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
@@ -1018,6 +1019,10 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
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
2.56.0.455.g6c5a503b38-goog

