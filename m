Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E1827C17E
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 10:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759512; cv=none; b=rT7VWMMjRckihikXZUcc+XGPDZHcybItqSkqUGx1/3DYZjTvthp6yMsbbzkAWMCuNdbZHpdYgHXypQE+LOKFhyCSD9/sMW8HRGrRaveNc2aSQKnpTNKLzqxGJYT3JZAJ4XQY8scsLmhqxycY6FQ1GlgPTejOcMgVlYNsOOgUjkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759512; c=relaxed/simple;
	bh=BxSZCTHQQbOzpUXG41bzHe6bhur/t86DouCb7Fsp5mY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jbSFqGazFQuA0oNbseAbxYw1FzKMH5H4nDKknKafUFpLnyCyCiiI/k76uwDcVarek8yWSqf692RLuokSc15Nf4FeaxVIS+bZVYw0doliStqNCzL0/vqgZEmvMG2F7ymDbN4pmabUYXIAWiXmGjTkGE/6LWhGiECaZ1wP1TURg4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=O0sR5a+4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="O0sR5a+4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so1641915e9.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 03:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750759508; x=1751364308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/p4W8XBYRlLTJmF90cO5SUhM2S4WURG9L9T1Yq5WmNI=;
        b=O0sR5a+49VlPI+YGmXq96t8eUMBJN5VeM79EStrIbRu1lY+uhRVJp82mxUQ7gE8J7c
         TjE++uDoq8ghX6iCjgQM5EPL/lm3KPySalgmcv9Ihnb82gpVw5RPBA0/6zRkARgSm4TG
         Ql5MY82RsoPd+xa065JfK97CGgCBedIWg0mKUL6mU3VmBGcp9UEzAe6/KPxl1mIQBxIZ
         6VPGzBkoyBhYN1nqFlF2zm/Soaoq796GGKL7TMQwjDYyvR4MOdNUmwN7k+KRqkxKr8LM
         i1Rs9hxW5XMTSDiyPQgLlJWS4WoQAFp1niyTEalXilidD9z9dT/YKyU1U/EfPkOCrbbG
         pSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759508; x=1751364308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/p4W8XBYRlLTJmF90cO5SUhM2S4WURG9L9T1Yq5WmNI=;
        b=WuhTDlSRCp/KJ+tAvsYRFuxUSIb1vNSgYyK+3fBv2sF8+UtL+b6cW4m9dL6a6KndJn
         NQCWwWR4SljCUDOuYJayh6ZXE0GwfjhHfYM0L4W0zYiDKInp+YT67uAP899eEYsl9Oi+
         0CICBdF+3kgbBk1pgDVlamw0w00ip4SwQ+TnP0gWEAvvpYD5Cp/ThulRvgd7o4s9YyAV
         2qadK0vIl1QJcpRA7ctN8z7KvIoTd/NiLqRobG8BIdUHRM5VeweYHL9MVdCwJjlKDoiX
         I/oW74knf9zY3XvE0QMP1JB7F3mIC1b0DZ7mroKJTiN4N/l6nzS/M7vORHYO4T+WdZYY
         FowA==
X-Forwarded-Encrypted: i=1; AJvYcCWQKTzTsBKWv4MEmEnGqbG9kM6iHDowoM4VSoe0zoi47q6MTFk3/P43lC6Zi6EDhaagZnkUiC1w3C4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrNspFP3pzOAIkQclLnh2NnIL0Vgi+AJ2w09mC28rJPvBH8Wkm
	TmtGHxOk2QaMrvGr9ntZzn6LcUocQ2aAXY1CkHSM/xwLZNgejv0q7/B/o9NklMsJoCw=
X-Gm-Gg: ASbGncu2d1Vygnh9owYhJEHgI2bAcFh1nHI5qXnvDgoCfFrNgZux1YCT6OSq0Ree3V4
	8Bem4wBhJP3xi9Ys73cL2u80VB3v561eFnnuA6xEY1JAOaQ52OjmNAa/Z/CDqr5M+kkzwmk5iG4
	1PRspY4RAiMxDgHizXR5XWJUPll3sJPZJHJay89uDEGrt3DUk/n9CrFOtqkWUNKAdNg0nNhc0eM
	ABRU4o/rAmSt7G5CA6ZJf3C//gbeOW/h9YpujJW4aB7RXGgr1KJKa7IHDA71Jcz0tIZKdUbufwi
	mm+GUEu0pPHBOXpMhm0zVFbMcTSxZAXfPrYKeQWNYtoHWW8nIipZJPHcSZWviSAQUvHi7B+FXzH
	VJp2FmkBKakWUMTeEojlfMxfYGvHm
X-Google-Smtp-Source: AGHT+IFJrgvCHKycSbwdKW1xCkf/MuOiL8PQmR3kqGg/1FDNCNSxeZZyPqXfrJodaz4BV1On31nEtw==
X-Received: by 2002:a05:600c:4452:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-453716b567bmr69741045e9.7.1750759507719;
        Tue, 24 Jun 2025 03:05:07 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453646fd642sm133197175e9.21.2025.06.24.03.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 03:05:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: pwm: Adapt Locking paragraph to reality
Date: Tue, 24 Jun 2025 12:05:00 +0200
Message-ID: <20250624100500.1429163-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=BxSZCTHQQbOzpUXG41bzHe6bhur/t86DouCb7Fsp5mY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoWnhMZSx36slfU2u6dOspYk4GeYrazI8k4XzbT le7FPWLb+SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaFp4TAAKCRCPgPtYfRL+ TgmWB/4mlf3PJE2o0ekyCVkZ8WN8dmD9Cqy5DVK33obcZHMRgKW4ar7jANlQXfR/CuL0opsOeJ1 Ti8dJBNN9iGeqo1SJpPzcXh8LnddKyIgWLUITGPazZ8oMFsW5m/Q8ikRISc/amK36l9gu0VDTRd iDlx9FS8JBLYhU5+lRdqfM37TF5xsMdRsvwS4wwwTWkRBf41vJ2eWh40vuxEx1MS3JcZCgEoab7 9PL6rO00390pTEELXX+hxDlM3ja9oIpdFRdDJEwDtd4SJsNbmEhqUcNchuliB5u4KP7hUsDeHbG yVkBrkaHvL+VZ6wLidXMtNfQFpaiqU2qu5xC7TcQK7km73lc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

We have the distinction between pwm_apply_atomic() and
pwm_apply_might_sleep() since commit c748a6d77c06 (pwm: Rename
pwm_apply_state() to pwm_apply_might_sleep()) contained in v6.8-rc1.

Locking in the core was introduced in commit 1cc2e1faafb3 ("pwm: Add
more locking", contained in v6.13-rc1) to serialize per-chip callbacks
and device removal.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I guess there are no objections and so will apply this patch to my pwm
tree in a week or so if there is no negative feedback.

Best regards
Uwe

 Documentation/driver-api/pwm.rst | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/pwm.rst b/Documentation/driver-api/pwm.rst
index b41b1c56477f..0d27a40f5818 100644
--- a/Documentation/driver-api/pwm.rst
+++ b/Documentation/driver-api/pwm.rst
@@ -173,10 +173,15 @@ Locking
 -------
 
 The PWM core list manipulations are protected by a mutex, so pwm_get()
-and pwm_put() may not be called from an atomic context. Currently the
-PWM core does not enforce any locking to pwm_enable(), pwm_disable() and
-pwm_config(), so the calling context is currently driver specific. This
-is an issue derived from the former barebone API and should be fixed soon.
+and pwm_put() may not be called from an atomic context.
+Most functions in the PWM consumer API might sleep and so must not be called
+from atomic context. The notable exception is pwm_apply_atomic() which has the
+same semantics as pwm_apply_might_sleep() but can be called from atomic context.
+(The price for that is that it doesn't work for all PWM devices, use
+pwm_might_sleep() to check if a given PWM supports atomic operation.
+
+Locking in the PWM core ensures that callbacks related to a single chip are
+serialized.
 
 Helpers
 -------

base-commit: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
-- 
2.49.0

