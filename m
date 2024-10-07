Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ED91D9586
	for <linux-doc@vger.kernel.org>; Mon,  7 Oct 2024 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315949; cv=none; b=qKgWkspNQNslkOtMLoplh0iWbSw9+/Xk8Ou6bdCSOoYeglderNdWY2PXerAkbL0Tlio9vyFhbc9QzmVROK06Opc01PopjMcLwtIcZ8CKuhGJ0o4ERl82AXV018wE4EegjBc4zKfNfMSkBpsvYoqfru85iUbygOcziLbhAL4rY3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315949; c=relaxed/simple;
	bh=adjIKONqQldQq+nYfRFYqYIa4peg7k+DD94EtLL12aY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hEiwPqVvNLtTZhjsMbf6apBLEedsy5j7GQvDb8GaCZ8Eh7a+vAQwhrwTVIFuW7m/5JO2UA5AdJq5pLxbzNnRtsllPcmxkZ/HbdNbRW8pel+dGZNMsX2L9xLzXw3Uk+Mke9InK/NHCNu2ja7AzgG+yOvT1+F0wDlbe5KWb96kuuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WgL9y4oP; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WgL9y4oP"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d1eda8c7cso916567f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2024 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728315944; x=1728920744; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IebLd9pybc2nbLozfLLDXz3gBz/LDqnDpQAr15l89v0=;
        b=WgL9y4oPhVU5CU2XRqENuOYDGZx91sIqy10aYAOdQfDY3RAKMGiNU7Z+r6hAaNpaWT
         bgTQQ6g4+JFyn/2PngLEMpYbJA2HBdleUsuHshZC8PnbBETWjvKic5YWoxOrz07E6lWi
         OUJTh9Ho6JniWBR948uP3g90DuziHpXZqqyhBHFGZqJQWiFnnKqfrAsNbsP1HYHaHlBN
         q/31zIW+++dp9XHheuFEhqRrSrEOD8LEwDjF9gGyFbmWVsiz1LWsl7IiUJ7AW/dVUUbS
         kS+ac37+K/SRbw+dhucBbKnF3KIm0r7HwlG8bEnBdmadJoqxZwGbCGuBmZW6aYtPujun
         d3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728315944; x=1728920744;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IebLd9pybc2nbLozfLLDXz3gBz/LDqnDpQAr15l89v0=;
        b=iW7FeY3SfDyKul6Az/a5pDHPgOoHLuvaViMds7g88IFtiwoL7gTNoh27YW+yMjs1Pm
         7vdVGdjI/5Z6Iyrf5qOvVn89b/PSYF0Cm1cV8gFipm0dsAqT3ojTWqFnx3I5QP77ZBqj
         GmVfApamNLhYTnaCXpf3oAV31ZHBIcnP/DnuP7HeT4VENeLCQ4SVEqtZ1NYr48ziKaqE
         K30Fm63vpA9GV/Cw8REVAGgSO9ZtnaJw0nrcJt9ETEwmdc8wtAtm6iqjhe67bnptFCHv
         eCC0gTTKXjpwsyQw7Mgu7xofDofAi50EUI8sM1XRvluKKAPTq5scPKUz4qLLY7e4NuE4
         frMA==
X-Forwarded-Encrypted: i=1; AJvYcCXR4xXHLePltkrOGvjsMs9fEVH+DQ3VL3j55+qye0jO8pK5sW5ClyetJmbsi798T5rMkfejAKvixAE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0MTafn2kUlt+xG7PW8K9m83ISRLmbcbhqE0Mr4NHaKF5mOdmi
	t9FyO7B9reKlDBb3ZFX4YFt/R62ejIRdsLUhm8jBCrF0KIy+cvzqkF/mnpuw390=
X-Google-Smtp-Source: AGHT+IG4xZiJ9Dxrm/XmWrYjYFc2ltp0HZl/BJIa/shgIDu3Ewcr2gbsH0yy3XGYqB+hqg8efWUjYA==
X-Received: by 2002:adf:f306:0:b0:37c:d526:9bb0 with SMTP id ffacd0b85a97d-37d0e76575dmr6868032f8f.35.1728315944069;
        Mon, 07 Oct 2024 08:45:44 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f9384f648sm17645555e9.20.2024.10.07.08.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 08:45:43 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 0/6] iio: adc: ad7380: fix several supplies issues
Date: Mon, 07 Oct 2024 17:45:43 +0200
Message-Id: <20241007-ad7380-fix-supplies-v1-0-badcf813c9b9@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACcCBGcC/x2MQQqAIBAAvxJ7bkGzMvpKdJDcaiFKlCIQ/97Sc
 RhmMiSKTAnGKkOkhxNfp4CuK1h2d26E7IWhUU2rlWrReWsGhSu/mO4QDonR9NaavlvWwTmQMkQ
 S/1+nuZQPlvh6lGUAAAA=
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

Hello,

This series tries to fix several issues found on the ad7380 driver about
supplies:

- vcc and vlogic are required, but are not retrieved and enabled in the
probe function
- ad7380-4 is the only device from the family that does not have internal
reference and uses REFIN instead of REFIO for external reference.

driver, bindings, and doc are fixed accordingly

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
Julien Stephan (6):
      dt-bindings: iio: adc: ad7380: remove voltage reference for supplies
      dt-bindings: iio: adc: ad7380: fix ad7380-4 reference supply
      iio: adc: ad7380: use devm_regulator_get_enable_read_voltage()
      iio: adc: ad7380: add missing supplies
      iio: adc: ad7380: fix supplies for ad7380-4
      docs: iio: ad7380: fix supply for ad7380-4

 .../devicetree/bindings/iio/adc/adi,ad7380.yaml    |  32 +++--
 Documentation/iio/ad7380.rst                       |  13 +-
 drivers/iio/adc/ad7380.c                           | 136 ++++++++++++---------
 3 files changed, 110 insertions(+), 71 deletions(-)
---
base-commit: 8bea3878a1511bceadc2fbf284b00bcc5a2ef28d
change-id: 20241004-ad7380-fix-supplies-3677365cf8aa

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>

