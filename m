Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B492FD1B1
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168689; cv=none; b=HM83KXrseij6GCEGha8aUaCsw7im/S2/vNIWuQ9XCTLI4segZ68RWpec87f2vrymR7B2fdVkuhJnD7ZKsgVI7/8Zj3KOvIzPu8ShhXDxJfsCLBnfXZpIhZOdQNDsrR/rL8XUOIc+wyWjch4jL3v/QTWxcf3Pq3kUGTexp02TcGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168689; c=relaxed/simple;
	bh=o8uIpvdm8rS/o+S1mykUYGGLHkWfPhCsX3cg0yw1X58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rLaNrtRdDfM0J5O5upRNBT66kcJGoqOtd+9WbuZV8W13TvOATk2MNcYwL5cnZkDJdvL+9G7AmeQMgElIHKhvZjs6QxfB16UW5SPaD5oJ5ex46LvPkV7uFffGvyvyP6HHJtdRN3kmOTSybKfFeZotXaB2DuMsN3F0dxBpEJ4hg10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zBdbMAJs; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zBdbMAJs"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so3808255e9.2
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 03:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755168686; x=1755773486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=;
        b=zBdbMAJs9CCm85BjdAfc74UUMg1aS1BRv72lP5XEfJ2MdK4TkcC6mninks4lzA4ZnF
         ScPR4mxDiXyAJuGHSfi57AZjJl4HHdBeENXsNnwYNIZQumInYrjWtxDZIq5SmkWLpvFw
         TVnZV+IC3ZbrYnj6tTvTjB5wq+5WgM93J2OctEMrQX2nWiKRqZzlJGpmjCwS+82mKNLA
         i177iYLDLG3Y+/WRIkKd6B/Ub+sa482ghzzGM80S5bCFyvXx1YOvNoLunk08eK7hEiK3
         JsoUcak5mPGDMx/cuGqbUmokmuMQUAfFX4dyW5VZI3rMvE8evkcsbAwjZFQTGiV6pfkK
         9GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168686; x=1755773486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=;
        b=w8EBdGnHQV5MpdCQSMr2QfUrvc8hhOFHjMwgudoRNKpNHj16TfjXIqf6qlDZCGyKU4
         vgmAPwWLDh25tyo+gzBBAgqPrCMQSdyA+Na3CCq6UvMg+apDtFVzagsvzN65vA8P1Cdk
         OOwhitflO61HJitiP5dY+16p5byE5u5HUTHlHWjvCWCxwNyk/yXuY7WZHYAiG5+Aczna
         V7Wc1kaBjNafrqDu1V2hs7ZyXBsO99vL55VZ/Xs1n2QFUxan11urv0GkTra1XaSaezhb
         BGV2pI8r9WrLKQImAcVsRbhc4GcUi5zcC8EQAXrPPHGwMbelWZoK4Jt3kPsnhAnzB4sG
         r+dA==
X-Forwarded-Encrypted: i=1; AJvYcCXpnUGZ3lnRV2JjCJ0YBWkZOpa/2N7jn1YGei0IDLWciJd8GXZ+HIMSz3jW223qR/mQNgrGuvMwCrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKqqeQw9DeJMs3yu1sb+wofefm23cIIyJtTeg5la7URiYXNekY
	r1EbfF4yN+6wzidZ3PG8lnnrMiiSLfbmZ5oiW1oBGYEvAKZLp20r1HI/SHSnD9q9MpM=
X-Gm-Gg: ASbGnctGrtsz5JYDN/S7mhQ88psBHQEkfRUTEnyI9Pwv8V+9K8fpjbuaOEEJn0X8kO3
	o2V5mB8axqtm0NMOsvQQgd2TczQoR+M0hSLgGadu9q03Ofx+miOd4AZQ3nD5t/KQ7XVLgCAv7VV
	cShbE3LbflAfHK61R9yli5ZL9mRqs4O1tZcY6q1/J2RNdBJsyGEn4HJi+AX/Ea6dvQDr9cKHQ22
	62egYpnVBEFcmUO1qjNxBmSGJQjO65XkE0hsin7JfXoTZLhAFanSUSMO/bHCV8dWWPjUQy6GWwf
	zokTzgALxG7L+P8umEudL7XQIlZYEUyBXakEpyzhK8D6bbpu8xhHheAu3Q64QsXRfoq3cjoXty5
	zRdYGfFw0c3ZsxqUV9oMbGplTBgxi2KU=
X-Google-Smtp-Source: AGHT+IF68KOqRUAOMHDKBpVY9t7uVgR8MmpK7ImpWi3/zcrlNC+5/ptZ2W1zXkHPP+sNnqPRzwGUWw==
X-Received: by 2002:a05:600c:4708:b0:459:e025:8c5b with SMTP id 5b1f17b1804b1-45a1b674677mr23813915e9.30.1755168685858;
        Thu, 14 Aug 2025 03:51:25 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b226eecsm14228345e9.1.2025.08.14.03.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:51:25 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 11:49:57 +0100
Subject: [PATCH v2 6/6] coresight: docs: Document etm4x ts_interval
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-cs-syncfreq-v2-6-c76fcb87696d@linaro.org>
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
In-Reply-To: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Document how the new field is used, maximum value and the interaction
with SYNC timestamps.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/trace/coresight/coresight.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 806699871b80..0cd83119b83f 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -619,6 +619,20 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
      - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
        default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
        value, as indicated via TRCIDR3.CCITMIN, then the minimum value will be used instead.
+   * - ts_level
+     - Controls frequency of timestamps. The reload value of the
+       timestamp counter is 2 raised to the power of this value. If the value is
+       0 then the reload value is 1, if the value is 10 then the reload value is
+       1024. Maximum allowed value is 15, and setting the maximum disables
+       generation of timestamps via the counter, freeing the counter resources.
+       Timestamps will be generated after 2 ^ ts_level cycles.
+
+       Separately to this value, timestamps will also be emitted when a SYNC
+       packet is generated, although this is only for every 4096 bytes of trace.
+       Therefore it's not possible to generate timestamps less frequently than
+       that and ts_level timestamps are always in addition to SYNC timestamps.
+       Timestamps must be enabled for this to have effect.
+
 
 How to use the STM module
 -------------------------

-- 
2.34.1

