Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834392EF662
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 21:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562300; cv=none; b=tx9WArYWgYRikIPjyPGkQNyFyWF3wEjSG5jpFWXDGNT2qODAVvELNUpzNWUw7d934+UQK+SsZIBxdsw20iJ4U+dmkDJJh59b4nTckZMr+xwnE0+2XDyh3Bjl+79ASHztnklRXkLkcsVpiF/J8kprk1EkMGJJ+uVTjygbI6wTydA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562300; c=relaxed/simple;
	bh=f/uwheFHSzT2MnHEE13G2RW3ofjy0vNjvK4QXFqbQkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OvOM3b5kNTVQZCzOSqRs1gasvk8XMX2++/+xoOqyltOYYS4cp2G5vYocNx0K7ajiZgPzcCJqnnGv4g47fv0VxMR0rlNZx8sWa6aDXfsPxQqcAKWzuyclE9Z7kDz+WJRdJT56BC/oAl60IEp30xkGdgOE8a0anVND5jKmVmwhBKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzrYKwEe; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzrYKwEe"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b5b68a9bdso3179135a12.3
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 13:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767562296; x=1768167096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1ju9uJ8HtmgaH2DMl24DFV+9KpxYvqpDWRQN/CQZFw=;
        b=jzrYKwEefYi6T1sJ/ERtENot+z3voBmVCNU0Il+yUUsksJ1Fu/S4RYve24asGgIX+g
         uQHxhFMcbJZvhwVrJxws8HBbPj9MJ3y81RDu0J2FPLLq+WxQrxhY2rvpSmEMDPrdZrze
         yGrq6Hdok5bXzEryBaRalHr12FJuPeFtA5ZjvMEJAsknMrSfJgftGnIBgOuh6ce77Kty
         U+YFoTRZU6wvGle9XzOdhgVBXzJrJYnSF+KlCbsOdmBIGUOZTWT+TvqBLGiwRjOTNUiN
         BFvkumgk4hsZ8eVqkRZiT8z+IrYigLKYL+w5NRon9mRol3ezev1NXYpHXQ72Rd/mzqMw
         nAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562296; x=1768167096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J1ju9uJ8HtmgaH2DMl24DFV+9KpxYvqpDWRQN/CQZFw=;
        b=EhStl5+EGx0KPX9BxKkl6n7Lhu5if8+QWsfK4Zoq8adHcEh3fjLZWh61C8/mpZtXxD
         qylqYSjTqA1kR5CkLBL8Yy9yPfaYf+3qkSOrZxrGad3O59Yx7LN5SB3ye+LMC7uMRIJO
         3vq2ZwU2C/mwT5BqhQqSV5WqfnP6GNXex6TvamWtGVUo2T+uCguWAL5e7VBC5aMQreNk
         bnMNkDd25bUH6e2RgaZ2cveyxhoJ6dQi0Ni857kcd0b6O0xbJaH02gK6bHlrZLx0ja1m
         3xU7QKvWJQViOSI5JivjsMMgSRForSezBGpm5n83LH08yyHK/rc6T9kOHUmQ1KLyYtmO
         s64Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2LiBnm8325ytlk8P1YcUVrkFeXpSUEqzMt92ekjR7njpBmYp6s7Z3rAfWNQ+Tw6lJmLj1tsJOrQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEbHwTs/jlc/hg7/E9C1Y2dEZxJIY1LGDfrhxRAxPkIzFLLlu3
	W9y6rnVPd1bb54J00lTZjUmIvGjUkFizkg5yG1LlzxZwykZ3j0wguGsz
X-Gm-Gg: AY/fxX5UgAeDlj96xNaqP29ZcPr984WVG5sOR6qF+ZuYIcqIz9V96FwZv2YUFvCF9w/
	5iseRxQw1k+gdipeE+ioAjmeuY/ULV79ynCeBm2Fyr+qrRfQ0bMLOiaZ7MkXiWRIKaQ8EjfwO+B
	9jNUhnU3sR7BOxR4F07UJOklO3ts/830evvdY8n4o7JWrg2NBzSyeNeziQ/3deXlAgspbq/iy7N
	lhlfyWkoDGqdWkAIH13PQmcbPAAqaDmqpGHD0D00JOvAgJWtLNZ36WPeV9ymaA4ezwIHDkZJ6O7
	r6/KQINup9CeGH5EtSLBQ51lF/Svf5nBhes9P7qSDf9VC2GfPTVxbvfDYRWAWlJymm/VnqRQ1JF
	xHMLLY55/j76GxUXaQtSHwv8/8HQ7SytdMToM54G+k8Lu9/qoggm3MvLJhE6EPFWsN64guCZXse
	ok+qjoO/iVWRScctFdGei3Wz0+p7ghVPc08VyzGA3+Vkes9ArbQFnwO4jrU1LBydMN
X-Google-Smtp-Source: AGHT+IH2FCylLobZ0wkmnV3e/fGGLODdTT8iSPZe82AXEhgV2cQNmF9xtamMrKBG4lju1W+Of3dwhg==
X-Received: by 2002:a05:6402:268a:b0:64b:76cb:5521 with SMTP id 4fb4d7f45d1cf-64b8e94bf43mr26815872a12.2.1767562295814;
        Sun, 04 Jan 2026 13:31:35 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm51947772a12.12.2026.01.04.13.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 13:31:35 -0800 (PST)
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
Subject: [RFC PATCH 2/6] Input: Add info about EV_BTN
Date: Sun,  4 Jan 2026 22:31:28 +0100
Message-ID: <20260104213132.163904-3-tomasz.pakula.oficjalny@gmail.com>
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

Add necessary bits to modalias etc. Store the number of buttons.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/input/input.c | 10 ++++++++++
 include/linux/input.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index a500e1e276c2..e926327443bb 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -258,6 +258,10 @@ static int input_get_disposition(struct input_dev *dev,
 		}
 		break;
 
+	case EV_BTN:
+		disposition = INPUT_PASS_TO_HANDLERS;
+		break;
+
 	case EV_ABS:
 		if (is_event_supported(code, dev->absbit, ABS_MAX))
 			disposition = input_handle_abs_event(dev, code, &value);
@@ -1124,6 +1128,8 @@ static int input_devices_seq_show(struct seq_file *seq, void *v)
 		input_seq_print_bitmap(seq, "FF", dev->ffbit, FF_MAX);
 	if (test_bit(EV_SW, dev->evbit))
 		input_seq_print_bitmap(seq, "SW", dev->swbit, SW_MAX);
+	if (test_bit(EV_BTN, dev->evbit))
+		seq_printf(seq, "I: BTN=%u\n", dev->button_count);
 
 	seq_putc(seq, '\n');
 
@@ -1347,6 +1353,7 @@ static int input_print_modalias_parts(char *buf, int size, int full_len,
 				'f', id->ffbit, 0, FF_MAX);
 	len += input_print_modalias_bits(buf + len, size - len,
 				'w', id->swbit, 0, SW_MAX);
+	len += snprintf(buf + len, size - len, "t%u", id->button_count);
 
 	return len;
 }
@@ -1679,6 +1686,8 @@ static int input_dev_uevent(const struct device *device, struct kobj_uevent_env
 		INPUT_ADD_HOTPLUG_BM_VAR("FF=", dev->ffbit, FF_MAX);
 	if (test_bit(EV_SW, dev->evbit))
 		INPUT_ADD_HOTPLUG_BM_VAR("SW=", dev->swbit, SW_MAX);
+	if (test_bit(EV_BTN, dev->evbit))
+		INPUT_ADD_HOTPLUG_VAR("BTN=%u", dev->button_count);
 
 	INPUT_ADD_HOTPLUG_MODALIAS_VAR(dev);
 
@@ -2113,6 +2122,7 @@ void input_set_capability(struct input_dev *dev, unsigned int type, unsigned int
 		break;
 
 	case EV_PWR:
+	case EV_BTN:
 		/* do nothing */
 		break;
 
diff --git a/include/linux/input.h b/include/linux/input.h
index 7d7cb0593a63..f6389de4a4d1 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -59,6 +59,7 @@ enum input_clock_type {
  * @sndbit: bitmap of sound effects supported by the device
  * @ffbit: bitmap of force feedback effects supported by the device
  * @swbit: bitmap of switches present on the device
+ * @button_count: number of generic buttons present on the device.
  * @hint_events_per_packet: average number of events generated by the
  *	device in a packet (between EV_SYN/SYN_REPORT events). Used by
  *	event handlers to estimate size of the buffer needed to hold
@@ -152,6 +153,7 @@ struct input_dev {
 	unsigned long ffbit[BITS_TO_LONGS(FF_CNT)];
 	unsigned long swbit[BITS_TO_LONGS(SW_CNT)];
 
+	unsigned int button_count;
 	unsigned int hint_events_per_packet;
 
 	unsigned int keycodemax;
-- 
2.52.0

