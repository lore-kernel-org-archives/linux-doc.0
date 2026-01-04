Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DE72F25FD
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 21:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562303; cv=none; b=G50Zef3/cgVuyXA9Kdn82SrDcMpcHW82QUF8iThTn4mB+UrXWbBfOy3kCjlBg98n0JyG6VsfxrIh/ijki4IojaDfwWpSEexLFYnFCOO9220ygMVQyvRp/lgRVVD4XGZ/LlQFbCtlCNIHyIFn3OzId1o/ow5QQrQ5wiOGM6l0YpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562303; c=relaxed/simple;
	bh=HhiXa9faNhgtAxR7thDLXdlpim1uuVVNkBce7yAbcqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PIJf5P4l0ZY9noXaqsltrKFLHNY+i8KVhRN9w0/Dop66s9CwtmyKnBkiFPOuM0OdHvo/yLcDpJFEZYqTSt1mcOCCumxDUKTE82We608tkndUDFRisxDsaJ/RryN42XIKxRXI1n1WUCB9nAscpMrv4irDjAVo0YqXmal9Cnmf35w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaVQGtd2; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaVQGtd2"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b830b385507so137824766b.1
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 13:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767562300; x=1768167100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxrdR1+2a5RaFKpyNZz55u6IOBzBhsiBktK5vLyXD6I=;
        b=WaVQGtd2BvqD7vVbyF25Y76CcgG6y7jslzI9x3WGFsFRLZYKh3nA1u9NbrkpqfXaII
         qAkkR+fDkBpXoSXUk++eSLCnO02kLKsp9OnI30jhjCohPIlMEy44qqQFQcH/U+M1o6Yj
         pQim2cRP1ybmAXfG1NdEczQVfql5FT8sTLazSuTji2GPWZvMKSZNprXfYOzC/9dWTuy1
         8wyyTus5/IZInJMNLz16QJS6M3PyvQFVx9X6PCPFwo0sJ5k6FpheL3GWfm3mCx/6uzlH
         f6Kc79KFZ6U00vDR0pENmyhFmX4AK92QJFAim5Plf5fqd8iYsYIYAQBD9ZebQP/T/loG
         wuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562300; x=1768167100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CxrdR1+2a5RaFKpyNZz55u6IOBzBhsiBktK5vLyXD6I=;
        b=QkZZSIX0K5ryrEWd30eGXOq77EFQTGtu4SSO8CcQcDGWOnsJeDiIORAzpp8N7ewbp3
         uNXP7xZKkkF2FRS6vW9RyQqCnUuGRux3YcAFepu5pAWe6K5kVrhUWWMYXEQH0IcK73CU
         L/ataz35VdlqUe+tHrduzjCvlQxbWrJUwwaMzd2rPpL4/HiHoCGzNr6/AKTjcgQBxSqL
         uFJ17DmlPJ/HG6DWDP3p4xXLy2ktugVkBtlWD6Pa5PQgSucwWimjcY5EYK3gShxHFYBi
         vEEuaSPfWDFpdMXKCGZ5weZiG9ReL05lXCZXqlOsiCWoTxPF+vS8AUSBE6/LU629o+o+
         89Ag==
X-Forwarded-Encrypted: i=1; AJvYcCU2tUhCRuYvdDsFwP+/XsCxNrMEQc8oNY4ZDMOhHUrrOJspHZnVMgkqMLouD9av+MWR0Cp7HILTGdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnXy80Hc7NyjwF5p6ZFGR3ACJVXc/sk2rSLYsR3uKPhNUA/4Dq
	l1yGM0pt03P78MTrJUxM66eCYyttDf8BU6o8iyZ3dJBV9t1ot4F69p4Y
X-Gm-Gg: AY/fxX785NWfoln0WVck+T9Vzvfw+VLt/Nj1UV/eVKKUkKT1xYCwPlRSQKuzbSTodvu
	aOZKEO+LVWzu2aN2WvdxZSm5ZFlQ7XQ0EpT0AG123xnishjKo9BVfAxF6i/jxNGE5h1KdyE4u3j
	saUumDr8yalnidAfnj/FgOqtIgCWEHgle8Z6Pkh/Df9valQryvR6Gr/w9K0Qtumnd37GeO0Lplv
	Rri7etIb8RHPp9f++S9w+tNbhiiWvmv3Y/IluIVUHL1BsY/BRJN5CY8y0zwVXonb6w/X4eRcIJk
	eBmcPyMlDcfnAKXimWHIZSIMLnR4UE+HRMFNQTpn2g4Ahy5QEBEhr3fhf6a3tOnJ6icO+SaslVc
	ZZjwGARG9QTNB7eSJCSc6NJcIJO9o9EyNVV6JHwY17XCQVnBCSfRs6vWF++iXAZulQ7myX3yiFu
	7YR9BRxQhn1/+cioHp759va83xVJpSMXafyjjxNzkyYf0RNt/ryIRf9XHQnKnomGHG
X-Google-Smtp-Source: AGHT+IFbT/17drCJTiC1SUmz0pBoy23cOQaM3ejZxbDW7YxU7ng/yG/cBTgBBPjbLDpAH8oMLhdjsw==
X-Received: by 2002:a05:6402:42c8:b0:64d:26a2:56af with SMTP id 4fb4d7f45d1cf-64d26a25be1mr25379531a12.0.1767562299676;
        Sun, 04 Jan 2026 13:31:39 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm51947772a12.12.2026.01.04.13.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 13:31:39 -0800 (PST)
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
Subject: [RFC PATCH 6/6] Input: Add EVIOCGBTNCNT
Date: Sun,  4 Jan 2026 22:31:32 +0100
Message-ID: <20260104213132.163904-7-tomasz.pakula.oficjalny@gmail.com>
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

Allow userspace to get the button count of input
devices. currently only used for Joysticks which
includes Simracing and Simflight hardware. Such
devices are always defined as generic joysticks.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/input/evdev.c      | 5 +++++
 include/uapi/linux/input.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index 90ff6be85cf4..b90dc035c0b3 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -1134,6 +1134,11 @@ static long evdev_do_ioctl(struct file *file, unsigned int cmd,
 
 	case EVIOCSKEYCODE_V2:
 		return evdev_handle_set_keycode_v2(dev, p);
+
+	case EVIOCGBTNCNT:
+		if (copy_to_user(p, &dev->button_count, sizeof(unsigned int)))
+			return -EFAULT;
+		return 0;
 	}
 
 	size = _IOC_SIZE(cmd);
diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index 6aa703fcfcfb..3d1b17ebcdfc 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -174,6 +174,7 @@ struct input_mask {
 #define EVIOCGLED(len)		_IOC(_IOC_READ, 'E', 0x19, len)		/* get all LEDs */
 #define EVIOCGSND(len)		_IOC(_IOC_READ, 'E', 0x1a, len)		/* get all sounds status */
 #define EVIOCGSW(len)		_IOC(_IOC_READ, 'E', 0x1b, len)		/* get all switch states */
+#define EVIOCGBTNCNT		_IOR('E', 0x1c, unsigned int)		/* get button count */
 
 #define EVIOCGBIT(ev,len)	_IOC(_IOC_READ, 'E', 0x20 + (ev), len)	/* get event bits */
 #define EVIOCGABS(abs)		_IOR('E', 0x40 + (abs), struct input_absinfo)	/* get abs value/limits */
-- 
2.52.0

