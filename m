Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933A71AD40D
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 13:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722433688; cv=none; b=YGMNgVDOZwD5JkzE7bG4oPKJeniwZz4e1lDWexnXw//ynRSO97fWCNf5OklJgDw//K5jQf3YL9Y04WH+Y0u6ez49dFNN1U6WtrC9avGJuGEWeVNoQlqJrpCrHv1HNV/9S/gwEZmCl3hPcnaTTHHaLMu56uR383oqbpKEOi1EFwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722433688; c=relaxed/simple;
	bh=jDRgG/QLRcrZ3k33DG+HUit1LgtQ0AiJ4a37RlX/MEo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j63aRh8NHiuP5XykmydrHDXdl/BtdNn+IAW91fZndCxFKIR5kO7hwlRbA9V9cw/16Tcplk6lRJ3kWjO7f3SnpHZ3k8FUd+asN/l4vw1eQyYQdTOrGzjq9qgCjFozUFzgETcBtWl6nh7YX54jA5V+1cAa5c93FJRTox7nKNTokxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nwL1aMJR; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nwL1aMJR"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-70943b07c2cso2808853a34.1
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 06:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722433686; x=1723038486; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdRZF0zEVgJezgw1kjlb7+blA/W6S32stDzVeGft97I=;
        b=nwL1aMJRIMYI11TxcL0iw+A+yVDajClnIsgVIbNSuH1r6VmSu9/6xACu3BPdSqa1+J
         l35qlAHP4lrqIBRqkdFnNMTb10VTpqqnUed3Df7y/ZerRAOjpb2fobQoIwiZHk10Dc1H
         Xr6/Z8llBJpGg/vNozdRsikL7re54tv45zPs8A0gEzJbu22W2an6CMiUuFja4gLBC82E
         Takv2hd0fsqPGIau4y1wWEoIcA7NBUDqixFl0Jzoc/aJTPcONh5XqbiEbCY5rr9XSZrc
         22ajVsKWlEZD9sV33DRcVqTjtczX1szHhD1yOHIgmujxMPbDPx04aFTm4fhPMX5NQ5BT
         9tjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722433686; x=1723038486;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdRZF0zEVgJezgw1kjlb7+blA/W6S32stDzVeGft97I=;
        b=BKo7yG9/h18KoAHajAN2dRzrzhy1ye49rZ4d9xGKiovemVuWnrR8FHcMiV19kp9hyr
         voFq2J+RHftPiHJmKGHLqTgupBPB2cZjpS0FbjX8yMYWpGL1JCsyRdVoQbSM/Q/wFXn9
         wUThp87q8RqIXZaUbD00eGFria8I+v4nuaHbzg8lA+8gaZd61wt4Ytx2ACKW431ApRT3
         2/rvzJyvzXhJFVlIVC1iNDmD4Oyx3awgBIUTZgqmKiBTVEhrv/jQrkRibpCuM39Ix1AA
         mp0DZyngD05/5UFWUHbhRGAIODhKe98SV7zoQpK8MtSEy6ffrwoUA9oo/NpSn1r6sKO6
         E1XA==
X-Forwarded-Encrypted: i=1; AJvYcCXL0m7RLMYj4C0fBISA5tS1dZdXVFVH9j42PdOTEdf+N/uVXwtjQZTgHy3rXanBdhsQoGxSa9JjqsD9edjvMaNVNRfRhn/7MCVM
X-Gm-Message-State: AOJu0Yz2Vet4l5f3sbxVtuzf3tOK1cs/HfaNk6Q3RtPdNrRaycLie3er
	8TVa+Id4xuyVQ12SnrohePNSArXFSzZl9b7KjDq3rpBHZn1SUC1HUX1mD8xmPSU=
X-Google-Smtp-Source: AGHT+IFuGK3+GfRNWwUpwAOBceLvx7l5m5dsWdus7T/LXIS+gjchpPdFnIJvpqhgswgrT52cWnyV2g==
X-Received: by 2002:a9d:6e11:0:b0:703:5dbc:1aa9 with SMTP id 46e09a7af769-70940c18633mr14176869a34.13.1722433685650;
        Wed, 31 Jul 2024 06:48:05 -0700 (PDT)
Received: from [127.0.1.1] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73955ccsm746209985a.11.2024.07.31.06.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 06:48:05 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH RFC 0/3] iio: adc: add new ad7625 driver
Date: Wed, 31 Jul 2024 09:48:02 -0400
Message-Id: <20240731-ad7625_r1-v1-0-a1efef5a2ab9@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJJAqmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc2MD3cQUczMj0/giQ10zgxRD89REIwtLUwsloPqCotS0zAqwWdFKQW7
 OSrG1tQCtbOUMYAAAAA==
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

One aspect that is still uncertain is whether there should be a
devicetree property indicating if the DCO+/- pins are connected, so
specific feedback on that is appreciated.

The devices make use of two offset PWM signals, one to trigger
conversions and the other as a burst signal for transferring data to the
host. These rely on the new PWM waveform functionality being
reviewed in [1].

This work is being done by BayLibre and on behalf of Analog Devices
Inc., hence the maintainers are @analog.com.

Special thanks to David Lechner for his guidance and reviews.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
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
 drivers/iio/adc/ad7625.c                           | 626 +++++++++++++++++++++
 6 files changed, 920 insertions(+)
---
base-commit: ac6a258892793f0a255fe7084ec2b612131c67fc
change-id: 20240730-ad7625_r1-60d17ea28958

Best regards,
-- 
Trevor Gamblin <tgamblin@baylibre.com>

