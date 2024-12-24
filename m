Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1049F8C1F
	for <linux-doc@vger.kernel.org>; Tue, 24 Dec 2024 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735032880; cv=none; b=Bv3cyLQirgm2LeGzU4maS4ibXy5irEz7bh7oggS1q8akAhoEdpzTB9U7yARelEWaRPnlTDyhHGWMzs17Ldo57f9iSzrlloDfp2ydLC9pmFwlj/EcGouZ/wLFY5lq/a7JVWrWvOlrn/uNZDh315Y/f+Xkl8wtRUX6ee3eZrZQlLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735032880; c=relaxed/simple;
	bh=gTP11STaOambNCrfwCro80qN7oJiUElgow1HkycNbHk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sW2XZ70WhnS7edvOMzm4oGy8QkCLzh5wPcOaOtbZGTwPclDCQRLWBpifHckhhzDosLhHR8Ze6Pe2awQ5OwCBdLHwCSayh62FNswd/xE7i1xKCcHgMsTveRomn07poKmROf1MYl1PrD3Ee++0LtYGEdaOF8hnJh4gHVAjjeOPJV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hwXdpX9a; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hwXdpX9a"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-385e0e224cbso2691649f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Dec 2024 01:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735032876; x=1735637676; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N0Ght693j/xuIl81ogZ/rFRsFKJQFysaPVf5fimjLkw=;
        b=hwXdpX9aJZ5IbBsSfNkslk7hwGc27j9Y1L0Lmy6P6PjD1bfBy7bo5+NFgNQUxnJCSo
         aixo/jYbuPmFTJ9ptZH5ajKlJOv1SIQp6MWSh8/++ya+neqBRkQtvsMeALJzIR7wX74u
         zVUrHKsQVedsEAcxJ3mIoSaRpQLfj+MhnENHH2GYejVVsGgqqFSB7Q9Tor9r+X1mf5D5
         g9Cpy45tjl2nRsRbN2IiR6y/t7DGxZ/AeSKHF2O0tmyVG9bweJkr9CidWtZow6T+bY7B
         4VquAESpFwiWTgw06lDDoJuhLbca7IYRadf8O46mSE0x40wo2rY+CAeShR8DC6sVm8WX
         jO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735032876; x=1735637676;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0Ght693j/xuIl81ogZ/rFRsFKJQFysaPVf5fimjLkw=;
        b=seGKujTLqGKOHC+Uio4oLks6YKqMXteipio/X28jxpsgsp6qoIEGMxbUzoceWFWiPQ
         V+gmzoXd3uOEgdVwU+UoVCdYe3+vED4qf3tuXVL+WcuuAd/Q2kZwiQl9ANDTUBvIN1de
         c5W2iY3eHL7IbQF2z2vsH7wbXqIVA4zC1dBmJzCOlc68OFxJgwvo5HnNSf2kQRTcfcpt
         QF7KpGvE+sa0rq/OdvtAE/L7JvqaSGrs4GrLhyITGfjYiJK2IVhyd8hyzppyNdXWWyAp
         f+68GxNHgbwJc94Wivs559NLuarRKoEv4dlgvv5LBDiiUG9Va5m1yZG8w7dwfqPTbnPZ
         jo7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlN47HH9bTCdoKT7On/bWwFwQIhltcLfWaPFV09j3VoFgCEWRYBoxOJ/WcSqmBEtE+dd2raWVE9uA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+XdStkFbb+XPYsQjEWTbU9YukTG5i2bVNtfKzodhZJnBb6J4o
	TKcMglBqbGZqz+jod6T7EF88UXtabz3djA71U3zPFoPbxZvAIvBkmJHlUwwiwMT+rejRY8jzG0W
	RJxqTYjBS
X-Gm-Gg: ASbGnctHcvd6x/Eh5093HxWWwnZ1XaejYcezozzILbew8OqTk0vUBVJRLDXXfX1FAIn
	oObAu6JFAGQyVpXCKSyqa1jGuty3S3KK3QNOROXHFIVoUOPrS0e0aiwPjj36LbfsNt9sG5i2pE7
	H7Jt37P+IZUX9t/QzmTUb4CFve+7+bQR5mzpXcdVsVvqtRkW68y2QJ/5q7Vt+EtTFvsm/Dnm+zP
	AO1QuzjgFfAVk8MlUdwgh4UyV8nZaNcia/IqwrGRRBu7qWY4wfbQ/SyvNtCsGrN1wSsP/ctRnY0
	YNVk5nTjiohUm5QVedJAdPRV9i5ErysHml87N+ah4LKrhT9OTQ==
X-Google-Smtp-Source: AGHT+IEsgDxRPzkbXXtlK3VaH4Q+DJ6FgkizyiG5Fyr+eZyjLexw0tZrYi1npUGFdYkBQ5L2oJLvNA==
X-Received: by 2002:a05:6000:188d:b0:385:ebea:969d with SMTP id ffacd0b85a97d-38a221fb1a9mr13669120f8f.22.1735032876048;
        Tue, 24 Dec 2024 01:34:36 -0800 (PST)
Received: from [192.168.1.62] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a7csm160932535e9.24.2024.12.24.01.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 01:34:35 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH RFC v2 0/4] iio: adc: ad7380: add alert support
Date: Tue, 24 Dec 2024 10:34:29 +0100
Message-Id: <20241224-ad7380-add-alert-support-v2-0-7c89b2bf7cb3@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACWAamcC/4VOSw6CMBC9Cpm1NW1BKa5MTDyAW8OidEZpghRbI
 BLC3a1wAFcv7zdvZgjkLQU4JTN4Gm2wro1E7hIwtW6fxCxGDpLLTHBZMI15qngEZLoh37MwdJ2
 LmCFHPBrSyiDEeufpYT/r6TvcrhcoN9HTe4gz/eb8xNqG3vlp/WEUa/7/3CiYYMjTQ5FxUeVKn
 Ss9NbbytDfuBeWyLF88AGCr3QAAAA==
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

As a reminder, an RFC was sent [1] with several open questions.

Here is a summary of the changes made:

- I now have a better understanding of the alert high/low registers, and
  it is much simpler than I initially thought: users can use the same
scale as the raw value; we just need to extract the 12 MSBs.
- IRQs are now disabled by default and only enabled before read_raw and
  buffered_read operations.
- I implemented the reset timeout mechanism, as suggested in the RFC, to
  avoid generating too many events during buffered reads (this has no
effect on read_raw).
- Reading registers via debugfs no longer triggers events.
- The reset_timeout attribute is added only if an IRQ is present in the
  device tree. However, the high/low thresholds and enable attributes
  are always available. This allows configuration of the thresholds and
  alert enablement even when no interrupts are defined in the device tree.
  For example, a user can enable alerts and hardwire the interrupt line,
  without relying on user events.

- I added an alert section to the documentation.

- Two preliminary commits have been added to this series:
  - A cleanup patch to remove iio_device_claim_direct_scoped calls.
  - A patch to implement regcache.

[1]: https://lore.kernel.org/r/20241029-ad7380-add-aleyyrt-support-v1-1-d0359401b788@baylibre.com

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
Changes in v2:
- fix read/write high/low thresholds
- add reset_timeout mechanism for buffered reads
- implement regcache
- add cleanup patch to remove iio_device_claim_direct_scoped calls
- add alert section in the Documentation page
- Link to v1: https://lore.kernel.org/r/20241029-ad7380-add-aleyyrt-support-v1-1-d0359401b788@baylibre.com

---
Julien Stephan (4):
      iio: adc: ad7380: do not use iio_device_claim_direct_scoped anymore
      iio: adc: ad7380: enable regmap cache
      iio: adc: ad7380: add alert support
      docs: iio: ad7380: add alert support

 Documentation/iio/ad7380.rst |  56 ++++-
 drivers/iio/adc/ad7380.c     | 531 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 537 insertions(+), 50 deletions(-)
---
base-commit: 5ab39233382c621d3271cc274d1534e1b687f4d3
change-id: 20241029-ad7380-add-alert-support-4d0dd6cea8cd

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>

