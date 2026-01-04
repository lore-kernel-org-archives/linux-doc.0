Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3012F12D3
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 21:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562302; cv=none; b=U0g/pGwH9RzjF8WT5IsRfsYdSVnH6FBBM5okq2zrQxgbmOehzWx5LSJyQu6qIw47K15CPMyac4HzWU8Td1QJ1mxC3QlT3qxOygvHDpSoS2X5oYbdRq8zj5XxqePzgudM/vXgqPPQ8AdWsakcXhQcTqa078kava5EEfvOxJKh3ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562302; c=relaxed/simple;
	bh=/7YH+Zqpi8jckS9SwFkBwQ/lSUU/TC5vR/IH2liykg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FT2AUk0DYqTHg+NoTVwbvwiI+Lvbg9CGSqMZ0GaQfb513A3aSC3jCS3oYaz0yGf9WizRN58a3YE0QO0ueWSwHORREOAZl9QKqu0REsmVHm1j55qp6YViT4ysf8FX8vFVPnLuSaaRzGD5mSYjoXxxgENDUuROaSjAvrb/lvvQ71I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDH+1W0b; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDH+1W0b"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b735c1fe67aso191818466b.2
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 13:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767562298; x=1768167098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUUroYHtAt2Ce/xZZlgPaiIZoDgmPFJ5E5jP2+Tt7RI=;
        b=PDH+1W0bfnEngycIXKuGMWDCkfU9LUJIzAeuniNEg2H0dGcy6t+Y+dgclYAhzknDkq
         DMUYeagy2McjSc/dMnZCuLMkaLGTfDNKPMNblue7iZBzvLZqUtjKvwKEWaIuQeHBpTO8
         jA2pHnN1JO/slsjG1JehdVHL3uuzgVIHNhx09suH1ozdQw59HPhl6cTWouJV0YZZWziR
         L0S+IHib71q5IIvuvmd9AsrsMYPis2ZyF7WRxhopUmu+TcJ7IA2wsZA9UINl1Z+K4ayQ
         9HbllrB5AmzEI7Jh+LLDsOggahqYjXwMtAqY8Eb05rhrFrpKat9WNJoHxkUn8k4fd//s
         fLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562298; x=1768167098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PUUroYHtAt2Ce/xZZlgPaiIZoDgmPFJ5E5jP2+Tt7RI=;
        b=evE0mSOT4Sf86nz/D7r8t5x7zbOJ13fUISBqoqG3COm7GyABIDLoiRbJZksWUz7ysK
         HHAzujGjcZ98IzaziS/PyBvsbHTcFRTRUE6SHc18ZidZf9DQxgm0v6VsOJtjY+d9IVrE
         7VVMq4yLqYa4nKB6fSePIYgcbYCqPbE/7QgSnlepNEhNHo+0G446Qw7FmXmXMLrZuKcg
         VVX8TEG4Gf6/9Q4LPRL5/ERFMQX1H0oJplDl7eS70Kjxu7Lp4Yg2Iizv79eR7AJK1zUI
         D7yuW9w91yhuFxmb2JlNsYGkHkAZi82Oe8eCDsy5Rqkaa6WDgZOmQeF72XypM+U4NdjY
         k3xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAbw5TJmQKJShAkKCF1eXKAfaG7Gj0v5rkWn/1NNL0h+KLS12OB22uehf82r2BpVObtcBpJBBIQkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN1IcrmNsuW7foXghfglBjnwmnRCd+dZulXTwEviRQHqwGU0xW
	KA5ZBn1tIALPqqH6Y+QVsqU3KuduU3YT6WFexh7aI4EYbs18acBrIw3m
X-Gm-Gg: AY/fxX7eHugS7bNnDfEYN5PQ5IXgtAGDiFd7V2yrR+yZI2cC3YwLhpMrLAXTYuyqndo
	by8xRJ1nBLw+09A48N26DNfgym18PL8wgLJXBdnIT6BvfzHfD2/hSGS5lS7lIQsvO6Nd+anKowY
	ix4xHylTGf5E7BND3m0pnT9mIPFsa9XBVv9KqQSsOA8y1hUCyBAcspLYalY+d5hbGiA3eAK2jP9
	g+FEQ/pg7xUMvqcF1J1+gGdyWvJNNjA/EkUhE3Z0UmllzMBXfrJDguIkxJuYUoSAjPvVibD2gOK
	c81n/c8hdV0klnQ4Xrs6w4BaQ0TCkbpW9IQ5CSrjSYdyvDgRtIdKhc9WDBiWQFe7CXlcPBdUWrf
	veFSAAcDiFvEfXS0NMa7GXvTZqEIPY0HFATNQ6whcuQREov7hz5ZZGAo3V0w23Qz6UceYSxE7t6
	yBm9hbHnFoeiU9BvIyi1pq/bC7WmZCLivZxU5kOl7ccJlzcQrqGa5qORybctlk2wXe
X-Google-Smtp-Source: AGHT+IG+AEIpwPtWYJYhI5A6ldFiprrP803Cg1B0GSU9VpFVObKxSmMNbMgLd9tAEXXNopAk8qcitQ==
X-Received: by 2002:a05:6402:4311:b0:649:b47b:2ef7 with SMTP id 4fb4d7f45d1cf-64b8e93de10mr21587011a12.3.1767562297834;
        Sun, 04 Jan 2026 13:31:37 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm51947772a12.12.2026.01.04.13.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 13:31:37 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vi@endrift.com,
	linux-kernel@altimeter.info,
	peter.hutterer@who-t.net
Subject: [RFC PATCH 4/6] Input: Assign EV_BTN event to HID Joysticks
Date: Sun,  4 Jan 2026 22:31:30 +0100
Message-ID: <20260104213132.163904-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Joysticks will now fire EV_BTN for every of their buttons, even buttons
that were previously ignored because they were cut off by KEY_MAX. This
in turns enables joysticks to finally report buttons above 80 which was
the previous limitation.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-input.c | 27 +++++++++++++++++++++------
 include/linux/input.h   |  2 ++
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 900a6fc9813e..1c11077b1577 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -760,11 +760,15 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		case HID_GD_MOUSE:
 		case HID_GD_POINTER:  code += BTN_MOUSE; break;
 		case HID_GD_JOYSTICK:
-				if (code <= 0xf)
-					code += BTN_JOYSTICK;
-				else
-					code += BTN_TRIGGER_HAPPY - 0x10;
-				break;
+			if (input->button_count >= INPUT_MAX_BUTTONS)
+				goto ignore;
+
+			code += BTN_JOYSTICK;
+			if (code > BTN_DEAD)
+				code += BTN_TRIGGER_HAPPY - BTN_DEAD - 1;
+			if (code > KEY_MAX)
+				code = KEY_RESERVED;
+			break;
 		case HID_GD_GAMEPAD:
 				if (code <= 0xf)
 					code += BTN_GAMEPAD;
@@ -1379,7 +1383,6 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 	}
 
 	set_bit(usage->type, input->evbit);
-
 	/*
 	 * This part is *really* controversial:
 	 * - HID aims at being generic so we should do our best to export
@@ -1390,12 +1393,18 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 	 *   *_MISC+N to overwrite a legitimate even, which confuses userspace
 	 *   (for instance ABS_MISC + 7 is ABS_MT_SLOT, which has a different
 	 *   processing)
+	 * - Joysticks can have arbitrary number of buttons without defined
+	 *   usages. Buttons that extend beyond KEY_MAX are assigned to
+	 *   KEY_RESERVED thus deduplication must be disabled for them.
 	 *
 	 * If devices still want to use this (at their own risk), they will
 	 * have to use the quirk HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE, but
 	 * the default should be a reliable mapping.
 	 */
 	while (usage->code <= max && test_and_set_bit(usage->code, bit)) {
+		if (field->application == HID_GD_JOYSTICK && usage->code == KEY_RESERVED)
+			break;
+
 		if (device->quirks & HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE) {
 			usage->code = find_next_zero_bit(bit,
 							 max + 1,
@@ -1455,6 +1464,12 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 	if (usage->type == EV_KEY) {
 		set_bit(EV_MSC, input->evbit);
 		set_bit(MSC_SCAN, input->mscbit);
+
+		if (field->application == HID_GD_JOYSTICK &&
+		    (usage->hid & HID_USAGE_PAGE) == HID_UP_BUTTON) {
+			set_bit(EV_BTN, input->evbit);
+			++input->button_count;
+		}
 	}
 
 	return;
diff --git a/include/linux/input.h b/include/linux/input.h
index f6389de4a4d1..7f39c663fa85 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -214,6 +214,8 @@ struct input_dev {
 };
 #define to_input_dev(d) container_of(d, struct input_dev, dev)
 
+#define INPUT_MAX_BUTTONS 2048 /* A sane limit of supported device buttons */
+
 /*
  * Verify that we are in sync with input_device_id mod_devicetable.h #defines
  */
-- 
2.52.0

