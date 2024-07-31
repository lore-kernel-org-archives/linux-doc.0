Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CF116CD03
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 07:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722409552; cv=none; b=oRyXT75h4bSliGpJ6hDSZISenzLCkzeOHjUbOBEhTtzmnjKQ2K+gBcxLp4c1SGIttzC+KwT68XpG+qnLdM5mX0X/MpsDpnVzQsMTaCC2Nettqpl/tfg7PM5kabG07MjLBCtv8UL64yQJ4uUS7wuzF8+L380pwlHr5E1QWkWmgJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722409552; c=relaxed/simple;
	bh=CVeeM9agMlhOuzB//PVeugDjFr+JlKm6KzovrQHMqX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXHLebPdptIzC+L98KbUqcnwBJ+iSyiRAYLbIcLNitffJ6pM87d/+hAALXY6CAgHcPtMc/eeytgfehkLfYzFhkTaT3G1fq20t2jaLx5qo276v3+BLwYLIrVqTk238d1l9no5HWGYJPaWuB6BwnrAuGvMrSMFZvBbGEM6EV7nisU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iSziX4iK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iSziX4iK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4280ee5f1e3so34247885e9.0
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 00:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722409549; x=1723014349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFCuIz7C9sKLND6RuCsZOq0lXreIYCfstfjNtwHxLOQ=;
        b=iSziX4iKBzQ/BtWR7pcIVTQ4O8pnQHYw0R85Zj1PUNfh7p3S2OKFggaKwkW4UYiOQY
         yUcLolZv/e4GkqTZtKbO9+uWUmAYGlGgQgWGR9YiO+N+YJA/621dQveMorlHNc69bccu
         wtLlA/NQWi+rfN9k7FAY3fMPI5zZzvwf3GCXtdfOjlPqU8UndERB2MHneenSeqdnnX9g
         WA2c2V7YykmTB5wm6//740qxmCczpvBtp438uZUuCeC0CQ1c7HKtGR0Fn14G9VuOYWJR
         6KPkFaSChq+FTZGMHDLTVAKpLMbeW3lRNVsJUX54x9uKPlM9tXPTH7gECeHr5uXNz336
         j9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722409549; x=1723014349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFCuIz7C9sKLND6RuCsZOq0lXreIYCfstfjNtwHxLOQ=;
        b=pUUs2oodpZ9albYBr2gU45o0jMQNzxsNbcfHVQGEn9LyD0Fvxi33S8EjJJJoxWmQvX
         XXpdJlwyuJzaU9pEboAh3mLWt8r2Q0LML1iDT/VL0PgvZcxeCRPLBR+Xz3W44G/Klh4M
         /ICkBAsNch17jz2yzH2K8upIVg4duO3a8X+9LguWmm1X47ScSkH8Gnlkg6xxVObFumPU
         SGYv0FRkwBxK+aUCArja4JIFyTg2HBLKNuk6K8GxVRozf/OYJF3p5yg8i1jQE+AXj93S
         ntsuXL/ebTkCGLv+oGj+G3BOVbgrOdMjrJusEE5FTAE0bzz0hYmsJaxCBc8Uo/WX1OyD
         v8gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ1naGOg7lhVXJyEVxqTYrPJP3xcxLj9Xh+g6LUwc/KuHWlLT91Q4+kZjrvLJkRl9qDj/sLTgRc4mC+c1lQ8I3utX61pyHeMq1
X-Gm-Message-State: AOJu0YyGSzQRJI35LCymX5mYqo4n1QyYcZUKN1ebDp3CsAgUcKDU4KiF
	EiduhIhc9XvFza+2pOExKlcbYpVzs0cCYm9jg9T04jkBXJi3kwqhJAWuEiYvX9I=
X-Google-Smtp-Source: AGHT+IGetKYVTW5hZ9jxdlylMXS0vLE2omCWqfpv9It70piPrSEHFmOVA4GtdWvPtzBnHg0b0GPogQ==
X-Received: by 2002:a05:600c:1e26:b0:426:5b84:86d2 with SMTP id 5b1f17b1804b1-42811da946fmr100643465e9.20.1722409549382;
        Wed, 31 Jul 2024 00:05:49 -0700 (PDT)
Received: from [192.168.1.61] (2a02-842a-d52e-6101-6f8f-5617-c4b6-8627.rev.sfr.net. [2a02:842a:d52e:6101:6f8f:5617:c4b6:8627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b8a2593sm9953215e9.4.2024.07.31.00.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:05:49 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 31 Jul 2024 09:05:42 +0200
Subject: [PATCH v2 1/7] dt-bindings: iio: adc: ad7380: add single-ended
 compatible parts
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-ad7380-add-single-ended-chips-v2-1-cd63bf05744c@baylibre.com>
References: <20240731-ad7380-add-single-ended-chips-v2-0-cd63bf05744c@baylibre.com>
In-Reply-To: <20240731-ad7380-add-single-ended-chips-v2-0-cd63bf05744c@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Julien Stephan <jstephan@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0

Adding ad7386/7/8 single-ended compatible parts, and the corresponding
ad7386-4/7-4/8-4 4 channels.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
index 899b777017ce..bd19abb867d9 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
@@ -15,10 +15,17 @@ description: |
   * https://www.analog.com/en/products/ad7381.html
   * https://www.analog.com/en/products/ad7383.html
   * https://www.analog.com/en/products/ad7384.html
+  * https://www.analog.com/en/products/ad7386.html
+  * https://www.analog.com/en/products/ad7387.html
+  * https://www.analog.com/en/products/ad7388.html
   * https://www.analog.com/en/products/ad7380-4.html
   * https://www.analog.com/en/products/ad7381-4.html
   * https://www.analog.com/en/products/ad7383-4.html
   * https://www.analog.com/en/products/ad7384-4.html
+  * https://www.analog.com/en/products/ad7386-4.html
+  * https://www.analog.com/en/products/ad7387-4.html
+  * https://www.analog.com/en/products/ad7388-4.html
+
 
 $ref: /schemas/spi/spi-peripheral-props.yaml#
 
@@ -29,10 +36,16 @@ properties:
       - adi,ad7381
       - adi,ad7383
       - adi,ad7384
+      - adi,ad7386
+      - adi,ad7387
+      - adi,ad7388
       - adi,ad7380-4
       - adi,ad7381-4
       - adi,ad7383-4
       - adi,ad7384-4
+      - adi,ad7386-4
+      - adi,ad7387-4
+      - adi,ad7388-4
 
   reg:
     maxItems: 1

-- 
2.45.1

