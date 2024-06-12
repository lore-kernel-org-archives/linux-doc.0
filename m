Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E23C82C7E
	for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 19:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718220105; cv=none; b=FbQTxCbHiAt3+e90mB+wzqsIt41Vut9T+V5v5t9WR2yVBL4qUJUy4AKj8tn3e8z2e5VCnzPdwXWYFjFuhKqODOIwZMisyRz5M2wAEBiXrpSNIrZx+GuCU5K9rBkgh3oPzgvy6ZjeNEXXW6eCESN2f1RBEo6NjYyU2owl2xBSPdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718220105; c=relaxed/simple;
	bh=Uu9Gleg1ASn8Dt7yA/1zARp3BFz8u1dMTh4oQIDHX/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B6UeffxNUrkzBHHv1SLcoT94xOHkO493RttxcS4LE/zJ0wwgAtu0Jo/8dCdRgc0UePo1RexzZoyQkeMoXnUoJlfYD6P2TkaIpaAyoEK6s6WESY9nMzfyNxdu3rHfanU+cdqb7nUSl9sGUbMlFfoobtYoboAEmIVokD0oP/s2HyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KcKZGMtj; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KcKZGMtj"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3d22368713aso80297b6e.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 12:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718220101; x=1718824901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qXy7VIHll/aDTcqBYwLAggajOlv8GzK8EL/ET9q9bCA=;
        b=KcKZGMtjmLVLw4epSZX5OqQkJsCAg+UA7HPZq6UhQd1JWuFWhrAqXCr/ajHlAhWs9/
         eSR8B2v/5FMnnHCk/aklpVNhGJD5pAEZTxBjwUmSSUzcutRglcW+UpVGhce94o8vu28B
         9mckY/Pg11StuYVVBUI+ES5mgb1KzRP9/iGl7Ach+VZpKFPt52OflmtlIaXJkNgRhaSR
         ztvf7+D9D5VYTIWD5Q+tnsYByG61vX+B65+caYuWdajZGRAVYhhGWS3VyycJ4+qQQkwP
         LIN7GX3jU4pQX0bGtBO7P3henBTrzWxen/hk/tFa9eLr4fmZkmGMjoSdYRZJx9L/hjsx
         XPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718220101; x=1718824901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXy7VIHll/aDTcqBYwLAggajOlv8GzK8EL/ET9q9bCA=;
        b=ZGuYhLnSsOlt5haIFFUC0T4Q/RmSiqmmtg0iZYdkqPDfiW8+EzaR1oXUK4sXIMsjK4
         ftcRXrGjxHvazydtPqxY62sT2xCIj3TqyPf4OQHci/88KmSXUMI0UCvsgiXicDcg6zRA
         uBzyhPzNjwYU7Ue0m4h0Iae+8wWjxPVp0DrOjnNHYfYmo/MqZ6iSp2AGywQx9EHrFhvI
         4OAjGRpuDRISw9hp/ixIzhZfD0vDT+Hn+KzAAkSr8mKgjXoMj+zk2cJrDKFj5FlTwKlQ
         SG2QzCbYIWtKkR798HFtOGCZ/HnXprjVRsl0sxAXDQif4HfcpSOPQK4KSRQUt20xoepN
         X8nA==
X-Forwarded-Encrypted: i=1; AJvYcCWUAUxBPPK+69RAbS3hPaK+f1wUnh0s0niMN9OjLAma74TJ6A5AcCtRKyj2gzQzEom/Np9wrO98J+qXcSev6AwqrX77pRHpkUw9
X-Gm-Message-State: AOJu0YyYtyi+ZVD+G0MaFUl5BMpvzxfwlE03yJZgXJvAQHUdgyDk5r5A
	gUwweji06jdE/QyCcF9yAB18bPLKGZVnt1g2WXj5CrC5esatGaSG8cC+hyUsc9Y=
X-Google-Smtp-Source: AGHT+IFBYyiezdoccJIdyFcHFDAQu+3md5pmRIFWY9xx0C2Wc0lrAEmMqqvt6hKjm7tETzp01RmbeQ==
X-Received: by 2002:a05:6808:220b:b0:3d2:2c07:c8af with SMTP id 5614622812f47-3d23e02eeb2mr3374670b6e.25.1718220101047;
        Wed, 12 Jun 2024 12:21:41 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d236676bfesm648795b6e.12.2024.06.12.12.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 12:21:40 -0700 (PDT)
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
Subject: [PATCH 0/3] iio: adc: ad4695: new driver for AD4695 and similar ADCs
Date: Wed, 12 Jun 2024 14:20:39 -0500
Message-ID: <20240612-iio-adc-ad4695-v1-0-6a4ed251fc86@baylibre.com>
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
David Lechner (3):
      dt-bindings: iio: adc: add AD4695 and similar ADCs
      iio: adc: ad4695: Add driver for AD4695 and similar ADCs
      Documentation: iio: Document ad4695 driver

 .../devicetree/bindings/iio/adc/adi,ad4695.yaml    | 297 ++++++++
 Documentation/iio/ad4695.rst                       | 145 ++++
 Documentation/iio/index.rst                        |   1 +
 MAINTAINERS                                        |  11 +
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/ad4695.c                           | 804 +++++++++++++++++++++
 7 files changed, 1270 insertions(+)
---
base-commit: cc1ce839526a65620778617da0b022bd88e8a139
change-id: 20240517-iio-adc-ad4695-ef72b2a2cf88
