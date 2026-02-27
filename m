Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E063876BA
	for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 19:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219318; cv=none; b=b35cV3NYNkqTyEADM8bmtprCyIwYBQTIm9TUpImgGTocgrAhhUpTOTzG33qaR0rsGzskGEMwWxs8B7yy4xYqFVTPHZdPXMK+DmjP1iheiuhZBOgflW1XQTFSHrZ4mVRFDIemFxe0pI+JmEOkk/Ov9b5dAbGIp7Fo+dKQpm1ZgyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219318; c=relaxed/simple;
	bh=589BKfYJnX0xBq2QFIE8KktMFxmjY0H22bxg8JH0DTQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t5cAQNmlCWSg6rApxMAzX00LxuDBOHum+imL5jXTLwOZ1+B2V/uT2MNqWGA+Y9BvegVRYI51BUMpmJeOkyj2GbvtJW9d1BHK9eCpDKwVOPQOM8qUcslSQIG7lxfOw7G37ds2sFb8Wk/S70fQcWAT56tDmvZjRn9Jjx9tNRUv+zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nd1swH3B; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nd1swH3B"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-506a67282a0so24790651cf.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 11:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772219316; x=1772824116; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3pUhkYNCOHcJIt/TwrF1xrDtMqe67JCJ7QQat4SlfqU=;
        b=nd1swH3BdQhLW1/u15z1HfZH/rqada5tGGq7Gj1cgztxdgbWUsHy/6tDKxuKCn6VD/
         wqUuFaMLdgTw0KarCJ9I6H4BayjaXXnbjbiOHpg6o83V35dxqFuFRt7jrOOTOzlNotDK
         oXyTvVGN+UjOXkCFmn3oQhI+8RLYITeBrR9cq4ISkPjGEodkE4M8SZb4A1gEZSxKdavg
         sVUlwEfi2z3LFb0kg/ejS06CV2hqxnNQVbLJ6o3rrodrBBkETZ0MYlZkrq9sRzylZm4P
         77Y//ueDVcoj87uGf6kbDQ3AoJdW/9ir5S/4PF1t3LAZHR/IZy2WdRgYfBw6RoMLmds9
         VRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772219316; x=1772824116;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pUhkYNCOHcJIt/TwrF1xrDtMqe67JCJ7QQat4SlfqU=;
        b=qugaM0p8Y/WcLFbXW6RJSG6YFOlUiQSJQr5ZbiMEsazJSIuc6WaCw4gyQiewh9aKrT
         pmZ05fxZBjxuYCp7zF4SJrofk/xwsP+h+A0uelCfd5fUC0dzYNWSX56q0sbIc5JFz9nP
         CaxYvZ207pBOI2wYORpSgBNkFSVsihkq2xvP0wkMSJRWRnsgf7cX6h/d+K58H/M7OqCz
         WV4TK+nhLuw3tc26R/jz3r9SD4yijD/tRLC/IHKw5hZChAaz8TLO74Boiz03RZaXlaKY
         Rcd8eMa8nQfhRu5SAEZkyS2NwIE0f78ZXR58mCBJcGPf1m6R5BqUpkMCpDjhwCF29TPf
         virg==
X-Forwarded-Encrypted: i=1; AJvYcCWsAiJybdKC3B+ORPG+d799G6jfxc6HNcN6chJ3ddUxG8pD0eZ5R/lRk5UqG3nEKIm0sYAXaqzDlLs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5kAX+O5cz+YGMZlR4oN+MKlwY4GqMLunkgpjcAARQJ062u5aw
	WCZCq95d1OxSSaFM0VGGY5Kd2R8+pJhbKpJdeU8JX7RzjxXZJqMnqVUG
X-Gm-Gg: ATEYQzxmpf65cdHRHdMHT23CQwKlVy5K80T2d6dWTQS9AljR8S/l8fu3mXjZJe1Xl3+
	fGDw/LAoUxkJn4lWMuFE0fJ5dkvIsTKFk79em71YSBwsk1xdeK79JhYXScRN37HrZ1X7HNBLVt4
	O17P/f9bHdJnXF6PwUhi+AfF9ZxHU7VOt4nIbQcPm8+RLw8fD8MGW8erUqFMNzTC9xIhCTenNP9
	oNF/cZmtsZFQiocqUUIfEEkgXl+5qnIfFAabI2EnzW4TNLuo79lHw8YHy2KmW3gil+UQgGVTiFv
	nnrmPafoG8Sdxvlax+iP9UKznOWLP1uG9OWg57DMfPeCoduTy1nD4zpDpYRnUGNLW7kUqw4AKqY
	PCLs2SwSXRKzVTw/GVp9aCJn+IfLsh7saO7l/NFR/ODdpWE4nbadEQ8Nzfxu2d4q6LGjnKGMpTF
	fwCNI3fZ9Aba0CXCXtULhpM21xnCr/OWE5aqiz+fXDhnWunH+YmKA6qt6wyAM+M3M4YN1U+CO6Q
	mWeovDfga+GGTXlwWF1RCp+FcfptEuioM40KB/8EYlH51RbqJDPnEXHwQ9gT/40U4KrpmEpciqZ
	6zPLCbxfOEW6lFt/Avec
X-Received: by 2002:ac8:7e85:0:b0:502:9e4c:266b with SMTP id d75a77b69052e-50752999d75mr47339771cf.42.1772219315950;
        Fri, 27 Feb 2026 11:08:35 -0800 (PST)
Received: from ammar-VM2 (d66-222-145-193.abhsia.telus.net. [66.222.145.193])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744acf0desm49676961cf.23.2026.02.27.11.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:08:35 -0800 (PST)
Date: Fri, 27 Feb 2026 14:08:33 -0500
From: Ammar Mustafa <ammarmustafa34@gmail.com>
To: Alisa-Dariana Roman <alisa.roman@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] Docs: iio: ad7191 Correct clock configuration
Message-ID: <aaHrsTS9iG-PEfue@ammar-VM2>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Correct the ad7191 documentation to match the datasheet:
- Fix inverted CLKSEL pin logic: device uses external clock when pin is
  inactive, and internal CMOS/crystal when high.
- Correct CMOS-compatible clock pin from MCLK2 to MCLK1.

Signed-off-by: Ammar Mustafa <ammarmustafa34@gmail.com>
---
Changes since v1:
- Instead of using "tied high" or "tied low", change to active or inactive
to remove confusion.
- Undo the swap of entries from previous patch.

 Documentation/iio/ad7191.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/iio/ad7191.rst b/Documentation/iio/ad7191.rst
index 977d4fea14b0..fd6a23ad44fd 100644
--- a/Documentation/iio/ad7191.rst
+++ b/Documentation/iio/ad7191.rst
@@ -63,11 +63,11 @@ Clock Configuration
 
 The AD7191 supports both internal and external clock sources:
 
-- When CLKSEL pin is tied LOW: Uses internal 4.92MHz clock (no clock property
+- When CLKSEL pin is ACTIVE: Uses internal 4.92MHz clock (no clock property
   needed)
-- When CLKSEL pin is tied HIGH: Requires external clock source
+- When CLKSEL pin is INACTIVE: Requires external clock source
   - Can be a crystal between MCLK1 and MCLK2 pins
-  - Or a CMOS-compatible clock driving MCLK2 pin
+  - Or a CMOS-compatible clock driving MCLK1 pin and MCLK2 left unconnected
   - Must specify the "clocks" property in device tree when using external clock
 
 SPI Interface Requirements
-- 
2.43.0

