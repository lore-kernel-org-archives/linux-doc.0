Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C458F510
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 19:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718654226; cv=none; b=kzeRtPmGcxl3hKRzwc3vUSrKheuUrw+bjJtods3ew64Bu3+Cyv+DfFPRmEz1VtMCcejvYOS0qroGeioo/8OzmCOkDRggjJk9db65dmTUrnrC7GfODF1p9d3O7yp2nfnDGSgK8Cg16ULbR+aEXlf31dMWjdBBe2NlZdX0AsC9aBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718654226; c=relaxed/simple;
	bh=ScBjloLOcmR/1nZUDV65s6oEOBC76uEbi9Qmw0FwB4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YOHSqsgOkPov068M7jVP5tQMXvfJNONwA8fLXwMufVZNhlcRVSWaHmktTp2/jXsAcdAbr5dMNRDl+AsMiKqGJq4OOVuBWi7xR0yTTaZhRSUn+N8gj5GEpuDJ6v33Yj40rAz/+BLlVr19Ksy1tKzOUlzW30kihKo18+72biPD2Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ckQhqkVE; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ckQhqkVE"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d229826727so2698421b6e.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 12:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718654223; x=1719259023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmeUj+Mt469bmKZm8v2IWEIIRLOnDTCxs7wy1b/+0yY=;
        b=ckQhqkVEXZ42sPxIFKHQZ2T99mFG7lT9fNht1P+elPQEYY6Yj/nG7poqvNHozkbSjh
         O2j9dGyN9Yg+m29OmlB3e9LPk3j8MDl4OEmfDEmO3yirx6fInVp7zpPITyg9AQ4sAmms
         vFMO81myWZEZzoVjPFgOF9ttmTxAnBFEzoBjdf0tdeGMEyPoEGAzpVMcf+MpDA3JpLPC
         r0WXWAqLqO1tj/2vOU7PvAwX/eYxoqlFuYDdVI1x6nXVKMilsyMSW+zwql6zR2IMJhG9
         4DIgZx1pl/YRSoBkuujzKwixKK0ltMt0LMQmgNYWed8u8tfKxqSlM6dTKmyeSBGCTWZK
         TDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718654223; x=1719259023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmeUj+Mt469bmKZm8v2IWEIIRLOnDTCxs7wy1b/+0yY=;
        b=Y5pGbZATaYUvZ3gk2MBfkXi7xmEfBdQ4gILawINQwyUx+ClmQH3Y4LnbTkqGpWlZPn
         y2CLb1j6zgYjAjEJOWBLku1joQ4hkPt9xq4riWljzsCuc5I/AglRksSYeyaEy8kUdRtg
         a9lQv7tYv7K8x0u2oFBsg3QQHBrg/KOuGtxiHcvOnt4YEjhsimrVatQlyv5IHaFcRgvr
         O16zbVNT7tYtf3RxZvPMFPQTmzha5CBQ7V+4b7HZzmTOwHGUL2/CZuMj5GSFHYLhknHj
         ntCmIUVCNT2snnGI+NP+aI/1g0OsIaG7P7g5qYO0JNqWTlFzcN9V9ySZzjvrYPKP7or8
         6fDg==
X-Forwarded-Encrypted: i=1; AJvYcCUqIQJU9zOtoro3RKCpp6u+H95JlfC1o8MyGCUgKMvu/h7ym4yvRP/JavnD/4hi+rSMRf1xaXJrZeJ3BxnrdmNP+NLN1tM0U2D8
X-Gm-Message-State: AOJu0YzkwWRruynavlvvaxW4iLho8dmL9dfmbVJvguY0hqULKTBMHoj3
	Vq1o9CHwUaoT9gyN/pzktK+/VKJrXYpkPzvjbXfjBeIORLgJ9CafGtdvWsgK+PQ=
X-Google-Smtp-Source: AGHT+IH9/4+dyYRgEcg2XW0YZsCPFHofUrrtcRaTh4A/vWs1fUnHrGG4bfgHOAJVsjYkvqQ0ZI3+tg==
X-Received: by 2002:a05:6808:1b29:b0:3d2:2577:89b7 with SMTP id 5614622812f47-3d24e8b9416mr13595425b6e.5.1718654223480;
        Mon, 17 Jun 2024 12:57:03 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d2476e2fa4sm1579492b6e.52.2024.06.17.12.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 12:57:02 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: iio: adc: add common-mode-channel dependency
Date: Mon, 17 Jun 2024 14:53:12 -0500
Message-ID: <20240617-iio-adc-ad4695-v2-1-63ef6583f25d@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240617-iio-adc-ad4695-v2-0-63ef6583f25d@baylibre.com>
References: <20240617-iio-adc-ad4695-v2-0-63ef6583f25d@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

The common-mode-channel property is only used in conjunction with the
single-channel property. This patch adds a dependency so that we will
get a validation error if common-mode-channel is used without also
specifying single-channel.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v2 changes:
* New patch
* Depends on recently applied patch [1]

[1]: https://lore.kernel.org/linux-iio/20240607-ad4111-v7-1-97e3855900a0@analog.com/
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index 8e7835cf36fd..5baef30104dd 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -80,4 +80,7 @@ anyOf:
   - required:
       - reg
 
+dependencies:
+  common-mode-channel: [single-channel]
+
 additionalProperties: true

-- 
2.45.2

