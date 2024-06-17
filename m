Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB04188CD9
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 19:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718654226; cv=none; b=Gk0qxcMg926YtN1RLvjGA+iJtmnDld5VC70VlCCRpTrnYmzJ5Cp78Y7Hi5SKBNRoH34YIOnRku/oKkcVJL/uhtbKcbD7Lbkrl8ZgyrUJfqrR9RinNR0Mex+BOIQDQ8d3ZoULUnuCezAjxR/hYVmyoGLBSDWpSPbhn9hxM73jW8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718654226; c=relaxed/simple;
	bh=s9reazg6TBFKFG2f9Ng//E/D00yIl1rxKSsErYw3Eew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eCxAh5oefmSePrw4GT0svW5iObDPAQp9YGoXDLJbd0ifhPnReHNfdKAkYeV4LRnz5o5Pj4SHw0Nk6cvZMWwmvtEDvooKC62rFHsTOQLnOLwyZElcpAAXHbeeKmL6QXF0DXHIJyEh8GoR0ZdlnCEBSCIw4h7wnVZLU0XSDpem1yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GxTWFREL; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GxTWFREL"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c9c36db8eeso2593431b6e.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 12:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718654224; x=1719259024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RjDdICWQ2oaGVdfAV4oGUq0PgukKKOkUbuScnyybVlc=;
        b=GxTWFRELaLLKTzFFr6cZ8EaHu+b2QDierAOHBraqqbQERWnB/IRBNU/vUAHlBXTGHe
         dqyz8GJIqpxqKk0LtxGt85+uyxnDUNCwcEWP/UXNNORLCtuLoy6PPMMDmOvhVjup1veM
         JvCwzQ4GCxaz90SPxMyY+GAwPZ9J2H03ymQrFUiDA/HK9oR/SRF9H4nnElHN8AmiJz09
         iDPOG5O5TQ66YerKfPX/1INMkkwsyhUe3X3VROd+ML+38vKFn7i87wIduxAlvSbxCrBT
         EDlRfKLew1SsidJ1PP8N7sl3YIAf2aX87dtjuTizSkXZ656Z/8oCb5IanX5CuSGRu5Wg
         FycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718654224; x=1719259024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjDdICWQ2oaGVdfAV4oGUq0PgukKKOkUbuScnyybVlc=;
        b=CndZQv4JhUygYiaqVSc3+ArjUkUqnvZy2QLXVVeoYgV0IUVu/+5fjXl61C9/r52Dub
         77ieFpOcZNXnFg1wOSuodhKtNIcP1buvL5JoMUvJeHhRM+3i/SYBOpEbtZhJqAbEvJCT
         qFWGo6sF6A9+oATr8jE24VZnHrlQfdbFeiAl647hFwJeI+uibuxuuNimZeuMstRKzteP
         TlxHn90j/C5U7BIXO1TA8awoiKVExhDl0x9EDsGp9zaiLDbdpFqcPItnBlwZBVS5e7Tg
         XpdYbJxHKIBOO17QrbfLDSkbTpMTXgIO7DuJK48eMBPaZswTMqjjlhszpbOve8BTV4cy
         UDAg==
X-Forwarded-Encrypted: i=1; AJvYcCXvmj5uzkI/E5CE4FatKRih9E+5wTo6RE7sIKQd4ZGt0RwCIL/agnpFfudOMr5tpMEhRerRhrAmWlavqc1ndDNe8+tQ7iWs8k7d
X-Gm-Message-State: AOJu0YxNsf7bVjs95NFRkVAf7y/qjl7VwhLV8ooyHhTk85jMn4a7Q3Yq
	qoa6OsCKF6endogZQ3XXOLyVacKRRVjQnLmuhMyISL8VqTXPgFfWJ4YDI16ZSpM=
X-Google-Smtp-Source: AGHT+IHhWGIOP5vCe5YhBqVWIz/2hVBesFqWs+uyjC79F4jfNKd28VX0z9aWhmbMQu5bKKCy8t8clw==
X-Received: by 2002:a05:6808:1910:b0:3d2:20e2:368e with SMTP id 5614622812f47-3d24e987574mr16129788b6e.40.1718654222424;
        Mon, 17 Jun 2024 12:57:02 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d2476e2fa4sm1579492b6e.52.2024.06.17.12.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 12:57:01 -0700 (PDT)
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
	linux-doc@vger.kernel.org,
	Ramona Gradinariu <ramona.gradinariu@analog.com>
Subject: [PATCH v2 0/4] iio: adc: ad4695: new driver for AD4695 and similar ADCs
Date: Mon, 17 Jun 2024 14:53:11 -0500
Message-ID: <20240617-iio-adc-ad4695-v2-0-63ef6583f25d@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

This is adding DT bindings and a new driver for the AD4695 and similar
devices. The plan is to implement quite a few more features, but this
is a complex chip so we're spreading out the work. To start with, we
have a reasonably complete DT binding and a very basic driver.

This work is being done in collaboration with Analog Devices Inc.,
hence they listed as maintainers rather than me. The code has been
tested on a Zedboard with an EVAL-AD4696FMCZ using the internal LDO,
an external reference and a variety of input channel configurations.

---
Changes in v2:

[PATCH 1/1]
* New patch
* Depends on recently applied patch
  https://lore.kernel.org/linux-iio/20240607-ad4111-v7-1-97e3855900a0@analog.com/

[PATCH 1/2]
* Drop *-wlcsp compatible strings
* Don't use fallback compatible strings
* Reword supply descriptions
* Use standard channel properties instead of adi,pin-pairing
* Fix unnecessary | character
* Fix missing blank line
* Add header file with common mode channel macros

[PATCH 1/3]
* rework register definition macros
* remove code structure comments at top level
* remove simple wrapper functions around regmap functions
* rework channel fwnode parsing for DT changes
* fix missing return value check

[PATCH 1/4]
* Rework DT examples for DT bindings changes
* Add file to MAINTAINERS

* Link to v1: https://lore.kernel.org/r/20240612-iio-adc-ad4695-v1-0-6a4ed251fc86@baylibre.com

---
David Lechner (4):
      dt-bindings: iio: adc: add common-mode-channel dependency
      dt-bindings: iio: adc: add AD4695 and similar ADCs
      iio: adc: ad4695: Add driver for AD4695 and similar ADCs
      Documentation: iio: Document ad4695 driver

 Documentation/devicetree/bindings/iio/adc/adc.yaml |   3 +
 .../devicetree/bindings/iio/adc/adi,ad4695.yaml    | 290 ++++++++
 Documentation/iio/ad4695.rst                       | 153 +++++
 Documentation/iio/index.rst                        |   1 +
 MAINTAINERS                                        |  12 +
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/ad4695.c                           | 753 +++++++++++++++++++++
 include/dt-bindings/iio/adi,ad4695.h               |   9 +
 9 files changed, 1233 insertions(+)
---
base-commit: 9ab0746278aff96c1a36fcaad22bee9e9d3b3bf6
change-id: 20240517-iio-adc-ad4695-ef72b2a2cf88
