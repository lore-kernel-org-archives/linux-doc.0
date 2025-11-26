Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673F3324B32
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154679; cv=none; b=bUzs6zwOhrVYv7HfXhjFR6B7GobiwXlvkIGP7Ws5WazTLr0up9hvOO5oCF7FrCtLap4XYmVHK9eQcB0Fj+7AxBG0AE+qi8b9idbJ7oMqBicl8uRXtiglmHDRwVUz/s7am8GcvBAAG5qpiReu6HAtR+wsBGKRmq21Tr1Pq1iipQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154679; c=relaxed/simple;
	bh=2gYGham6RcUhZnNfLTEyX5K2IIqX9Oa8+TtMYKSDzf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhXoH8b2Dk/cy2YjAEi/P7sitpKccY8s8cNAXc4mUHM7PYb7x7MecSRiriQDofkBCTZDIu9RvQ4J7ElKmYj+BPWDNT5kSJAAYwsj1pesZYPPFJsSr57fCKO2ZiXeYvt0COX/8Gp0eRa1hqZprWP76K6/Ya7NOkVt8ZQ3dpYoa4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jgQX6wIC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jgQX6wIC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779d47be12so50187275e9.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154676; x=1764759476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=;
        b=jgQX6wICwmAcvXYlu5TX/XrbPUBBGFHzeKfrKyASZHxzoIxfYHtcifP6d17o8esp68
         jiBpsCNQyssIM97lHprtDzPDAX2szTOra3eOeEiJAWFjpND+OUAiGnNgLAr2pJ4j6hrJ
         8+FZRvbqMNVXZK8DYGEYADK5oYIquq9BITwR34A5I2V2VIvbgowRveQcDB/2kRC7+K2N
         hBGyU95rWlMf5fVqoW+3RktNGWJr4dj6zB8N9YYEtBU2E195gCKNReYmr/u9X6R+TlqN
         vlo2lD0svY8Cer0Sd4SHeu1+echGyEJC9hNG75yb3dHokyTq5H3Su96aUTivu8Bobql9
         eApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154676; x=1764759476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=;
        b=Fb3CXl1AQzKVyjCG0+wecnVDHvMN07jcgQlKcdQAKobc0jerG//0/YJq2DA8BIqPZp
         Nry+qNjpTXX8y2fxcBwSQWPUmmuG3gopPpWkBKYZeY+A+q0bqGVXmtaUtDzgbahrw5fh
         73i/1aeZpt5/dc5qPaQEOwe9iwk2OER26zTJVZ7pWLoftOHvMGd/z+52DREM7KNe7ua8
         ZXZ6OK9Qy/VRG4DcK6yYhu2h4EKjL2H1+Fr6GzaBWQBvWwJtlJzfzSiqpri5oeJzRYho
         nabZRpdfeR+RCeMFNKsowPFtYwjvLTogWbmmlwUrZ0DyWl9ww5eY5zCEFPaxbVYd0SlO
         LfxA==
X-Forwarded-Encrypted: i=1; AJvYcCUF8oXCujCtIZ0TtBG9P3T1AaKAIJXxJ2CYZxzYeCHmNvMGDQW9srOrsK9Ukf6GM14Viva4y6IGgpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy8eo1Wollg+7iA7wfD1nnsuLEZ45G1l4D4A5dVneGs05lAsSQ
	ZOuH/wAQ+DTcttWCZ8T3pMlDsuuO8nOLeM2qwQhs3TuBy7Y+8PtnLqj0gRbdxbydodI=
X-Gm-Gg: ASbGnct8SMQL9MrLCcNfCbcqgcGNmSzfFNxUUnceeLFsmszhy+Cg7q0cm8mE4vdZD+a
	+c9aO8EKaRdvTfuUZL2Rt6HuaBHwbv5uQTb3+lC7MXvux83u3kwiFCzm27wxvNmS+WZZJXmSBWv
	eEA5f6f3Jqt7vKj9z6lpMI3iH1xUFj/J08eprNiGXO8w/N8TaQn+dpo1llpvHtg3F8TKpYupg5X
	J29nIj1GrF6maTiJ1EFr14XM//4VHUlIGe6TgRA2r15UthFZISrc6QxBKG9uDepjCNQVF65N4Fg
	1wTW4YBIOH0a3cWQh0nOXL9vVmxlLizv5EWywBp41F3KDpFy3ZSRooOdY47iuaFdTIX18sGgRCD
	RJc3zKa0VDZrSysgPI8QdN4T5pij+HVoroxY5CCUfA2dl2Z0HwsloKZzrqo1Oo0LKipesHPv6Gb
	FtVDROSP0jPw7/iiHDUvj6mQieIlpERUw=
X-Google-Smtp-Source: AGHT+IGI5q1kexToJTcX1Yl/7hYBxLHl5Npy8jahQMf8CLbNWSX46wWWQuRfFFyKaMWwDJ+DY4kHYg==
X-Received: by 2002:a7b:c011:0:b0:477:7cac:508d with SMTP id 5b1f17b1804b1-477c01d4ac6mr163405625e9.16.1764154675634;
        Wed, 26 Nov 2025 02:57:55 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:55 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:42 +0000
Subject: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
In-Reply-To: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
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

