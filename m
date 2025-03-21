Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4740E230BF8
	for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 20:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742589009; cv=none; b=RvIey+HCV01Ply31i9Gi5nAho9Ce1Si7c8gcZvXLZtoiRL1qa+CkMchDmgwLizmFxB6HUzhdqon2MSb4jVWbS0VZNyXzJxEfl/PTnVpeV7AFpx/oGj1TJP2B+JoGztZGRJPvLAyezLQ4FFPDRJyBIYb5hgEaC4LXGRulybJ52aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742589009; c=relaxed/simple;
	bh=PlGObf3FoFSVjLZ3+lkHVytXNt5oNV1sykTKJih/nGY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K+TUEwEK1CnU/MPhPkjKbPVzjs0y+XbpWbraMJM5RG1+6+uPu7TZf0aAidD644HuPZHRR7THHoU2cH5cuaNnWV2pfVE2VCxVB24GjsO1/31AtrNOzw8nuMod2Ho3/lEfyhqXfDJ0l1925iK3Lw4l7uS28G1AO8yT7svjZrx65co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HG/7pIh+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HG/7pIh+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso17874635e9.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 13:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742589004; x=1743193804; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D0lB23+k9X4O/rcO+siwkQMd1AepAsIgIgh1h0N3Brs=;
        b=HG/7pIh+UGrJ1vPiA+bcGEd9XkwrrJc18Qro3mnBfAX8Bf6N2ewUlT7aDKV7ArcetZ
         ccYidspGqMaBsELktOrO49nsBOlyG9Ej4gFewyJxUActmIJdWq8AVGolom652RQONhPw
         m4LTSi9TjT4DUzd7N5uBe4b8wjuQWFGdoYXLZNhCl4K1eGIuIjF3oBFKxBMHmmRYiBQi
         y67ecypptgTzyFfVXRs98xsI/+fbh/SOzkz6A5ghlP98why9T6+JvwueglxC6aOqOU+9
         ie7MX2V1NIfP+4xdXuAcB7I+i86p+FRXnmDCvEIMIxC2BSAdU1UPDyzD8mgL7fk2vVBs
         4AMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742589004; x=1743193804;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0lB23+k9X4O/rcO+siwkQMd1AepAsIgIgh1h0N3Brs=;
        b=oGd0/bwiCZIOew8bGRYzpitEciYhLSiqEfsvGOSxgiT78SBwolXSkzurkH/x+uS46l
         wK49TxQRMe5GtbdmYJcR9F/VYkcC2QfmcKxmXD+hGwoeKcYQU3K7DpQLWMNpon+2kAr4
         iAAYy66vikS3hpaPbTO0Ss880fOsZc4YOEvUaoQdEcSgY4V090qboHCtLxC+blC/H/F5
         V0XtderJYUXJkJiq0ASyMA5aD44hQJRLmD0mL28WxTGdvFmKds0Of8yaiZuSmca2aPEX
         14B4DUtBDjvaO/lVQx0SmjW27DB/t6ms0S/YDbRFuA+zH2+5PrF59kZ+oHJrQ52Rimup
         jhIA==
X-Forwarded-Encrypted: i=1; AJvYcCVXjkxvgGO9T10oY3sEjRUtd6xKXJEWyD1/BBEIzE06EU+qpOrKTCrRbzlMHCfOF1UpZPo6QZFK/m8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXswet8Szbhf0PiuJZjtFiilpfgnBNR4OBJfhMZ7XP8Du2r6L3
	U0MjEyu+6RQpFRaZRdkUpeTeriCAYbZO1DW6ZI27kc3cc2JgLDkVZj3r+dclyts=
X-Gm-Gg: ASbGnctx3v6OEpdxmZWlS/Vx0GE4o3vC31Hi6FjvZcg52J2hdGH2pkb/gh256nrbGky
	44RTx0+E1bks2RyaKPa7H5Sva6ZqqmrhuIaVnhBTgk18gEfdVFS7TAyNX9AQAHKy0gYAZohBnnD
	PxacMfMLG/F4BwoN7mBCafuUK6GQQfkLsNVE5qUi5u+ukkHqpFjGuIMLTvPOC7hK5eYHp5mbsXb
	+TNMeKDRSBhJY43FllMsew/gHNHJDWgnRdKoMl/GuieMG6KNkv87yNmtPC5mfT/Es2tfWivtIRc
	ca+VN61qWLzK4Rys/NL+mf5FgTrGpGhC8Z/a0CYkk7lE1uBoc43GCPj19O6fV9l8Lea2qLYDXKC
	6T7UkvjF4wCxYBg==
X-Google-Smtp-Source: AGHT+IGjVzjsQhl5rDbYi4VVK/fRtIMiZvFWgaXPd9JuriqnNE+STbPvOWFVdMkEYe4bCMacXf5xgg==
X-Received: by 2002:a05:600c:35ca:b0:43c:fae1:5151 with SMTP id 5b1f17b1804b1-43d50a4adabmr38674315e9.25.1742589004317;
        Fri, 21 Mar 2025 13:30:04 -0700 (PDT)
Received: from [127.0.1.1] (host-87-8-62-49.retail.telecomitalia.it. [87.8.62.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9955c0sm3258380f8f.3.2025.03.21.13.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 13:30:03 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH 0/4] iio: ad3552r-hs: add support for internal ramp
 generator
Date: Fri, 21 Mar 2025 21:28:47 +0100
Message-Id: <20250321-wip-bl-ad3552r-fixes-v1-0-3c1aa249d163@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP/L3WcC/x3LSQqAMAxA0atI1gY6Ol1FXFQbNSAqLahQvLvF5
 ePzE0QKTBG6IkGgiyMfe4YsC5hWty+E7LNBCWWFVhJvPnHc0HltrQo480MRjdNN1RozyVpAXs9
 Af8hnP7zvB2PT81VmAAAA
X-Change-ID: 20250321-wip-bl-ad3552r-fixes-4a386944c170
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2

Add support to enable the HDL IP core internal ramp generator,
actually managed by the adi-axi-dac backend. 

It works this way:

/sys/bus/iio/devices/iio:device0# echo 1 > buffer0/out_voltage0_en 
/sys/bus/iio/devices/iio:device0# echo 1 > buffer0/out_voltage1_en                                           
/sys/bus/iio/devices/iio:device0# echo 1 > buffer0/enable 

Activating ramp generator:

/sys/kernel/debug/iio/iio:device0# echo -n backend-ramp-generator > data_source

Deactivating:

/sys/kernel/debug/iio/iio:device0# echo -n iio-buffer > data_source

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Angelo Dureghello (4):
      docs: iio: add documentation for ad3552r driver
      iio: backend: add support for data source get
      iio: dac: adi-axi-dac: add data source get
      iio: dac: ad3552r-hs: add support for internal ramp

 Documentation/iio/ad3552r.rst      |  65 +++++++++++++++++++++++
 Documentation/iio/index.rst        |   1 +
 MAINTAINERS                        |   1 +
 drivers/iio/dac/ad3552r-hs.c       | 106 ++++++++++++++++++++++++++++++++++---
 drivers/iio/dac/adi-axi-dac.c      |  27 ++++++++++
 drivers/iio/industrialio-backend.c |  28 ++++++++++
 include/linux/iio/backend.h        |   5 ++
 7 files changed, 227 insertions(+), 6 deletions(-)
---
base-commit: eb870a5af7db1e5ca59330875125230b28e630f9
change-id: 20250321-wip-bl-ad3552r-fixes-4a386944c170

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

