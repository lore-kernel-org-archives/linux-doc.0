Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3420C37374D
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569115; cv=none; b=bEpxJFzbd/7IoFjHVXL/G3njrjSO88vsDDqDNeM9As67A3Arf7DNQmgIV+JqJcBzTyZo9EGgkkNeaPWnAYsr6W79nvGqapurGYd/0FJy1yAnfn+MTtze6lsVW4Vv6awczJFdgNdnLXMjuD3/B1xQqpEIhW9RXRicQMVjJ6Imwz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569115; c=relaxed/simple;
	bh=2gYGham6RcUhZnNfLTEyX5K2IIqX9Oa8+TtMYKSDzf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aO5ZFL8SfkZ6grwfh+89FC9E3+N/yGD6nBiEqlZIkZmLGlLdssrXZJNYV2cyN2mSIDo8xV/4SDvus33xlmNrSXBdi184QsiwwqRQvOIdlpdmQAKRUco1r9X089xjrJxjsLKdeMlZ8y0oqLj9dReHnSQ29uEesZPplAg4BRe6bpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xT0TSeGv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xT0TSeGv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47118259fd8so51678045e9.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569111; x=1764173911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=;
        b=xT0TSeGv1shStWY8dG2VdnVNTmaOATqx5X4A6etNbikwyUW2v027fqYAP3WksI3Rn5
         tmfexNiX6XGmm4MGw8i2JSvUOrsuiIkalV/89pCoVnYZJXrD4ExkS9+P0SET4iTknZK9
         G0bDe4SkP8sQJUvj2fhSG4GA5vVClgfcvk1j8a3wNnEHPGREzrt7wqLsgu0Xt5ssR5Zf
         u4Hf4eBLiJCHVBEJdZiz3UWyoXwR6zcSSKkQPBVhsQPVQp25/5ond0WTaISog6ExwDQT
         WjrGVVE1RP1cIYJW6c2PJaR0LAOx3Dh4d1TgoKW/6DgurmV8iRznB/vnJXPgCe6oJlBE
         mlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569111; x=1764173911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=;
        b=AAp9UbtlJF+TlPyNnEuOpKaWjZcE+ENWhu3Wjqu2ax7yqgTneUAIDCtM7FrTRL4TMa
         PRbuGC+lHmsKatUApQWVjDcraj05M+IJrPLxGgBxoYhMs6F1ljKQopbW8zKINAzoUuz7
         LIRgSJ5EyjyuULjJUktbJEXDO3VMyJA495JH6zgBj0s3fW2vvAUUty3Uaf668srBP4VA
         IpBpIfeMREsbZRpF+n/vJeaRRtD4um0/EbRDFcDdRfztXjxTrNiQiSsf94h1LEX9SSht
         VMk/SS7skGd3nollbNbYDOqFvmWTn1qXkdQSVdfjB0UUjqPs8/oKPKjP45/k+Lj12J+/
         MlGA==
X-Forwarded-Encrypted: i=1; AJvYcCU54gMJTZt8xqhYi5dJkYu264GCs47SQuwyRfjzRiqKlXGWc25KNgzwXtdat2h+CMX2kEcEySVpPBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhIEQa0D8EWLCGxalc78NAQhPPopxNajLZalvMcLanPcmI0Hmx
	HRZgLlp4TxYRF8HuS/d0iu60QtYF9Xk2V9DS+C/f0urGJfeQcyRsgyf9P51U+Kxwx2s=
X-Gm-Gg: ASbGncvCzwH2jGqzt95xWV7zhoMHBuHoURclD9a2FELC0cnxar+NQK76IVl3uvIJPwM
	5xxp364AS/BoQSgX4iV+VH3A2Cdthbt6AreopVC4u4Erx3bZfifyVVF4LaAZSboCZTzRLf3dRb3
	iCkR8SDBUWpLiDgkotiXb+xoV/8zjhx4w+gBz8Qz1BbuPs5wvzdDTqsSBbBSeE1vAcfCKny6ibB
	TvOucZtfLNAEtlVSlg0wuecEmBx3YLaUf12xmVJp8PPK27emZTjnA5e1HxVb8vm7KKs3zDwK6OT
	1hovYvVEARdRzONSo3axtFUPqixxsac2VZXlVAQE9Oa93LryWH8L0ht9vGI2ziUcF6k1BGFsXM5
	toDyN43awqCuucTWlcrIQ8Mkj2mQZ89RaDsb/aJXsANJKSdpy7ebLtYMYgTc9cNwSKxie4JpWU5
	cedlLZfNsRijO7MEzHVE+qrBXedyOMnv0=
X-Google-Smtp-Source: AGHT+IHdpfGKmHi4dDxwCxkPLQGkWAFqU0kact4PGhTMGVixHnJV4SZCke4Dbaosdd52MSthTFvACA==
X-Received: by 2002:a05:600c:6b47:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-477b7348cebmr11811715e9.8.1763569111423;
        Wed, 19 Nov 2025 08:18:31 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:31 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:09 +0000
Subject: [PATCH v6 13/13] coresight: docs: Document etm4x timestamp
 interval option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-13-740d24a29e51@linaro.org>
References: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
In-Reply-To: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Document how the new field is used, maximum value and the interaction
with SYNC timestamps.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/trace/coresight/coresight.rst | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 806699871b80..d461de4e067e 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -613,8 +613,20 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
      - Session local version of the system wide setting: :ref:`ETM_MODE_RETURNSTACK
        <coresight-return-stack>`
    * - timestamp
-     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
-       <coresight-timestamp>`
+     - Controls generation and interval of timestamps.
+
+       0 = off, 1 = minimum interval .. 15 = maximum interval.
+
+       Values 1 - 14 use a counter that decrements every cycle to generate a
+       timestamp on underflow. The reload value for the counter is 2 ^ (interval
+       - 1). If the value is 1 then the reload value is 1, if the value is 11
+       then the reload value is 1024 etc.
+
+       Setting the maximum interval (15) will disable the counter generated
+       timestamps, freeing the counter resource, leaving only ones emitted when
+       a SYNC packet is generated. The sync interval is controlled with
+       TRCSYNCPR.PERIOD which is every 4096 bytes of trace by default.
+
    * - cc_threshold
      - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
        default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold

-- 
2.34.1

