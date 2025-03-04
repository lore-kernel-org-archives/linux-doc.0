Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FB325525E
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 15:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102056; cv=none; b=NMtAgaHhNSdVtVS0V/GgXixJ9Cv12gU0bll+HHHWh04ilmS9wH/15IKVne2HmlxusjdW/61VKye5ZGR+wWZUErCk9ZPIaCS663715iyX2tFVtHu28H/xqamjlLRz/xbKx2OU42S1UFgdM2xpeGwCU5MVTui0Mq/uLRBrVd08afw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102056; c=relaxed/simple;
	bh=QzL/6Jwrk5+OEZqUr5nej/Vdup/WUPqimuxioOMsDnQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c6se+X6rj8vh8S/kjFw37QOHB5LKp1RMjNBgx7fPCuYfF5B79+qCYm9a+YHM8Eoh5VwDp2QMFWpU0i1Tg8qqW+KOzlDK201jRijGUHqD5vYOG2hYtK1YQx5P5N3UWXexzqfeoKeqJ5Prwb8B0oo/n1dDSZ4HoefKNqyaQFmv258=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MdNMkUkU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MdNMkUkU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bcf9612f4so3233165e9.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 07:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741102051; x=1741706851; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2BLge0yQ5Ly7QiVOr8wvQ/f7AlfV4bu5713ouH8WzHU=;
        b=MdNMkUkUEt/CwfLUwMJNIKqKddQ/68vhhcSh6COrPzb8CbFHpLtlDhrd1MZZuc8NTj
         pRoY/J5d/1Y3X9G/jHzJFFz2Eoivjk3NecXbn3JvlKotLYslwrReEd9jgtv8CmpcPg4W
         5i0GfLDwxkThMngsi91P+FWKUaLGPbVjqyrmife9sRUE+U01EuufS5kO/krE80caF2wl
         g+Y5JeIrznFBQ+dLL5nBRDrHc+lqhgShVyFlcb9fNrA/SvB7+JbbQF09FmvL3P/PKkQ7
         hXlnyAvOK55Y7Ymy5QQJgl+2FHziXeLYfY4+MpVKhJt/pGoEpixcmuOtvDRGxkHGQvY7
         NFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741102051; x=1741706851;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BLge0yQ5Ly7QiVOr8wvQ/f7AlfV4bu5713ouH8WzHU=;
        b=Oz/Ew364/udICI29KGXEwwLJe8GmyUhzYoyUZ2xA+p4VDJ/Mq/+Q4CsdQ/jgOdIEav
         4mPjxcoaqV4ikDQZaDPGN2AsDq3x9O+vwGZ7AmEIyt2oWS1YhHe6irkXQYNUzVuyT5IL
         GGnqz5jLov7eYeIZgMCE5FR8/p+CksxU/30diNkulT4AccvmRdS7lE5ykwW+JGl3e6hf
         6uizlEopuNcqUMaHO1zM76dXneEGjZgbMTGnq74DDq0njL47UK73JHw7QDehnvWUTKrD
         5COsWsBkekaGFTbdSmc1AMMLoNtqdBEaezN/LhXwSu49SoKFXCZ6A43TJHlvAYr5gU3J
         OaNw==
X-Forwarded-Encrypted: i=1; AJvYcCXPn9+VjKoGResZ+fbHevy6MdCLb3NXWsnnngurxHwKVOUX+BGBJCir5L5JlhXh7E/Zr6gmjohPh0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YypRMflxj9hUcHTitl5Hi8ggmKPj1wfZzeJb6BI2jq8Sv9L3i0Z
	OHIj3geS1ZXAmgb0GeLmy7WrItGcYD1TdJg2m8zOIK/pqpyVvbFfWOJVlQB48MA=
X-Gm-Gg: ASbGncvhQ1A78jKqZaPxZWf0+W+REBLtAUXRtEl3Cm6BtfPHedgVuG+7kDyyBnf7HOm
	0gW0oDleQ4kQ3ortFpvjkSAZ1OAp3fSvIgTIZjxYzjUiPpQAl1w8oA+O1MdNHEezBolLB1I0zTZ
	wSYFdSlCU02QQpKO2rvm9Ppl3jrRmZHsyA7EzatGqlo0qMckuPQvtqJDHPMLvEi8q9SlLZFm5lL
	veGMI89FPVeUNw8wvG6pUlf+uWI3ZeY93hsqYhk6L6XzaKGQFWKx8miKYNvJFarAUklIfkBuPza
	PA0LBGb7u+kB3pQmIvcPJir2ftiNZv/7podLjx7gB/7d54vqCAd5klAFw+KzBmANYTnBFZgOyG8
	m1YY2bE07ZEMp1LuBiIOxs0IK5WB+i0OFew==
X-Google-Smtp-Source: AGHT+IHXqIP8MbjkxEqvoAMHolj2v2rUB0Dn2DUpOMoOaxKJaJO9yJDenmATL1r7UA1nkYXV308fzw==
X-Received: by 2002:a05:6000:156d:b0:38d:e3db:9058 with SMTP id ffacd0b85a97d-390ec7cb945mr14176368f8f.12.1741102051464;
        Tue, 04 Mar 2025 07:27:31 -0800 (PST)
Received: from [10.2.5.157] (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr. [109.210.4.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7dcfsm18245580f8f.55.2025.03.04.07.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:27:31 -0800 (PST)
From: Angelo Dureghello <adureghello@baylibre.com>
Subject: [PATCH v3 0/2] iio: ad7380: add SPI offload support
Date: Tue, 04 Mar 2025 16:25:43 +0100
Message-Id: <20250304-wip-bl-spi-offload-ad7380-v3-0-2d830f863bd1@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHcbx2cC/42NQQ6CMBBFr0Jm7ZhxsGBceQ/DooWOTIKUtAYlh
 LtbOYGrn/eT//4KyUf1Ca7FCtHPmjSMGcpDAW1vx4dH7TIDExsq6YxvndANmCbFIDIE26Ht6vJ
 COaraCFsW00LeT9GLfnb3vcnca3qFuOxXM//af6wzIyGJl+okXBmyN2eXQV30xzY8odm27Qt1g
 yMVxQAAAA==
X-Change-ID: 20250304-wip-bl-spi-offload-ad7380-ad675f2a2f5c
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2

Add SPI offload support for the ad7380 ADC. 

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- fix return value on offload probe,
- add documentation patch 2/2.

Changes in v3:
- fix tabs erroneously added,
- fix documentation syntax error,
- add a note for the 4 channels ADC variants.
- Link to v2: https://lore.kernel.org/r/20250304-wip-bl-spi-offload-ad7380-v2-0-0fef61f2650a@baylibre.com

---
Angelo Dureghello (2):
      iio: ad7380: add support for SPI offload
      docs: iio: ad7380: add SPI offload support

 Documentation/iio/ad7380.rst |  36 +++
 drivers/iio/adc/Kconfig      |   2 +
 drivers/iio/adc/ad7380.c     | 509 ++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 511 insertions(+), 36 deletions(-)
---
base-commit: b7508a5a672275694c2a1b09a5f491ca2a56bbcf
change-id: 20250304-wip-bl-spi-offload-ad7380-ad675f2a2f5c

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

