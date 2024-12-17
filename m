Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106001D1724
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 21:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734472055; cv=none; b=dDlGX0575V/WVpAB8VwrP2lXvPk3IBcdYoZaGo9YYwtdBqRB7+9uYZjMYVrJFOM82t1HXwJZZrMMkIg0tmC0FTeaJ21CXlk1nho8BpgEc21Sfl/qSN0XSgjU7mOzaIIDA41aokYtiOLXrolcBnVpXiW5WdRKZLwxqp6Rg+RbS8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734472055; c=relaxed/simple;
	bh=9LBkbRZjR8OtDCWd3DaTMKnZFmldhuPelOwiNGPdPXU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fxi2spy1lqyPOKn4W2TdcJLypx1dwpvVt5E1C4XfXeJB6PXI11WBnpjcgTZezf0dn8sABwFhirmj5EeENG54R2suDdrn760YypvLniWZ9fs9gTaOHHzN5YBdoNL5gnGNEaiBZdYtxx8C0jItY9I+nB+my862loIdQe6Mo8RY8Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zf/dBjjv; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zf/dBjjv"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-46677ef6920so1427121cf.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 13:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734472051; x=1735076851; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7E616DPF2CInBFtwDOpZgMtLKnq3DIfHRsefh6j34i8=;
        b=zf/dBjjvgx3inKBocwKksUxiVakIX4FU9hXltC3GipfxVbLkFVHdyiqwQ/8/XZugdI
         IbSg6EI8PKy5llugXKEgTjA189uPiVektYBEqWP/rYn5njfmF9HRRCN/P9tHC72U7Mud
         M5tKKw8pEnfhY2lvLigYAB59ZR4kzrhynD2iycI7tevWbbjlgvQOmx6MU9znX0w886Ma
         Vrw4uotLsyjsF/PxmJJlzvK4vsdWm2ZPwCyOg/QFlhTcI4IZ1SsRzELTNjjbEzCyYGJ4
         k1qxiSr2BU9tSisUIRm7awlMeM0Me4TcMQtHrSibMr465nwBNEvnCRaOTR47Po65eSqZ
         rMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734472051; x=1735076851;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7E616DPF2CInBFtwDOpZgMtLKnq3DIfHRsefh6j34i8=;
        b=mNVAfufPZx/Dm71kTY2BCU3dpv7mBZ8zPWsNBqjKMnXz743XRc0kUyRuCERa3lKGNS
         +cx7S1BeIpPkzyGZWhWVbfdHdlrJlSX5gx7KfLhcRYQrfOl9oyYnqK3F0m8pzVkplOzs
         fSVKl/NGltjQN7Czpsz2fZHS76/fMc9qxnkpwi89pusaDJIaY9Q8F8ue9VivY0Eb0gpL
         5WM7x8B4zu/3CroquXq14HNRBqEhBwB0gcB9aZboPpm9IuFxV4+tCcN3KGPTKLfkdmKT
         u1x5gu6yaAaajY6EwqH/2SDjwXkk1ycTfSeG50C+ELFJSUgGNxGS3YWAFoRDNhhwjWK/
         skYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv2dxzZ2hxfkPu3Gdo59e3eUYMpiYx+Qkz3ad1KaKWubbSBPu4vSncJcQ2Z8YqVYIw2U/43jztPd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUfDXZv1uDwAg08vtl0gkaqsYREy6tH1BKFLRAod4Bj3AWEZTR
	RLKEl+iAidB1rTI6HV7iohBjZlcgcLTfUhUioQwU25/IWSAjPFL0lICbuONGgn79cnq1ZzHh33t
	q
X-Gm-Gg: ASbGncv5MDQKDYgPb9TT9ycVjmtyFSPTxTG22IPetDVvpi0BRqQyCqD5Itf5kGbH0hr
	ZZOd8r5ferDPqvKPtIYIJspXw3DVHfllWiniwVdSoJFNaA7fo8wJYJdsh7dfhlZ1KqhuldG9MYU
	2xhHruTndF9jerFLqFr9vBYBtOo5QN8Zo6o05dJBCvTcY/xbfEUigG5K8CTALOIFh1HNV3Jpdn5
	I4p/YXIZNiVhKsJqp8nYqTU4zMGuAJUh77zj64WTWrsHBoww8spzq1ic7BFjFmxFZ1BRxXsgkRv
	1QzGm1Uk4VnMNNTD
X-Google-Smtp-Source: AGHT+IGoYnyvG2Q7UWCGRRgjtVttlrB1QOCo98O5Isd/VOtrfcyapcvE7rNT79egsgGNsj+K7L6G1w==
X-Received: by 2002:ac8:57c2:0:b0:467:6d36:4c94 with SMTP id d75a77b69052e-468f8cc8052mr76744101cf.2.1734472050941;
        Tue, 17 Dec 2024 13:47:30 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2eccbe6sm43135171cf.82.2024.12.17.13.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 13:47:30 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH 0/2] iio: adc: ad4695: add oversampling support
Date: Tue, 17 Dec 2024 16:47:27 -0500
Message-Id: <20241217-ad4695-oversampling-v1-0-0b045d835dac@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG/xYWcC/x3MTQqAIBBA4avErBPyJ6OuEi0sRxsoCwUJpLsnL
 b/FewUSRsIEU1MgYqZEV6jgbQPbboJHRrYaRCcUF3xgxio99uzKGJM574OCZ2JU2q0ojXMSanl
 HdPT813l53w//XlrEZQAAAA==
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.1

Add driver logic and documentation for the oversampling feature of the
AD469x parts from Analog Devices. For now, this only works with offload
support, and takes advantage of that mode's higher performance to make
oversampling possible on multiple channels with varying sampling
frequencies. Some significant rework of the driver had to be done in
order to conditionally support this feature, including use of
iio_scan_types to help determine the appropriate spi message
configurations depending on oversampling ratio.

A dilemma that came up during development of this feature was whether or
not the implementation of oversampling ratios against sampling frequency
was actually correct. More specifically, it's unclear if the sampling
frequency attribute is supposed to be the conversion rate or the data
read rate (according to the IIO subsystem). If it's the former, then
this implementation is probably incorrect. David Lechner pointed out
during review that it would be easier if it were defined as the
conversion rate and that it was userspace's responsibility to handle
oversampling ratio, but that might also require more work in the IIO
subsystem. Two other ADC drivers that were referenced for inspiration
when working through this were the ad7380 and the rtq6056. The ad7380
has a global oversampling setting rather than per-channel, and the
rtq6056 seems at least partially broken because it only takes
oversampling ratio into account when getting the sampling frequency (but
not when setting it). Instead of per-driver implementation, these three
drivers might serve as inspiration for changes to how oversampling is
handled in IIO?

This series depends on David's recent SPI engine changes for adding
offload support:

https://lore.kernel.org/all/20241211-dlech-mainline-spi-engine-offload-2-v6-0-88ee574d5d03@baylibre.com/

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
Trevor Gamblin (2):
      iio: adc: ad4695: add offload-based oversampling support
      doc: iio: ad4695: describe oversampling support

 Documentation/iio/ad4695.rst |  36 ++++-
 drivers/iio/adc/ad4695.c     | 378 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 383 insertions(+), 31 deletions(-)
---
base-commit: 0c6c3bf84f541fb4ec7097baf9eac10136f98c62
change-id: 20241217-ad4695-oversampling-2946fbe3aff3

Best regards,
-- 
Trevor Gamblin <tgamblin@baylibre.com>

