Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05D520C001
	for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761504407; cv=none; b=hief5KZTdZpOT9CxGIpU3sgNU80WbawI39CZyhHlLVzqiWK7Vu8OLV7w7eNC8Vbhl6+JUmvtUn6Qy7H4dd+BfqTmq59ueE4YhRGtFX+nFSVGiWfQd2Pdiq7Kegodnk1HLerczFnJfrcMATa4bdq8adZPCSZM5SVRK0za7GC7NdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761504407; c=relaxed/simple;
	bh=9JElRUYcelJHNX0v60zr/J8lWtgoWXeCAYKccVAcB3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/s154ArfsP/7P1YOZ8JD/4CdYeTsNAj4gBEQoJ7cPS8yqgiZeJsji8o46IMTPwvYUOnyivMbV4NNenChz4sZohP5rVmKSVqdEdORquLt1Hk62QEgPSbjnzIXPRuuC8QGHun51PWpo9DMnlhOkRuoJ+ql2DRvOcuM5cvVBXZtJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=nfuU5nc0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="nfuU5nc0"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-290ab379d48so35492575ad.2
        for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 11:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761504405; x=1762109205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr+uTiTscqC5xNsxJVLhouOq96vCtcj/UADaRDhqzhs=;
        b=nfuU5nc0POpV4P3j/DGLhWJQXNqr0k1HE9XSR9yoHSEwcBdUbWJrDZYIJNC/Zigl6F
         vHDtRKR7oa6eXm8LNFt350e4RLDLiyPUquzPNz6Aw1x35N6To1Q8ve58ATIPNEeiBo11
         ur7nEaXMjxSGzSoYn4diJtavEwxzJPcZVVmszzlpx690+BugfkfxFVkZgxNNGpnNZlZP
         Mm5mcMN+BY8C0xEeM+VI47tSDq5MCuJIZWbXA01kn/aNtazHm6o4pnG9RfYsx/ARUmMh
         ysw1c0ZBFcNMlGfNTBSpKL19nfZYqEPPjLcU+HpQ0hrU3LPAQzmZmrFNLRF1ld4A2q4w
         VUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761504405; x=1762109205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kr+uTiTscqC5xNsxJVLhouOq96vCtcj/UADaRDhqzhs=;
        b=dMmjMkC1OwIpU65tyoJwwKStzSL500R8wiAanbfTuSqvfifR3HMGTxw7PJXNMpm7Ph
         IbQbztTnbbm+fSkUlMwB7tw1d/XCCTM7+jF+DhiwzmdcuYcv1pQuMPNIQwYOV5SvNtFs
         1PZ3RAjk43wXontTBkUqIAfdUUxm/WfQLfCWB2gk/YUboKH/Q9A/MsHISlgtC+Ni/8pD
         4FvCRQx9V+qH3FEd2l6WFgbhmABXb+zt62uJhUr36Nb0qIoCyGFdkCJlmIm6nqBsv8yO
         C0skaueLeoQVi0klBVsT5tQ7+hVL85MhNo6aKH9YRkK5Sc89oLZeM2ip5erT8K6bdsPH
         ssEg==
X-Forwarded-Encrypted: i=1; AJvYcCVtPdwAVspXvWppHHP9dMbrQawrSye2Vk6APmIXjF/6inC+7DTjmB/0YLops7jVbytCz881Odv1z90=@vger.kernel.org
X-Gm-Message-State: AOJu0YwipczvwgGL7CvsAR8cp1HfrlkgfvZmFWjezt2IoLjOGfEkHvY5
	MJvsx4p7YvM3EgVQVLeiNt72/7S6q0UofdLExJCH9dpOI80P8yLQCnOaWVdwoClATBM=
X-Gm-Gg: ASbGncsTlwdjia5mhlh5exTjlSEqvMqy1ePgoawO2y/FzS0m6PYgnORjlXiTsvF8dUs
	3eZoA1Mmwdihm3bgQn3ecZDR/WDZZkAMvI1H706ALRVKoFUF3yTQ+AUZvuyMtEwGEVl7Y0jZCvR
	CxnA3qz/gW6BC/rhwqF6kbvONiubQ2D1dWWRA4ITfnyI564HmxrLIl2VZi0Iv4IEcZegdYskVtv
	ozSsDp1mZ0wp/o93fKItknleijWWRogUv6jPdAi+6rghocCLBctDsHSMsP0Fb8yCHnwqKZuI54m
	PbPmeMZu7QdRxAhHdfegnYwjjma+K7pqz8m4vq8XyTAC4km3ehDbWbwFxbUvaQW1M2Z8mNNCBe8
	af27oxCYCjSNfuGK/qk+OEosIfNs3gpmfc41dwAuU7hnrw0Sg7UkgM+Nuxs8rUPPKdRwk+eiQYT
	Gd5PNKYB0IKmT6bnOq
X-Google-Smtp-Source: AGHT+IHyb18kbZzmWwrapG89GEeH9zIO5kUERUgBm/20I/UDyDk2AQLJZ+iiUs1VcHb79+gHNkmW7A==
X-Received: by 2002:a17:902:db05:b0:24e:3cf2:2450 with SMTP id d9443c01a7336-290c9c8a5e6mr441023785ad.2.1761504404962;
        Sun, 26 Oct 2025 11:46:44 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:a43b:396a:591:2ee9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7e2851sm2432460a91.6.2025.10.26.11.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 11:46:44 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	igor@reznichenko.net,
	krzk+dt@kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add support for ST TSC1641 power monitor
Date: Sun, 26 Oct 2025 11:46:41 -0700
Message-ID: <20251026184641.631641-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <408c1698-a8ad-4e16-8def-352c2c265f5a@kernel.org>
References: <408c1698-a8ad-4e16-8def-352c2c265f5a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Subject: I asked to drop "binding" and not add "support for". "Support
> for" makes little sense in terms of binding. How binding can support
> anything? This is the "ST TSC1641 power monitor" not support.

Krzysztof,

Thanks for feedback, will fix this and will create following patch versions
in new threads.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  shunt-resistor-micro-ohms:
>> +    description: Shunt resistor value in micro-ohms. Since device has internal
>> +      16-bit RSHUNT register with 10 uOhm LSB, the maximum value is capped at
>> +      655.35 mOhm.
>> +    minimum: 100
>> +    default: 1000
>> +    maximum: 655350
>> +
>> +  st,alert-polarity-active-high:
>
>Isn't this just interrupt? You need proper interrupts property and then
>its flag define the type of interrupt.

This controls a bit written into device register.
I omitted interrupt property after looking at existing power monitor bindings,
especially hwmon/ti,ina2xx.yaml. INA226 has very similar bit controlling alert 
pin polarity and binding doesn't define alert pin as interrupt. Overall, I didn't
find many power monitor bindings defining alert pins as interrupts.

Thanks, Igor
