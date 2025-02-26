Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9CA212D8D
	for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 14:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740581428; cv=none; b=ok1zcEC+LHWPb0l119YHurU4Sij5nwlLSJqsLDJYDGqvYqVuH0yN6OPiX4B0y/1BFgvhFkqHMdueUTyHO0gA9xnJs1PQBf9nRBZoyHLE5gRoxWnwweHfr9OR+9Pvgoa+7pMnhnHELrtbHlXJMJpfnXBfUDqlXQCardktgxsUwW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740581428; c=relaxed/simple;
	bh=0+XUfchGDBDlyNgsEJQ6+K6kAggRr99F0prHzXAA7Jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LrPq/ht5bKEKnHQL2IjPYpGXMo1N/vuuu4bDTZ/OPt3BmoFCeidE/d4G9YMLHMYQ4UenarEKu79mbQP1Fq4sK9ZNmpzDtnGfNFG4umBX5jUhJOrnnVObncEv3kEngyJC4AJZpfjhclQjzCyyS5Hr/yuoyMjenXkQqp55Ph9kIjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fIvdXugX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fIvdXugX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4398e3dfc66so60818395e9.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 06:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740581424; x=1741186224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lS52Mn/qM2k2l7VX8UfktBsw1uLX5sdsUF4ydhQ29IY=;
        b=fIvdXugXsS/+oioZqUopDCPM3QaZraeqGmItnE/xEypLkrxWEmyqn5GBVZkWq3QIOM
         e2+4hit3wVMmUXRNRYsnX9TC4CSg9gMOcBUunGk70fGQJ/rkrJJbLDBJ9D9Vk46IN0DZ
         HHbpS2WCrY9j+y0P+3HH3CDhg/P4vyvdq127cVRkKpABfkydsjCk0U5XXjKFDDrikkgQ
         /D7MZxtKLOEHcQYSnS/SfE+tq3Z0KZm00e18G9KpJZDQKf+MTaBobiWKIbvUL6sLz4CY
         CYh6TVFHKukgJtR5tw3PBBx0b5YJixOFVqt/B5yB54neCDt8b2qLq4BoIKD6K54u2cXq
         cAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740581424; x=1741186224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lS52Mn/qM2k2l7VX8UfktBsw1uLX5sdsUF4ydhQ29IY=;
        b=WjwOdFBrxE9w2znx+TZhx/vLs0PP2mULsxO5KzyC8Z1EaCcdA5LoEJGCeVzJ3WBvV3
         ldcd0NvbympHBlDtu0xtNnSza0MeQI3egt/L93mUdEJ+qV1kDKyK7Kpi/J5uMpwG8TYD
         zFgL5FWe6mqQbi1T8TqcnJeEdhOk0opsUKelB+cLz3pHkbMkyXcTSCOS1oJBrroLzLh1
         8ax5Wj9e7s5htaHRSIFB6zt5hb61LDmMuQoamVcS3mtfxRaFhMVYVikIGfTLyr8RMus9
         YAZM+5ALpMpco8Bcv0wxybh/f9HQwjrntH+2RSICFRTyRFLNEk1WBQFZDBnQAluYrpoh
         L8EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPo/RhuB6iCoU59VpGsjTUsseMA29Ah0zSW+iztffVju5GBh5sdDlkw8wvSRVuQ8nDIdHerSGaKTs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpwqp8oDOGopb01ZWe0soMuRJb/+l5KWLKAw3p2uIiewnVOfLz
	FMHPr93ZgchLpBtyFFI2zZw3sabk6wZqy7Jm06kA/OHBDrPEFxC32LWTxUEefAw=
X-Gm-Gg: ASbGncsVIRbDDWGLtQwXmCvkh1NHs8pckgxRfb8MWwu5UGg25eP4iaDPcjAtSJGj0vT
	yGul/Cfxl4DPlD85R5i7N/N02kon8kTk7kx0ZJUlyrAl6t/SBrXZ9XP8mRNAwRn9J5SszNsYJ1D
	jXtfzQ1uqg0mS2qmDS2LAa37IpA+2jmkGs08ufTkwCo6VbZdANhQNbxQgsiBt+cD4YNkUSmYsK2
	X7pvT+YJjfXfpRqlpr/mTqHnS95PjpOiDKfoelVMGQkODSyTh/C8ozLPFDNGhBhG8ld+kzJnpVy
	DdRczkBUl9x35ICB3GFKlnVEAGjgtHdNO1eUmXKz0ClMCMZVGHtwLJ3h85MZqquZyXZ2O0il+Ul
	ezVyyhchbfzIYRCet609bDf4=
X-Google-Smtp-Source: AGHT+IGhXvt5BENLR9FHTRRWS32zA9Au7LcKHN1yHbaUpiSXl/h3VJo56DcHYz28lKEiLlwueTwZGg==
X-Received: by 2002:a05:600c:4506:b0:439:6e12:fdb4 with SMTP id 5b1f17b1804b1-43ab8fe90camr38158175e9.14.1740581424358;
        Wed, 26 Feb 2025 06:50:24 -0800 (PST)
Received: from jstephan-bl.local (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba549d6asm23747965e9.36.2025.02.26.06.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:50:23 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 26 Feb 2025 15:50:04 +0100
Subject: [PATCH 2/3] dt-bindings: iio: adc: ad7380: add adaq4381-4
 compatible parts
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-ad7380-add-adaq4381-4-support-v1-2-f350ab872d37@baylibre.com>
References: <20250226-ad7380-add-adaq4381-4-support-v1-0-f350ab872d37@baylibre.com>
In-Reply-To: <20250226-ad7380-add-adaq4381-4-support-v1-0-f350ab872d37@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

adaq4381-4 is the 14 bits version of adaq4380-1 chip. Add support for
it.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
index ada08005b3cd1ce7ba13f96484a33fdee0e83a1c..ff4f5c21c5482b77ee2774b01ad6d426e68cf207 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
@@ -27,6 +27,7 @@ description: |
   * https://www.analog.com/en/products/ad7388-4.html
   * https://www.analog.com/en/products/adaq4370-4.html
   * https://www.analog.com/en/products/adaq4380-4.html
+  * https://www.analog.com/en/products/adaq4381-4.html
 
 
 $ref: /schemas/spi/spi-peripheral-props.yaml#
@@ -50,6 +51,7 @@ properties:
       - adi,ad7388-4
       - adi,adaq4370-4
       - adi,adaq4380-4
+      - adi,adaq4381-4
 
   reg:
     maxItems: 1
@@ -201,6 +203,7 @@ allOf:
             - adi,ad7380-4
             - adi,adaq4370-4
             - adi,adaq4380-4
+            - adi,adaq4381-4
     then:
       properties:
         refio-supply: false
@@ -218,6 +221,7 @@ allOf:
           enum:
             - adi,adaq4370-4
             - adi,adaq4380-4
+            - adi,adaq4381-4
     then:
       required:
         - vs-p-supply

-- 
2.47.1

