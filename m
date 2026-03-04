Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D013890F3
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611604; cv=none; b=S7gsBhNcK8yjk/lK4bxM21JE8aPTalsn2BqAo1uDOxDStiiFpm4XGBOdEtwc3uA8Mbdwki7xaNxmTkIw8c7QJEc0RSEqGHkTMrIB1ck0sPj+Er5yzVERkZORJdIN+c5H+EdaPphSpvRP05RwlPftit9LOPaQCQz/6Od3qFs4c80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611604; c=relaxed/simple;
	bh=nbcIj9p/rJtGfpI+6gAVQl8LH4vGeVEesGIMEW3TiWI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VtSdZEJzjF0HEXtHuFLBbJ8M1gtVSI6AV7t9NdZET7syEWxFpoy9MXX+3Fval3tpHV3UYua+2OM7u6xI7i79n787ignVHbsGtNYtYUS6KjCX4Xvr1cYCNetFi1fBsY7cfIapiDPw6/HXm/0n007ccddhNQkIq0aqdMFLwz4OBW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HYNso38T; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HYNso38T"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48370174e18so37680785e9.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 00:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772611602; x=1773216402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWAQuloq0on7zfLhaTWn8GaYtLAbCLs7s2S7wp1warE=;
        b=HYNso38TFXZ1EvN6FfE8ObP8MFoVUNiykDKBIMfHfsVe813Cl0XQSWivuoylPfqCWG
         AvyC6D2EV9Wmw20KuoqlGMIvScHMnN7gUqMXTvxrNAUx+m7lMgBFHrBl1FVqbPBHCFz3
         4dWd3P5S2uTalnG5OL2Zbglc26IcAiP8hZ/XMnHiqqLZlwf8cwUJLnmnj71exlFjAemN
         YNURHSln4BxLR2rBJuLehXOsHto3POf0pyqcHxPWwf53AzFl8UmokbYMoFdu2TRFkhbB
         haEGUOu88zQujfTYiWdJY3ulhDu9fCyILwhwq2YTCm8dah7Gxc9WFagS0P4/LPIsaQS6
         m0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611602; x=1773216402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWAQuloq0on7zfLhaTWn8GaYtLAbCLs7s2S7wp1warE=;
        b=EpDLmoo3bELxajmsfjXPMroudyqE626KnXexZ8+K/tTTnmPxHUXyGJv2FlMyEwhvn9
         XO9uzigpGCbZ/G/7O9pDrCFH1gkY3tyaQibuIZ62jCaGvOg0q90ir05wUH/rLQIEcjBV
         K3NMufPSwUR0Octsxzz5PcU1T7C3NOZRy/Q2yFvQ3w/MP8RVXyro33H0jPHer3CzO1bV
         KEfPZPOT4Qw8ESyVRV2w7dq42aZIAa6tM4/15WDdOBmACxQV580ZTfSPDJwxVoq1n7Ok
         j1syUC2T8i9Cxq9QvW+pUf5aeUqlq1v8T6TMJJItXBxlxZul7NqiMluMle0DaUtoS+jM
         ZbAA==
X-Forwarded-Encrypted: i=1; AJvYcCX5WotZXdfiP/mCKltE1CEhCd3FVjD5sw8FOqUldBlOQqt5tGs8wPP8VR7ZgzJKWN1/wVgfTBjqE9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXI1Io+n5tdvNA1d+yPrd6T2wiXBrCnR7OnWWwkr8bnepcTWCu
	BCJGLrFnPmYXopS3qsCTWRKOawBn8pMy30qE4X2LK+ACCXiLE3H6YfN/ki6u9C/FXoU=
X-Gm-Gg: ATEYQzxxy1cuCBZ0eDfpWx4NtN3TPUEqsyJkDv6zOi4EXzMNM+uDYg1g4qw/1Se3eFF
	ZuwwvQ/H7/AMTcCK0xsj9S7BvHWD2J9gqHg8pOAaVZsVkKuh1Zl/BMDMUZIScJ6nGlrOVuQILt6
	Ge5v6dlZCXaf7gl6pfxczauhdUNgz2FA5TmTv5NoVtfb42Ox1a8MKwirWz5ID/T+WZR3Jty6veJ
	WpI0563+NFVea3JJHCuc8h0JTDkwDdeCVkQx5pbs6ytZ0/VNYisz9BUh+XJjyvHq9j6ybbG6fwc
	aUgVKVufQyqSSQ3Vs1VkN1Ub+qM5LHQHztk94BhJelAnyMbaS0sqCyk26VJMRFYwY1z3Jvb71Mv
	ce0S/TgOzMpODhLF4HHKTT5WNMq++wb4LdBH+BtyJAx807QZ3UTiA32Ea4hIu0R+/lnRB
X-Received: by 2002:a05:600c:1c18:b0:480:69ae:f0e9 with SMTP id 5b1f17b1804b1-48519871aa4mr20809055e9.16.1772611601805;
        Wed, 04 Mar 2026 00:06:41 -0800 (PST)
Received: from localhost ([151.19.177.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b130abfasm24333017f8f.34.2026.03.04.00.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:06:41 -0800 (PST)
From: Francesco Lavra <flavra@baylibre.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v7 2/6] iio: Replace 'sign' field with union in struct iio_scan_type
Date: Wed,  4 Mar 2026 09:06:40 +0100
Message-Id: <20260304080640.2844366-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260304080519.2844101-1-flavra@baylibre.com>
References: <20260304080519.2844101-1-flavra@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2147; i=flavra@baylibre.com; h=from:subject; bh=nbcIj9p/rJtGfpI+6gAVQl8LH4vGeVEesGIMEW3TiWI=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBpp+gQu9y/kVgjMpuub/OeUVKw7GKOLTUITzZ4O p/kp6DTbTeJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCaafoEAAKCRDt8TtzzpQ2 X3mrC/4tgZlCQIi7HexBqikkIq9gk6RMxPqYaE6WUY3kz1jD11r5sI9GIDnKORWLOC6J44fDroC Pqr29x3VAGHqCFOybqCHkCfrYpwB6kby+UQggt0MrfYUy2tIRrxLr6zL7zpeQIFAA7a2MreEwi4 6QuUa1WBLh/lQijRNmzkLDyDWbKHNHycDZxQTLyqdtNSlDp9z6AWsmXm0KAl4fuLp/PEQWk9aJK VA2uiULdlSPU3MWHCgW/RQqYgSzaZuGlxk4gBvz/6PvN8+W4IBQA5UhBuhI+4fnjekAfHBY/uLR wnAjKXeexOFARMFbVSgfaogoluq26flyNTrkNM8L8iBJTyVN/WE4YB3v0vpjyNqftCqvmhbf3iT uEtRFKveyw8VsSmySYyLn66959C25aagPfr0IEXEDrghtAYhJiI8IL+A7K+Nj2J5mplE95xpmuU W2LheAYQUGIq7q5+Y6lYryLlZLZYQdPsapzHEhXN424o5N0L0iHURa8MbfGIfN1fSX0g8=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit

This field is used to differentiate between signed and unsigned integers.
A following commit will extend its use in order to add support for non-
integer scan elements; therefore, replace it with a union that contains a
more generic 'format' field. This union will be dropped when all drivers
are changed to use the format field.

Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
 Documentation/driver-api/iio/buffers.rst | 4 ++--
 include/linux/iio/iio.h                  | 7 +++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/iio/buffers.rst b/Documentation/driver-api/iio/buffers.rst
index 63f364e862d1..f36e6d00173f 100644
--- a/Documentation/driver-api/iio/buffers.rst
+++ b/Documentation/driver-api/iio/buffers.rst
@@ -78,7 +78,7 @@ fields in iio_chan_spec definition::
    /* other members */
            int scan_index
            struct {
-                   char sign;
+                   char format;
                    u8 realbits;
                    u8 storagebits;
                    u8 shift;
@@ -98,7 +98,7 @@ following channel definition::
 		   /* other stuff here */
 		   .scan_index = 0,
 		   .scan_type = {
-		           .sign = 's',
+		           .format = 's',
 			   .realbits = 12,
 			   .storagebits = 16,
 			   .shift = 4,
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index a9ecff191bd9..61f1dfc14e02 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -178,7 +178,7 @@ struct iio_event_spec {
 
 /**
  * struct iio_scan_type - specification for channel data format in buffer
- * @sign:		's' or 'u' to specify signed or unsigned
+ * @format:		(signed or unsigned) integer, or floating point
  * @realbits:		Number of valid bits of data
  * @storagebits:	Realbits + padding
  * @shift:		Shift right by this before masking out realbits.
@@ -189,7 +189,10 @@ struct iio_event_spec {
  * @endianness:		little or big endian
  */
 struct iio_scan_type {
-	char	sign;
+	union {
+		char sign;
+		char format;
+	};
 	u8	realbits;
 	u8	storagebits;
 	u8	shift;
-- 
2.39.5

