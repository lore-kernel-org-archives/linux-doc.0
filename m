Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56E9228CA9
	for <linux-doc@vger.kernel.org>; Mon,  7 Apr 2025 08:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016013; cv=none; b=kYPYgPyDb4qD7QQkZ799B56iEW6eKJIErQt9ZY6O0sQ5X+Kt7Ph+MotbTcR93i8peVnL2uJSi0iVM9Y2A80jbX1Hen8Q8hyQ6X05KNAbh3MByPy72ffJ/bLBkQLOwMaErwYyH8JEsA70UWzaA30KG5eLPyOHScO/MpoAUOdP6P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016013; c=relaxed/simple;
	bh=F2Qod7NABbhubiuu+bmx+zE/fhm/Yo5sMggxFose+iE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GR4KoBjkhtD5rvbIwnpsXhlwqZcHAuqVaH7pNW+S938zJnU9Bc29zffh5c26WIKL/bHax78qVzVzXoC8HFORCZGKiCfhCt82Dhh5A00/+DzMa/Nsd0S+eu02PfOB1L/zhVXRv/VT1Hjv/P9M5/x8lCV4AYWhhGJvTjXs8JNcF2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2geaPF+y; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2geaPF+y"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39129fc51f8so3230589f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Apr 2025 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744016008; x=1744620808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShsE3ZcbHwYaWyOB5JwD08uVlCnOZ4Y4zX0gXgP+EjU=;
        b=2geaPF+yGXDZstuPr3nx2VOxC/kJKOPfc3bBTu36efPt3ZC/DeG6v/oxer8SCRbCjO
         qpfIh8oE22SEA7nmy3zI2TPdCUof9K4sAj3O+vKYHUK46/eYaDGIMNWAR4aEAwSz67yH
         hFeEWkbKI85FWhJB23DpGonSjHLHmkpKO+solIg+vBmDGzchhHOyW4Y58DiQ4sHyDWgG
         dg1fJ1pnxoxhdt96qXJTmzM+iGuFqCOVInd+6m2zw6wy3G3VRq598080ZXW6NebbZQWI
         Jd+/MqukXCzH8D4CTbVuc6oJeMpyAfeQGrpp9Hlmm9wJ1CD6tgsJdpCkPb3aNz4pyZQ0
         MUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744016008; x=1744620808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShsE3ZcbHwYaWyOB5JwD08uVlCnOZ4Y4zX0gXgP+EjU=;
        b=asQameyf50lLJzrihckyDtARcMcAgSTjCC6qNCvVCpNdkLve3E9qXvIWo/o/9cP8kh
         nbPa96a01+0058BoOvdfjtUpT5OBUQbssBO9/T9wUPlpBfYYvnuM6IPbnSASWTU7cqOZ
         Op9q8DeNbY5E3zxEwmuOyv3y8o4O/BgDtsue5bGvkc32ql7owymrJy8siXPSlxrjnOjT
         fTLN17c2qYAtmAmInVovG2VUFDyz7rhITMrsPXMHFv/0/9cFpN2+eSuOlO3tDPeVyREv
         UNcvHQoLu3P+QlY5zDf8oR/pumvTppFAvWEPp8aU/hdG9Wfpw0E9UXV2l4bQNernXRKV
         oNDA==
X-Forwarded-Encrypted: i=1; AJvYcCXiZfZEJ/m2gbGPdgJ56M7TT0Sl2cDAuW0gA0M1VUnPNr++I24+DUI4awZ2A8mlkOLDXLQenoxbv6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh3O9TaFoGBZVgxMwxLamg1vv0RtVYcLwH1WIP+TzlFh/sTtAJ
	Etf+KQP1Lr/PcneKPxkegc/IaSAXY21wdzBWjiD5vi1FPip4f3yN/W02XB4eB8I=
X-Gm-Gg: ASbGncuEvlilf+NB0/yo/JZ+Y38WQlaMLe+/AQNLGaqFN0I/ipK/dqsCFVyELaFHOsa
	M6owJtdHAWZN/kr5XnFXbT8X2SOIpOijxUYRWntE1w8Z9abWWfY4zjUQMFemBIwyHYXwiQhTej0
	PfdVMqX0Xyh3xM6n5Z8CzM+d/DTp+JzdCwArwc8vqofIPabJ1e+HG72WlqZKZpSIc7dKCDauByY
	D1yejn1K8oJe5T20exdti4z4OP+2WztwWhGktXfV61L6CUPrUCRO5B5bZEoMn8Cpv+JJVJOqvz6
	sah+bVguGqDgntZbu2qt3BbFPGYrhqNjsDy5ZYsu1+9Xyf6L6NK9AsmxKEeL5jLLQLMdoiIvCYz
	5CDa6t2TgZtTjB0vdM2VkZg==
X-Google-Smtp-Source: AGHT+IGoWMikHiILCzQyxiICmyrDcYbMbBE2+CmSWIHKyocBHZuGsTfBPMzzPfYegK5uRlhusxUWRA==
X-Received: by 2002:a5d:5f4d:0:b0:391:47d8:de25 with SMTP id ffacd0b85a97d-39d0de67a0bmr10291358f8f.41.1744016008061;
        Mon, 07 Apr 2025 01:53:28 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3174cf0sm126966995e9.0.2025.04.07.01.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:53:26 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 07 Apr 2025 10:52:04 +0200
Subject: [PATCH v3 2/5] docs: iio: add documentation for ad3552r driver
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-wip-bl-ad3552r-fixes-v3-2-61874065b60f@baylibre.com>
References: <20250407-wip-bl-ad3552r-fixes-v3-0-61874065b60f@baylibre.com>
In-Reply-To: <20250407-wip-bl-ad3552r-fixes-v3-0-61874065b60f@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4191;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=K6IzTR+F1J2B1DTGHtf/OPY+ArUlb20kadSjMscdtUE=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/PMmGaUNurFfh9PrpW37czjvWpuGTdPnVhJqgiW062
 64pOTGEdZSyMIhxMciKKbLUJUaYhN4OlVJewDgbZg4rE8gQBi5OAZgIMxsjw/nW1/eLhLYsZJq+
 T6ptd7TwbYOgvKmHfbXtLqhsdr3wU4CRoeWLU/0dvc4rq5jPSjU5sj98dD/BLqgw9LNyouZhOz1
 5RgA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add documentation for ad3552r driver, needed to describe the high-speed
driver debugfs attributes and shows how the user may use them.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 Documentation/iio/ad3552r.rst | 72 +++++++++++++++++++++++++++++++++++++++++++
 Documentation/iio/index.rst   |  1 +
 MAINTAINERS                   |  1 +
 3 files changed, 74 insertions(+)

diff --git a/Documentation/iio/ad3552r.rst b/Documentation/iio/ad3552r.rst
new file mode 100644
index 0000000000000000000000000000000000000000..2af24cfe886f1f4c1b86ac679fd19b83635b6771
--- /dev/null
+++ b/Documentation/iio/ad3552r.rst
@@ -0,0 +1,72 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+==============
+AD3552R driver
+==============
+
+Device driver for Analog Devices Inc. AD35XXR series of DACs. The module name
+is ``ad3552r``.
+With the same module name, two different driver variants are available, the
+``generic spi`` variant, to be used with any classic SPI controllers, and the
+``hs`` (high speed) variant, for an ADI ``axi-dac`` (IP core) based controller
+that allows to reach the maximum sample rate supported from the DACs, using the
+DMA transfer and all the SPI lines available (D/QDSPI)..
+The high speed driver variant is intended to be used with the ``adi-axi-dac``
+backend support enabled, that is enabled by default when the driver is selected.
+
+Supported devices
+=================
+
+* `AD3541R <https://www.analog.com/en/products/ad3541r.html>`_
+* `AD3542R <https://www.analog.com/en/products/ad3542r.html>`_
+* `AD3551R <https://www.analog.com/en/products/ad3551r.html>`_
+* `AD3552R <https://www.analog.com/en/products/ad3552r.html>`_
+
+Wiring connections
+==================
+
+Generic SPI
+-----------
+Use the classic SPI S_CLK/CS/SDO/SDI connection.
+
+High speed (using axi-dac backend)
+----------------------------------
+
+::
+
+    .-----------------.                .-------.
+    |                 |--- D/QSPI -----|       |
+    |   DAC IP CORE   |--- SPI S_CLK --|  DAC  |
+    |                 |--- SPI CS -----|       |
+    |                 |--- LDAC -------|       |
+    |                 |--- RESET ------|       |
+    |_________________|                |_______|
+
+
+High speed features
+===================
+
+Device attributes
+-----------------
+
+The following table shows the ad35xxr related device debug files, found in the
+specific device debug folder path ``/sys/kernel/debug/iio/iio:deviceX``.
+
++----------------------+-------------------------------------------------------+
+| Debugfs device files | Description                                           |
++----------------------+-------------------------------------------------------+
+| data_source          | The used data source,                                 |
+|                      | as ``iio-buffer`` or ``backend-ramp-generator``.      |
++----------------------+-------------------------------------------------------+
+
+Usage examples
+--------------
+
+. code-block:: bash
+	root:/sys/bus/iio/devices/iio:device0# cat data_source
+	iio-buffer
+	root:/sys/bus/iio/devices/iio:device0# echo -n backend-ramp-generator > data_source
+	root:/sys/bus/iio/devices/iio:device0# cat data_source
+	backend-ramp-generator
+
+
diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index bbb2edce8272e7483acca500d1a757bbcc11c1e0..2d6afc5a8ed54a90cd8d5723f0dc5212b8593d16 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -19,6 +19,7 @@ Industrial I/O Kernel Drivers
 .. toctree::
    :maxdepth: 1
 
+   ad3552r
    ad4000
    ad4030
    ad4695
diff --git a/MAINTAINERS b/MAINTAINERS
index 57eaab00f6cb53df52a4799eb2c1afbbd1e77a1e..52bc56a9ee22c66b90555681c4757ea4399adae1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1295,6 +1295,7 @@ L:	linux-iio@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
+F:	Documentation/iio/ad3552r.rst
 F:	drivers/iio/dac/ad3552r.c
 
 ANALOG DEVICES INC AD4000 DRIVER

-- 
2.49.0

