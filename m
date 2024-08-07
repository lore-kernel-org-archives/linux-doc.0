Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0579E84A51
	for <linux-doc@vger.kernel.org>; Wed,  7 Aug 2024 20:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723060939; cv=none; b=Gp5lSXTqlMVvfKy2NfsxGcKuYANiYo88j/ZJPWBXmsuEfrXIzcYvBFZvh6ONHLUVf2fg9EH7hO+/b51G3wCSUxLEFmbK+BMURLzJY0hTxq+x2ZY8O5tRONmE0bR8GmMfd6agi7+jQh/QkN2SgTfXDVpYcSFSPypDaswP1H2FY6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723060939; c=relaxed/simple;
	bh=JqI/7JY0uwHO8jeHmfDAkuQSCd4muvWmJPLKHs/4J70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U0xJdAvk8jSe4d31yypi/ILugn7BqfERdBfViTHD5I+GcC32MYGo98SX58sG/NJeBkdOMKKx8emjz37dsHd9UH/b9Ts7SeSISvcPWqwtbp/Ji2YXwiRFfET5RaoqnM3PETvTtdKkQ4BXL+xKvSYvgitsjXOHCPHRnTJJIuHBSZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ckl2slCP; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ckl2slCP"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-70944d76a04so135634a34.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Aug 2024 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723060936; x=1723665736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LsITnJxqyk3GLU8VoWLUSQ1dx7O5PrUBJFkjcQc8Yi0=;
        b=Ckl2slCPnKSgr8UNq8Ph9sqxOeN6LcIvmi7Tp9jhlNe4dANMmudJk0IaChD1LwdvQ7
         CsEjf+RfubYyGNybetFxV/Lm/q4fTBHowZqcqySCKOWAF9r+wb2Ltlx9eAWrlMJ3FOUe
         MgHEYqT0pZ7AwbxDTOrHhaR1XoNjjiYuYp06sLHVmgZhJ57cuV7Zfcg1c2rlEHWC2jJH
         npGrNJ/zHP4u3H4UoeC54TKjISYDqN28+jzFZhllOaJP258MOBl985yhwCyWqU1QugSA
         oww7/QMDKw5/OKVJhjKVPzijvhHQxTqKCE0j3JxG+RMO0hyFPfKuph0GW9jkBADUYQYE
         hOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723060936; x=1723665736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsITnJxqyk3GLU8VoWLUSQ1dx7O5PrUBJFkjcQc8Yi0=;
        b=cHKf90Z1qkozUGiy4WNvt0jzlmwNDQngcXMeSvpq2pEUGSuXwMS2oLyI2Q8KQmzZEW
         TR2I03rSDaQD0ZTkKlqHfZfgK7SzEzB8aUgCao6bn87B95mpzSXDIg1AoyW8pOWU6Izr
         q3EooqdehTIy2ZzEry3TUggl4+6+bzml5xKzq/na1guawkUfcF/a7SEIbxfAO+ng0ciH
         Ioiez+PHdR6CGK/c5TEbw0lOTSCQU3gIIDu/XRcAYx9YKUezT5D6FfvAz3vTcjWPWAmJ
         8z+TWnfsgG85ABKL2Ra9Glr/nsDN/jalwjAoS3RQs8vFJONW3/0rDgRVcuXOQ1/pKdOT
         5zjg==
X-Forwarded-Encrypted: i=1; AJvYcCVEe2Tmk7uq8wvXb0aqWZCt5QoQZCHXryf84IiDvbG5ykIzOBCbO+IZrBGLpCbK/6+7zKdFM+mMuVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ06doPMih4mgtiJWZVGNgGknKi9kt7KA+B7s89Jn3VGh+RPFq
	5wVDCtGCFqgeSR8GPLo59h9QAwfwB5J1TkcqphhN838eE/miev8gA2qcaF36CvM=
X-Google-Smtp-Source: AGHT+IHXba0L9xz2feaAjHZF5HL6FfrLqc1XVJbv+ptCNbxlgacOca0GRhf/jsOysJCJOOgMtHOHpQ==
X-Received: by 2002:a05:6830:2a86:b0:703:6f95:98e9 with SMTP id 46e09a7af769-70b4641c8f2mr1430507a34.10.1723060935925;
        Wed, 07 Aug 2024 13:02:15 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70a31eaf7b6sm4951003a34.24.2024.08.07.13.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 13:02:15 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/2] iio: adc: ad4695: implement triggered buffer
Date: Wed,  7 Aug 2024 15:02:09 -0500
Message-ID: <20240807-iio-adc-ad4695-buffered-read-v1-0-bdafc39b2283@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.0
Content-Transfer-Encoding: 8bit

This is a fairly simple series that adds support for triggered buffers
to the ad4695 driver.

Not directly related to this patch, but as a side discussion about
future possibilities with this chip while we are here...

The advanced sequencer on this chip can repeat the same channel multiple
times which, when combined with the autocycle feature, can be used to
create different effective sampling rates for individual channels.

For example if we set up the sequence [IN1, IN2, IN1, IN3] and the time
between each individual sample in the sequence is the same, then IN1 has
an effective sampling rate of 2x the other channels.

Have there ever been discussions before about implementing something
like this in the IIO subsystem? I didn't see anything that looked like
this already implemented in the kernel.

---
David Lechner (2):
      iio: adc: ad4695: implement triggered buffer
      doc: iio: ad4695: document buffered read

 Documentation/iio/ad4695.rst |  12 ++-
 drivers/iio/adc/ad4695.c     | 233 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 241 insertions(+), 4 deletions(-)
---
base-commit: 7cad163c39cb642ed587d3eeb37a5637ee02740f
change-id: 20240807-iio-adc-ad4695-buffered-read-f49eb511e300
