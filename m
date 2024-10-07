Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E121DA603
	for <linux-doc@vger.kernel.org>; Mon,  7 Oct 2024 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315952; cv=none; b=Q/978P+TVHIJmxwWkaohtYa6CUvZfeYBxRCFCAY4FF+fz6Y7MtnkK8clEKwgJu+lVOup/VtQscdbkKTzYeZ3qQ/xL+jnlgyUpUaAy3MG9FhkM9962oYXuAak4RUpXsIWWoAS8jB7fvaEnaXWTklNgDHbeSgNYNaQGBMIeObxCHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315952; c=relaxed/simple;
	bh=ZXp2MaLpZvcOm5A1oxJOmpktuau4lw5UjykBgfjJO8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RyDd5r4M66HrCWkYVdZLbg7NWR8ciuReUsP1hlriKVfbiHk5FOJZ7v6lo75QtZk8XntFGyIBbILQRQB6hEn1Hs7eep4twYpWlN3bkmlCV5tdMbECGA4eroU5/rjpovYW0kpJT+mtzpBn/fPqDG51YVlQVtA2FTLj9Jh3J7NEcts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Wjync4DH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Wjync4DH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so46639645e9.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2024 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728315949; x=1728920749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojstTyg1pnZB23KdDSwZrfNu+xTBHe5+8ZL6KQWO5vU=;
        b=Wjync4DH/EE9HWUf5DMYu/ZeMs889KqFHCkqFGyxL3DeQE1FthjiSymS4G92anPZHS
         cybMUQj5p8YELZ8b3eehV+RNMiTFQHdMf2LmzFiZ1c/LYYKIh3BNu0raPgYATb3jW5DA
         peO9WwpFL2QJGGIwoic5BeYBlcEGMUNUloUqsX0/0/XnVlUf+hneqOUTc/m76zRem3Vb
         vrWWfnC/BArXSUF2H4CKu1KevpJVs231g02aXOdkY7UeIGp1UyoJg64zvcApzb72m4sP
         C1II73DJyyamgfpC+nAOdWV0zAdG06urJXGlVMbmx/hWr8pWxAVYeEslX0LcMsrCrhru
         DbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728315949; x=1728920749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojstTyg1pnZB23KdDSwZrfNu+xTBHe5+8ZL6KQWO5vU=;
        b=trwIJl2OfAu1bqhQB/Zl0PB9wG5HUDr7tur4lhn56xC8LXaxfUQOamYwPzkEHa8D3a
         XA7zn54a2YgEAUkpGMRv0xZTUJby9N5CGLIs4Ma1owSmLYkisw/RpvUgBJSwuzdh9NqJ
         zU6Q5obwYJOaSlZVtGTqNFZhKTB3Wlkfj2hGoCGOvJOQUziHX5JMEPRgLBp+hEc5hOX4
         dvzzztP9a1dU+ntXUC3UuPirAqEz7+LBDIn70mXxWczP60yiXw2lracr3YRLqjD10O8R
         +kAmERvNKdGpJ6GOCqfrQwig+yEvwDmnyg7wwSdamyPBtN6tlPaRB6A/93qCILeiZ29p
         avkA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ1dJsxEtQsaWynRpu8n80rXa53alXSnLLlmuMK44TgnwPbkPtKMBWFTUqTsPAPUp9dUc3utBOXj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYyFNzoBed0eGWq+1WSvnAZDMOqId8mlIWTUpD6BC0WjmrvgN
	zBJZJK2yPs3B9JKnwiyVR/zYGhWaJ/nDfhfv8NqGWPvWreijEN427MG6BoDTHmA=
X-Google-Smtp-Source: AGHT+IFkaUFrNKgpEhRj9y7Z751fJZyDqB9TXK6VMlRQ+6Ipso8Gpm2aKBbAueSQ7imOULbXRTfOOg==
X-Received: by 2002:a05:600c:4f14:b0:42c:b5f1:4508 with SMTP id 5b1f17b1804b1-42f85aea060mr88251595e9.23.1728315948973;
        Mon, 07 Oct 2024 08:45:48 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f9384f648sm17645555e9.20.2024.10.07.08.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 08:45:48 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 07 Oct 2024 17:45:49 +0200
Subject: [PATCH 6/6] docs: iio: ad7380: fix supply for ad7380-4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-ad7380-fix-supplies-v1-6-badcf813c9b9@baylibre.com>
References: <20241007-ad7380-fix-supplies-v1-0-badcf813c9b9@baylibre.com>
In-Reply-To: <20241007-ad7380-fix-supplies-v1-0-badcf813c9b9@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-doc@vger.kernel.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.1

ad7380-4 is the only device from ad738x family that doesn't have an
internal reference. Moreover it's external reference is called REFIN in
the datasheet while all other use REFIO as an optional external
reference. Update documentation to highlight this.

Fixes: 3e82dfc82f38 ("docs: iio: new docs for ad7380 driver")
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 Documentation/iio/ad7380.rst | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/iio/ad7380.rst b/Documentation/iio/ad7380.rst
index 9c784c1e652e..6f70b49b9ef2 100644
--- a/Documentation/iio/ad7380.rst
+++ b/Documentation/iio/ad7380.rst
@@ -41,13 +41,22 @@ supports only 1 SDO line.
 Reference voltage
 -----------------
 
-2 possible reference voltage sources are supported:
+ad7380-4
+~~~~~~~~
+
+ad7380-4 supports only an external reference voltage (2.5V to 3.3V). It must be
+declared in the device tree as ``refin-supply``.
+
+All other devices from ad738x family
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+All other devices from ad738x support 2 possible reference voltage sources:
 
 - Internal reference (2.5V)
 - External reference (2.5V to 3.3V)
 
 The source is determined by the device tree. If ``refio-supply`` is present,
-then the external reference is used, else the internal reference is used.
+then it is used as external reference, else the internal reference is used.
 
 Oversampling and resolution boost
 ---------------------------------

-- 
2.46.0

