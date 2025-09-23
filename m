Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A84D253B40
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 19:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758655785; cv=none; b=TsYGlGKo7tOacCIKrtZnttl3bD5m4vYGS/fh340BtkexXUQeX9sYQmqsWC+XX0FtajDV+k5GpFd7AcBbT3UTxb2+gl7lT7KPtzyRm1q56kLFzfPOAqBCAINNzNTpTNNSbyuKFEcY/d496WsgjCix+K+W66eJrHg8WTle88Ou/a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758655785; c=relaxed/simple;
	bh=LcfSPyxliarsrjBW8KdLJnI/wfhzpiagpiOPZ9cPBYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QX+wFtThudG0EsO2Fu7GN9UmTfQq7bhvWByz1FPiW328yge6hmTIlqRXEAs06d3PNjigFbfeczrC064HM9sKwLj5byc+/ruAY3BjW6KyCSFXSQFdLUNS/3yBJp3pFRRbTl7itcWSGcfgrZAEhNarQGIz2DvNr97quqkgA4Hye3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyuQmoEm; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyuQmoEm"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso9712755a12.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 12:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758655782; x=1759260582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WKw5WBcdwThDcwNolMRNTEm2HBfxrHADbBhqF6TW9ZY=;
        b=YyuQmoEmdMl/gzsCYqMtNOcgrdj9MYbs8CeLr2XUPgZJhz8I8wBEbnKzmLm2h3dnus
         VLoHGVRdrGoVxSCt4gAT00uJpHdn4ouIVh28ZPROPIyKhHI3W8gVvvRSflPvaUeRsQyt
         8bJrm8NkO+p8XOyhiVA3vQwtAfiKBl49RiRSFu0DhdlHRBocq9WCBrr0z2Ey+oYQ/9+q
         Fb5V8F9tWD27sR0HjUk/6tBXxIcP0X0OPN7n2S1fwx1ZZfFpLdHyxbRrCkWPcZouHtAa
         iz1l19z9GzJuwmqNcy5wOCAyvykl++kf9TnOLdcpF64yZmpqbFZjQu3tsEXz9DX10QS6
         5GxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758655782; x=1759260582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKw5WBcdwThDcwNolMRNTEm2HBfxrHADbBhqF6TW9ZY=;
        b=rnAZEpCZmGdg8rInD/87oeqX4Qsh6YH227CT3mOKs1uD1/PmjGNmH8pDzBHPS36hLd
         20RzreHD/9ywkAnrrihQL+xrKawu/TkD5npfLgt+RXvsLyHsm64mdgZ1qlITKUe3kfgh
         P4oNmygbFMqJsy6VdV0kvqnXk+DfqbJlJZX76PXtsr/lUnNWUgvKJbCknRkB8q/WcFg4
         iFZcKHxXuG7xoy6Iqr9Uxsa/rk0gtwMD8Bfv5tuPnKGsyzpaJ7lgdhcpTBQPHKgdciHl
         7+stZjh4DzKw4rIGgZGXmH3vI0cAsfj158/o02OGMR5/P6vjhSnvPzq6q+aJjYtzht4U
         /5tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBJqo5hrCKWj0cuF5msWUCdHa3WhP2aNDATcEeLTdBiPH7m+yyUXbWwyTNw1dH9KtlWKBew2qogAI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw5usZshBgMGD3Z9qqyE+9KgoFFs7UY4X1+f8OoDfXh7es4GwB
	nZIz2uoXXaR8mCsvln9x1RLWZYW0iS+uOFn1QsZeRUu5l4ij7lZqo2/Z
X-Gm-Gg: ASbGncv877aibHsrT5LN7aYffsiukxc3hefG1M47OfFJForfL2qBc9TTWh0c/yndbzX
	Y6vOQsCXf5rO8fpYDLIOUPn7EjEjcuonBRxA+VBZTY2WNxgj6+/CK9xaGbXwUFKsjmk7fG5Az74
	ukXVwThvp+acZQZpUbNh+us36hLjFbo8LypqoKPhxeYVHYdjCN4zIQkKR79uiUiQrOelqlAVgn8
	X2uDtlZAELmIVZPGeQm1F/hZ2ffQWuMv4Q/G1eAGomaqn4oya0V7ntMzsgxoRBPCzimrVscCVZ+
	9tIGMJG2xMJ0xbHt1vjorIFq4QtQNd3qc77qnZlChm+aoOpRbPWKL6gMXL+yic82ZsjwWGhJ+9U
	fHsnMamgIeUsXHrhB+gKK3NkbZvRW2arXS9eCi0auTQU=
X-Google-Smtp-Source: AGHT+IGQZQoVuZFs1hNmyeu90pPHQt+clUVbl7wl8s1PrL/ZcHhNRHRWTlkuntkRS7bYFsGkeIHO8Q==
X-Received: by 2002:a17:907:980f:b0:b04:45cc:9d31 with SMTP id a640c23a62f3a-b302bd1dfe4mr340385066b.59.1758655781873;
        Tue, 23 Sep 2025 12:29:41 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b3ea:9c00:26e7:b56a:5a2d:1d72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd271f895sm1370710466b.97.2025.09.23.12.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:29:41 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] add ROG STRIX X870E-E GAMING WIFI
Date: Tue, 23 Sep 2025 21:26:54 +0200
Message-ID: <20250923192935.11339-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the new board and increases the ACPI mutex lock timeout so
that the driver works with the ROG STRIX X870E-E GAMING WIFI board
without triggering frequent lock failures.

Ben Copeland (2):
  hwmon: (asus-ec-sensors) add ROG STRIX X870E-E GAMING WIFI
  hwmon: (asus-ec-sensors) increase timeout for locking ACPI mutex

 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.51.0

