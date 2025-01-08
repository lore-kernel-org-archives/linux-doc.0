Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB411FAC5E
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 12:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340588; cv=none; b=pXzN8fJFJFjVjaAlnVzRaxGJHUr5aVzRLChF2M/JBuawl67f/iYgzsKcq7IVvT0IEg9aBK7dzLiRA9Yi/F7AT9y0E3VpUU7/58myKt/ye/6bl8cvHZ8Sae8JcSg4AJi2l1FSrP6+vrj9jKPYOnGK02MxcYVqHWEmObfnQ83siZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340588; c=relaxed/simple;
	bh=KmGydHgNNLZRZ14xArcryaDxetquTR6NLcfmO0s4HBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FHa/d46zMGbKNou+u3hp5ZAwxuPnDks8zMv68yVWWFRYVEbp8crbUM2iCHWsGD3q8Iz+aF+PGd62LN6lEfUuZRdBy3B8hy++oVtFIJM+UH/nh60TZbj4pd6DGt2GErWrgifnSjQpCxyDlqTOzPR81qBSK+Z2iA2qKE9Hxp3AAb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=THSWOCdq; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="THSWOCdq"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-385e0e224cbso8364002f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 04:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736340583; x=1736945383; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kTPRHlVS1liPDPiJyJ4YA3l7fo0hLRRppQlZFlUkkhI=;
        b=THSWOCdqTN2GT162hlTYP4HGhcmUJrDQPK8bYWzWzB0a/pEwqye0tbZac6PMragmA2
         oCGiaIVJpZJ6XCVriCt+8YGoTk8n6suojogGkaK6VBplhRCMga3NUQA+ui+WsUx+F7Bj
         otskIZx93q2kdLGZsFACoSi3AUR9dbMapurV2lxv2cViKhj0DcURbbGJ4EYb3yXdQfqs
         KQmFu9NftRbLrIkfSjdLCdLvnoxYUYuxCmyGK5ueF+jr/GYXFSw0PoEP8vVe7WH+b/Qp
         a3PZU1s2WtwgZMd94cgOzyeOa/+OxRp98QkdWk6oa60Xkne77oevVAgBpJkqSXa1eyuR
         fZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340583; x=1736945383;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTPRHlVS1liPDPiJyJ4YA3l7fo0hLRRppQlZFlUkkhI=;
        b=W5NWn1qZkSwcND6qkko21zS/wHdJrx9ek9nV/NzSemTOR6kdukHSLx4wOt2QeccUze
         lVdkOJ6APUUhSsAmxBY5JhX/ew/ou4Ll8LzlHD0bc3eI/zfRBWWQvY6/BYJJc8MGq/GP
         obxhTEHhbzqRK5fpsq0HKK/7kO610nt+Fnd9C8O5RkM2JYXX0YanF4NktMZnr2AU4qQC
         /Wn04OzrMyiqezB1ubvmChwHFSL34wCPzUpYiq8+l8MLbwxfRp/BWPgaVfJy2WLcavjT
         1oV4H8vA2JRGJZ3Oe5EVPQAVCPRPrJm51R9GCIC52yFd1zxUPawCdoZsu8UfDFQZWnpH
         mTNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU313fvqEEK3gNO8Q+v8Fi/LRg9hkft1m4grxT6UUr01NwiuEbaeu8l6m1lfMXX7Z+7QrbYU7CcuB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZvrb5XV+c19wlzo1+ftPaueN+OtE8QyN7WRUYIzcGLmDFRzJf
	0M9vQRTpZEqjy00rkgdIYsju8bN5HYmmiiiA+ZuDsbmhQEYKlUsAssyrhC3oics=
X-Gm-Gg: ASbGncuNS6O9Xnfi0BbJNTzgu12hWB3J211N9jIRecz05B+4zyP+0whSGi3ALemqbc4
	WDLL0UG20Do7Fjq9+zSiYadXopn1jecMGKEP/3/TXjnZJXYIdgbchAaGwUOSXGxOcoTgJY43DRM
	tQtA4eLfz63hcvYnebIPoc2uNdquBkapPE+Q2YOHQtbmyuCzirG4Bg7//pg7lnDlPms+kudXB2k
	lIMvcz9xr/59GBG4P4FNGG7CuDHja2nELGNjHSOreBMtm8NIi0S+ce2t4WJ4O6sWDdelL7y2f+0
	uGAdA6obPdTGHiwnCK2vqCA86etZir0OvqFfIRN8XNvIhGfNM+l2jg==
X-Google-Smtp-Source: AGHT+IH2/6ZUjBDO77lZA0i6ON5WHfOGrSu5OgNDrSVHzUtHNMDrY0bgyO6kLF9SSUphC3YN0b80/Q==
X-Received: by 2002:a05:6000:4a0c:b0:386:33e8:20f4 with SMTP id ffacd0b85a97d-38a8731b9c1mr1951004f8f.59.1736340582772;
        Wed, 08 Jan 2025 04:49:42 -0800 (PST)
Received: from jstephan-bl.local (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da63eesm19846805e9.3.2025.01.08.04.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:49:42 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v4 0/5] iio: adc: ad7380: add alert support
Date: Wed, 08 Jan 2025 13:49:32 +0100
Message-Id: <20250108-ad7380-add-alert-support-v4-0-1751802471ba@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFx0fmcC/43N3YrCMBAF4FeRXG9k8tMm9cr3EC+SzFQDrq1JW
 xTpuxsVEZZFvDqcgfnOlWVKkTJbLa4s0RRz7I6l6J8FC3t33BGPWDqTILUA2XCHRlkogdwdKA0
 8j33fldQIiHUgZwOy8t4nauP5QW+2z57oNJaF4X3cxzx06fKYn8T9+sXSJLjgCKpqNAhvrF17d
 zlEn2gZul92dyf5tqTUHyzJgZtgGy99a4JX/1jqZVUgwHywVLF8IAGuxbqq/R9rnucbcfLqinA
 BAAA=
X-Change-ID: 20241029-ad7380-add-alert-support-4d0dd6cea8cd
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

Hello,

The ad738x family includes a built-in alert mechanism for early
detection of out-of-bounds conversion results. This series introduces
this functionality to the ad7380 family.

This is the first non RFC version of the series (RFC available at [1] and [2]).

Given the fact that the main use case is to hardwire the interrupt line
and according to discussions in V2 about interrupts, I think the best is
to not generate events, at least while we don't have a reasonable way to
correctly and efficiently handle interrupts.

Events attributes are still populated to allow user to set a threshold
and enable alert detection, so alert pin can be hardwired.

Userspace event can still be added later if needed.

[1]: https://lore.kernel.org/r/20241029-ad7380-add-aleyyrt-support-v1-1-d0359401b788@baylibre.com
[2]: https://lore.kernel.org/r/20241224-ad7380-add-alert-support-v2-0-7c89b2bf7cb3@baylibre.com

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
Changes in v4:
- docs: fix some nitpicks from David Lechner
- driver: fix some nitpicks from David Lechner and use helper functions
  to get/set the thresholds
- driver: fix reading the low threshold value
- add Reviewed-by tag from David Lechner
- Link to v3: https://lore.kernel.org/r/20250107-ad7380-add-alert-support-v3-0-bce10afd656b@baylibre.com

Changes in v3:
- split regmap cache commit in two
- remove interrupt handling completely, updating commit messages,
  driver, and doc
- fix minor comments from v2 review
- improve commit message for iio_device_claim_direct_scoped removal
- Link to v2: https://lore.kernel.org/r/20241224-ad7380-add-alert-support-v2-0-7c89b2bf7cb3@baylibre.com

Changes in v2:
- fix read/write high/low thresholds
- add reset_timeout mechanism for buffered reads
- implement regcache
- add cleanup patch to remove iio_device_claim_direct_scoped calls
- add alert section in the Documentation page
- Link to v1: https://lore.kernel.org/r/20241029-ad7380-add-aleyyrt-support-v1-1-d0359401b788@baylibre.com

---
Julien Stephan (5):
      iio: adc: ad7380: do not use iio_device_claim_direct_scoped anymore
      iio: adc: ad7380: enable regmap cache
      iio: adc: ad7380: do not store osr in private data structure
      iio: adc: ad7380: add alert support
      docs: iio: ad7380: add alert support

 Documentation/iio/ad7380.rst |  33 +++-
 drivers/iio/adc/ad7380.c     | 402 +++++++++++++++++++++++++++++++++++++------
 2 files changed, 378 insertions(+), 57 deletions(-)
---
base-commit: 5ab39233382c621d3271cc274d1534e1b687f4d3
change-id: 20241029-ad7380-add-alert-support-4d0dd6cea8cd

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>

