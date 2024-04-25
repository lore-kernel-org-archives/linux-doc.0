Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A06149C6E
	for <linux-doc@vger.kernel.org>; Thu, 25 Apr 2024 14:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714054218; cv=none; b=CuZqxUlkMy9+vfOesWVS/oOwiUSPGj7crZu1RifpGPJBOsivdFpXLIU9yqBBghxlDsGjyUCM19mcziqCStlPCe4YU52nZlW2r4fodc1Y7PxfV91f7scm0Nwr89TthFFTwfzBIVViOgrr12Aa8PtiwmDn2aIeFftnq3OD1C2WSAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714054218; c=relaxed/simple;
	bh=PMcrQr7vfTZSRSNcRmkCpyQp7LWBnFY770gK/C5SUSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZtU3FtC0+FRYizaXcj6RxkiAiF+it9ayxPmCjMamuSAVBZYT1mHUTx4qbUwlS4JSA/Gln3HUeMGORAl0V8USHDBSkorkmtq104xxdNEYkqGnHj7z96BtjcxmYg1NYyg0ziTeiLq+0XkcVQR1JTlunajsA4BbTv9Fxc3yrnQH8q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mKpb3Fly; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mKpb3Fly"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2352cc0b076so416066fac.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Apr 2024 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714054213; x=1714659013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/EIvcYkNNA7uNCHReQKx+DoUp53lMP7MDiBbZ5jB3G0=;
        b=mKpb3FlyRk44HMN9uezQae6MeQSwZ107oJt0ulYJ5nBVmj4A3A7lp0y0WaaRQyVObP
         Du/eHRzlA/hviFHvjSYTxzdhVFydjLZMlihRhCFMYFsnxfWu1c8UHTf/VgVA1LY4PxMT
         eqZARisR0YCl8o/E7fzS3WFnSO6gzS84fxv2jlVGADiEfBUF6njP7By8HVzHiR5cQG+6
         F3LNAT1kg6vAfuURYk8v8SFX4k6hKBwtF5cBFjS9mxv1fhrsTxjlPKjzZjhbIwia21Lu
         UDadC7YV2P13PUcbfgye4ZT78SOFcyTjAYetKIR7AW+06T8qX4x7010+NniHYdgBWh4C
         EPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714054213; x=1714659013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EIvcYkNNA7uNCHReQKx+DoUp53lMP7MDiBbZ5jB3G0=;
        b=tummr0cZz6hG+he8E1JxDioDigUqw9Hz4xvuu2SHxRUOX2VjLcAOnwlhLpx+p5TZZS
         jvzi6AETWuRSEvDr6jCGpRVt97qWMSLhFvm0o5FDdN9ttqYNNmiocFq7jpPlfQS056Z8
         pOmSyvDo3U7tqmZUWmYohkd9J6P308ART9n/Q0iTaniBMkI3nkQjXtUyFJmjJfMS/iwQ
         bUxMuVKRVoyDd4U4yWuwLY4T6Is6lpBIi6Sk7+K+VMB1SC3LSG84D/OKxBVvYiAY9J3n
         bNAYITlkajrmtogfjccidygFzmNk/Emf9HXIjFAz8ry9LQyyWNT0NF9JIDZxcaSLD7Q0
         KwMg==
X-Forwarded-Encrypted: i=1; AJvYcCVurrebPFD5DvdzLG/mkFh8nm5gd8ohd0TsBb3mvLdwMbtB+ZuO55IAMfltO9yTwXilLPexFK6VLqguImVHbXZCUExkBQWPG70N
X-Gm-Message-State: AOJu0YyCXovKyN0B1VyrEi9QoCVXI315pemiOZso+QeLfA6KTg4GwDmz
	46PCEkrrJPkMynTflCZ1vS90QNZgMOHS0WoKBcnWGIeCSTyRdXJl80hPuH31DL8=
X-Google-Smtp-Source: AGHT+IGPh8BWqW4vel5Qzl3DF4uhNTmrKORgW/O0L3hxpcKmJ6L/waBufcrQ+V8+zzseyb0YDKubeg==
X-Received: by 2002:a05:6870:e408:b0:22e:b2b4:f00b with SMTP id n8-20020a056870e40800b0022eb2b4f00bmr6380665oag.39.1714054212707;
        Thu, 25 Apr 2024 07:10:12 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id pz8-20020a056871e48800b0023b5203fc58sm294786oac.37.2024.04.25.07.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 07:10:12 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/2] iio: adc: ad7944: implement chain mode support
Date: Thu, 25 Apr 2024 09:09:58 -0500
Message-ID: <20240425-iio-ad7944-chain-mode-v1-0-9d9220ff21e1@baylibre.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

This series adds support and documentation for the chain mode wiring
configuration to the ad7944 driver. In this configuration, multiple
chips are daisy-chained together in series via the SPI data lines.
So it appears on the SPI bus as a single device with multiple channels.

---
David Lechner (2):
      iio: adc: ad7944: add support for chain mode
      docs: iio: ad7944: add documentation for chain mode

 Documentation/iio/ad7944.rst |  30 ++++++-
 drivers/iio/adc/ad7944.c     | 186 ++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 204 insertions(+), 12 deletions(-)
---
base-commit: b80ad8e3cd2712b78b98804d1f59199680d8ed91
change-id: 20240424-iio-ad7944-chain-mode-f5c4e6a856f6

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

