Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DA532C333
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330968; cv=none; b=l8yrJoIoyKUnrlIUVCc/jOTEsAshf57Jwj7pXVoAgcMqFCX5+ArY/sG6sex1WXAD3n1amr0CdNgCsasj8jF8+lU5tjVo+bzYZPrx9IjPRQPnJyTTGd+xB6P9HiFZtJo8PrEo9ZwysuLcxBhsVk0MUN/0A0QMB8tYnEb5JepNdyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330968; c=relaxed/simple;
	bh=DZ4HZWH5qf3Io6Mvd7Ro7kQIN5EHdhrLFo71SpJ5Le0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLkszDvLe7R+3gy2hahKtPY9Pzx4H0gRZJRBIpDs8jAxKrY81Swi/6EMeQmCT5y6SIFFQMQSrQkZ2q+vSFeGL506uuj8Pn+fu1zNtOqFkoW/tsxrSioN2WV4NrNvafOMHCKKV5GLKOUhVs9EQzaOLL4yy+h7odAZThBYHXaqxe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S+aHJGOz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S+aHJGOz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477770019e4so14202935e9.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330962; x=1764935762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cth2HfadlNIwjuNkYXpg5yJwdRtCIZo2ukA+LLh7V4I=;
        b=S+aHJGOzU5eecmseTrls3toFzEZF2M/bJJD93gHh3/DrNFkGsATgVg2IrlbJOYk8UH
         xAVvgdC9ut1LDPzMTp8nPewDPioPGaYzNUzWc4msnsLZjLkgr7CyLWIHqEbuG4mbY0v4
         pnO8mQbW7LfeEBqd4Ooi5ZbHl6wWCq4+FB1W0ovs7t+zE8dbbTIptnDF4f+QIw1j05Lu
         dkdPCF37nmyzTX+QROLsAhfQiqJ8pd8FQAjKu/9gK3XX5qXwyIFGrAryidGac6b6Dcry
         eEO+UIhChhxTZz++M51kGWcLfxyoYNC3OSYcksvoWP77uajvrAb7RTHXUuDO+fBPyea8
         PffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330962; x=1764935762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cth2HfadlNIwjuNkYXpg5yJwdRtCIZo2ukA+LLh7V4I=;
        b=MXD7qOzmeTKjdWPBBgIjCELXa481P2xrkaO7kX63jLhkv1yQoH/JSxtQbPiWoyirqs
         oz+KKRsSb6O6Z/ZSiUR17in9d5d0A41ralBbuK3LSD+cCLekda+sg5rulMQ5xPlgyXRz
         hjlccl4fDIllZaTQ0wsgYWe0bqXaNSExdx5t5f6xSnWNHojjV1urRz72FqnHFO+bb0O1
         /Jfn8qP1z6g6/1GoUJvKVyGEb6YAzPXpG0OymQVNFHaxVcU4YmjuzHq03/vqhGdrHViT
         05d8t+oYRLFBb9/xOGgSXT+G2jpPSsr2yYqRD9GFW5CegmrUNTpBVsoWwauAMRf89JRh
         x2ug==
X-Forwarded-Encrypted: i=1; AJvYcCX8HiFDk/VR7cHxCawk+Us9UHkTd7j3A7S2s3aBrLJnfj/R2aMitv3iWq5oGbP3Uu42xy5ivvVi1J0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf5JwTwD+dLaHceVRH+EaR1T/RjpIssbjKotVAjeTPGCeCeXyD
	yqUpz69obZMTrJqvBu9+0SmquIUuommYf9ObEu9lagoG6I3J5A9wFVXV7ApKrS6lU/A=
X-Gm-Gg: ASbGnct5tPpnxZeA1nLEb+SsVty3saAT3ZD0Pnh14OVKUahRMhTmUeVR9br1jp7i/Tf
	CGrEZuu2jIKrtT4prZyR+C9XZLi06DpRtLqUsLcJT+dG6mpJik32JnHGrc7q1ncfUGJf0pvGp5I
	x4RiQzLZKtBDvyRmG1cHYGG2nAW8BGuwi/pMRJLHVq7FTONhfPGW8emk7oCLlf5epQo/hfEfnoY
	4cLQuaZavo9SJfz/BOwCFh08Dxx+ixT7D0tKz4Qa84ogqcDvBmHYZndbrHGPosjSJliF78jTBz6
	2hc6k+nfJ9nzw66HM6qInn2t2ZBMj+41PQu6GvwWnQe+FryBcYE2cFUoV8qyJoQVgrdG7DHA9hV
	Ir1z3CxJKg8fscN6iYAkE7Yom423MSFQ2rQuMrfAc0XNEsgh8AfbziZMOwUMzNuxoHpntKgjWFN
	mojIKcog9Pb9OU12jh24RD
X-Google-Smtp-Source: AGHT+IHPyD1xyffyVNm3+d/4wd26K/XgcD7YW3gltFP0yISG5I/GpHGJjvh7e5mHCRlPRu4u6YXiag==
X-Received: by 2002:a05:600c:1c92:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-47904b2c2c5mr166562705e9.33.1764330962372;
        Fri, 28 Nov 2025 03:56:02 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:56:02 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:25 +0000
Subject: [PATCH v8 13/13] coresight: docs: Document etm4x timestamp
 interval option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-13-4d319764cc58@linaro.org>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
In-Reply-To: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
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

Tested-by: Leo Yan <leo.yan@arm.com>
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

