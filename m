Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC8E16CD07
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724076714; cv=none; b=pe63aEZxBjJFwRLarwqpy0yb7nX4SIJ2DCjyBRsM+rTA274z94II5bx1ipfr8ojeTitBG9DABz2flsLApCca64hKnh+p/ImttN98p03p/4maA2M7LYv3Qo4iyjNMhjydLvcGL1/LqYYP+sbKH0Jin6xb9wjGtGwZ51CL4eVm11s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724076714; c=relaxed/simple;
	bh=tB4PDDkW81CD/s79vLo1AJEusz61GZ1uoE/0QuJSDOk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ur0kNf0owV9H5CEYtzCTrG9V6mL8Q3KC0SvOCEy0NVgXPOXEuNcoTS/ulrhq4UPfxXGBjF7nsnjqKWTaJ3xF2cmILNlskTlqKl8Ana5OdoCSkRAw9n4Fl1ycRDG00ttdgDe5UGtcZ/xFx55DQ9ALch7nmWgymlFujwOqfCFZZ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=drZtc2Oy; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="drZtc2Oy"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-44fded90c41so22817541cf.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724076711; x=1724681511; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=evP3x4C+fRIeDF7JfvlYtCwz/QjijRArOrvvuEB+piA=;
        b=drZtc2Oyb7n/kZmX3gqpj6rLi+cenM1O/iZVSCg7uFMlkm9L61loTX/k57yiGnm77I
         0vr9eYUz7ro8vgy8ZReha+4evzKHHOvqkmZhUtgIgtjfCq3PgZgFS3wRA6teT5YMWrCn
         jJTiJCL0S1Jq5IlxpSO3+e/8RNHH9qzOqlJv8pETsPusZ/4WWxv6pnsEEQ6z5Nf4aFw4
         z/cqIrV5X35fl5Wycxq+zZ8ZyB/gjI7aoybj2hfR7rC5CFwmLnTyp13rELIUJmktD31r
         nqw/XXMQSKpMjWXKG2ID6EuvXhqsByjQ5VFtPBuULZzxMRL741tFDu0Dhb5VaIXyK1e4
         ckBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724076711; x=1724681511;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evP3x4C+fRIeDF7JfvlYtCwz/QjijRArOrvvuEB+piA=;
        b=vfM3LqHbaK5RzQzh8y3MY7M2UyZDxw/v7bqlM3HYURhWCkOsDrw6m3kWeaJcdvopAP
         5KBNoquoAAYEuE/Xj+fwB95Ko8EBpL4mj1DXalzqSEx5tY187UxJQByeFWCkvl1TOOMB
         +tdkde6hT0+F119Z4+lSFECWuh0f6Oz+QHBV5f124b+50e+taHtwOwxA7POY0kTfJVLH
         HK3+vhuO3rSz6Sfj+dZ2Yo79DKI6oS3ToTJ4vlW8H+0lSZWdZrDAVfvkATQ1MSs/l+9Z
         aDopSaID+1BQ/69eUpGRKeEz9HfmA4sgyvPYQ/di2BSj2f2k7scMDwVuk8irEKRkb4ND
         hZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuBV60IOFXyJ0C6+3JEGO90yO/xMilKX5XfUTq17q0Q3Gis3lbyEBhf40McFBq2luGAfa8Pcz23SaEXZpgrgHIqeMYS8fSQqJt
X-Gm-Message-State: AOJu0Yz/bQX/ogsYgQLXtixomJ6PPS9M4OEuySFOHsj2alz+HM+/WseF
	TmSbX0vFse7PxSqdohNJQ2XFMxAOymS5O76u7KMFdOQUf8oFor9vy+Qt7nVzp0RLJpzA2xseImm
	hF2E=
X-Google-Smtp-Source: AGHT+IH11j5ljDHQiPGDFjO8eAoF+5qTzbeZIySkNqlpz9g3PB17Frcm6NCKtRTZS0aq6PrTS47cQA==
X-Received: by 2002:ac8:45ce:0:b0:453:7706:759a with SMTP id d75a77b69052e-4537706a18dmr98282571cf.3.1724076710842;
        Mon, 19 Aug 2024 07:11:50 -0700 (PDT)
Received: from [127.0.1.1] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-454c0186bf4sm17630871cf.83.2024.08.19.07.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 07:11:50 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH v3 0/3] iio: adc: add new ad7625 driver
Date: Mon, 19 Aug 2024 10:11:42 -0400
Message-Id: <20240819-ad7625_r1-v3-0-75d5217c76b5@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ5Sw2YC/13M0QqCMBTG8VeRXbfYZnOzq94jIo56lgfKxRYjE
 d+9KUTS5Xc4/9/EIgbCyI7FxAImiuSHPMpdwdoehhty6vJmSqiDMKXg0JlK6WuQvBKdNAjK1tq
 y/P8M6Oi9WudL3j3Flw/jSie5XL+K3ChJ8oxKdOg0KGjqUwPjnZqA+9Y/2AIl9YutqLexyrGzG
 g20tpRa/MXzPH8AABwNluIAAAA=
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 David Lechner <dlechner@baylibre.com>, 
 Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.1

This series adds a new driver for the Analog Devices Inc. AD7625,
AD7626, AD7960, and AD7961. These chips are part of a family of
LVDS-based SAR ADCs. The initial driver implementation does not support
the devices' self-clocked mode, although that can be added later.

The devices make use of two offset PWM signals, one to trigger
conversions and the other as a burst signal for transferring data to the
host. These rely on the new PWM waveform functionality being
reviewed in [1] and also available at [2].

This work is being done by BayLibre and on behalf of Analog Devices
Inc., hence the maintainers are @analog.com.

Special thanks to David Lechner for his guidance and reviews.

[1]: https://lore.kernel.org/linux-pwm/cover.1722261050.git.u.kleine-koenig@baylibre.com
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git/log/?h=pwm/chardev

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
Changes in v3:
- Link to v2: https://lore.kernel.org/r/20240809-ad7625_r1-v2-0-f85e7ac83150@baylibre.com
  
  [PATCH 1/3]
  - Add gpio bindings header, en0-gpios and en1-gpios to binding example
  - Remove unnecessary comments

  [PATCH 2/3]
  - No change

  [PATCH 3/3]
  - No change

Changes in v2:
- Link to v1 (marked as RFC): https://lore.kernel.org/r/20240731-ad7625_r1-v1-0-a1efef5a2ab9@baylibre.com
- Include link to required PWM patch series in cover letter (missing before)
- Include new link to the pwm/chardev branch of Uwe's kernel tree
  
  [PATCH 1/3]
  - Rework dt bindings to be compliant using make dt_binding_check
  - Add "adi,no-dco" flag to address indication of how DCO lines are
    configured
  - Fix binding patch message
  - Remove chip packaging info from binding description
  - Move comments around to be clearer

  [PATCH 2/3]
  - Remove ad7625_pwm_disable(), call pwm_disable() directly
  - Add ad7625_buffer_preenable() and ad7625_buffer_postdisable()
    functions
  - Add devm_ad7625_regulator_setup() function, move all regulator logic
    to it, consolidate the comment blocks related to it above
  - Add have_refin flag in ad7625_state struct
  - Add pwm_waveform structs to ad7625_state struct for storing
    requested waveform characteristics
  - Refactor ad7625_set_sampling_freq() to set the pwm_waveform struct
    values in ad7625_state, limiting PWM enable/disable to
    preenable/postdisable functions
  - Remove redundant dev_err_probe() after devm_ad7625_pwm_get()
  - Use device_property_read_bool() instead of device_property_present()
  - General alignment and line wrapping fixes

  [PATCH 3/3]
  - No change

---
Trevor Gamblin (3):
      dt-bindings: iio: adc: add AD762x/AD796x ADCs
      iio: adc: ad7625: add driver
      docs: iio: new docs for ad7625 driver

 .../devicetree/bindings/iio/adc/adi,ad7625.yaml    | 176 ++++++
 Documentation/iio/ad7625.rst                       |  91 +++
 MAINTAINERS                                        |  11 +
 drivers/iio/adc/Kconfig                            |  15 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/ad7625.c                           | 688 +++++++++++++++++++++
 6 files changed, 982 insertions(+)
---
base-commit: ac6a258892793f0a255fe7084ec2b612131c67fc
change-id: 20240730-ad7625_r1-60d17ea28958

Best regards,
-- 
Trevor Gamblin <tgamblin@baylibre.com>

