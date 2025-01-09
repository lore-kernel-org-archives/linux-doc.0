Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B640518CBE1
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 18:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736448452; cv=none; b=G6JqN6VZ/MqgodsIRNeg4B6WmgBzKd7lIt7pBnUP15JlwRcel6OX62KJbCyij7L4oTXVhNZK8j2dxbhW8qm6LCcvT7IU1Bl98XTGHSfhxkbjC44uipUptoJV8syo/Zt9R9F19tXuU4q9Uv8NfdwlVR4RSePprS5AciQopuW83Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736448452; c=relaxed/simple;
	bh=SdHLgA6hMZWHMgsbotcJ+WvghAkLReDpXCVd3Hw1HEg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dj4ajn9iQ9jYCd5VIzx4/oRDZDFnT+eenmXz9SV2UEwrp5ebXwNpbt+YgwE4z9Hljf7ZWojmTCj6i1bppE1GMyhtjCBTdFa98rSDVFSmOQqb7EcD6jl2idFO+cBncRyCQzZwaOJMkUi1IigXIJJYGRzNgjtS8vcKc8vEY6M3JJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=n4IrSBhV; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="n4IrSBhV"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467a1d43821so18938151cf.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 10:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736448446; x=1737053246; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EBzfPU9gNZEbLc1BBci6q4AdbZIidQPUgRG2TRlPwYg=;
        b=n4IrSBhVmRxetI8s+H4hKi0ZYREVSuk8SC/OW2lWTBgxeOwmCkIjbUTStGhrDv4zLO
         hIKMqenpeYPha6mBXqtL9M5NmZvGJ1Krb3aChFg5ylVr1Oc8OqveCdD1wxr8M7D75UFW
         9aS+KoM/miz+NFKnkCV5wdK151ScRYbQAc/Z3thEgOEQc6ctO9S3CHH026cBCyJiiPyh
         pLRB89+FfgeITBYg0uDOEdrpGrXiwhglU0qudmYangScxIJNtu7pHUaduXnBOoF0DdDj
         LiY+ZLyM/bdjI/ZAGa3vksBBcdQIKgWGK5HtQrgqZgUM1npGIoEG+GIaFusfIozrQIz1
         e8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736448446; x=1737053246;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBzfPU9gNZEbLc1BBci6q4AdbZIidQPUgRG2TRlPwYg=;
        b=f6S71oewJbrlOvKFB62fmL7/1iWQjE4imgRdEJL81/Ex5AxcAhMtWz9tuBkj0KLwZ3
         iRp+v6YEThknaeC7IGkAFcCQ3OaXiuH/GCHWAJ0qoFDD0t3NWBsE92MNt/praLMdSD29
         MYHAJ4iT9WrLwvvuRU9B0ylqXk2VTJDxaWbMXmrMx2RCHNshqQd41FmOEC5ky+kLT4IT
         Jm5+NVtZw+MU5HAzFF9dyC1A19egFLbXFdPvXAtT3GTBcyUUy5phkbw+wfYtWKo4pdZT
         itHiWJ0wrlSydIK5BomPieTWf/mY8F0SBbtwhMQPsobZfsj5eIobnopSZD/vd6pkzFUl
         fHBA==
X-Forwarded-Encrypted: i=1; AJvYcCWacYXRlunaw2k3GOJNY+Fbf9tKKf2AMSqajSbRi/pDlFZl2AQslwNpCg5h2GN/JZep1YJ/DeW535o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMarfwLSPBUatWV3fOJn412bsUsTZ3Dow1iZYoX9/JzXc26XnP
	9B2qJyJbuuyUeu+MxLB8iVad8eumk9hi11b+4EAtq3Ue3IMcnZeexyf4eVg7x9I=
X-Gm-Gg: ASbGncvoVpuALcfl4H4S2hvYZ44vz5PdqJ5ptA24czOT2vOMjJtuCJSzcz/Ci66Q9IM
	wzZu/Hr1HKSW3oDfvJn1UvodX7wb5yJku9THn6s8VDA5vUkE7yk88Z22mwly4Re3UkzG4v7UY2A
	19NkYm58w9Gb/22hUyYoAublN/fEoRNVPKiQSbwp0URmLwUzj6DRhmdwa8qYVsRZfpwNLD31Us4
	Pf6ICT/lVtIp0XJva5ayn+P1XHtc0rSauyZ/rj2P9C69R/qjgDYwv8U7lM8jpgmf/Zh1ZxI4b7M
	vFG1rLZXGUB3T2ra
X-Google-Smtp-Source: AGHT+IHGX7Nrz9RlIt6zKZH3ez/179ERRbKkoOyF6dqrbwBF/lI8nHTn4mEoeT8UyPp04zylRgXEYQ==
X-Received: by 2002:a05:6214:468a:b0:6d8:b81c:ecc1 with SMTP id 6a1803df08f44-6dfa3a99e36mr65481166d6.13.1736448446627;
        Thu, 09 Jan 2025 10:47:26 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfade733e9sm1075596d6.82.2025.01.09.10.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 10:47:25 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH v2 0/2] iio: adc: ad4695: add oversampling support
Date: Thu, 09 Jan 2025 13:47:22 -0500
Message-Id: <20250109-ad4695-oversampling-v2-0-a46ac487082c@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALsZgGcC/32NQQ6DIBBFr2JmXRpAtLWr3qNxATLoJCoGGlJju
 HupB+jyveS/f0DEQBjhUR0QMFEkvxaQlwqGSa8jMrKFQXKphBQ3pq1qu4b5hCHqZZtpHZnsVOs
 M1tq5GspyC+joc1ZffeGJ4tuH/TxJ4mf/95JgnHHDVWPvdWP18DR6n8kEvA5+gT7n/AWYlyR6u
 QAAAA==
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

This series depends on David's recent SPI engine changes for adding
offload support:

https://lore.kernel.org/all/20241211-dlech-mainline-spi-engine-offload-2-v6-0-88ee574d5d03@baylibre.com/

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
Changes in v2:
- Removed section in cover letter about correct implementation
- Simplify math of ad4695_get_calibbias() in ad4695.c, based on
  Jonathan and David's suggestions
- Link to v1: https://lore.kernel.org/r/20241217-ad4695-oversampling-v1-0-0b045d835dac@baylibre.com

---
Trevor Gamblin (2):
      iio: adc: ad4695: add offload-based oversampling support
      doc: iio: ad4695: describe oversampling support

 Documentation/iio/ad4695.rst |  36 ++++-
 drivers/iio/adc/ad4695.c     | 333 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 338 insertions(+), 31 deletions(-)
---
base-commit: 0c6c3bf84f541fb4ec7097baf9eac10136f98c62
change-id: 20241217-ad4695-oversampling-2946fbe3aff3

Best regards,
-- 
Trevor Gamblin <tgamblin@baylibre.com>

