Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA7732825D
	for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 15:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206666; cv=none; b=MWcAtQKk5HWZOlULsO1rJfbWw70Im5x9wp98jErWU83CbFqO7i/RDSQzushpOP4cK8C14CorKWG9wg0vDTTn5SVBtDkq+rZf5O+MRuCr1k81UJNaZ0rGFNrK1B9Fo+qgyRdEktnx4PpE4B3oJjdDLC76Gw7F+5Vd4wHJPyaY/BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206666; c=relaxed/simple;
	bh=mI23sdKdjfHrq229OZV9nOIuRczz+cpeb/6mgnKDCt0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jEiJYCFD9NEp+oJFERLlMXtKrRYRHVqe7eDz67NkrwnY/3abPhbFvo749EhlYapx15ZegkLG7Irwm7CYcObrYolp9kIJXygG8WQQxg7OJS9gbCmdIoUDGy0oQAbvahSJ8JU4UcUDO+TOax/VhqIYAKHcLemNnKzOSAcvseVcXJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X13Iio4r; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X13Iio4r"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5069ad750b7so18534011cf.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 07:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206664; x=1772811464; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IYCNfGI/wBJeh75yMqRB8p3GDB0aK/wV0WicdnppPD4=;
        b=X13Iio4rGHu3KCKPl4UlHdQQtFR8tNnPRH/Ms1hgk0QjjI2UE1R9grl9XfOAARurqz
         TVhjb+/zYT1KdlAeSdVylb2PKDfKJF9+IYYFVMLK5HafPxGolW5pDA8nofwPEDS8on3A
         k+h48SvpDHfR87ZIy/+lwx08dOYoR1t/oxQUDhRVMCJ6Aw/7VAEBtK/jopDkJK1k2E3J
         5VS5CrWnN/JyUpje9PTYNJf0OECxUh5sty/pAlKOd6JTqm8RTKXb+2kC/7DFyvdwhVT4
         vogNIuPQZw8SrB4Q7NGCTTQLL9pEi8R0lIVUkF9muu5kvbh2GCF42m24wXvu1zVKAf+G
         woYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206664; x=1772811464;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYCNfGI/wBJeh75yMqRB8p3GDB0aK/wV0WicdnppPD4=;
        b=DcYlHn1ovj80hjd8SiuHfpZNWKu0bkC5rGW+IdIGqP1o4x4xyNGw9tAA6ISs5dvO7j
         Mrc+GM8VpwZsciRIEBzV9+2uH6KxdQnMW1P+bB6XKTvin17Ea+lrj7EyLb+EHC7Q267H
         WMVdsu1xfuwlIfHv6PjIftUim4dNuLJrggpxGbUtr2qC2NoFUxNpv+gObpPLuThwLtI3
         XtMR9nPpYyc9qvoAD8qDDAPBDt6nemNxWNfY58U3TfqhmYjtMdIQrU+iv1iMqzklmi+V
         b3fcCYB78SONCEl54F8sEGAilJT9Zqo/nDxMqT0jKWbXCX4VSuCsxO6qd6V1/yJAqL1Y
         wDvA==
X-Forwarded-Encrypted: i=1; AJvYcCVtLFk9XS0ktOZSxjlAibW4We7d6/p99r9F06Sfv7LO4KpmwWKezpxjiSkBNGXREhaocYbXhOBTBV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAG3IWBnzUSvFAhnW+KKQJjcPNbuQtmMPrV/8pxazPwgZtgTve
	fFvo4vMbgfnLGHTwzlRcmr6NHB/KpKeSp2Tpbc2xZUs/Z8IXWqVeX0Pm
X-Gm-Gg: ATEYQzyTHYQf2ijymHaeyXo5U3Lh94LdAdNaCa1dJvOHJ0mE6Xm0cq2i85FbwMoMW9/
	urx3a7eTf5qrNMFel3GFT8awora/O2PF3Cd6kjAPNyU1dY+vRwMHZb+ptCMouHt4nUXqsebv7TD
	UcwH8gCtxp7BJqJ/Uktu/pcteFGXS1xjhf3uoPap6wdJpnfCUMSHL1SoV1duHVn5sCIU89YW5Nx
	mkxPM/f//zI2VjO8Rnrf6H96a4eAOXeBe6pGo93LjwmkRHNbdFjhKZiUa9Ir1zhjdLGhxYz65S9
	e6XdA60epYyRNiG7xOOBI8Og6CDQzomiF1ccY3OKk9C0cfnnCemWh3khm0mC2XcGgjZv9PaW46e
	TjtsBCMte1z/ggP0mlm48P5AtpAXvUo6d77aO8/Z7N1yEYJ0xDK6UUBsUkNdLQnmQfbqE0p8lYO
	lTeYapTI22QQCESXef8gAFwTV4vdZhqP6VGYGyZ/X6JQlq6xpoc6fM96KL6jRcJKZyk2RGI0Q+D
	lo8NDC0CIHrOlR5DPwdGjwZYeTDrouZBU+Qv9OrovBbtDv+7sTzcLpAgeEfz04Ne3+SfBilr/Nc
	4g1P9ELpfdsm3bv43lwa
X-Received: by 2002:a05:622a:182a:b0:506:2041:13bc with SMTP id d75a77b69052e-50752895c12mr33664521cf.55.1772206663810;
        Fri, 27 Feb 2026 07:37:43 -0800 (PST)
Received: from ammar-VM2 (d66-222-145-193.abhsia.telus.net. [66.222.145.193])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449be47dsm44501821cf.15.2026.02.27.07.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:37:43 -0800 (PST)
Date: Fri, 27 Feb 2026 10:37:41 -0500
From: Ammar Mustafa <ammarmustafa34@gmail.com>
To: Alisa-Dariana Roman <alisa.roman@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Docs: iio: ad7191: Correct clock configuration
Message-ID: <aaG6Rds7GAf9ZtF8@ammar-VM2>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Correct the ad7191 documentation to match the datasheet:
- Fix inverted CLKSEL pin logic: device should use external clock when low,
  internal CMOS/crystal when high.
- Correct CMOS-compatible clock pin from MCLK2 to MCLK1.

Signed-off-by: Ammar Mustafa <ammarmustafa34@gmail.com>
---
 Documentation/iio/ad7191.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/iio/ad7191.rst b/Documentation/iio/ad7191.rst
index 977d4fea14b0..bb8a1efcfb98 100644
--- a/Documentation/iio/ad7191.rst
+++ b/Documentation/iio/ad7191.rst
@@ -63,12 +63,12 @@ Clock Configuration
 
 The AD7191 supports both internal and external clock sources:
 
-- When CLKSEL pin is tied LOW: Uses internal 4.92MHz clock (no clock property
-  needed)
-- When CLKSEL pin is tied HIGH: Requires external clock source
+- When CLKSEL pin is tied LOW: Requires external clock source
   - Can be a crystal between MCLK1 and MCLK2 pins
-  - Or a CMOS-compatible clock driving MCLK2 pin
+  - Or a CMOS-compatible clock driving MCLK1 pin and MCLK2 left unconnected
   - Must specify the "clocks" property in device tree when using external clock
+- When CLKSEL pin is tied HIGH: Uses internal 4.92MHz clock (no clock property
+  needed)
 
 SPI Interface Requirements
 --------------------------
-- 
2.43.0

