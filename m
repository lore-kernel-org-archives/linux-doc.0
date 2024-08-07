Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C95145340
	for <linux-doc@vger.kernel.org>; Wed,  7 Aug 2024 20:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723060940; cv=none; b=cd5O64UVv4Rr9wte0bHlnqm3WtMvMfKlkRYMjiYJgCztPET6rhayXhlf2DU7NO2WDvcczKD8aH3leYS5tAybqd8ZfJhiWF/vLzSONS/nGENu3BusV53UfeNjD8m+FaHDqH0vWRLPaXj/WlomDLN+qhRTNYUQCB2P9A5IuZKl3ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723060940; c=relaxed/simple;
	bh=m5t8YOEq14DzpXxC9kxyMNMwCAST8cQieg2+aTW9klI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nEI1LpamaIcOZqMMjuF46J652X1nbqRUbV1ErfjG7Ow4qnsEJ1B1EYR/JmvTKur0Gnkj82PPACWGazdYjgrlT/o2XJahRbMp4Qx0UwMomPNWp3jD2bngFQsgXiRKpiUhIIH5O//C0ta99DQLjzCgsi0wC9tLhxFHHfHDTLUqJD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TPrg1VVv; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TPrg1VVv"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7093705c708so213805a34.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Aug 2024 13:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723060938; x=1723665738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2y1nEpEAN88fP/7CYpPbMEs5vEqFecEWNsSRdZjPkE=;
        b=TPrg1VVvonedIFxZZZSQzfpypwUPzXWiqY4F1uX+5orTMfdd+iiY9DnXWoFlxFD6Eg
         TVMsDFMsuY4H5E1VY3G5jCnNP8r2QhNsqHgcRi/7S+Aw8ilQhDs8gbevcCq/jieopdhr
         Q4UkEL+r1OJOYP33OpxMpF7t1VPlIqaKey9q4XUicbYc28+gJoKhSHgJpknelhWvZDDl
         iD7ybKcnHyuI9vX2H5oj9pBAP0yyN7PGkWjpLvkSH36Ip5cKJdBC6HBZANjGNXoj8MDo
         thEZCNm28bRlkLpGEx/JrcWtAFAC5UvYy0mdJhXipLuToSyyRHw0E2Eq4TlEAT7q5rol
         hhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723060938; x=1723665738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2y1nEpEAN88fP/7CYpPbMEs5vEqFecEWNsSRdZjPkE=;
        b=Q8+b3kIJN+r0cndySQUPhQi8arBDNNyom0TXz/XqtrppOqYQO9ELFo7PA2FO0NII1s
         yEzYRMLiun9WQZF4lCQ/NxvREB/a9wD74wQyf6JRz3eVWAD3ghJhf50gGBdqpD/LkrGr
         sEkk4a68tzfmki/rpKu+SqP1S2Pr/SqzBYz/fLRyBAUmhVpNAMKqmUu8gX0m0h048/5E
         mlMvGJvaqisR7sNJHLtk+LbKOTxAfoV5dChjCJ1eKT7WmtDsjH67dJg7l0RCgQQBuDOE
         LKdFLz2rQ3b1yiLODm4gdtrbyuQHcA5MJEulZytOsdX1YVNfUkZnka3EZRddgkIbeXxp
         fgdw==
X-Forwarded-Encrypted: i=1; AJvYcCUHMekHl5+hfwu90c3LJZifVHiXoC4ZoY/WUV3HX3o9GzVwByAsyk0+sDJUiyXG2Jl+QoSc4neACh3K/luyaCd74SVz/pS4f1yy
X-Gm-Message-State: AOJu0YzSrkOPq8fk7tVZsWiu+ba04Ff1sWX7zoZ6LYlxPllnGF1rptx+
	7i4aQH1QP6iIO/IvoC9sgVy/L4gMV4d4Jge3JqPAXjCWxcPwXuCwx+eXxSxLXsWUd/PxkZrYlc+
	q
X-Google-Smtp-Source: AGHT+IH8Nl0php+QRYheKFloGDFLC//hM73Q+fe7pdRaQE2K9PwYXuJqyTxUqUvBEQDhv5idA12HkQ==
X-Received: by 2002:a05:6830:dc9:b0:703:7775:c6c2 with SMTP id 46e09a7af769-709b99724femr22842726a34.33.1723060937736;
        Wed, 07 Aug 2024 13:02:17 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70a31eaf7b6sm4951003a34.24.2024.08.07.13.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 13:02:17 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] doc: iio: ad4695: document buffered read
Date: Wed,  7 Aug 2024 15:02:11 -0500
Message-ID: <20240807-iio-adc-ad4695-buffered-read-v1-2-bdafc39b2283@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807-iio-adc-ad4695-buffered-read-v1-0-bdafc39b2283@baylibre.com>
References: <20240807-iio-adc-ad4695-buffered-read-v1-0-bdafc39b2283@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.0
Content-Transfer-Encoding: 8bit

The ad4695 driver has a quirk where the temperature channel can't be
enabled on its own for buffered reads, so we should document this.

Also, since there are 4 possible modes of reading conversion data, it
is useful to know which one is actually being used, namely the advanced
sequencer mode.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/iio/ad4695.rst | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/iio/ad4695.rst b/Documentation/iio/ad4695.rst
index a33e573d61d6..af76ce2d0702 100644
--- a/Documentation/iio/ad4695.rst
+++ b/Documentation/iio/ad4695.rst
@@ -147,9 +147,19 @@ Unimplemented features
 ----------------------
 
 - Additional wiring modes
-- Buffered reads
 - Threshold events
 - Oversampling
 - Gain/offset calibration
 - GPIO support
 - CRC support
+
+Device buffers
+==============
+
+This driver supports hardware triggered buffers. This uses the "advanced
+sequencer" feature of the chip to trigger a burst of conversions.
+
+Due to hardware constraints, the temperature channel cannot be read on its own
+for buffered reads. At least one voltage channel must also be enabled.
+
+Also see :doc:`iio_devbuf` for more general information.

-- 
2.43.0

