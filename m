Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1254518FC74
	for <linux-doc@vger.kernel.org>; Tue, 24 Dec 2024 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735032883; cv=none; b=OIlof9GXQwNkpV21OgXjo/vrXg/ClSqK/nzczvLgADtZoyC9812KYPUN+dMwLO/nyVK1iPRzSwhoFuY5RJxQz/dA6337XY5k1qogMj5KKhLi7tumgbStBTVYmf17HNxMS0zD0ApH2OdYR/HvMnLzMUAge7Y74EgOafgEPOgQSFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735032883; c=relaxed/simple;
	bh=kSfw31r1V5uQjSD98r12a1K9VX6sZXrUEVT0pOUqXUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OBDWCbDndiKM1lewgMUi+v4nEgJKeOCMeke0E1JOQ6Jy4ElIWW/5JjsQzZjpGafvb2FgIyuWeZuYEgB2ecYpyw4tgu8mQhIQf+qDfofuidkEveQBfwCjLk1qj56YKcx5M/pp3WFIglEjIPfUCEkL8myS2ezvkg8YptRYRqIlO5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hMgg89VJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hMgg89VJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso33767815e9.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Dec 2024 01:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735032879; x=1735637679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHxfnHco609cw6bEt34RvlmgEA4BmkTtw1PkuvrIB18=;
        b=hMgg89VJFfdSLoQ6EhKxa9tBhfG/nJbolXDU6sG+4/rs8h0RvKxSy7yYDgVnyINm8e
         0hoteQZbF40WwtdxbJs9YqanMoUlB5t5CU7bSCNC6bvHgZY666WR2Zj5eD9Gtjv9vteF
         6Huc98CxQaKh1K5dClTNZq9e3YteGNlv5FyomgGwjaS9WbF69NleKNuuZG784WRhw6kL
         ea0ZgJ1Z2Sq65YV22j3M/xWWnMLEDClKFR0+2PDMfRDSndemHGwuFuL8u+ODYGx0gOGY
         U620eWEMVABRr4y/0pvcuCFSHvAe74yAodKm+8x5uqrl8nqrxxe5GulAFaV8kJjRVcwg
         pnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735032879; x=1735637679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHxfnHco609cw6bEt34RvlmgEA4BmkTtw1PkuvrIB18=;
        b=kzD5Q+XvTsW3yYiNFZmqsuC6GKO/bNfkagbbjxog50sHR3r3WLbd5JtCwcNwk9D3DV
         ngh6vhGjMAJOG7L//YSGE+Q/Nj1LAqha/aoGLqz0DRwXMxudqU0NXQL+ohjLMmpGI4DS
         TnZFqJ/nnehCDPblaLsDfpmInNlHHVyzqVSEFtM0GtyVn5KvXGGOdZQ5OkK3tGEDBYVc
         jiiunu01ElzCAO6pJ71Ra0BTGMzuTSjZ5zkmici00Y+K2ysj8GXxsJLqRFrth6PnQ8gH
         18A68HjEl/oz2rkignjSsGO7JYH6kRAhGXJjyAF4+JWwlXm+2OUdyFW8Ywahvv++af5K
         S3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkmf4mE5jTd5PwyjKlvGYrgjuDc1SXwyIyjvbhbbNBK/vrOF+ypcMpimsd5WGignqECjVAS4cY2yM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHJ5vfKht72Vvnwzhzo4JVjAolRkKxdyIEDlYUvaE2+Ge/Fl1H
	RzBxEGEa5ffhYucsGdVlFgi/hbXkIhVJWMOpEgjZLBgq8VEPIlqaTkuE+Oj5Hpw=
X-Gm-Gg: ASbGncs5f+O3qZkHoo2zxLVg7v6MdVH3EAuVFbfD6/qRfgNDCCp/mPSnbSLvX1Ig15o
	39l24Pog626wubtMApGMbOYNZNDEgVu/URmAkoB6zbTp3PWT59NHwVvw6Hgy2wwYtt8dALTLigA
	W5ZZ+/136Lvlf8tq4T4Vnw07tA3hqXIlHd6p2ZQEBDj9WSUkGK6U36GMsJKdaQzfUcO6cQ0kGGt
	1Wq/GapY8rDN8YprSogMGszDvjndfezgcu2erWn8wZLFBD/V2zgjHqSwjh9Fa2aveaCLBnj3eK9
	9++r+c5jMCN9In5jpsisqB1j2WMfzO7/gANyTE6ezExrMK+hrA==
X-Google-Smtp-Source: AGHT+IGZX699OSrVyMHZfxCNhIMRgOtdkxq4kcRZIVIIzs0qAsHeLAPMigr0o64lDLP6J6HC9mM9hg==
X-Received: by 2002:a05:600c:1f85:b0:434:9936:c823 with SMTP id 5b1f17b1804b1-43668646741mr142737805e9.18.1735032879107;
        Tue, 24 Dec 2024 01:34:39 -0800 (PST)
Received: from [192.168.1.62] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a7csm160932535e9.24.2024.12.24.01.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 01:34:38 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 24 Dec 2024 10:34:33 +0100
Subject: [PATCH RFC v2 4/4] docs: iio: ad7380: add alert support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-ad7380-add-alert-support-v2-4-7c89b2bf7cb3@baylibre.com>
References: <20241224-ad7380-add-alert-support-v2-0-7c89b2bf7cb3@baylibre.com>
In-Reply-To: <20241224-ad7380-add-alert-support-v2-0-7c89b2bf7cb3@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

Add a section for alert support, explaining how user can use iio events
attributes to enable alert and set thresholds, but also what kind of
events will be generated.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 Documentation/iio/ad7380.rst | 56 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/Documentation/iio/ad7380.rst b/Documentation/iio/ad7380.rst
index c46127700e14ca9ec3cac0bd5776b6702f2659e2..7cca4a9ad42ae8b3fda2e063ffd864ffa9dac2f1 100644
--- a/Documentation/iio/ad7380.rst
+++ b/Documentation/iio/ad7380.rst
@@ -92,6 +92,61 @@ must restart iiod using the following command:
 
 	root:~# systemctl restart iiod
 
+Alert
+-----
+
+When configured in 1 SDO line mode (see `SPI wiring modes`_), the SDOB or the
+SDOD line (respectively for the 2 or 4 channels variants) can act as an alert
+pin.
+
+At the end of a conversion the low-active alert pin gets asserted if the
+conversion result exceeds the alert high limit or falls below the alert low
+limit. It is cleared, on a falling edge of CS. The alert pin is common to all
+channels.
+
+User can enable alert using the regular iio events attribute:
+
+.. code-block:: bash
+
+	events/thresh_either_en
+
+The high and low thresholds are common to all channels and can also be set using
+regular iio events attributes:
+
+.. code-block:: bash
+
+	events/in_thresh_falling_value
+	events/in_thresh_rising_value
+
+User space IIO events
+~~~~~~~~~~~~~~~~~~~~~
+
+If the ``interrupts`` property is set in the device tree, IIO events will be
+generated for alerts.  A register identifies the faulty channel, and direction,
+but during buffered reads, registers are inaccessible, making it impossible to
+know the exact channel triggering the alert. A generic event is sent for each
+channel, resulting in 2 or 4 events per alert, depending on the number of
+channels:
+
+.. code-block:: bash
+
+	Event: time: 1733501917162945723, type: voltage, channel: 0-1, evtype: thresh, direction: either
+	Event: time: 1733501917162945723, type: voltage, channel: 2-3, evtype: thresh, direction: either
+
+
+Alert Reset timeout (buffered read only)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+In buffered reads, if input stays out of thresholds limit, an interrupt will be
+generated for each sample read, because the alert pin is cleared when CS get
+active (i.e when starting a new conversion). As a result, excessive event
+generation can occur. User can set a reset timeout in milliseconds, during
+which interrupt will be disabled:
+
+.. code-block:: bash
+
+	events/thresh_either_reset_timeout
+
 Channel selection and sequencer (single-end chips only)
 -------------------------------------------------------
 
@@ -144,7 +199,6 @@ Unimplemented features
 - Rolling average oversampling
 - Power down mode
 - CRC indication
-- Alert
 
 
 Device buffers

-- 
2.47.1

