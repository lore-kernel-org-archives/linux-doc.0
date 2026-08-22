Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DDE31F9A8
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787384221; cv=none; b=R9xGoaUaVjS86tDM/D1oXVTzDee3tYAbrDJw10e0C7tiX5SOn1qsCKS8Ak004hgxGPablwj/HxnFXPI1ckNHCU6YzN/8cXgMA6afel4Hto2XiE4t2Xj3N/dcoSmlGCYnKWf4eqofc+I4tdOQSPLONL6GMPgngXC0LApPWr9b0dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787384221; c=relaxed/simple;
	bh=JP/ICKziAlQRxyOXVD8jmCPTlqlx8SIwSwVOqiEsO+8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G+NGIrf23TctWJXY+PqTw1h4sYgV7033i/fN2w5Do9kG3wCED9oynvZ+/RLxd5+/lxDtUNSGZ+QE4ya8lfIKgJtavzYqtKhroifSuM3gNJ0vTqcCt/Q5r7CP4hHVcS7LTpMd+wdI/R7zraHfRIkLq8fr7QJyYiTdW8J7UYEnU2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=he6/oqAn; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he6/oqAn"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c167aa9500dso279712166b.3
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 00:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787384218; x=1787989018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gm2rqy+lf4IbusjJqM8ChRMey6WJ6UyvAI5pxVcqLk=;
        b=he6/oqAnFtn8PpUP5z28WedAiIJ52Ky4DTkS0NPhna7IrSK9Z2UTza8XEg+2kGoEt7
         xCbYuDvhXSkuii5WSZyJ/KDgihgywWT24xzd27+zVt6wXrPFnSxHQXJoy4T4pETl4J1j
         YHCMf0uZYvjQlBJfuFQZTyW7PHY/PGbdo2B1PRulERvLaJ5a6WrRsu5eGSt/kj+mFrMp
         hurYL/ezWIe4Zzj0A52motYZLYd7kWZFw5FsC5xEzki3fXBnQ+lEkL0RXWptRr0WpPC8
         fQKSxcJmZTePaVvLyj0FL8b3z1ErVz//TZSrWuzmBqE9IIOVB5+TsCcbyRIQuJilfvtw
         ICUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787384218; x=1787989018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gm2rqy+lf4IbusjJqM8ChRMey6WJ6UyvAI5pxVcqLk=;
        b=HpM2qj9ICyhUi2vjMCV3wSB2OIe1TwexU161xJ5dtSGIPhfbW3K4NtRxWoTP4MdqWg
         xT6wVEg/Tur0mD/GVxfL3Wn63tiGHA6afDCPU3eVqnyDTuBXI6KBCcPy9E7BLDvA4sbx
         ii3q2rFquSMCkXVXuZ6wK96g3rNQVYxJSBXfMlN7bVqZN62aSG1i38fZeyT7G9NZWDKq
         M/PPgamHfUInRJIxlDJ42Q8V3s616qvjb2gxZE7f8X/mJBV0dcNBGedt3ZLZwxV4OkCj
         PJtpsOemHK86IlZA9/M4Cr5odWK5YkmiAoh3YVWJCYUo/OMPN10rOub1y+dMb7irRt7Y
         TJkg==
X-Forwarded-Encrypted: i=1; AHgh+RqOa/z0qzhy0DHC43/YzDQoACKGW0yr4fzavi9EogsVYNRp8+xr2ItIb0aj0z90+X8d1j40B1ozFiI=@vger.kernel.org
X-Gm-Message-State: AFuF++m8c9qHQYHapY92BxG/zXImivI+2LtIjMnx/ixl8Zjx1Z4RKwdn
	ia7FRv7RF9A/ky4Ok+uLFVgx9D4TQImvLMY5Igb6xiehNkPJcaXhmgzv
X-Gm-Gg: AR+sD12fFQmjDEJilLqOta34tBqy9goOUEKwogOD+AG9VO+zBUXX7MhPhvJ/Mcay2ia
	QbzUQkCwltpT1hl+Ja6f14cVnrQDn7O0jdMuvzHmgYZtlLQJF0PfGS1n/etvVnPefEDL9ykbHmJ
	JJd5U7ADKZqgtgHIObAT8Lne1s28twphqo2bqg35xJM3f9tQh0WUgvS9n3oHAhjuDuebTLQznYM
	uErY4+z19gNmA8q0CdPp0oRmU+GNjhKbj9kDIRT0II1iA4cHlK9yiVX4Rq3X6jV9AEaq0R+OtNO
	qAGTg9fPKvzoYPQJgFGbHoCLIgWh3VLo1YytA2ocIC/tB5JV9QKbvI/+OfH+eJ7W1HJGcel/h/e
	ZdPpTMXpHbPQAs7q4RlhloDv+/5fLaotgylAni1TQnIIbVISDo7Nt4fZNx01D6RSqLxYXY7XIbp
	VKc37O3H+IAVDSIoSCGr1XjEE4EJxaku7/bJsOwBhmmintgIiU8QxTWfdBklpjfr1I197xYCBXI
	CH6LndfaZssNTZ8eQysOvLzMhYkhoYS3erafJ3w7HZ4Gwb3ALgOP9aN8rMrM5rT2dfQhCIaN+dh
	fKpdjt2CuYxBHH3jru3jJnKJCvmmyDMHN7IJEjQAEKw3/SHWFWBsCvNyt52MaVeQKjQmEIqjSPi
	HlGZ1eGP7
X-Received: by 2002:a17:907:97d5:b0:c19:45df:1856 with SMTP id a640c23a62f3a-c246a675873mr1190754066b.17.1787384217744;
        Sat, 22 Aug 2026 00:36:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b208sm187084966b.10.2026.08.22.00.36.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 00:36:57 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Ramona Gradinariu <ramona.gradinariu@analog.com>,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: iio: Correct ADXL380 filter descriptions
Date: Sat, 22 Aug 2026 09:36:53 +0200
Message-Id: <20260822073653.54545-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The high-pass attributes were described as low-pass filters and vice
versa. Correct all four descriptions.

Fixes: b6a097a9af00 ("docs: iio: add documentation for adxl380 driver")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/iio/adxl380.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/iio/adxl380.rst b/Documentation/iio/adxl380.rst
index 654d4c0e84a19..a1c249dc2e51c 100644
--- a/Documentation/iio/adxl380.rst
+++ b/Documentation/iio/adxl380.rst
@@ -39,13 +39,13 @@ specific device folder path ``/sys/bus/iio/devices/iio:deviceX``.
 +---------------------------------------------------+----------------------------------------------------------+
 | in_accel_scale                                    | Scale for the accelerometer channels.                    |
 +---------------------------------------------------+----------------------------------------------------------+
-| in_accel_filter_high_pass_3db_frequency           | Low pass filter bandwidth.                               |
+| in_accel_filter_high_pass_3db_frequency           | High pass filter bandwidth.                              |
 +---------------------------------------------------+----------------------------------------------------------+
-| in_accel_filter_high_pass_3db_frequency_available | Available low pass filter bandwidth configurations.      |
+| in_accel_filter_high_pass_3db_frequency_available | Available high pass filter bandwidth configurations.     |
 +---------------------------------------------------+----------------------------------------------------------+
-| in_accel_filter_low_pass_3db_frequency            | High pass filter bandwidth.                              |
+| in_accel_filter_low_pass_3db_frequency            | Low pass filter bandwidth.                               |
 +---------------------------------------------------+----------------------------------------------------------+
-| in_accel_filter_low_pass_3db_frequency_available  | Available high pass filter bandwidth configurations.     |
+| in_accel_filter_low_pass_3db_frequency_available  | Available low pass filter bandwidth configurations.      |
 +---------------------------------------------------+----------------------------------------------------------+
 | in_accel_x_calibbias                              | Calibration offset for the X-axis accelerometer channel. |
 +---------------------------------------------------+----------------------------------------------------------+
-- 
2.53.0

