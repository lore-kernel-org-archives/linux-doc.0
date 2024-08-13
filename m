Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29151A2577
	for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2024 17:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723570012; cv=none; b=IToQI3lHsaCKR2UE6n20vBWBSyF4r3yhsiGNDoHNZx41fVTxYgDBsuoi8HGSTw3pLW+UvJ9jbflikKk9bCCSKJNjPqxcSNaZwI9swqlDB9IFdLq8mbYkWViAnEvIDPQAmStBsN0xRbuHL+RHa7lRm5vtfAlOaYCr8gDV3nuAl80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723570012; c=relaxed/simple;
	bh=ZzTceNq/VahFThxcoefiMSTMiJCAPq1LHWua5OwiDXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LPf+1ZpSNot0cin9ImFOvOXGuznLE2tH4pQmc1tz/2umaVj2gdwn/sq+U+FJieoVI6WusxM8Pw/zrmtuu+2YokKSU0TkIJ/Fjj5GwelDXxtoliZQ8i088GKpMtviZyVRXx2b3aXm64BOZS51LjqO3czJbxd2xUNd3RjV1vB8bIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qXayL9XZ; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qXayL9XZ"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5d5c7f23f22so3311483eaf.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2024 10:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723570008; x=1724174808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xG6x5j0C9GwdQm5O0YJQ35HAaRtvKzSD7igQqCAZy5g=;
        b=qXayL9XZsDlKOg5GtGZIGosNDrqOdGVcBnMl7PE9F8LwdX7N5KbyRV8hqgeqW5/Nxq
         2et2S1cL24TuftNYhMarGAZ8PqtEdvFSRiBN46K4oAGT4c+v69lNDNapHcYFugZlwljR
         Iuh9xPpVyvUSczOidxAAvWeALUj0UVOwgIoOG8xXuVJWhPWg7FbSxVY+yxNd4F3GYAGf
         qiSk1jnDSwcdcrBrJxQWF2ii1J22hHAG1IM2p/+d5iDCLwPIoVcBlt8t7OURqSU6DAQw
         /PODmFv9xpTAY2xPp7cGXYho03qyvQF87QmtgF3RR0+JGkzY5ydvMOl0qmUQZbIzunLm
         h2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723570008; x=1724174808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xG6x5j0C9GwdQm5O0YJQ35HAaRtvKzSD7igQqCAZy5g=;
        b=h2AV3eBYzl+Dp5S5IeqxTYbriGF1eH9Mp5Rj2gJYATHjIt7md5r77s9ey6NaiZ6Eaq
         EE9XbjxDmraP2Ez5VqMDR2O9ShdNXIOBUV5geCHpwxzPhKPCW5KMOI3UA8sdo4mnLsDG
         G7cX2ZQLMFUV4UHgcq5kcYiptCuDUi1iSVkVQAexQ3xXxMby7KBBtE47IPAmAmDvLrtH
         ud8FikUJyd229/3N36B9CzQk72keRGBbXPh5YWTLXYAogDMuVEqEpkDq+cVUKVBTrQnB
         js/3HxK63oKqn9/3M9i+TMt371fEA2Rn+1c21xtnr+2pJm/i5vRRv8zeiAzuq3HrTgkb
         /2Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXhRV50VPZCLMzlgOzPPD2kfzdYdGgVzfywXD2J51wsQOlT5yc/CtyBRPFO5HVLCkOA7msz6rjctKwAYMMezJS+SvevUYn7Mbyf
X-Gm-Message-State: AOJu0Yz2zGvTG53ZHyGkiWpCHkQL6PiR3sAXXkwQnYpCjWaMJWxOy1so
	h4CZcM7Sx5kwkXeAHYMSn/7++JIGR2xeHORMJanmExOcESowZzmK9sfZQBLorrI=
X-Google-Smtp-Source: AGHT+IE7cQzWLO3jWd3KSSFLMOSIEVFhEv2EfjOn346VEcwYYVn943aDI4d7Fs3uIL/ohjzsEiDG9w==
X-Received: by 2002:a05:6870:972b:b0:25e:24d5:4d54 with SMTP id 586e51a60fabf-26fe5bb98afmr324787fac.35.1723570007899;
        Tue, 13 Aug 2024 10:26:47 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-26c7203f908sm2462915fac.11.2024.08.13.10.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 10:26:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 0/2] iio: adc: ad4695: implement triggered buffer
Date: Tue, 13 Aug 2024 12:26:39 -0500
Message-ID: <20240813-iio-adc-ad4695-buffered-read-v2-0-9bb19fc1924b@baylibre.com>
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
Changes in v2:
v2 changes:
* Don't error when only temperature channel is enabled, just add extra
  xfer instead.
* Drop use of reg/mask/val local variables.
* Use struct initializer for xfer in ad4695_exit_conversion_mode().
* Simplify return at end ad4695_buffer_preenable().
* Use t_ACQ instead of t_CNVL to ensure proper acquisition time.
* The temperature channel changes weren't quite trivial, so I didn't
  pick up Nuno's Reviewed-by.
* Link to v1: https://lore.kernel.org/r/20240807-iio-adc-ad4695-buffered-read-v1-0-bdafc39b2283@baylibre.com

---
David Lechner (2):
      iio: adc: ad4695: implement triggered buffer
      doc: iio: ad4695: document buffered read

 Documentation/iio/ad4695.rst |   9 +-
 drivers/iio/adc/ad4695.c     | 250 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 255 insertions(+), 4 deletions(-)
---
base-commit: d505a9dc8de83df2a8ce8c9e780f7b29887f34af
change-id: 20240807-iio-adc-ad4695-buffered-read-f49eb511e300

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

