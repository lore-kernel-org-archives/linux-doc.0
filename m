Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA992F0C7A
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 21:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562300; cv=none; b=EWUYmQQsuUzWbOlJhhuPtTuMwMR13HUsD2QPhLkav9nFGsrCf7BYkWVimeRrdQMfC+eCKrHNQEBg1iFmL466p9OJtCXSdzJE7OVeYPwvKmwD3mMIxhK6dNlDQqEn0+NOfhZyxW5LnqgZI7/23B4IaoJmgF2Xvx3OA/U2St6vtXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562300; c=relaxed/simple;
	bh=K1Gr+aLk2G42C9RgkcZD+nIQ5P+OEJfi74ouHBrvAYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/a6R88VpO8dL0BrbTIfzDDY/MwxQ5HbC/WuiFPuxGHIiZGWobao55nu3SNJDOkh6RufRrvxCBRoge5sKWuaHWwqf9ZbqbGM/PcldM1yd1lyV+AwR5OAr9RVgcXEcfRAmJsFtAbW17QA/LMmvykUYNuLy/CBFqnTovi0ezIoQp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XG5+I6QQ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XG5+I6QQ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64b5eb14e88so3104179a12.2
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 13:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767562297; x=1768167097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFooUSrVXm9pvAYpHh/HKF6iHEd9ba7nkhN8dd9UQqs=;
        b=XG5+I6QQbfGlSRsAV56UgWhVvqpmEwq0feduOm3pWXjrfjZAZ5uluqIZf9nq/KuukR
         r9qvfww9LVScMqkVY0wcSin1dfc1Ffo52am95rqsUrbTDd/dNDHJ2FYSUevgglePXOX4
         PVR+07DmiPh5R4uyclXzlvWtYP8MwNqBdmiUHbUPvUNsipVLWp2O+IQYMh4pW1nXmpj8
         XKr4rMx3tgff00aU4DiMBflsNcqB5MNKJZDSTaYss4q9uCdmR6TJUqHql27+W1DX7Hdt
         0c/MJ2e8nixc6a5zV91U6Lpb05lrbUOGV+mEnzQFpYH5vZ8PMWLuv8tKKkx6Ce1B3ZZt
         SBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562297; x=1768167097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gFooUSrVXm9pvAYpHh/HKF6iHEd9ba7nkhN8dd9UQqs=;
        b=j6OJ0DcrMFM/OIkK+L6eWB+oh0MX0EJDptnBYPYgXdT3bTpN2dcTE6ePJE3uIPqX1l
         zPYU/N6hgTQwfCVPnz12oN5WJx9SzGslNrILSfA3VsffsbxyDcnavhnnp2kcWtW+K9VE
         85QbTt722l57m7E6nLzHdcnc7v0XOfaoBsQ/9MMVWhF7zokpV0epnmhgptREIiTP4fPd
         uSpRJzsPLASbiQBi1AcYrCQtFF3kJuFAVcPUiB++G7Vgj1PXvoVA4PIsK6+cV6xJuS1z
         aluN76o7JI10EtlWHIR49TMFjF5gwX5Ts7fGwtYFXCLLijWp4Le84LOrF43SgcT5ELvX
         ZqIg==
X-Forwarded-Encrypted: i=1; AJvYcCU+/IpCcg5PXRBlZ7dpdYRU/yaS2iM5a+g5hDLbgkoVSRAIx4he/k3fpuvyqNptV9RLFvDfLkeQlmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT3ZDmF8n80FSzgING1ba3Rh4taX90AJHK8CB4nWWVHVEmIloD
	B6Y6s3zbHeqhNe0hbZ9gh5YxpcQauSSFSNfnoO2v0DLkdweqo1Km3EC8Vim6UQ==
X-Gm-Gg: AY/fxX4XGwnFTyw+bYvagt5rpIYc2nqV6ENrQPj8HmihVHTTPnOnz1JEvi5G08sddI6
	8oiLZCJDqaMrHeCzwxQJVwW+bmk1Ou455fw0Uql4Co+cnoX4e+dcBJcbRhR2E/qwmd6Q8tuTH+F
	hgiuAMopfGh9Za+2Lq3JhXTS004h3vA4FaaRwAwAChglKt/yt5l/rWM4BupQvTjvBoBabJ9tfji
	AaAHdrdkl7a/MPSsN35dowBN9BBKXthj2noKqnOQvdEsXOIMh0ElasVvopV2cLKQuv7f4PZbZbV
	m1Vx2uPMQ1q9sHk2YMmZVWUURihHaK5pJPO1gV7u4bKt+yScxRpy3aRpaIiCjgB9jdxPYu8zPMA
	9LAg0zrjsPO16yWFxEjZeorGOcnNhRAjLb4Eh0mYLzB0pELw9678vyxE8TdRsE1Q6xNuV9pS+Wb
	9fyTG85rlEU0vPU9fyYlBuHuf2Ap5FVs282BOXPN4GtffcgLaQobbRconYf9YBRtiB6Chknz96w
	z8=
X-Google-Smtp-Source: AGHT+IGjUkLkKEMTWYzAwCdwlq8lHOYywpLwMuXneu5ARm5/T3CMRRTVuA7vHtt8tpniBq9fgW1EtA==
X-Received: by 2002:a05:6402:5244:b0:64d:23ac:6ca6 with SMTP id 4fb4d7f45d1cf-64d23ac72fdmr25639337a12.4.1767562296850;
        Sun, 04 Jan 2026 13:31:36 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm51947772a12.12.2026.01.04.13.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 13:31:36 -0800 (PST)
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
Subject: [RFC PATCH 3/6] Input: Fire EV_BTN if found in ev_bit
Date: Sun,  4 Jan 2026 22:31:29 +0100
Message-ID: <20260104213132.163904-4-tomasz.pakula.oficjalny@gmail.com>
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

Passes EV_BTN through to handlers and allows reacting to this event by
clients.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-input.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 2bbb645c2ff4..900a6fc9813e 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1673,7 +1673,8 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 
 	switch (usage->type) {
 	case EV_KEY:
-		if (usage->code == 0) /* Key 0 is "unassigned", not KEY_UNKNOWN */
+		/* Key 0 is "unassigned", not KEY_UNKNOWN */
+		if (usage->code == 0 && !test_bit(EV_BTN, input->evbit))
 			return;
 		break;
 
@@ -1723,10 +1724,19 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 	    value == field->value[usage->usage_index])
 		return;
 
-	/* report the usage code as scancode if the key status has changed */
-	if (usage->type == EV_KEY &&
-	    (!test_bit(usage->code, input->key)) == value)
-		input_event(input, EV_MSC, MSC_SCAN, usage->hid);
+
+	if (usage->type == EV_KEY) {
+		/* Send out EV_BTN with button number (starts at 1) */
+		if (test_bit(EV_BTN, input->evbit))
+			input_event(input, EV_BTN, usage->hid & HID_USAGE, value);
+
+		if (usage->code == 0)
+			return;
+
+		/* report usage code as scancode if the status has changed */
+		if ((!test_bit(usage->code, input->key)) == value)
+			input_event(input, EV_MSC, MSC_SCAN, usage->hid);
+	}
 
 	input_event(input, usage->type, usage->code, value);
 
-- 
2.52.0

