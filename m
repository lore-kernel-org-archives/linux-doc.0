Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E4E22D7A6
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741628473; cv=none; b=hU15cWKggSdr5bAo8kEXOQFa+tEsRaFyVp2ndigNA70iix0hKfkkqCDAd1gzmT54jb6OmJXjeQl8tsaFpWW7xkDjaqPB5aMJ41up/sDLnxI159POSFN6teXa5yZBg/2xGtEo7EsX3Kf74JyA/0FjOpPrCDgd7gvzlvXkJ5nNZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741628473; c=relaxed/simple;
	bh=5CSaYIH6K+6YfU9gGc1n6Mjj0iU2j2bA64dxCEYv5ls=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dfiIja5DwOTaMFO+4fwbE+tkfWk3UiDrNfoW7iHgmaBqLK4HUWJ1gLSBXjOrbH5SqdlyRU1ws+Mp7x282mwT0NLEB6J0RGhu9TslnGS3rNi1YrPrxbPAoo7aSCbbGGVTBH+j2oQp0kcI6m6MDs2rV8zKnDV9G6qhgCssm5itqaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JLHhFmez; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JLHhFmez"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1482571f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 10:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741628469; x=1742233269; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=op0K5hQxl24cMPSQ2zXUerey4wk9VmfFfMkw2OmdMwo=;
        b=JLHhFmezIPhR8yET/sUs/4K5xmhFqI1XXyvtKUXs6sK3NvcRY2KvRTQcajoOgQwPts
         9ltIgDSqmrtNbI1Un+6JhLsX4FjLC34km9nDkPMRBtcY1cS1360H9zM79IsuKKgWNJNu
         K3TXiXWbE/KhukYOEpw7Kn/xXZdRmcFcJr+qy9nUDbyBy2CGWBuh7WNaBFSymD/UfddL
         SB8aUtqTKht3eosV3bexmnRX8h+G/Uoc/q+FhV665T4wzXRj8B09TJGoHKPSD4jQf4ql
         QS0w5xsA02TjjCd+a+fP1UlpmR+nUDdU+gZRcymDWx6HJ+MTiXxVX54jOXmU+aT8ga0i
         76Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741628469; x=1742233269;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=op0K5hQxl24cMPSQ2zXUerey4wk9VmfFfMkw2OmdMwo=;
        b=owh5meYEIC0cdewEoKIAdzRpqV/KBwW50Pw2pjcI3ytjJryvCfJoiHqimwpG3hmmb5
         VGwKGsruL8I49i2TK5NNV/TQDS6n0xl8UHQlY1OHEMhGHkygn/ZIiAC87criu142pr12
         JNLi8VjoPrAEa42hp9VP2d6fp6bAq8+PIpm3WtrXp31QFXQsz/FqlGWvib7sUpeik8+/
         YN7uRSAnZ7nPITtcKXUJuEwTOpXJcil9LZ9d91N7T5+k2eLdfyzrFMs0FMuDyFgGSoKJ
         f/q0k7ObRpUgG/NLYbmVrk/8wBnCBRyFsiwK6+aUTncwbedzKfN82swyUMfPCu2oVykW
         hP1A==
X-Forwarded-Encrypted: i=1; AJvYcCUpDQYlghawk4aJbkQ/0KrTatF+jsrs6GdlNf0R264Yqf2cm/R6hg3wufa9q4kVcEMbmE2xuIzfCKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLasYRchGwj5vc3qDrc+aoAoI55f/KFGNCq4A3wtNpeKC/B5jJ
	P3XxRO8dDPkarBO5tNxWu1SE/VTvrVfq0TA+tfA3QGKI3jcVe1If7uku9YdpYiw=
X-Gm-Gg: ASbGncugBTc77xC2Rk4EvfitLUYuvDiAT2DA3xezEwyCgZTwtzo6sSZz2QrSsta3H2A
	2fZwGxjzTAgK6ShPxT6KOT3zwEJTOoh+oXp1Pn1T+D+N4l9piNcu45W523sdqSKEsk7erlIhGRM
	cv+DLxRtJerYHTOFeUH9wXB6y3rmbKXd3MbiaEfsiZXnWLdmS3KG1MNOxZYVB2bVUSM/9VforZd
	SM3kaDfEnLRNLhzyzs9gAW/lPWuiIqr33kpukH10mW6fROdY4AY6OVxe6lCXkFHVlNNVnzKBQ1V
	y8cWuMmIvWivDFsJkl7JgPAXNZR86vev2LVsgL31yzPKQZfYYvIJDgouddvLVa5EmEZ1PyU+h9b
	0/T4VxL6y6Dxp2gT8Ix8=
X-Google-Smtp-Source: AGHT+IGOgm3gmY4DlSe83JHp94+rEh9KGfjZ9kZ5Lnuk2aRTnT7RJnoSabcihrFdfyLb9ivTlMczAA==
X-Received: by 2002:a5d:47a3:0:b0:391:329b:893e with SMTP id ffacd0b85a97d-39263cebb08mr668621f8f.5.1741628469264;
        Mon, 10 Mar 2025 10:41:09 -0700 (PDT)
Received: from [127.0.1.1] (host-82-56-170-15.retail.telecomitalia.it. [82.56.170.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfba8a9sm15597038f8f.9.2025.03.10.10.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 10:41:08 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v4 0/2] iio: ad7380: add SPI offload support
Date: Mon, 10 Mar 2025 18:39:51 +0100
Message-Id: <20250310-wip-bl-spi-offload-ad7380-v4-0-b184b37b7c72@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOcjz2cC/42NQQ6CMBBFr0K6dkxbBBpX3sOwGNqpTIK0aQ1KC
 He3cgKX7yX//U1kSkxZXKtNJFo4c5gLXE6VsCPODwJ2hYWWupFaS3hzhGGCHBmC91NAB+i62kh
 ovbK6s86oxomyj4k8f472vS88cn6FtB5Xi/rZf6qLAgWmNoimq6nVeBtwnXhIdLbhKfp937/DF
 SnpxQAAAA==
X-Change-ID: 20250220-wip-bl-spi-offload-ad7380-6f1c27cd815d
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

Changes in v4:
- add offload support to adaq4381-4.
- Link to v3: https://lore.kernel.org/r/20250304-wip-bl-spi-offload-ad7380-v3-0-2d830f863bd1@baylibre.com

---
Angelo Dureghello (2):
      iio: ad7380: add support for SPI offload
      doc: iio: ad7380: describe offload support

 Documentation/iio/ad7380.rst |  18 ++
 drivers/iio/adc/Kconfig      |   2 +
 drivers/iio/adc/ad7380.c     | 511 ++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 495 insertions(+), 36 deletions(-)
---
base-commit: 73b788d05b5bd82c40193165583a9dcad2d8410e
change-id: 20250220-wip-bl-spi-offload-ad7380-6f1c27cd815d

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

