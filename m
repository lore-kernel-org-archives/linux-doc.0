Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E3239E193
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 14:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771941849; cv=none; b=rOrn4fFHvgblWpkyOxkPXzrJlyWecTN85vLpyWB9CIDE18Z0mvXrvQkwmq8t4tboit9kzQulXd6VL8u9CGGtjqCgi/58kIeoj+XF2xNs8EQfD8PbVH2TMdH1f4Q3AcZZnBWeod97IWjlbhMxcCJDPmRo8MfdnRLf7U4DVmuSD80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771941849; c=relaxed/simple;
	bh=oLLb29gcQ0BdhzqDQZuPnB8XcQV025xjsRtvxagy5mY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYNcoDEBcIXlKl7fyYp1DIwm0KaX3Cx4dFvuwUY6ZwJKazVNf1/qrSgChQIDyRhkxmxtXiW2s5JNYpf5J02g1q1RnnOseOtqoDN4/v6Mr6jT97JTO7gVoOEPr7EwVBgzqUZ9EP5ZureFlHI7j49IBzXjjNdOwtCMm2YxyVYW+4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0zhnCy9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0zhnCy9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso63005245e9.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 06:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771941846; x=1772546646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXJxDts9nitekq/TVoz9OLkW8FMNDccXXJfyJV6WzLY=;
        b=e0zhnCy9hl8we8Ow+/1z4tj7c/vNeLMiVlP+m8Nv1QaejlG2zFHsTC8LiPk/WNIDs4
         Dv6DDVMSELtSzo+h2CrQjD/tWD90D3HAMVhbg8tSZjP+Ct71POnTR+K+hHQJnC6RB0kB
         djk5XPwJkE/YSYj4awO4yo5H8l/HgbiDSH6noZUhkMZ92St5fOc3FERRPSfKhuNT5Xxb
         jt0jquwm1YDjfpqdvw5WO10QwPfWh5qr9OkwP73kEwJ18gG0UGocI6IF1HA1XifGSlil
         fFgh2Z4uvwPmCGwBd6iOLaNJWmYoE4jCnSUylpw+iVpSQB75+hoJj/ogHr8bo4jzmgNh
         s0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771941846; x=1772546646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JXJxDts9nitekq/TVoz9OLkW8FMNDccXXJfyJV6WzLY=;
        b=JFe2kP+GKgn5N4GMFO4w2aoF2x8RN8EAp0vcGC5ZdkYjQKbTNCkEEW5bBKMlHGIz/N
         kQ2K9xIkY58iJ1mTO7jsej8tJt2YtP8EthPC3vRis7VhvO865CbIkv41Zv9bnpQqxugl
         lhA89D3UEKnmmR6sNshWUtGBPQNMN1b/HYc542an5fhYcg8+YsuRaf63OA5UFWb+wzUq
         vpipK3yvio1YtJcWK9ToSLEd6Ftk8a1WihD+ZGGlIF+1i79zx95dJp/ndkVq8xO+NpaG
         Rr+WOnK1lLEiiF61Qof24TNa3H9cn0A1EY5RNYf6vodC47gF62rZUybBc7bM7c3jPxez
         hugA==
X-Forwarded-Encrypted: i=1; AJvYcCXgZz4nyZwkkNUz3hxngm4JscEl0R0FtnG9dlww9paiODOq1YNaDGDMPDG0eqA/DbeRIfkKehr4vQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyykW5vx0ayNIsMQtyGycTG38ICgxVZvgvS4GcKJ8RPcMtuN6vv
	TwoeNP2Dy1moY9mju89NUO3gUUzQpFJMgUIFrC6kHlvr/xltA8VxKdfA
X-Gm-Gg: AZuq6aI8mhLVxDgF9y9+s7//0+2yc7b0TAYr/uhExyOGKnBhDoJwrEJc+P8OSrOZ6Mx
	vVG7f1WUfxh4v4S0ZUGXFlB0gu3mP70DIu51/cxgxwKJKrDFbo961OFcRHdmoe+fm4gLW7uEsK3
	rXCm17WW8x4PMNlUQvg7BBTlydZIAUnLd1JJyj9sgu3LRmB42SnTUg7K5yIEPAfFRoF7oavrF9B
	0rAYyUa0GeMBNuGrAeRK5dpiI+4lVuOd8jWapg40UDnn6hwiALues5aA33qr+GV2xksI5DLAZW3
	kQFuhTGzfYDXwfiR5DF1un5VGSP1Tn4W3/X1sLa0tFT+FG82OECnzoH2cT0Ji1ISZyMM9d0KXYs
	dReoefowBFLZHJaGUUvqF4rvtlJ+wGEeQzVMdWhUn4lEJF6Xt+QbM673tWyWIHYQRDAwlnL006O
	834xsWtAOjN7WRlgrMO4qP1we9BB8wAoDhmVY4ofvOKH2vH/nKNkUeCHOZRntnRg==
X-Received: by 2002:a05:600c:5020:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-483a95fb698mr228656595e9.11.1771941845765;
        Tue, 24 Feb 2026 06:04:05 -0800 (PST)
Received: from db07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7010a0sm1043505e9.5.2026.02.24.06.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:04:05 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: linux-iio@vger.kernel.org,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	nuno.sa@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v5 3/5] iio: accel: adxl345: Expose IIO_EV_INFO_VALUE for double tap
Date: Tue, 24 Feb 2026 14:03:46 +0000
Message-ID: <20260224140351.27288-4-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224140351.27288-1-0rayn.dev@gmail.com>
References: <20260224140351.27288-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADXL345 uses a single hardware register (ADXL345_REG_THRESH_TAP) to
store the threshold for both single tap and double tap events.

Currently, the driver only exposes the IIO_EV_INFO_VALUE attribute for
the single tap event.

However, the IIO ABI dictates that if an event is supported, its
associated configuration attributes should be exposed to userspace. This
applies even if writing to one channel property alters the value of
another due to shared underlying hardware state.

Add IIO_EV_INFO_VALUE to the double tap event specification to ensure
full ABI compliance.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/accel/adxl345_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_core.c
index 78e3f799ecc1..1ac99263ad8e 100644
--- a/drivers/iio/accel/adxl345_core.c
+++ b/drivers/iio/accel/adxl345_core.c
@@ -235,8 +235,10 @@ static const struct iio_event_spec adxl345_events[] = {
 		/* double tap */
 		.type = IIO_EV_TYPE_GESTURE,
 		.dir = IIO_EV_DIR_DOUBLETAP,
-		.mask_shared_by_type = BIT(IIO_EV_INFO_ENABLE) |
-			BIT(IIO_EV_INFO_RESET_TIMEOUT) |
+		.mask_shared_by_type =
+			BIT(IIO_EV_INFO_ENABLE)		|
+			BIT(IIO_EV_INFO_VALUE)		|
+			BIT(IIO_EV_INFO_RESET_TIMEOUT)	|
 			BIT(IIO_EV_INFO_TAP2_MIN_DELAY),
 	},
 };
-- 
2.47.3

